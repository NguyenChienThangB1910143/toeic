{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleDictionary.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container-dictonary">
    <div class="dictionary-form">
        <h1>Tra cứu từ điển</h1>
        <form id="lookup-form">
            <input type="text" id="word" name="word" placeholder="Enter a word" required>
            <button type="submit">Search</button>
        </form>
        <div id="result"></div>
    </div>
    {{-- <div class="translate-form">
        <h1>Translate</h1>
        <label for="inputText">Your Text:</label>
        <textarea id="inputText" rows="30" placeholder="Type text here..."></textarea>
        <div>
            <label for="translateFrom"> Translate From:</label>
            <select id="translateFrom">
                <option value="en">English</option>
            </select>
            <label for="translateFrom"> Translate To:</label>
            <select id="translateTo">
                <option value="vi">Vietnamese</option>
            </select>
        </div>
        <button id="translateBtn">Translate</button>
        <button id="speakBtn">Speak</button>
        <div id="outputText" aria-readonly="true"></div>


        <script src="countries.js"></script>
        <script>
            const selectTags = document.querySelectorAll('select');
            selectTags.forEach((tag, id) => {
                for(let country_code in countries){
                    let selected = id === 0 ? (country_code === "en" ? "selected" : "") : (country_code === "vi" ? "selected":"");

                    let option = `<option ${selected} value="${country_code}">${countries[country_code]}</option>`;
                    tag.insertAdjacenHTML("beforeend", option);
                }
            });
            document.getElementById('translateBtn').addEventListener('click', function (){
                const text = document.getElementById('inputText').value;
                const translateFrom = document.getElementById('translateFrom').value;
                const translateTo = document.getElementById('translateTo').value;
                translateText(text, translateFrom, translateTo);

            })
            function translateText(inputText, fromLang, toLang) {
                const apiUrl = `htttp://api.mymemory.translate`;
            }

        </script>
    </div> --}}
</div>
<script>
    document.getElementById('lookup-form').addEventListener('submit', function(event) {
        event.preventDefault();
        const word = document.getElementById('word').value;

        fetch('/search', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: new URLSearchParams({ word })
        })
        .then(response => response.json())
        .then(data => {
            if (data.meanings && data.meanings.length > 0) {
                const meanings = data.meanings.join('<br>');
                document.getElementById('result').innerHTML = `<b>${data.word}</b>:<br>${meanings}`;
            } else {
                document.getElementById('result').innerHTML = `<b>${data.word}</b>: No meanings found.`;
            }
        })

        .catch(error => {
            console.error('Error:', error);
            document.getElementById('result').innerHTML = 'An error occurred. Please try again.';
        });
    });
</script>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
