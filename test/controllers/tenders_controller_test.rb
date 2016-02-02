require 'test_helper'

class TendersControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tender" do
    assert_difference('Tender.count') do
      post :create, tender: { changedate: @tender.changedate, comment: @tender.comment, contactwith: @tender.contactwith, contactwithposition: @tender.contactwithposition, contractdate: @tender.contractdate, contractsubject: @tender.contractsubject, contracttype: @tender.contracttype, finishprice: @tender.finishprice, link: @tender.link, name: @tender.name, paymentcondition: @tender.paymentcondition, paymentform: @tender.paymentform, price: @tender.price, pricetext: @tender.pricetext, purchasedestination: @tender.purchasedestination, purchasefinishdate: @tender.purchasefinishdate, purchaseplace: @tender.purchaseplace, purchasestart: @tender.purchasestart, purchasestatus: @tender.purchasestatus, registereddate: @tender.registereddate, tenderclassific: @tender.tenderclassific, tenderofficiallink: @tender.tenderofficiallink, tenderofficialname: @tender.tenderofficialname, tradecategory: @tender.tradecategory }
    end

    assert_redirected_to tender_path(assigns(:tender))
  end

  test "should show tender" do
    get :show, id: @tender
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tender
    assert_response :success
  end

  test "should update tender" do
    patch :update, id: @tender, tender: { changedate: @tender.changedate, comment: @tender.comment, contactwith: @tender.contactwith, contactwithposition: @tender.contactwithposition, contractdate: @tender.contractdate, contractsubject: @tender.contractsubject, contracttype: @tender.contracttype, finishprice: @tender.finishprice, link: @tender.link, name: @tender.name, paymentcondition: @tender.paymentcondition, paymentform: @tender.paymentform, price: @tender.price, pricetext: @tender.pricetext, purchasedestination: @tender.purchasedestination, purchasefinishdate: @tender.purchasefinishdate, purchaseplace: @tender.purchaseplace, purchasestart: @tender.purchasestart, purchasestatus: @tender.purchasestatus, registereddate: @tender.registereddate, tenderclassific: @tender.tenderclassific, tenderofficiallink: @tender.tenderofficiallink, tenderofficialname: @tender.tenderofficialname, tradecategory: @tender.tradecategory }
    assert_redirected_to tender_path(assigns(:tender))
  end

  test "should destroy tender" do
    assert_difference('Tender.count', -1) do
      delete :destroy, id: @tender
    end

    assert_redirected_to tenders_path
  end
end
