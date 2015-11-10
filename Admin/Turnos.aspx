<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="BitOp.Admin.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="auto-style10"><strong>TURNOS</strong></h3>
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
                <span class="auto-style10">
                <br />
                Ingrese Turno: </span>&nbsp;<asp:TextBox ID="TurnoTextBox" runat="server" MaxLength="10" Text='<%# Bind("Turno") %>' Width="50px" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TurnoTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                &nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
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
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Turno" DataSourceID="BopDBTurnos" Width="20%" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Eliminar" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Turno" HeaderText="Turno" ReadOnly="True" SortExpression="Turno" />
            </Columns>
            <HeaderStyle BackColor="#003366" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="BopDBTurnos" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Turnos] WHERE [Turno] = @Turno" InsertCommand="p_ValidaInsertaTURNOS" SelectCommand="SELECT * FROM [Turnos]" InsertCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Turno" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Turno" Type="String" />
                <asp:Parameter Name="Done" Type="Boolean" />
                <asp:Parameter Name="Msg" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
