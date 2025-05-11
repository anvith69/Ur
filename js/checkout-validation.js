document.addEventListener('DOMContentLoaded', function() {
    // List of Indian cities and states for validation
    const indianCities = ['mumbai', 'delhi', 'bangalore', 'hyderabad', 'chennai', 'kolkata', 'pune', 'ahmedabad', 'jaipur', 'surat', 'lucknow', 'kanpur', 'nagpur', 'indore', 'thane', 'bhopal', 'patna', 'vadodara', 'ghaziabad', 'ludhiana'];
    
    // List of countries for validation
    const countries = ['india', 'united states', 'united kingdom', 'canada', 'australia', 'germany', 'france', 'japan', 'china', 'singapore'];
    const form = document.querySelector('.checkout-orders form');
    const cityInput = form.querySelector('input[name="city"]');
    const countryInput = form.querySelector('input[name="country"]');
    const nameInput = form.querySelector('input[name="name"]');
    const numberInput = form.querySelector('input[name="number"]');
    const emailInput = form.querySelector('input[name="email"]');
    const pincodeInput = form.querySelector('input[name="pin_code"]');

    // Name validation - only letters and spaces
    nameInput.addEventListener('input', function(e) {
        this.value = this.value.replace(/[^A-Za-z\s]/g, '');
        if(this.value.length > 20) {
            this.value = this.value.substring(0, 20);
        }
    });

    // Phone number validation
    numberInput.addEventListener('input', function(e) {
        this.value = this.value.replace(/[^0-9]/g, '');
        if(this.value.length > 10) {
            this.value = this.value.substring(0, 10);
        }
        if(this.value.length === 10) {
            if(!this.value.match(/^[6-9]\d{9}$/)) {
                this.setCustomValidity('Please enter a valid Indian mobile number');
            } else {
                this.setCustomValidity('');
            }
        }
    });

    // Email validation
    emailInput.addEventListener('input', function(e) {
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if(!emailPattern.test(this.value)) {
            this.setCustomValidity('Please enter a valid email address');
        } else {
            this.setCustomValidity('');
        }
    });

    // Pincode validation
    pincodeInput.addEventListener('input', function(e) {
        this.value = this.value.replace(/[^0-9]/g, '');
        if(this.value.length > 6) {
            this.value = this.value.substring(0, 6);
        }
        if(this.value.length === 6) {
            if(!this.value.match(/^[1-9][0-9]{5}$/)) {
                this.setCustomValidity('Please enter a valid 6-digit pincode');
            } else {
                this.setCustomValidity('');
            }
        }
    });

    // Form submission validation
    form.addEventListener('submit', function(e) {
        const name = nameInput.value.trim();
        const number = numberInput.value.trim();
        const email = emailInput.value.trim();
        const pincode = pincodeInput.value.trim();

        if(name.length < 3) {
            e.preventDefault();
            alert('Name must be at least 3 characters long');
            nameInput.focus();
            return;
        }

        if(number.length !== 10 || !number.match(/^[6-9]\d{9}$/)) {
            e.preventDefault();
            alert('Please enter a valid 10-digit mobile number');
            numberInput.focus();
            return;
        }

        if(!email.match(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/)) {
            e.preventDefault();
            alert('Please enter a valid email address');
            emailInput.focus();
            return;
        }

        const cityName = cityInput.value.trim().toLowerCase();
        if(!indianCities.some(city => city.startsWith(cityName))) {
            e.preventDefault();
            alert('Please enter a valid Indian city name');
            cityInput.focus();
            return;
        }

        const countryName = countryInput.value.trim().toLowerCase();
        if(!countries.some(country => country.startsWith(countryName))) {
            e.preventDefault();
            alert('Please enter a valid country name');
            countryInput.focus();
            return;
        }

        if(!pincode.match(/^[1-9][0-9]{5}$/)) {
            e.preventDefault();
            alert('Please enter a valid 6-digit pincode');
            pincodeInput.focus();
            return;
        }
    });
});
