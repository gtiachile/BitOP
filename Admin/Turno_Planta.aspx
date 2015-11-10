<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turno_Planta.aspx.cs" Inherits="BitOp.Admin.Turno_Planta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
        }
        .auto-style11 {
            width: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="auto-style10"><strong>TURNOS POR PLANTA</strong></h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Turno Planta</asp:LinkButton>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="BopDBTurnosPlanta" Width="80%">
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
                            <asp:BoundField DataField="Codigo" HeaderText="Código" ReadOnly="True" SortExpression="Codigo" />
                            <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                            <asp:TemplateField HeaderText="Planta" SortExpression="Planta">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBPlantaGV" DataTextField="Descripción" DataValueField="Planta" SelectedValue='<%# Bind("Planta") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBPlantaGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="BopDBPlantaGV0" DataTextField="Descripción" DataValueField="Planta" Enabled="False" SelectedValue='<%# Bind("Planta") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBPlantaGV0" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Turno" SortExpression="Turno">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="BopDBTurnosGV" DataTextField="Turno" DataValueField="Turno" SelectedValue='<%# Bind("Turno") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBTurnosGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Turno] FROM [Turnos]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Turno") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dotación St." SortExpression="DotacionStd">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DotacionStd") %>' TextMode="Number" Width="53px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DotacionStd") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Inicio" SortExpression="HoraInicio">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="5" Text='<%# Bind("HoraInicio") %>' Width="58px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("HoraInicio") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fin" SortExpression="HoraFin">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="5" Text='<%# Bind("HoraFin") %>' Width="58px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("HoraFin") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="BopDBEstadoGV" DataTextField="Estado" DataValueField="Estado" SelectedValue='<%# Bind("Estado") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBEstadoGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Estado] FROM [Estados]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#003366" ForeColor="White" />
                    </asp:GridView>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Codigo" DataSourceID="BopDBTurnosPlanta" DefaultMode="Insert" Width="670px">
                    <EditItemTemplate>
                        Codigo:
                        <asp:Label ID="CodigoLabel1" runat="server" Text='<%# Eval("Codigo") %>' />
                        <br />
                        Descripción:
                        <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Planta:
                        <asp:TextBox ID="PlantaTextBox" runat="server" Text='<%# Bind("Planta") %>' />
                        <br />
                        Turno:
                        <asp:TextBox ID="TurnoTextBox" runat="server" Text='<%# Bind("Turno") %>' />
                        <br />
                        DotacionStd:
                        <asp:TextBox ID="DotacionStdTextBox" runat="server" Text='<%# Bind("DotacionStd") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        &nbsp;<table style="width:103%;">
                            <tr>
                                <td class="auto-style10">Código:</td>
                                <td>
                                    <asp:TextBox ID="CodigoTextBox" runat="server" MaxLength="10" Text='<%# Bind("Codigo") %>' Width="76px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CodigoTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style11">&nbsp;</td>
                                <td class="auto-style10">Descripción:</td>
                                <td>
                                    <asp:TextBox ID="DescripciónTextBox0" runat="server" Text='<%# Bind("Descripción") %>' />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DescripciónTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Planta:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="BopDBPlantasFV" DataTextField="Descripción" DataValueField="Planta" SelectedValue='<%# Bind("Planta") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBPlantasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                <td class="auto-style10">Turno:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="BopDBTurnos" DataTextField="Turno" DataValueField="Turno" SelectedValue='<%# Bind("Turno") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBTurnos" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Turno] FROM [Turnos]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Dotación Estándar:</td>
                                <td>
                                    <asp:TextBox ID="DotacionStdTextBox0" runat="server" Text='<%# Bind("DotacionStd") %>' TextMode="Number" Width="45px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DotacionStdTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style11">&nbsp;</td>
                                <td class="auto-style10">Estado:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem Selected="True">Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Hora inicio:</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="5" Text='<%# Bind("HoraInicio") %>' Width="58px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style11">&nbsp;</td>
                                <td class="auto-style10">Hora Fin:</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="5" Text='<%# Bind("HoraFin") %>' Width="58px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" OnClick="InsertButton_Click" />
                        &nbsp; <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClick="InsertCancelButton_Click" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Codigo:
                        <asp:Label ID="CodigoLabel" runat="server" Text='<%# Eval("Codigo") %>' />
                        <br />
                        Descripción:
                        <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Planta:
                        <asp:Label ID="PlantaLabel" runat="server" Text='<%# Bind("Planta") %>' />
                        <br />
                        Turno:
                        <asp:Label ID="TurnoLabel" runat="server" Text='<%# Bind("Turno") %>' />
                        <br />
                        DotacionStd:
                        <asp:Label ID="DotacionStdLabel" runat="server" Text='<%# Bind("DotacionStd") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="BopDBTurnosPlanta" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [TurnoPlanta] WHERE [Codigo] = @Codigo" InsertCommand="p_ValidaInsertaTURNOPLANTA" InsertCommandType="StoredProcedure" SelectCommand="SELECT [Codigo], [Descripción], [Planta], [Turno], [DotacionStd], [Estado], [HoraInicio], [HoraFin] FROM [TurnoPlanta]" UpdateCommand="UPDATE [TurnoPlanta] SET [Descripción] = @Descripción, [Planta] = @Planta, [Turno] = @Turno, [DotacionStd] = @DotacionStd, [Estado] = @Estado, [HoraInicio] = @HoraInicio, [HoraFin] = @HoraFin WHERE [Codigo] = @Codigo">
                    <DeleteParameters>
                        <asp:Parameter Name="Codigo" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Codigo" Type="String" />
                        <asp:Parameter Name="Descripción" Type="String" />
                        <asp:Parameter Name="Planta" Type="String" />
                        <asp:Parameter Name="Turno" Type="String" />
                        <asp:Parameter Name="HoraInicio" Type="String" />
                        <asp:Parameter Name="HoraFin" Type="String" />
                        <asp:Parameter Name="DotacionStd" Type="Int32" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Descripción" Type="String" />
                        <asp:Parameter Name="Planta" Type="String" />
                        <asp:Parameter Name="Turno" Type="String" />
                        <asp:Parameter Name="DotacionStd" Type="Int32" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="HoraInicio" Type="String" />
                        <asp:Parameter Name="HoraFin" Type="String" />
                        <asp:Parameter Name="Codigo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
