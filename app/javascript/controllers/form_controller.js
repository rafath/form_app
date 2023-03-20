import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['form']
  static values = { isFormValid: { type: Boolean, default: false } }

  submitForm(event) {
    // let isValid = this.validateForm(this.formTarget);
    this.validateForm();

    if (!this.isFormValidValue) {
      event.preventDefault();
    }
  }

  validateForm() {
    this.isFormValidValue = this.validateEmail() && this.validateName()
  }

  validateEmail() {
    const element = this.formTarget.elements['user_email'];
    const value = element.value;

    if (!value) return this.addError(element, 'Please provide an email before submitting the form');
    if (!value.includes('@')) return this.addError(element, 'Email must have an @ character');
    if (!value.match( /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i))
      return this.addError(element, 'Please provide a valid email before submitting the form');

    return this.addError(element, '');
  }

  validateName() {
    const element = this.formTarget.elements['user_name'];
    const value = element.value;

    if (!value || value.length <= 2) return this.addError(element, 'Please provide your name');

    return this.addError(element, '');
  }

  addError(element, message) {
    const parent = element.parentElement.parentElement

    if (parent.querySelector('p')) {
      parent.querySelector('p').remove()
    }
    if (message) {
      parent.insertAdjacentHTML('beforeend', `<p class="mt-2 text-sm text-red-600">${message}</p>`)
      return false
    } else { return true }
  }
}
