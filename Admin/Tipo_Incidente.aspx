<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tipo_Incidente.aspx.cs" Inherits="BitOp.Admin.Tipo_Incidente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
        }
        .auto-style11 {
            width: 176px;
        }
        .auto-style12 {
            color: #000000;
            width: 93px;
        }
        .auto-style13 {
            width: 149px;
        }
        .auto-style14 {
            width: 362px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>TIPOS DE INCIDENTE</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Tipo de Incidente</asp:LinkButton>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TipoInicidente" DataSourceID="BopDBTipoIncidente" Width="60%" ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel(build)_194_32.bmp" Text="Cancelar" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Eliminar" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TipoInicidente" HeaderText="Tipo Incidente" ReadOnly="True" SortExpression="TipoInicidente" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion" />
                            <asp:TemplateField HeaderText="eMail Alerta" SortExpression="emailAlerta">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("emailAlerta") %>' TextMode="Email"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("emailAlerta") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#003366" ForeColor="White" />
                    </asp:GridView>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="TipoInicidente" DataSourceID="BopDBTipoIncidente" DefaultMode="Insert" OnPageIndexChanging="FormView1_PageIndexChanging">
                    <EditItemTemplate>
                        TipoInicidente:
                        <asp:Label ID="TipoInicidenteLabel1" runat="server" Text='<%# Eval("TipoInicidente") %>' />
                        <br />
                        Descripcion:
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style12">Tipo Incidente:</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="TipoInicidenteTextBox" runat="server" MaxLength="10" Text='<%# Bind("TipoInicidente") %>' Width="50px" />
                                </td>
                                <td class="auto-style13">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TipoInicidenteTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Descripción:</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="DescripcionTextBox0" runat="server" MaxLength="50" Text='<%# Bind("Descripcion") %>' Height="16px" Width="233px" />
                                </td>
                                <td class="auto-style13">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DescripcionTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">eMail alerta:</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("emailAlerta") %>' Width="233px"></asp:TextBox>
                                </td>
                                <td class="auto-style13">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Estado:</td>
                                <td class="auto-style14">
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13">&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" OnClick="InsertButton_Click" />
                        &nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" OnClick="InsertCancelButton_Click" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        TipoInicidente:
                        <asp:Label ID="TipoInicidenteLabel" runat="server" Text='<%# Eval("TipoInicidente") %>' />
                        <br />
                        Descripcion:
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Delete" />
                        </asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="BopDBTipoIncidente" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [TiposIncidentes] WHERE [TipoInicidente] = @TipoInicidente" InsertCommand="p_ValidaInsertaTIPOSINCIDENTES" InsertCommandType="StoredProcedure" SelectCommand="SELECT [TipoInicidente], [Descripcion], [Estado], [emailAlerta] FROM [TiposIncidentes]" UpdateCommand="UPDATE [TiposIncidentes] SET [Descripcion] = @Descripcion,[emailAlerta]=@emailAlerta, [Estado] = @Estado WHERE [TipoInicidente] = @TipoInicidente">
                    <DeleteParameters>
                        <asp:Parameter Name="TipoInicidente" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="TipoInicidente" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="emailAlerta" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="emailAlerta" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="TipoInicidente" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
