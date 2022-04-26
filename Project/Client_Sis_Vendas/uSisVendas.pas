﻿unit uSisVendas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, uDM, uSincronismo, uFormat,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation,
  FMX.MultiView, FMX.TabControl, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Actions, FMX.ActnList, FMX.DateTimeCtrls, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFormPrincipal = class(TForm)
    MultiView: TMultiView;
    ListBox: TListBox;
    ListBoxHeader: TListBoxHeader;
    btnCadastroPessoa: TListBoxItem;
    btnCadastroFornecedor: TListBoxItem;
    btnCadastroProduto: TListBoxItem;
    btnVendas: TListBoxItem;
    lblUsuario: TLabel;
    TabControl: TTabControl;
    ToolBar: TToolBar;
    Rectangle1: TRectangle;
    lblTitulo: TLabel;
    tabMenu: TTabItem;
    tabCadPessoa: TTabItem;
    tabCadFornecedor: TTabItem;
    tabCadProduto: TTabItem;
    tabVenda: TTabItem;
    btnMenu: TImage;
    RecLogin: TRectangle;
    Layout1: TLayout;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    lblEsqueciSenha: TLabel;
    btnLogin: TButton;
    ListBoxCadPessoa: TListBox;
    ListBoxItemNome: TListBoxItem;
    ListBoxItemCpf: TListBoxItem;
    ListBoxItemCep: TListBoxItem;
    ListBoxItemTipCadastro: TListBoxItem;
    Label1: TLabel;
    EdtNomeCadPessoa: TEdit;
    Label2: TLabel;
    edtCpfCadPessoa: TEdit;
    Label3: TLabel;
    EdtCepCadPessoa: TEdit;
    Label4: TLabel;
    cbTipCadastro: TComboBox;
    ListBoxItemAcessos: TListBoxItem;
    Label5: TLabel;
    Label6: TLabel;
    edtUserCadPessoa: TEdit;
    edtSenhaCadPessoa: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    swCadPessoa: TSwitch;
    swCadFornecedor: TSwitch;
    swVendas: TSwitch;
    swCadProduto: TSwitch;
    ListBoxItemEndereco: TListBoxItem;
    Label12: TLabel;
    EditEnderecoCadPessoa: TEdit;
    TabControlCadPessoa: TTabControl;
    TabItemCadastroPessoa: TTabItem;
    TabItemConsultaPessoa: TTabItem;
    lvCadPessoa: TListView;
    ListBoxItemSalvarCadPessoa: TListBoxItem;
    btnSalvar: TImage;
    Label13: TLabel;
    ActionList1: TActionList;
    ChangeTab: TChangeTabAction;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Label14: TLabel;
    ListBoxItem2: TListBoxItem;
    Label15: TLabel;
    edtNomeFornecedor: TEdit;
    ListBoxItem3: TListBoxItem;
    Label16: TLabel;
    edtRazaoSocialFornecedor: TEdit;
    ListBoxItem4: TListBoxItem;
    Label17: TLabel;
    edtCNPJFornecedor: TEdit;
    rbFornecedorAtivo: TRadioButton;
    ListBoxItem5: TListBoxItem;
    Label18: TLabel;
    rbFornecedorDestativado: TRadioButton;
    lvCadFornecedor: TListView;
    ListBox2: TListBox;
    ListBoxItem6: TListBoxItem;
    Label19: TLabel;
    ListBoxItem7: TListBoxItem;
    Label20: TLabel;
    edtDescricaoProduto: TEdit;
    ListBoxItem8: TListBoxItem;
    Label21: TLabel;
    edtPrecoProduto: TEdit;
    ListBoxItem9: TListBoxItem;
    Label22: TLabel;
    ListBoxItem10: TListBoxItem;
    Label23: TLabel;
    ListBoxItem11: TListBoxItem;
    Label24: TLabel;
    lvCadProduto: TListView;
    edtEstoqueProduto: TEdit;
    cbFornecedorProduto: TComboBox;
    rbAtivoProduto: TRadioButton;
    rbDesativadoProduto: TRadioButton;
    ListBox3: TListBox;
    ListBoxItem12: TListBoxItem;
    Label25: TLabel;
    ListBoxItem13: TListBoxItem;
    Label26: TLabel;
    ListBoxItem14: TListBoxItem;
    Label27: TLabel;
    ListBoxItem15: TListBoxItem;
    Label28: TLabel;
    ListBoxItem16: TListBoxItem;
    Label29: TLabel;
    lvVendas: TListView;
    cbProdutoVenda: TComboBox;
    cbClienteVenda: TComboBox;
    edtQuantidadeVenda: TEdit;
    edtDataVenda: TDateEdit;
    edtHoraVenda: TTimeEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure cbTipCadastroClosePopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCadastroPessoaClick(Sender: TObject);
    procedure btnCadastroFornecedorClick(Sender: TObject);
    procedure btnCadastroProdutoClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure ListBoxHeaderClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
    procedure VerificaLogin;
  public
    { Public declarations }
    uSync : TSincronismo;
    procedure LimpaCampos;
  end;

