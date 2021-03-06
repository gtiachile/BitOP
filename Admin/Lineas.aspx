﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lineas.aspx.cs" Inherits="BitOp.Admin.Lineas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
        }
        .auto-style11 {
            color: #000000;
            width: 79px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="auto-style10"><strong>LINEAS</strong></h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Línea</asp:LinkButton>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Linea" DataSourceID="BopDBLineas" Width="60%" ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/StopHS.png" Text="Cancelar" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Eliminar" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Linea" HeaderText="Línea" ReadOnly="True" SortExpression="Linea" />
                            <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                            <asp:TemplateField HeaderText="Planta" SortExpression="Planta">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="BopDBPlantas" DataTextField="Planta" DataValueField="Planta" SelectedValue='<%# Bind("Planta") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBPlantas" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Plantas] WHERE [Planta] = @original_Planta AND [Descripción] = @original_Descripción" InsertCommand="INSERT INTO [Plantas] ([Planta], [Descripción]) VALUES (@Planta, @Descripción)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas] WHERE ([Estado] = 'Activo')" UpdateCommand="UPDATE [Plantas] SET [Descripción] = @Descripción WHERE [Planta] = @original_Planta AND [Descripción] = @original_Descripción">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_Planta" Type="String" />
                                            <asp:Parameter Name="original_Descripción" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Planta" Type="String" />
                                            <asp:Parameter Name="Descripción" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Descripción" Type="String" />
                                            <asp:Parameter Name="original_Planta" Type="String" />
                                            <asp:Parameter Name="original_Descripción" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Planta") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Estado" DataValueField="Estado" SelectedValue='<%# Bind("Estado") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [Estados]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#003366" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="BopDBLineas" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Lineas] WHERE [Linea] = @original_Linea AND [Descripción] = @original_Descripción AND [Estado] = @original_Estado AND [Planta] = @original_Planta" InsertCommand="INSERT INTO [Lineas] ([Linea], [Descripción], [Estado], [Planta]) VALUES (@Linea, @Descripción, @Estado, @Planta)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Linea], [Descripción], [Estado], [Planta] FROM [Lineas]" UpdateCommand="UPDATE [Lineas] SET [Descripción] = @Descripción, [Estado] = @Estado, [Planta] = @Planta WHERE [Linea] = @original_Linea AND [Descripción] = @original_Descripción AND [Estado] = @original_Estado AND [Planta] = @original_Planta">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Linea" Type="String" />
                            <asp:Parameter Name="original_Descripción" Type="String" />
                            <asp:Parameter Name="original_Estado" Type="String" />
                            <asp:Parameter Name="original_Planta" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Linea" Type="String" />
                            <asp:Parameter Name="Descripción" Type="String" />
                            <asp:Parameter Name="Estado" Type="String" />
                            <asp:Parameter Name="Planta" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Descripción" Type="String" />
                            <asp:Parameter Name="Estado" Type="String" />
                            <asp:Parameter Name="Planta" Type="String" />
                            <asp:Parameter Name="original_Linea" Type="String" />
                            <asp:Parameter Name="original_Descripción" Type="String" />
                            <asp:Parameter Name="original_Estado" Type="String" />
                            <asp:Parameter Name="original_Planta" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Linea" DataSourceID="BopDBLineas" DefaultMode="Insert" Width="235px">
                    <EditItemTemplate>
                        Linea:
                        <asp:Label ID="LineaLabel1" runat="server" Text='<%# Eval("Linea") %>' />
                        <br />
                        Descripción:
                        <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        Planta:
                        <asp:TextBox ID="PlantaTextBox" runat="server" Text='<%# Bind("Planta") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table style="width:115%;">
                            <tr>
                                <td class="auto-style11">Línea: </td>
                                <td>
                                    <asp:TextBox ID="LineaTextBox" runat="server" MaxLength="10" Text='<%# Bind("Linea") %>' Width="58px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style11">Descripción:</td>
                                <td>
                                    <asp:TextBox ID="DescripciónTextBox0" runat="server" MaxLength="20" Text='<%# Bind("Descripción") %>' Width="170px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style11">Planta: </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBPlantas0" DataTextField="Descripción" DataValueField="Planta" SelectedValue='<%# Bind("Planta") %>'>
                                        <asp:ListItem Selected="True">Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBPlantas0" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas] WHERE ([Estado] = 'Activo')"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style11">Estado: </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" OnClick="InsertButton_Click" />
                        &nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" OnClick="InsertCancelButton_Click" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Linea:
                        <asp:Label ID="LineaLabel" runat="server" Text='<%# Eval("Linea") %>' />
                        <br />
                        Descripción:
                        <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        Planta:
                        <asp:Label ID="PlantaLabel" runat="server" Text='<%# Bind("Planta") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
