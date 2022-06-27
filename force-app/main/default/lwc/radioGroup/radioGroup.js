import { api, LightningElement } from 'lwc';

export default class RadioGroup extends LightningElement {

	_options = [];
	_type = 'radio'
	_value = '';
	
	@api
	get options() {
		return this._options;
	}
	set options(value) {
		this._options = JSON.parse(JSON.stringify(value));
	}

	@api
	get type() {
		return this._type;
	}
	set type(value) {
		this._type = value;
	}

	@api
	get value() {
		return this._value;
	}
	set value(value) {
		this._value = value;
	}

	handleOnChange(event) {
		this.value = event.target.value;
		const selectedValue = new CustomEvent("valuechange", {
			detail: this.value
		});

		// Dispatches the event.
		this.dispatchEvent(selectedValue);
	}
}