var
  FormPrincipal: TFormPrincipal;
  vgTipoPessoa : String;

implementation

{$R *.fmx}

procedure TFormPrincipal.btnCadastroFornecedorClick(Sender: TObject);
begin
 ChangeTab.Tab := tabCadFornecedor;
 ChangeTab.ExecuteTarget(Self);
 btnSalvar.Visible := True;
 MultiView.HideMaster;
end;

procedure TFormPrincipal.btnCadastroPessoaClick(Sender: TObject);
begin
 DM.qryPessoa.Close;
 DM.qryPessoa.Open;
 ChangeTab.Tab := tabCadPessoa;
 ChangeTab.ExecuteTarget(Self);
 btnSalvar.Visible := True;
 MultiView.HideMaster;
end;

procedure TFormPrincipal.btnCadastroProdutoClick(Sender: TObject);
begin
 ChangeTab.Tab := tabCadProduto;
 ChangeTab.ExecuteTarget(Self);
 btnSalvar.Visible := True;
 MultiView.HideMaster;
end;

procedure TFormPrincipal.btnLoginClick(Sender: TObject);
begin
  if (EdtUsuario.Text.Equals('Admin') and EdtSenha.Text.Equals('Password')) then
  begin
    RecLogin.Visible := False;
    lblUsuario.Text := EdtUsuario.Text;
  end
  else
  begin
   uSync.Conectando;
   VerificaLogin;

  end;
end;

procedure TFormPrincipal.btnSalvarClick(Sender: TObject);
begin
  if tabCadPessoa.IsSelected then
  begin

       if cbTipCadastro.ItemIndex  = -1 then
       ShowMessage('Informe o tipo de pessoa.');

       if EdtNomeCadPessoa.Text= '' then
       begin
         ShowMessage('Informe o Nome.');
         edtNomeCadPessoa.SetFocus;
         abort;
       end;

       if edtCpfCadPessoa.Text= '' then
       begin
         ShowMessage('Informe o CPF.');
         edtCPFCadPessoa.SetFocus;
         abort;
       end;

    dm.qryPessoa.First;
    while not dm.qryPessoa.eof do
    begin
      if trim(edtCpfCadPessoa.Text) = dm.qryPessoa.FieldByName('CPF').AsString then
      begin
        ShowMessage('CPF já cadastrado !');
        abort;
      end;
      dm.qryPessoa.Next;
    end;

    uSync.Conectando;

    if uSync.GravaCadPessoa(trim(EdtNomeCadPessoa.Text),
                            trim(edtCpfCadPessoa.Text),
                            trim(EdtCepCadPessoa.Text),
                            trim(EditEnderecoCadPessoa.Text),
                            trim(cbTipCadastro.Items[cbTipCadastro.ItemIndex])) then
    begin
      dm.qryPessoa.Close;
      dm.qryPessoa.Open;
    end
    else
    begin
     ShowMessage('Não foi possivel concluir o cadastro de Pessoa.');
    end;
    ShowMessage('Pessoa: Cadastrado com Sucesso');


   if cbTipCadastro.ItemIndex = 0 then
   begin
     if uSync.GravaCadUsuario(trim(edtCpfCadPessoa.Text),
                            trim(edtUserCadPessoa.Text),
                            trim(edtSenhaCadPessoa.Text),
                            swCadPessoa.IsChecked,
                            swCadFornecedor.IsChecked,
                            swCadProduto.IsChecked,
                            swVendas.IsChecked)then
    begin
      dm.qryPessoa.Close;
      dm.qryPessoa.Open;
    end
    else
    begin
     ShowMessage('Não foi possivel concluir o cadastro de Usuário.');
    end;

    ShowMessage('Usuário: Cadastrado com Sucesso');
   end;


   LimpaCampos;
 end;
  if tabCadFornecedor.IsSelected then
 begin

 end;
  if tabCadProduto.IsSelected then
 begin

 end;
  if tabVenda.IsSelected then
 begin

 end;

