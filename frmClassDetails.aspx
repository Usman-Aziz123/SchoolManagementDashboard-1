﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmClassDetails.aspx.cs" Inherits="School_Dashboard.WebForm23" EnableEventValidation="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">

        <!-- Page Heading -->
 <h1><u><b><i>CLASS DETAIL DATA</i></b></u></h1>
<br />       
         <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="form-group">
                    <asp:Label ID="lbl_cname" runat="server" Text="Class Name"></asp:Label>
                    <asp:DropDownList ID="DropDownListClass" runat="server" class="form-control border-0 shadow form-control-lg text-violet" placeholder="Select Class"></asp:DropDownList>
                    <ajaxToolkit:CascadingDropDown ID="DropDownListClass_CascadingDropDown"  runat="server" Category="Class" BehaviorID="DropDownList1_CascadingDropDown" TargetControlID="DropDownListClass" LoadingText="Loading Class" PromptText="Select Class" ServiceMethod="BindAllClass" ServicePath="~/WebServiceCascading.asmx">
                    </ajaxToolkit:CascadingDropDown>
                </div>
                <br /><div class="form-group">
                     <asp:Label ID="lbl_sname" runat="server" Text="Section Name"></asp:Label>
                    <asp:DropDownList ID="DropDownListSection" runat="server" class="form-control border-0 shadow form-control-lg text-violet" placeholder="Select Class"></asp:DropDownList>
                     <ajaxToolkit:CascadingDropDown ID="DropDownListSection_CascadingDropDown" Category="Section" runat="server" BehaviorID="DropDownList2_CascadingDropDown" TargetControlID="DropDownListSection" LoadingText="Loading Section" PromptText="Select Section" ServiceMethod="BindAllSection" ServicePath="~/WebServiceCascading.asmx" ParentControlID="DropDownListClass">
                     </ajaxToolkit:CascadingDropDown>
                </div>
                
                <br />
                 <br />
                <br />
                <div class="form-group">
                    <asp:Button ID="btn_Add" runat="server" Text="Add" class="btn btn-primary shadow px-5" OnClick="btn_Add_Click" />
                </div>
                <br />
                <div class="form-group" >
                    <asp:GridView ID="GridViewDetails" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </div>

                <div class="form-group">
                    <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary shadow px-5" />
                </div>
                <br />
                 <div class="form-group">

                     <asp:GridView ID="GridViewClassDetails" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ClassDetailsID,ClassID,SectionID" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewClassDetails_SelectedIndexChanged">
                         <AlternatingRowStyle BackColor="#CCCCCC" />
                         <Columns>
                             <asp:CommandField HeaderText="Select" SelectText="*" ShowSelectButton="True" />
                             <asp:BoundField DataField="ClassDetailsID" HeaderText="ClassDetailsID" InsertVisible="False" ReadOnly="True" SortExpression="ClassDetailsID" />
                             <asp:BoundField DataField="ClassID" HeaderText="ClassID" SortExpression="ClassID" InsertVisible="False" ReadOnly="True" />
                             <asp:BoundField DataField="ClassName" HeaderText="ClassName" SortExpression="ClassName" />
                             <asp:BoundField DataField="SectionID" HeaderText="SectionID" InsertVisible="False" ReadOnly="True" SortExpression="SectionID" />
                             <asp:BoundField DataField="SectionName" HeaderText="SectionName" SortExpression="SectionName" />
                         </Columns>
                         <FooterStyle BackColor="#CCCCCC" />
                         <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                         <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#F1F1F1" />
                         <SortedAscendingHeaderStyle BackColor="#808080" />
                         <SortedDescendingCellStyle BackColor="#CAC9C9" />
                         <SortedDescendingHeaderStyle BackColor="#383838" />
                     </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="Select cs.ClassDetailsID, c.ClassID,c.ClassName,sec.SectionID,sec.SectionName from tbl_ClassSectionDetails cs join tbl_Class c on c.ClassID=cs.ClassID 
join tbl_Section sec on cs.SectionID=sec.SectionID"></asp:SqlDataSource>
                 </div>

                </div>
             </div>
         </div>
    
</asp:Content>
