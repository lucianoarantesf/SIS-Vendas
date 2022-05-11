﻿unit uSisVendas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, uDM, uSincronismo,uFormat,

  {$IFDEF ANDROID}
   FMX.platform.Android,
  {$ENDIF}

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation,
  FMX.MultiView, FMX.TabControl, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Actions, FMX.ActnList, FMX.DateTimeCtrls, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Skia.FMX, FMX.VirtualKeyboard, FMX.Platform;

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
    btnEditarCadProduto: TImage;
    btnExcluirCadProduto: TImage;
    btnGravarCadProduto: TImage;
    btnSalvarVenda: TImage;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    SuccessAnimation: TSkAnimatedImage;
    ErrorAnimation: TSkAnimatedImage;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    BindSourceDB4: TBindSourceDB;
    LinkListControlToField4: TLinkListControlToField;
    BindSourceDB5: TBindSourceDB;
    BindSourceDB6: TBindSourceDB;
    LinkListControlToField5: TLinkListControlToField;
    LinkListControlToField6: TLinkListControlToField;
    ListBoxItem17: TListBoxItem;
    lblDetalheVenda: TLabel;
    BindSourceDB7: TBindSourceDB;
    LinkListControlToField7: TLinkListControlToField;
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
    procedure btnSalvarCadFornecedorClick(Sender: TObject);
    procedure btnExcluirCadFornecedorClick(Sender: TObject);
    procedure btnEditarCadFornecedorClick(Sender: TObject);
    procedure edtCNPJFornecedorTyping(Sender: TObject);
    procedure edtCpfCadPessoaTyping(Sender: TObject);
    procedure EdtCepCadPessoaTyping(Sender: TObject);
    procedure edtPrecoProdutoTyping(Sender: TObject);
    procedure edtEstoqueProdutoTyping(Sender: TObject);
    procedure lvCadProdutoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnGravarCadProdutoClick(Sender: TObject);
    procedure btnEditarCadProdutoClick(Sender: TObject);
    procedure btnExcluirCadProdutoClick(Sender: TObject);
    procedure ListBoxItem6Click(Sender: TObject);
    procedure ListBoxItem12Click(Sender: TObject);
    procedure edtQuantidadeVendaTyping(Sender: TObject);
    procedure edtQuantidadeVendaValidating(Sender: TObject; var Text: string);
    procedure btnSalvarVendaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
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
 dm.qryProduto_Fornecedor.Close;
 dm.qryProduto_Fornecedor.Open;

 dm.qryProduto.Close;
 dm.qryProduto.Open;

 ChangeTab.Tab := tabCadProduto;
 ChangeTab.ExecuteTarget(Self);
 MultiView.HideMaster;
end;

procedure TFormPrincipal.btnGravarCadProdutoClick(Sender: TObject);
var
 Salvar : Boolean;
 vStatus : String;
begin

       if cbFornecedorProduto.ItemIndex  = -1 then
       ShowMessage('Informe O Fornecedor');

       if edtDescricaoProduto.Text= '' then
       begin
         ShowMessage('Informe a Descrição do Produto.');
         edtDescricaoProduto.SetFocus;
         abort;
       end;

       if edtPrecoProduto.Text= '' then
       begin
         ShowMessage('Informe o Preço.');
         edtPrecoProduto.SetFocus;
         abort;
       end;

       if edtEstoqueProduto.Text= '' then
       begin
         ShowMessage('Informe a Quantidade em Estoque.');
         edtEstoqueProduto.SetFocus;
         abort;
       end;

    if rbAtivoProduto.IsChecked then vStatus := 'Ativo'
    else
    if rbDesativadoProduto.IsChecked then vStatus := 'Desativado';

    uSync.Conectando;

    Salvar := uSync.GravaCadProduto(trim(edtDescricaoProduto.Text),
      trim(edtPrecoProduto.Text),
      DM.qryProduto_Fornecedor.FieldByName('cod_fornecedor').AsString,
      trim(vStatus),
      trim(edtEstoqueProduto.Text));

   if Salvar then
   begin
     DM.qryProduto.Close;
     DM.qryProduto.Open;
     SuccessAnimation.Visible := True;
     LimpaCampos;
   end
   else ErrorAnimation.Visible := False;
end;

