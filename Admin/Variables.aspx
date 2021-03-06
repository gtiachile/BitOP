﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Variables.aspx.cs" Inherits="BitOp.Admin.Variables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 99%;
            height: 198px;
        }
        .auto-style15 {
            height: 13px;
        }
        .auto-style16 {
            height: 4px;
        }
        .auto-style17 {
            height: 12px;
            width: 261px;
        }
        .auto-style19 {
            height: 13px;
            width: 261px;
        }
        .auto-style20 {
            height: 4px;
            width: 261px;
        }
        .auto-style21 {
            height: 12px;
        }
        .auto-style22 {
            height: 11px;
        }
        .auto-style23 {
            height: 11px;
            width: 261px;
        }
        .auto-style24 {
            height: 12px;
            width: 70px;
            color: #000000;
        }
        .auto-style25 {
            height: 11px;
            width: 70px;
            color: #000000;
        }
        .auto-style26 {
            height: 13px;
            width: 70px;
            color: #000000;
        }
        .auto-style27 {
            height: 4px;
            width: 70px;
            color: #000000;
        }
        .auto-style28 {
            height: 12px;
            width: 318px;
        }
        .auto-style29 {
            height: 11px;
            width: 318px;
        }
        .auto-style30 {
            height: 13px;
            width: 318px;
        }
        .auto-style31 {
            height: 4px;
            width: 318px;
        }
        .auto-style32 {
            height: 13px;
            color: #000000;
            width: 80px;
        }
        .auto-style33 {
            height: 11px;
            color: #000000;
            width: 80px;
        }
        .auto-style34 {
            height: 12px;
            color: #000000;
            width: 80px;
        }
        .auto-style35 {
            color: #000000;
        }
        .auto-style36 {
            height: 12px;
            width: 120px;
        }
        .auto-style37 {
            height: 11px;
            width: 120px;
        }
        .auto-style38 {
            height: 13px;
            width: 120px;
        }
        .auto-style39 {
            height: 4px;
            width: 120px;
        }
        .auto-style40 {
            height: 4px;
            width: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="auto-style35"><strong>VARIABLES DE PROCESO</strong></h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agrega Variable</asp:LinkButton>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Variable" DataSourceID="BopDBVariables" Width="80%" ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel.png" Text="Cancelar" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Eliminar" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Variable" SortExpression="Variable">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Variable") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Variable") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Equipo" SortExpression="Equipo">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBEquiposGV" DataTextField="Descripción" DataValueField="Equipo" SelectedValue='<%# Bind("Equipo") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBEquiposGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Equipo], [Descripción] FROM [Equipos] where estado='Activo'"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="BopDBEquiposGV0" DataTextField="Descripción" DataValueField="Equipo" Enabled="False" SelectedValue='<%# Bind("Equipo") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBEquiposGV0" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Equipo], [Descripción] FROM [Equipos] where estado='Activo'"></asp:SqlDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Descripción" SortExpression="Descripcion">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="50" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Unidad" SortExpression="Unidad">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="BopDBUnidades" DataTextField="Descripcion" DataValueField="Unidad" SelectedValue='<%# Bind("Unidad") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBUnidades" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Unidad], [Descripcion] FROM [Unidades] where estado='Activo'"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Unidad") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Límite Sup." SortExpression="LimSup">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("LimSup") %>' TextMode="Number"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("LimSup") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Límite Inf." SortExpression="LimInf">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("LimInf") %>' TextMode="Number"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("LimInf") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList6" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#003366" ForeColor="White" />
                    </asp:GridView>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Variable" DataSourceID="BopDBVariables" DefaultMode="Insert" Width="90%">
                    <EditItemTemplate>
                        Variable:
                        <asp:Label ID="VariableLabel1" runat="server" Text='<%# Eval("Variable") %>' />
                        <br />
                        Equipo:
                        <asp:TextBox ID="EquipoTextBox" runat="server" Text='<%# Bind("Equipo") %>' />
                        <br />
                        Descripcion:
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        Unidad:
                        <asp:TextBox ID="UnidadTextBox" runat="server" Text='<%# Bind("Unidad") %>' />
                        <br />
                        LimSup:
                        <asp:TextBox ID="LimSupTextBox" runat="server" Text='<%# Bind("LimSup") %>' />
                        <br />
                        LimInf:
                        <asp:TextBox ID="LimInfTextBox" runat="server" Text='<%# Bind("LimInf") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table class="auto-style11">
                            <tr>
                                <td class="auto-style24">Variable:</td>
                                <td class="auto-style21">
                                    <asp:TextBox ID="VariableTextBox" runat="server" MaxLength="10" Text='<%# Bind("Variable") %>' />
                                </td>
                                <td class="auto-style36">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="VariableTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style34">Descripción:</td>
                                <td class="auto-style17">
                                    <asp:TextBox ID="DescripcionTextBox0" runat="server" MaxLength="50" Text='<%# Bind("Descripcion") %>' Width="200px" />
                                </td>
                                <td class="auto-style28">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DescripcionTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">Equipo:</td>
                                <td class="auto-style22">
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="BobDBEquiposFV" DataTextField="descripcion" DataValueField="Equipo" SelectedValue='<%# Bind("Equipo") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BobDBEquiposFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Equipo], [Equipo]+' - '+[Descripción] as descripcion FROM [Equipos] where [Estado]='Activo'"></asp:SqlDataSource>
                                </td>
                                <td class="auto-style37"></td>
                                <td class="auto-style33">Unidad: </td>
                                <td class="auto-style23">
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="BobDBUnidadesFV" DataTextField="Descripcion" DataValueField="Unidad" SelectedValue='<%# Bind("Unidad") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BobDBUnidadesFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Unidad], [Descripcion] FROM [Unidades]"></asp:SqlDataSource>
                                </td>
                                <td class="auto-style29"></td>
                            </tr>
                            <tr>
                                <td class="auto-style26">Límite<br />Superior:</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="LimSupTextBox0" runat="server" Height="16px" Text='<%# Bind("LimSup") %>' TextMode="Number" />
                                </td>
                                <td class="auto-style38">&nbsp;</td>
                                <td class="auto-style32">Límite
                                    <br />
                                    Inferior:</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="LimInfTextBox0" runat="server" Text='<%# Bind("LimInf") %>' TextMode="Number" />
                                </td>
                                <td class="auto-style30">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style27">Estado:</td>
                                <td class="auto-style16">
                                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style39">
                                    <br />
                                </td>
                                <td class="auto-style40">
                                    <br />
                                </td>
                                <td class="auto-style20"></td>
                                <td class="auto-style31">&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insertar" />
                        &nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Variable:
                        <asp:Label ID="VariableLabel" runat="server" Text='<%# Eval("Variable") %>' />
                        <br />
                        Equipo:
                        <asp:Label ID="EquipoLabel" runat="server" Text='<%# Bind("Equipo") %>' />
                        <br />
                        Descripcion:
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        Unidad:
                        <asp:Label ID="UnidadLabel" runat="server" Text='<%# Bind("Unidad") %>' />
                        <br />
                        LimSup:
                        <asp:Label ID="LimSupLabel" runat="server" Text='<%# Bind("LimSup") %>' />
                        <br />
                        LimInf:
                        <asp:Label ID="LimInfLabel" runat="server" Text='<%# Bind("LimInf") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="BopDBVariables" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Variables] WHERE [Variable] = @Variable" InsertCommand="p_ValidaInsertaVARIABLES" InsertCommandType="StoredProcedure" SelectCommand="SELECT [Variable], [Equipo], [Descripcion], [Unidad], [LimSup], [LimInf], [Estado] FROM [Variables]" UpdateCommand="UPDATE [Variables] SET [Equipo] = @Equipo, [Descripcion] = @Descripcion, [Unidad] = @Unidad, [LimSup] = @LimSup, [LimInf] = @LimInf, [Estado] = @Estado WHERE [Variable] = @Variable">
                    <DeleteParameters>
                        <asp:Parameter Name="Variable" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Variable" Type="String" />
                        <asp:Parameter Name="Equipo" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Unidad" Type="String" />
                        <asp:Parameter Name="LimSup" Type="Decimal" />
                        <asp:Parameter Name="LimInf" Type="Decimal" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Equipo" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Unidad" Type="String" />
                        <asp:Parameter Name="LimSup" Type="Decimal" />
                        <asp:Parameter Name="LimInf" Type="Decimal" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Variable" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
