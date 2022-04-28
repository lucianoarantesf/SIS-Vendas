﻿unit uSisVendas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, uDM, uSincronismo,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation,
  FMX.MultiView, FMX.TabControl, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Actions, FMX.ActnList, FMX.DateTimeCtrls, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Skia.FMX;

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
    btnLogOut: TImage;
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
    SkLabel1: TSkLabel;
    btnSalvarCadPessoa: TImage;
    SkAnimatedImage1: TSkAnimatedImage;
    btnEditarCadPessoa: TImage;
    btnExcluirCadPessoa: TImage;
    btnLogin: TRectangle;
    Label13: TLabel;
    btnEditarCadFornecedor: TImage;
    btnExcluirCadFornecedor: TImage;
    btnSalvarCadFornecedor: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    SuccessAnimation: TSkAnimatedImage;
    ErrorAnimation: TSkAnimatedImage;
    procedure cbTipCadastroClosePopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
    procedure btnCadastroPessoaClick(Sender: TObject);
    procedure btnCadastroFornecedorClick(Sender: TObject);
    procedure btnCadastroProdutoClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure ListBoxHeaderClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure lvCadPessoaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnSalvarCadPessoaClick(Sender: TObject);
    procedure btnEditarCadPessoaClick(Sender: TObject);
    procedure btnLoginMouseEnter(Sender: TObject);
    procedure btnLoginMouseLeave(Sender: TObject);
    procedure btnExcluirCadPessoaClick(Sender: TObject);
    procedure TabItemCadastroPessoaClick(Sender: TObject);
    procedure TabItemConsultaPessoaClick(Sender: TObject);
    procedure lvCadFornecedorItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure SkLabel2Click(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItemSalvarCadPessoaClick(Sender: TObject);
    procedure SuccessAnimationAnimationFinished(Sender: TObject);
    procedure ErrorAnimationAnimationFinished(Sender: TObject);
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
  DM.qryFornecedor.Close;
  Dm.qryFornecedor.Open;
 ChangeTab.Tab := tabCadFornecedor;
 ChangeTab.ExecuteTarget(Self);
 MultiView.HideMaster;
end;

procedure TFormPrincipal.btnCadastroPessoaClick(Sender: TObject);
begin
 DM.qryPessoa.Close;
 DM.qryPessoa.Open;
 ChangeTab.Tab := tabCadPessoa;
 ChangeTab.ExecuteTarget(Self);
 MultiView.HideMaster;
end;

procedure TFormPrincipal.btnCadastroProdutoClick(Sender: TObject);
begin
 ChangeTab.Tab := tabCadProduto;
 ChangeTab.ExecuteTarget(Self);
 MultiView.HideMaster;
end;

procedure TFormPrincipal.btnEditarCadPessoaClick(Sender: TObject);
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

    uSync.Conectando;

    if uSync.UpdateCadPessoa(trim(EdtNomeCadPessoa.Text),
                            trim(edtCpfCadPessoa.Text),
                            trim(EdtCepCadPessoa.Text),
                            trim(EditEnderecoCadPessoa.Text),
                            trim(cbTipCadastro.Items[cbTipCadastro.ItemIndex])) then
    begin
      dm.qryPessoa.Close;
      dm.qryPessoa.Open;
      SuccessAnimation.Visible := True;
    end
    else ErrorAnimation.Visible := True;


   LimpaCampos;
end;

procedure TFormPrincipal.btnExcluirCadPessoaClick(Sender: TObject);
begin

     if cbTipCadastro.ItemIndex = -1 then
    ShowMessage('Informe o tipo de pessoa.');

  if EdtNomeCadPessoa.Text = '' then
  begin
    ShowMessage('Informe o Nome.');
    EdtNomeCadPessoa.SetFocus;
    abort;
  end;

  if edtCpfCadPessoa.Text = '' then
  begin
    ShowMessage('Informe o CPF.');
    edtCpfCadPessoa.SetFocus;
    abort;
  end;

    uSync.Conectando;

    if uSync.DeleteCadPessoa(trim(edtCpfCadPessoa.Text)) then
    begin
      dm.qryPessoa.Close;
      dm.qryPessoa.Open;
      SuccessAnimation.Visible := True;
    end
    else ErrorAnimation.Visible := True;



   LimpaCampos;
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

procedure TFormPrincipal.btnLoginMouseEnter(Sender: TObject);
begin
btnLogin.Margins.Top := 0;
btnLogin.Margins.Left := 0;
btnLogin.Margins.Right := 0;
btnLogin.Margins.Bottom := 0;
end;

procedure TFormPrincipal.btnLoginMouseLeave(Sender: TObject);
begin
btnLogin.Margins.Top := 3;
btnLogin.Margins.Left := 3;
btnLogin.Margins.Right := 3;
btnLogin.Margins.Bottom := 3;
end;

procedure TFormPrincipal.btnSalvarCadPessoaClick(Sender: TObject);
var Salvar : Boolean;
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

    Salvar := uSync.GravaCadPessoa(trim(EdtNomeCadPessoa.Text),
      trim(edtCpfCadPessoa.Text), trim(EdtCepCadPessoa.Text),
      trim(EditEnderecoCadPessoa.Text),
      trim(cbTipCadastro.Items[cbTipCadastro.ItemIndex]));


   if cbTipCadastro.ItemIndex = 0 then
   begin
     Salvar := uSync.GravaCadUsuario(trim(edtCpfCadPessoa.Text),
       trim(edtUserCadPessoa.Text), trim(edtSenhaCadPessoa.Text),
       swCadPessoa.IsChecked, swCadFornecedor.IsChecked, swCadProduto.IsChecked,
       swVendas.IsChecked);
   end;

   if Salvar then
   begin
     DM.qryPessoa.Close;
     DM.qryPessoa.Open;
     SuccessAnimation.Visible := True;
     LimpaCampos;
   end
   else ErrorAnimation.Visible := False;

end;

procedure TFormPrincipal.btnLogOutClick(Sender: TObject);
begin
LimpaCampos;
TabControl.ActiveTab := tabMenu;
RecLogin.Visible := True;
EdtUsuario.Text := '';
EdtSenha.Text := '';
end;

procedure TFormPrincipal.btnVendasClick(Sender: TObject);
begin
 ChangeTab.Tab := tabVenda;
 ChangeTab.ExecuteTarget(Self);
 MultiView.HideMaster;
end;

procedure TFormPrincipal.cbTipCadastroClosePopup(Sender: TObject);
begin
  if cbTipCadastro.ItemIndex = 0 then
    ListBoxItemAcessos.Enabled := True
  else
    ListBoxItemAcessos.Enabled := False;
end;

procedure TFormPrincipal.ErrorAnimationAnimationFinished(Sender: TObject);
begin
ErrorAnimation.Visible := False;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
SuccessAnimation.Visible := False;
ErrorAnimation.Visible := False;

RecLogin.Visible := True;
lblTitulo.Text := 'Sis Vendas - ' + FormatDateTime('DD/MM/YYYY',Now);
ListBoxItemAcessos.Enabled := False;
TabControl.ActiveTab :=  tabMenu;
end;

procedure TFormPrincipal.LimpaCampos;
begin

    btnEditarCadPessoa.Visible := False;
    btnExcluirCadPessoa.Visible := False;
    btnSalvarCadPessoa.Visible := True;

    btnSalvarCadFornecedor.Visible  := True;
    btnEditarCadFornecedor.Visible  := False;
    btnExcluirCadFornecedor.Visible := False;

    cbTipCadastro.ItemIndex := -1;
    cbTipCadastro.Enabled := True;

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
 MultiView.HideMaster;
end;

procedure TFormPrincipal.ListBoxItem1Click(Sender: TObject);
begin
LimpaCampos;
end;

procedure TFormPrincipal.ListBoxItemSalvarCadPessoaClick(Sender: TObject);
begin
LimpaCampos;
end;

procedure TFormPrincipal.lvCadFornecedorItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    btnSalvarCadFornecedor.Visible  := False;
    btnEditarCadFornecedor.Visible  := True;
    btnExcluirCadFornecedor.Visible := True;

    edtRazaoSocialFornecedor.Text := dm.qryFornecedor.FieldByName('RAZAO_SOCIAL').AsString;
    edtCNPJFornecedor.Text        := dm.qryFornecedor.FieldByName('CNPJ').AsString;
    edtNomeFornecedor.Text        := dm.qryFornecedor.FieldByName('NOME_FANTA').AsString;

    if dm.qryFornecedor.FieldByName('STATUS').AsString = 'Ativo'
    then
    begin
    rbFornecedorAtivo.IsChecked := True;
    rbFornecedorDestativado.IsChecked := False;
    end
    else
    begin
    rbFornecedorDestativado.IsChecked := True;
    rbFornecedorAtivo.IsChecked := False;
    end;
end;

procedure TFormPrincipal.lvCadPessoaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

  if DM.qryPessoa.FieldByName('TIPO').AsString = 'Cliente' then
  begin
    btnSalvarCadPessoa.Visible := False;
    btnEditarCadPessoa.Visible := True;
    btnExcluirCadPessoa.Visible := True;

    EdtNomeCadPessoa.Text := DM.qryPessoa.FieldByName('NAME').AsString;
    edtCpfCadPessoa.Text := DM.qryPessoa.FieldByName('CPF').AsString;
    EdtCepCadPessoa.Text := DM.qryPessoa.FieldByName('CEP').AsString;
    EditEnderecoCadPessoa.Text := DM.qryPessoa.FieldByName('ENDERECO').AsString;
    cbTipCadastro.ItemIndex := 1;
    cbTipCadastro.Enabled := False;

    TabControlCadPessoa.ActiveTab := TabItemCadastroPessoa;
  end
  else
  ShowMessage('Não é possivel modificar cadastro de Funcionario.');
end;


procedure TFormPrincipal.SkLabel2Click(Sender: TObject);
begin
LimpaCampos;
end;

procedure TFormPrincipal.SuccessAnimationAnimationFinished(Sender: TObject);
begin
SuccessAnimation.Visible := False;
end;

procedure TFormPrincipal.TabItemCadastroPessoaClick(Sender: TObject);
begin
LimpaCampos;
end;

procedure TFormPrincipal.TabItemConsultaPessoaClick(Sender: TObject);
begin
LimpaCampos;
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
      lblTitulo.Text  := 'SIS Venda - '+ FormatDateTime('DD/MM/YYYY', NOW);

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