procedure TFormPrincipal.btnEditarCadFornecedorClick(Sender: TObject);
var status :String;
begin

    if edtNomeFornecedor.Text= '' then
     begin
       ShowMessage('Informe o Nome Fantasia.');
       edtNomeFornecedor.SetFocus;
       abort;
     end;

     if edtRazaoSocialFornecedor.Text= '' then
     begin
       ShowMessage('Informe o Razão Social.');
       edtRazaoSocialFornecedor.SetFocus;
       abort;
     end;

     if edtCNPJFornecedor.Text= '' then
     begin
       ShowMessage('Informe o CNPJ.');
       edtCNPJFornecedor.SetFocus;
       abort;
     end;

    uSync.Conectando;

    if rbFornecedorAtivo.IsChecked then status := 'Ativo' else status := 'Desativado';


   if uSync.UpdateCadFornecedor(trim(edtNomeFornecedor.Text),
       trim(edtCNPJFornecedor.Text), trim(edtRazaoSocialFornecedor.Text),
       status) then
    begin
      dm.qryFornecedor.Close;
      dm.qryFornecedor.Open;
      SuccessAnimation.Visible := True;
    end
    else ErrorAnimation.Visible := True;


   LimpaCampos;
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

procedure TFormPrincipal.btnEditarCadProdutoClick(Sender: TObject);
VAR
 vStatus : String;
 Salvar : Boolean;
begin

       if cbFornecedorProduto.ItemIndex  = -1 then
       ShowMessage('Informe O Fornecedor');

       if edtDescricaoProduto.Text= '' then
       begin
         ShowMessage('Informe a Descrição do Produto.');
         edtDescricaoProduto.SetFocus;
         abort;
       end;

       if edtPrecoProduto.Text= '' then
       begin
         ShowMessage('Informe o Preço.');
         edtPrecoProduto.SetFocus;
         abort;
       end;

       if edtEstoqueProduto.Text= '' then
       begin
         ShowMessage('Informe a Quantidade em Estoque.');
         edtEstoqueProduto.SetFocus;
         abort;
       end;


    if rbAtivoProduto.IsChecked then vStatus := 'Ativo'
    else
    if rbDesativadoProduto.IsChecked then vStatus := 'Desativado';

    uSync.Conectando;

    Salvar := uSync.UpdateCadProduto(
      dm.qryProduto.FieldByName('cod_produto').AsString,
      trim(edtDescricaoProduto.Text),
      trim(edtPrecoProduto.Text),
      dm.qryProduto.FieldByName('cod_fornecedor').AsString,
      trim(vStatus),
      trim(edtEstoqueProduto.Text));

   if Salvar then
   begin
     DM.qryProduto.Close;
     DM.qryProduto.Open;
     SuccessAnimation.Visible := True;
     LimpaCampos;
   end
   else ErrorAnimation.Visible := False;
end;

procedure TFormPrincipal.btnExcluirCadFornecedorClick(Sender: TObject);
begin
    if edtNomeFornecedor.Text= '' then
     begin
       ShowMessage('Informe o Nome Fantasia.');
       edtNomeFornecedor.SetFocus;
       abort;
     end;

     if edtRazaoSocialFornecedor.Text= '' then
     begin
       ShowMessage('Informe o Razão Social.');
       edtRazaoSocialFornecedor.SetFocus;
       abort;
     end;

     if edtCNPJFornecedor.Text= '' then
     begin
       ShowMessage('Informe o CNPJ.');
       edtCNPJFornecedor.SetFocus;
       abort;
     end;

    uSync.Conectando;

    if uSync.DeleteCadFornecedor(trim(edtCNPJFornecedor.Text)) then
    begin
     DM.qryFornecedor.Close;
     DM.qryFornecedor.Open;
     SuccessAnimation.Visible := True;
     LimpaCampos;
    end
    else ErrorAnimation.Visible := True;



   LimpaCampos;
end;

procedure TFormPrincipal.btnExcluirCadPessoaClick(Sender: TObject);
begin
  if cbFornecedorProduto.ItemIndex  = -1 then
       ShowMessage('Informe O Fornecedor');

       if edtDescricaoProduto.Text= '' then
       begin
         ShowMessage('Informe a Descrição do Produto.');
         edtDescricaoProduto.SetFocus;
         abort;
       end;

       if edtPrecoProduto.Text= '' then
       begin
         ShowMessage('Informe o Preço.');
         edtPrecoProduto.SetFocus;
         abort;
       end;

       if edtEstoqueProduto.Text= '' then
       begin
         ShowMessage('Informe a Quantidade em Estoque.');
         edtEstoqueProduto.SetFocus;
         abort;
       end;


    uSync.Conectando;

    if uSync.DeleteCadProduto(dm.qryProduto.FieldByName('cod_produto').AsString) then
    begin
      dm.qryProduto.Close;
      dm.qryProduto.Open;
      SuccessAnimation.Visible := True;
    end
    else ErrorAnimation.Visible := True;



   LimpaCampos;
end;

