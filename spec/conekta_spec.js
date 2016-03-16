describe("A suite", function() {

  beforeEach(function(){
    loadFixtures("credit_card.html");
    spyOn(XMLHttpRequest.prototype, 'open').and.callThrough();
    spyOn(XMLHttpRequest.prototype, 'send');
  });

  it("Should call AJAx request ", function() {
    $('button').click();
    expect(XMLHttpRequest.prototype.open).toHaveBeenCalled();
  });


  it("should retunr call xDomainPost ", function() {
    spyOn(Conekta._helpers, 'xDomainPost').and.callThrough();
    $('button').click();
    expect(Conekta._helpers.xDomainPost).toHaveBeenCalled();
  });

  it("should retunr call xDomainPost ", function() {
    spyOn(Conekta._helpers, 'xDomainPost').and.callThrough();
    $('button').click();
    expect(Conekta._helpers.xDomainPost).toHaveBeenCalled();
  });


});