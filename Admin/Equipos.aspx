<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="BitOp.Admin.Equipos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style10 {
            color: #000000;
        }
        .auto-style11 {
            height: 26px;
            color: #000000;
        }
        .auto-style15 {
            width: 203px;
        }
        .auto-style16 {
            width: 62px;
        }
        .auto-style18 {
            width: 68px;
        }
        .auto-style19 {
            width: 189px;
        }
        .auto-style21 {
            width: 198px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="auto-style10"><strong>EQUIPOS</strong></h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    &nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Equipo</asp:LinkButton>
                </p>
                <p>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style15">
                                <asp:DropDownList ID="DropDownListPlanta" runat="server" AutoPostBack="True" DataSourceID="BopDBFiltroPlanta" DataTextField="Descripción" DataValueField="Planta">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBFiltroPlanta" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                            </td>
                            <td class="auto-style18">Seleccione Area:</td>
                            <td class="auto-style19">
                                <asp:DropDownList ID="DropDownListAreas" runat="server" AutoPostBack="True" DataSourceID="BopDBAreasFiltro" DataTextField="Descripción" DataValueField="Area">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBAreasFiltro" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Area], [Descripción] FROM [Areas] WHERE ([Planta] = @Planta) ORDER BY [Descripción]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownListPlanta" DefaultValue="VIE" Name="Planta" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style16">Seleccione Proceso:</td>
                            <td class="auto-style21">
                                <asp:DropDownList ID="DropDownListProcesos" runat="server" AutoPostBack="True" DataSourceID="BopDBProcFiltro" DataTextField="Descripción" DataValueField="Proceso">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBProcFiltro" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Proceso], [Descripción] FROM [Procesos] WHERE ([Area] = @Area)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownListAreas" Name="Area" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Equipo" DataSourceID="BopDBEquiposGV" Width="80%" ShowHeaderWhenEmpty="True">
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
                            <asp:BoundField DataField="Equipo" HeaderText="Equipo" ReadOnly="True" SortExpression="Equipo" />
                            <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                            <asp:TemplateField HeaderText="Proceso" SortExpression="Proceso">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBProcesosGV" DataTextField="Descrip" DataValueField="Proceso" SelectedValue='<%# Bind("Proceso") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBProcesosGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Proceso, Proceso + N' - ' + Descripción AS Descrip FROM Procesos"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Proceso") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="BopDBEstado" DataTextField="Estado" DataValueField="Estado" SelectedValue='<%# Bind("Estado") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBEstado" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Estado] FROM [Estados]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#003366" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="BopDBEquiposGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Equipo], [Descripción], [Proceso], [Estado] FROM [Equipos] WHERE ([Proceso] = @Proceso)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListProcesos" Name="Proceso" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Equipo" DataSourceID="BopDBEquiposFV" DefaultMode="Insert" Width="408px" OnItemInserting="FormView1_ItemInserting">
                    <EditItemTemplate>
                        Equipo:
                        <asp:Label ID="EquipoLabel1" runat="server" Text='<%# Eval("Equipo") %>' />
                        <br />
                        Proceso:
                        <asp:TextBox ID="ProcesoTextBox" runat="server" Text='<%# Bind("Proceso") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        Descripción:
                        <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style10">Equipo:</td>
                                <td>
                                    <asp:TextBox ID="EquipoTextBox" runat="server" Text='<%# Bind("Equipo") %>' Width="111px" Height="22px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EquipoTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Descripción:</td>
                                <td>
                                    <asp:TextBox ID="DescripciónTextBox0" runat="server" MaxLength="30" Text='<%# Bind("Descripción") %>' Width="196px" Height="22px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DescripciónTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Planta:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownListPlanta1" runat="server" AutoPostBack="True" DataSourceID="BopDBPlantasFV" DataTextField="Descripción" DataValueField="Planta" Height="22px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBPlantasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas] where [Estado] = 'Activo'"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListPlanta1" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Area:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="BopDBAreasForm" DataTextField="Descripción" DataValueField="Area" Height="22px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBAreasForm" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Area], [Descripción] FROM [Areas] 
WHERE [Planta] = @Planta
     and [Estado] = 'Activo'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownListPlanta1" DefaultValue="VIE" Name="Planta" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList4" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style11">Proceso:</td>
                                <td class="auto-style1">
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="BopDBProcesosFV" DataTextField="Descripción" DataValueField="Proceso" Height="22px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBProcesosFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Proceso, Descripción FROM Procesos
WHERE [Area] = @Area and [Estado] = 'Activo'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList4" Name="Area" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Estado:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Estado" DataValueField="Estado" SelectedValue='<%# Bind("Estado") %>' AutoPostBack="True" Height="22px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Estado] FROM [Estados]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insertar" />
                        &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Equipo:
                        <asp:Label ID="EquipoLabel" runat="server" Text='<%# Eval("Equipo") %>' />
                        <br />
                        Proceso:
                        <asp:Label ID="ProcesoLabel" runat="server" Text='<%# Bind("Proceso") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        Descripción:
                        <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="BopDBEquiposFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Equipos] WHERE [Equipo] = @Equipo" InsertCommand="p_ValidaInsertaEQUIPOS" InsertCommandType="StoredProcedure" SelectCommand="SELECT [Equipo], [Descripción], [Proceso], [Estado] FROM [Equipos]" UpdateCommand="UPDATE [Equipos] SET [Proceso] = @Proceso,  [Descripción] = @Descripción, [Estado] = @Estado 
WHERE [Equipo] = @Equipo">
                    <DeleteParameters>
                        <asp:Parameter Name="Equipo" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Equipo" Type="String" />
                        <asp:Parameter Name="Descripción" Type="String" />
                        <asp:Parameter Name="Proceso" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Proceso" Type="String" />
                        <asp:Parameter Name="Descripción" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Equipo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