procedure TFormPrincipal.btnExcluirCadProdutoClick(Sender: TObject);
begin

    uSync.Conectando;

    if uSync.DeleteCadProduto(dm.qryProduto.FieldByName('cod_produto').AsString) then
    begin
      dm.qryProduto.Close;
      dm.qryProduto.Open;
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

procedure TFormPrincipal.btnSalvarCadFornecedorClick(Sender: TObject);
var salvar : Boolean;
begin

    if edtNomeFornecedor.Text= '' then
     begin
       ShowMessage('Informe o Nome Fantasia.');
       edtNomeFornecedor.SetFocus;
       abort;
     end;

     if edtRazaoSocialFornecedor.Text= '' then
     begin
       ShowMessage('Informe o Razão Social.');
       edtRazaoSocialFornecedor.SetFocus;
       abort;
     end;

     if edtCNPJFornecedor.Text= '' then
     begin
       ShowMessage('Informe o CNPJ.');
       edtCNPJFornecedor.SetFocus;
       abort;
     end;

    dm.qryFornecedor.First;
    while not dm.qryFornecedor.eof do
    begin
      if trim(edtNomeFornecedor.Text) = dm.qryFornecedor.FieldByName('CNPJ').AsString then
      begin
        ShowMessage('CNPJ já cadastrado !');
        abort;
      end;
      dm.qryFornecedor.Next;
    end;

   uSync.Conectando;


   if rbFornecedorAtivo.IsChecked then
   begin
     Salvar := uSync.GravaCadFornecedor(trim(edtNomeFornecedor.Text),
       trim(edtCNPJFornecedor.Text), trim(edtRazaoSocialFornecedor.Text),
       'Ativo');
   end
   else
   if rbFornecedorDestativado.IsChecked then
   begin
     Salvar := uSync.GravaCadFornecedor(trim(edtNomeFornecedor.Text),
       trim(edtCNPJFornecedor.Text), trim(edtRazaoSocialFornecedor.Text),
       'Desativado');
   end;

   if Salvar then
   begin
     DM.qryFornecedor.Close;
     DM.qryFornecedor.Open;
     SuccessAnimation.Visible := True;
     LimpaCampos;
   end
   else ErrorAnimation.Visible := False;
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

procedure TFormPrincipal.btnSalvarVendaClick(Sender: TObject);
var
vCodVenda : String;
begin
  if edtDataVenda.Date <= Now then
    begin
    ShowMessage('Informe uma Data Valida.');
    Abort;
    end;

  if cbClienteVenda.ItemIndex = -1 then
    begin
    ShowMessage('Informe um Cliente.');
    Abort;
    end;

  if cbProdutoVenda.ItemIndex = -1 then
    begin
    ShowMessage('Informe um Produto.');
    Abort;
    end;

  if edtQuantidadeVenda.Text = '' then
   begin
    ShowMessage('Informe a quantidade.');
    Abort;
   end;

   vCodVenda :=  uSync.AdicinarVenda(FormatDateTime('DD/MM/YYYY hh:mm:ss',edtDataVenda.DateTime),
                       DM.qryCliente.FieldByName('cod_cliente').AsString,
                       'Efetivada');

   if vCodVenda <> 'Erro' then
   begin
     if uSync.AdicionarDetalVenda(vCodVenda,
                                  dm.qryProdutoVenda.FieldByName('cod_produto').AsString,
                                  edtQuantidadeVenda.Text,
                                  dm.qryProdutoVenda.FieldByName('DESCRICAO').AsString,
                                  FormatFloat('0.00',(DM.qryProdutoVenda.FieldByName('PRECO').AsFloat
                                                      * StrToIntDef( edtQuantidadeVenda.Text, 0)))
                                  )
     then
     begin
     DM.qryVendas.Close;
     DM.qryVendas.Open;
     SuccessAnimation.Visible := True;

     end;

   end
   else
   begin
     DM.qryVendas.Close;
     DM.qryVendas.Open;
     ErrorAnimation.Visible := True;
   end;

     LimpaCampos;
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
 dm.qryProdutoVenda.Close;
 dm.qryProdutoVenda.Open;

 dM.qryCliente.Close;
 DM.qryCliente.Open;

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

procedure TFormPrincipal.EdtCepCadPessoaTyping(Sender: TObject);
begin
uFormat.Formatar(sender, uFormat.CEP);
end;

procedure TFormPrincipal.edtCNPJFornecedorTyping(Sender: TObject);
begin
uFormat.Formatar(sender, uFormat.CNPJ);
end;

procedure TFormPrincipal.edtCpfCadPessoaTyping(Sender: TObject);
begin
uFormat.Formatar(sender, uFormat.CPF);
end;

