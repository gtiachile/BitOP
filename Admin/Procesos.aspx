<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Procesos.aspx.cs" Inherits="BitOp.Admin.Procesos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 127px;
            color: #000000;
            }
        .auto-style2 {
            width: 2px;
        }
        .auto-style10 {
            color: #000000;
        }
        .auto-style11 {
            width: 252px;
            text-align: left;
            }
        .auto-style12 {
            width: 112px;
            color: #000000;
            }
        .auto-style13 {
            height: 24px;
        }
        .auto-style14 {
            width: 127px;
            color: #000000;
            height: 41px;
        }
        .auto-style15 {
            width: 252px;
            text-align: left;
            height: 41px;
        }
        .auto-style16 {
            width: 112px;
            color: #000000;
            height: 41px;
        }
        .auto-style17 {
            height: 41px;
        }
        .auto-style18 {
            width: 249px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>PROCESOS</strong></p>
    <p class="auto-style10">
        &nbsp;</p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style14" valign="top">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                                &nbsp;
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Proceso</asp:LinkButton>
                            </td>
                            <td class="auto-style15" valign="top"></td>
                            <td class="auto-style16" valign="top"></td>
                            <td class="auto-style17" valign="top"></td>
                        </tr>
                        <tr>
                            <td class="auto-style1" valign="top">Seleccion Planta:</td>
                            <td class="auto-style11" valign="top">
                                <asp:DropDownList ID="DropDownListPlanta" runat="server" AutoPostBack="True" DataSourceID="BopDBFiltroPlanta" DataTextField="Descripción" DataValueField="Planta">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBFiltroPlanta" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                            </td>
                            <td class="auto-style12" valign="top">Seleccione Area:</td>
                            <td valign="top">
                                <asp:DropDownList ID="DropDownListAreas" runat="server" DataSourceID="BopDBAreasFiltro" DataTextField="Descripción" DataValueField="Area" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBAreasFiltro" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Area], [Descripción] FROM [Areas] WHERE ([Planta] = @Planta) ORDER BY [Descripción]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownListPlanta" Name="Planta" PropertyName="SelectedValue" Type="String" DefaultValue="VIE" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Proceso" DataSourceID="BopDBProc" ShowHeaderWhenEmpty="True" Width="70%">
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
                            <asp:BoundField DataField="Proceso" HeaderText="Proceso" ReadOnly="True" SortExpression="Proceso" />
                            <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Area" SortExpression="Area">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="BopDBAreasFiltro" DataTextField="Descripción" DataValueField="Area" SelectedValue='<%# Bind("Area") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBAreasDet" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Area], [Descripción] FROM [Areas]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="BopDBAreasDet0" DataTextField="Descripción" DataValueField="Area" Enabled="False" SelectedValue='<%# Bind("Area") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBAreasDet0" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Area], [Descripción] FROM [Areas]"></asp:SqlDataSource>
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
                </p>
                <p>
                    <asp:SqlDataSource ID="BopDBProc" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Procesos] WHERE [Proceso] = @Proceso" InsertCommand="p_ValidaInsertaPROCESOS" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [Procesos] WHERE ([Area] = @Area)" UpdateCommand="UPDATE [Procesos] SET [Descripción] = @Descripción, [Fecha Creación] = @Fecha_Creación, [Estado] = @Estado, [Area] = @Area WHERE [Proceso] = @Proceso">
                        <DeleteParameters>
                            <asp:Parameter Name="Proceso" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Proceso" Type="String" />
                            <asp:Parameter Name="Descripción" Type="String" />
                            <asp:Parameter Name="Fecha_Creación" Type="String" />
                            <asp:Parameter Name="Estado" Type="String" />
                            <asp:Parameter Name="Area" Type="String" />
                            <asp:Parameter Name="Done" Type="Boolean" />
                            <asp:Parameter Name="Msg" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListAreas" Name="Area" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Descripción" Type="String" />
                            <asp:Parameter Name="Fecha_Creación" Type="String" />
                            <asp:Parameter Name="Estado" Type="String" />
                            <asp:Parameter Name="Area" Type="String" />
                            <asp:Parameter Name="Proceso" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Proceso" DataSourceID="BopDBProc" DefaultMode="Insert" Width="403px" OnItemInserting="FormView1_ItemInserting" >
                    <EditItemTemplate>
                        Proceso:
                        <asp:Label ID="ProcesoLabel1" runat="server" Text='<%# Eval("Proceso") %>' />
                        <br />
                        Descripción:
                        <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        Linea:
                        <asp:TextBox ID="LineaTextBox" runat="server" Text='<%# Bind("Linea") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style10">Proceso: </td>
                                <td class="auto-style18">
                                    <asp:TextBox ID="ProcesoTextBox" runat="server" Text='<%# Bind("Proceso") %>' />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ProcesoTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Descripción: </td>
                                <td class="auto-style18">
                                    <asp:TextBox ID="DescripciónTextBox0" runat="server" Height="18px" Text='<%# Bind("Descripción") %>' Width="205px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DescripciónTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Planta:</td>
                                <td class="auto-style18">
                                    <asp:DropDownList ID="DropDownListPlanta1" runat="server" DataSourceID="BopDBPlantasFV" DataTextField="Descripción" DataValueField="Planta" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBPlantasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas] where [Estado] = 'Activo'"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Area: </td>
                                <td class="auto-style18">
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBAreasForm" DataTextField="Descripción" DataValueField="Area" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBAreasForm" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Area], [Descripción] FROM [Areas] 
WHERE [Planta] = @Planta
     and [Estado] = 'Activo'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownListPlanta1" DefaultValue="VIE" Name="Planta" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Estado: </td>
                                <td class="auto-style18">
                                    <asp:DropDownList ID="DropDownListEstado" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" OnClick="InsertButton_Click" />
                        &nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" OnClick="InsertCancelButton_Click" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Proceso:
                        <asp:Label ID="ProcesoLabel" runat="server" Text='<%# Eval("Proceso") %>' />
                        <br />
                        Descripción:
                        <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        Linea:
                        <asp:Label ID="LineaLabel" runat="server" Text='<%# Bind("Linea") %>' />
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
