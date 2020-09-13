const pay = () => {
  Payjp.setPublicKey("pk_test_e7e2ae4aea1d5ea5e270857b");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formData = new FormData(form);

    const card = {
      number: formData.get("card-number"),
     cvc: formData.get("card-cvc"),
     exp_month: formData.get("card-exp-month"),
     exp_year: `20${formData.get("exp_card-exp-year")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-monthh").removeAttribute("name");
      document.getElementById("exp_card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
};

window.addEventListener("load", pay);