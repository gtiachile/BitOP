﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="BitOp.Admin.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>TURNOS</h3>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Turno" DataSourceID="BopDBTurnos" DefaultMode="Insert">
            <EditItemTemplate>
                Turno:
                <asp:Label ID="TurnoLabel1" runat="server" Text='<%# Eval("Turno") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                &nbsp;<asp:TextBox ID="TurnoTextBox" runat="server" MaxLength="10" Text='<%# Bind("Turno") %>' Width="50px" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Turno:
                <asp:Label ID="TurnoLabel" runat="server" Text='<%# Eval("Turno") %>' />
                <br />
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Turno" DataSourceID="BopDBTurnos">
            <Columns>
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/DeleteHS.png" ShowDeleteButton="True" />
                <asp:BoundField DataField="Turno" HeaderText="Turno" ReadOnly="True" SortExpression="Turno" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="BopDBTurnos" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Turnos] WHERE [Turno] = @Turno" InsertCommand="INSERT INTO [Turnos] ([Turno]) VALUES (@Turno)" SelectCommand="SELECT * FROM [Turnos]">
            <DeleteParameters>
                <asp:Parameter Name="Turno" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Turno" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
