<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Control_Proceso.aspx.cs" Inherits="BitOp.CProcesos.Control_Proceso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">


        .auto-style10 {
            width: 77px;
        }
        .auto-style11 {
            width: 203px;
        }
        .auto-style12 {
            width: 77px;
        }
        .auto-style45 {
            width: 132px;
        }
        .auto-style46 {
            width: 56px;
        }
        .auto-style47 {
            width: 77px;
            color: #000000;
        }
        .auto-style48 {
            width: 56px;
            color: #000000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        CONDICIONES DE PROCESO</p>
        <table style="border-style: solid; border-width: thin; width:100%;">
            <tr>
                <td class="auto-style47">Fecha:</td>
                <td class="auto-style11"><strong>
                    <asp:Label ID="lblFecha" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style47">Planta:</td>
                <td class="auto-style45"><strong>
                    <asp:Label ID="lblPlanta" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style46">&nbsp;</td>
                <td>
                    <asp:Label ID="lblCodEquipo" runat="server" Text="lblCodEquipo" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style47">Responsable:</td>
                <td class="auto-style11"><strong>
                    <asp:Label ID="lblResponsable" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style47">Area:</td>
                <td class="auto-style45"><strong>
                    <asp:Label ID="lblArea" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style48">Equipo:</td>
                <td><strong>
                    <asp:Label ID="lblEquipo" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style47">Cargo:</td>
                <td class="auto-style11"><strong>
                    <asp:Label ID="lblCargo" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style47">Turno:</td>
                <td class="auto-style45"><strong>
                    <asp:Label ID="lblTurno" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style46">&nbsp;</td>
                <td>
                    <asp:Label ID="lblNivRegDet" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lblLocalizacion" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lblDiasAtr" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lblUsuario" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="SelPlanta" runat="server"></asp:Label>
                    <asp:Label ID="SelArea" runat="server"></asp:Label>
                    <asp:Label ID="SelProceso" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="SelPlanilla" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style45">&nbsp;</td>
                <td class="auto-style46">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    SELECCIONE TIPO DE PLANILLA
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="BopDBPlanillasMedicionEnc" Width="70%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Select.png" ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="N°" SortExpression="NroPlanilla">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NroPlanilla") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNroPlanilla" runat="server" Text='<%# Bind("NroPlanilla") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Planilla" SortExpression="Titulo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Titulo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelPlanilla" runat="server" Text='<%# Bind("Titulo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Planta Dsc" HeaderText="Planta" SortExpression="Planta Dsc" />
                        <asp:BoundField DataField="AreaDsc" HeaderText="Area" SortExpression="AreaDsc" />
                        <asp:BoundField DataField="ProcesoDsc" HeaderText="Proceso" SortExpression="ProcesoDsc" />
                        <asp:BoundField DataField="EquipoDsc" HeaderText="Equipo" SortExpression="EquipoDsc" />
                    </Columns>
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                    <SelectedRowStyle BackColor="#4D6082" ForeColor="#CCCCCC" Width="60%" />
    </asp:GridView>
    <asp:SqlDataSource ID="BopDBPlanillasMedicionEnc" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT PlanillasMedicionEnc.Titulo, PlanillasMedicionEnc.Planta, Plantas.Descripción AS [Planta Dsc], PlanillasMedicionEnc.Area, Areas.Descripción AS AreaDsc, PlanillasMedicionEnc.Proceso, Procesos.Descripción AS ProcesoDsc, PlanillasMedicionEnc.Equipo, Equipos.Equipo AS EquipoDsc, PlanillasMedicionEnc.DiasToleranciaIng, PlanillasMedicionEnc.Estado, PlanillasMedicionEnc.NroPlanilla FROM PlanillasMedicionEnc LEFT OUTER JOIN Areas ON PlanillasMedicionEnc.Area = Areas.Area LEFT OUTER JOIN Equipos ON PlanillasMedicionEnc.Equipo = Equipos.Equipo LEFT OUTER JOIN Procesos ON PlanillasMedicionEnc.Proceso = Procesos.Proceso LEFT OUTER JOIN Plantas ON PlanillasMedicionEnc.Planta = Plantas.Planta WHERE (PlanillasMedicionEnc.Planta = @Planta) AND (PlanillasMedicionEnc.Area = @Area) AND (PlanillasMedicionEnc.Estado = 'Activo')">
        <SelectParameters>
            <asp:ControlParameter ControlID="SelPlanta" Name="Planta" PropertyName="Text" />
            <asp:ControlParameter ControlID="SelArea" Name="Area" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="ButtonIMediciones" runat="server" Text="Ingresar Mediciones" />
    <br />

                </asp:Content>