end;

procedure TFormPrincipal.btnVendasClick(Sender: TObject);
begin
 ChangeTab.Tab := tabVenda;
 ChangeTab.ExecuteTarget(Self);
 btnSalvar.Visible := True;
 MultiView.HideMaster;
end;

procedure TFormPrincipal.cbTipCadastroClosePopup(Sender: TObject);
begin
  if cbTipCadastro.ItemIndex = 0 then
    ListBoxItemAcessos.Enabled := True
  else
    ListBoxItemAcessos.Enabled := False;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
RecLogin.Visible := True;
lblTitulo.Text := 'Sis Vendas - ' + FormatDateTime('DD/MM/YYYY',Now);
ListBoxItemAcessos.Enabled := False;
btnSalvar.Visible := False;
TabControl.ActiveTab :=  tabMenu;
end;

procedure TFormPrincipal.LimpaCampos;
begin
  EdtNomeCadPessoa.Text := '';
  edtCpfCadPessoa.Text := '';
  EdtCepCadPessoa.Text := '';
  edtUserCadPessoa.Text := '';
  EditEnderecoCadPessoa.Text := '';
  edtSenhaCadPessoa.Text := '';
  edtNomeFornecedor.Text := '';
  edtCNPJFornecedor.Text := '';
  edtRazaoSocialFornecedor.Text := '';
  edtDescricaoProduto.Text := '';
  edtPrecoProduto.Text := '';
  edtEstoqueProduto.Text := '';
  rbFornecedorAtivo.IsChecked := False;
  rbFornecedorDestativado.IsChecked := False;
  rbAtivoProduto.IsChecked := False;
  rbDesativadoProduto.IsChecked := False;
  cbTipCadastro.ItemIndex := -1;
  cbFornecedorProduto.ItemIndex := -1;
end;

procedure TFormPrincipal.ListBoxHeaderClick(Sender: TObject);
begin
 ChangeTab.Tab := tabMenu;
 ChangeTab.ExecuteTarget(Self);
 btnSalvar.Visible := False;
 MultiView.HideMaster;
end;

procedure TFormPrincipal.VerificaLogin;
begin
  try
   if edtUsuario.Text = '' then
   begin
    ShowMessage('Informe o Usuário.');
    edtUsuario.SetFocus;
    exit;
   end;
   if edtSenha.Text = '' then
   begin
    ShowMessage('Informe a Senha.');
    edtSenha.SetFocus;
    exit;
   end;

   if (edtSenha.Text <> '') and (edtUsuario.Text <> '') then
   begin
     DM.qryUsuario.Close;
     DM.qryUsuario.ParamByName('usuario').AsString := edtUsuario.Text;
     DM.qryUsuario.ParamByName('senha').AsString := edtSenha.Text;
     DM.qryUsuario.Open;

     if dm.qryUsuario.IsEmpty then
     begin
      ShowMessage('Usuário ou Senha Incorretos.');
      edtSenha.SetFocus;

     end
     else
     begin
      RecLogin.Visible := False;
      lblUsuario.Text := EdtUsuario.Text;
      lblTitulo.Text  := 'Sistema de Venda - ' + UpperCase(DM.qryUsuario.FieldByName('USUARIO').AsString) + ' - ' + FormatDateTime('DD/MM/YYYY', NOW);

      if DM.qryUsuario.FieldByName('PERCADPESSOA').AsBoolean
      then   btnCadastroPessoa.Visible := True
      else   btnCadastroPessoa.Visible := False;

      if DM.qryUsuario.FieldByName('PERCADFORNECEDOR').AsBoolean
      then   btnCadastroFornecedor.Visible := True
      else   btnCadastroFornecedor.Visible := False;

      if DM.qryUsuario.FieldByName('PERCADPRODUTO').AsBoolean
      then   btnCadastroProduto.Visible := True
      else   btnCadastroProduto.Visible := False;

      if DM.qryUsuario.FieldByName('PERVENDAS').AsBoolean
      then   btnVendas.Visible := True
      else   btnVendas.Visible := False;
     end;
   end;

   except
   on E:Exception do
   begin
    ShowMessage('Ocorreu um Erro: ' + E.Message);
    Abort;
   end;

  end;

end;


end.
