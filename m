From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Wed, 8 Jan 2020 11:37:01 +0000
Message-ID: <07cd66dc-1a6c-6b49-55a9-1420fe235161@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Dmitry Osipenko <digetx@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Ck9uIDA3LzAxLzIwMjAgMDE6MzksIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNi4wMS4yMDIw
IDIyOjAwLCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4gT24gMDUvMDEvMjAyMCAxMDo1MywgQmVu
IERvb2tzIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4+Pj4gMDUuMDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6
Cj4+Pj4+IFtzbmlwXQo+Pj4+Pgo+Pj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJvdWdoIHRlc3Rpbmcu
Cj4+Pj4+Cj4+Pj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQgMzItYml0cyB3
b3JrLgo+Pj4+Pgo+Pj4+PiBUaGUgMjQgYml0IGNhc2Ugc2VlbXMgdG8gYmUgd2VpcmQsIGl0IGxv
b2tzIGxpa2UgdGhlIDI0LWJpdCBleHBlY3RzCj4+Pj4+IDI0IGJpdCBzYW1wbGVzIGluIDMyIGJp
dCB3b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4+PiBkbyAyNCBi
aXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBsZSBzdXBw
b3J0Cj4+Pj4+ICh3aGljaCBpcyBhIHNoYW1lKQo+Pj4+Pgo+Pj4+PiBNeSBwcmVmZXJlbmNlIGlz
IHRvIHJlbW92ZSB0aGUgMjQtYml0IHN1cHBvcnQgYW5kIGtlZXAgdGhlIDMyIGJpdCBpbi4KPj4+
Pj4KPj4+Pgo+Pj4+IEludGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0g
dGhhdCAyNGJpdCBmb3JtYXQgaXNuJ3QKPj4+PiB1c2FibGUgb24gVDMwPwo+Pj4KPj4+IElmIHRo
ZXJlIGlzIGFuIG9wdGlvbiBvZiAyNCBwYWNrZWQgaW50byAzMiwgdGhlbiBJIHRoaW5rIHRoYXQg
d291bGQgd29yay4KPj4+Cj4+PiBJIGNhbiB0cnkgdGVzdGluZyB0aGF0IHdpdGggcmF3IGRhdGEg
b24gTW9uZGF5Lgo+Pgo+PiBJIG5lZWQgdG8gY2hlY2sgc29tZSB0aGluZ3MsIEkgYXNzdW1lZCAy
NCB3YXMgMjQgcGFja2VkIGJpdHMsIGl0IGxvb2tzCj4+IGxpa2UgdGhlIGRlZmF1bHQgaXMgMjQg
aW4gMzIgYml0cyBzbyB3ZSBtYXkgYmUgb2suIEhvd2V2ZXIgSSBuZWVkIHRvCj4+IHJlLXdyaXRl
IG15IHRlc3QgY2FzZSB3aGljaCBhc3N1bWVkIGl0IHdhcyAyNGJpdHMgaW4gMyBieXRlcyAoUzI0
XzNMRSkuCj4+Cj4+IEknbGwgZm9sbG93IHVwIGxhdGVyLAo+IAo+IE9rYXksIHRoZSBTMjRfM0xF
IGlzbid0IHN1cHBvcnRlZCBieSBSVDU2NDAgY29kZWMgaW4gbXkgY2FzZS4gSSBicmllZmx5Cj4g
bG9va2VkIHRocm91Z2ggdGhlIFRSTSBkb2MgYW5kIGdvdCBpbXByZXNzaW9uIHRoYXQgQUhVQiBj
b3VsZCByZS1wYWNrCj4gZGF0YSBzdHJlYW0gaW50byBzb21ldGhpbmcgdGhhdCBjb2RlYyBzdXBw
b3J0cywgYnV0IG1heWJlIGl0J3MgYSB3cm9uZwo+IGltcHJlc3Npb24uCgpJIGNoYXR0ZWQgd2l0
aCBTYW1lZXIgYWJvdXQgdGhpcywgc28geWVzIHRoZSBBSFVCIGNhbiByZXBhY2ssIGJ1dCB0aGVy
ZQppcyBhIHByb2JsZW0gd2l0aCBTMjRfTEUgd2hlcmUgaWYgd2UgdHJ5IHRvIGV4dHJhY3QgMjQt
Yml0cyB3ZSBhY3R1YWxseQpnZXQgdGhlIHVwcGVyIDI0LWJpdHMgYW5kIG5vdCB0aGUgbG93ZXIg
TFNCcyBpbiB0aGUgMzItYml0IGRhdGEgZWxlbWVudC4KU28gYWN0dWFsbHkgd2UgZG9uJ3Qgc3Vw
cG9ydCBTMjRfTEUuCgpCZW4gZG8geW91IG5lZWQgMjQtYml0IHN1cHBvcnQgb3IgMzItYml0IG9y
IGJvdGg/CgpKb24KCi0tIApudnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