procedure TFormPrincipal.edtEstoqueProdutoTyping(Sender: TObject);
begin
uFormat.Formatar(sender, uFormat.SomenteNumeros);
end;

procedure TFormPrincipal.edtPrecoProdutoTyping(Sender: TObject);
begin
uFormat.Formatar(sender, uFormat.Money);
end;

procedure TFormPrincipal.edtQuantidadeVendaTyping(Sender: TObject);
begin
uFormat.Formatar(sender,uFormat.SomenteNumeros);
end;

procedure TFormPrincipal.edtQuantidadeVendaValidating(Sender: TObject;
  var Text: string);
var
  vValor : Double;
begin
 if StrToIntDef(Text,0) > dm.qryProdutoVenda.FieldByName('ESTOQUE').AsInteger then
   Text := IntToStr(dm.qryProdutoVenda.FieldByName('ESTOQUE').AsInteger);

   vValor :=  dm.qryProdutoVenda.FieldByName('PRECO').AsFloat * StrToIntDef(Text,0);
   lblDetalheVenda.Text := 'Valor total da Venda: ' + FormatFloat('R$ 0.00', vValor);
end;

procedure TFormPrincipal.ErrorAnimationAnimationFinished(Sender: TObject);
begin
ErrorAnimation.Visible := False;

if RecLogin.IsVisible then
 ShowMessage('Usuário ou Senha Incorretos');
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

procedure TFormPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Teclado: IFMXVirtualKeyboardService;
  begin

   {Recebe o estado do teclado virtual}
    TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(Teclado));

   {Se o botão back pressionado e o teclado virtual ativo, não faz nada}


    if Key = vkHardwareBack then
    begin

      if (Teclado <> nil) and (TVirtualKeyboardState.Visible in Teclado.VirtualKeyboardState) then
      begin
       //Reservado, não faz nada
      end
      else
      begin
       /////////////////////////////////////////////////////////////////////////////////////
        if (TabControl.ActiveTab = tabMenu) or (RecLogin.IsVisible) then
        begin

          MessageDlg('Deseja sair do Sys Venda', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
            procedure(const AResult: TModalResult)
            begin
              if AResult = mrYes then
              begin
                 {$IFDEF ANDROID}
                MainActivity.finish;
                 {$ELSE}
                exit;
                 {$ENDIF}
              end;
            end);

        end;

        if TabControl.ActiveTab <> tabMenu then
        begin
        ChangeTab.Tab := tabMenu;
        ChangeTab.ExecuteTarget(Self);

        Key := 0;
      end;
    end;

  end;
end;

procedure TFormPrincipal.LimpaCampos;
begin

    btnEditarCadProduto.Visible := False;
    btnExcluirCadProduto.Visible := False;
    btnGravarCadProduto.Visible := True;

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
  edtDataVenda.Date := Date;
  cbClienteVenda.ItemIndex := -1;
  cbProdutoVenda.ItemIndex := -1;
  edtQuantidadeVenda.Text := '';
  lblDetalheVenda.Text := '';
end;

procedure TFormPrincipal.ListBoxHeaderClick(Sender: TObject);
begin
 ChangeTab.Tab := tabMenu;
 ChangeTab.ExecuteTarget(Self);
 MultiView.HideMaster;
end;

procedure TFormPrincipal.ListBoxItem12Click(Sender: TObject);
begin
LimpaCampos;
end;

procedure TFormPrincipal.ListBoxItem1Click(Sender: TObject);
begin
LimpaCampos;
end;

procedure TFormPrincipal.ListBoxItem6Click(Sender: TObject);
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


procedure TFormPrincipal.lvCadProdutoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    btnEditarCadProduto.Visible := True;
    btnExcluirCadProduto.Visible := True;
    btnGravarCadProduto.Visible := False;

edtDescricaoProduto.Text := DM.qryProduto.FieldByName('DESCRICAO').AsString;
edtPrecoProduto.Text := FormatFloat('R$0.00', DM.qryProduto.FieldByName('PRECO').AsFloat);
edtEstoqueProduto.Text := DM.qryProduto.FieldByName('ESTOQUE').AsString;

 if DM.qryProduto.FieldByName('STATUS').AsString = 'Ativo' then
    rbAtivoProduto.IsChecked := True
  else
    rbDesativadoProduto.IsChecked := True;


 cbFornecedorProduto.ItemIndex := cbFornecedorProduto.Items.IndexOf(dm.qryProduto.FieldByName('FORNECEDOR').AsString);


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
      ErrorAnimation.Visible := True;
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
    ErrorAnimation.Visible := True;
    ShowMessage('Ocorreu um Erro: ' + E.Message);
    Abort;
   end;

  end;

end;


end.
