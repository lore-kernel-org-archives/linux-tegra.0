From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Mon, 6 Jan 2020 19:00:59 +0000
Message-ID: <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
Content-Language: en-GB
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

T24gMDUvMDEvMjAyMCAxMDo1MywgQmVuIERvb2tzIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjAtMDEt
MDUgMDE6NDgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDUuMDEuMjAyMCAwMzowNCwgQmVu
IERvb2tzINC/0LjRiNC10YI6Cj4+PiBbc25pcF0KPj4+Cj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJv
dWdoIHRlc3RpbmcuCj4+Pgo+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAz
Mi1iaXRzIHdvcmsuCj4+Pgo+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdlaXJkLCBp
dCBsb29rcyBsaWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4gMjQgYml0IHNhbXBsZXMgaW4gMzIg
Yml0IHdvcmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRvCj4+PiBkbyAyNCBi
aXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBsZSBzdXBw
b3J0Cj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Cj4+PiBNeSBwcmVmZXJlbmNlIGlzIHRvIHJl
bW92ZSB0aGUgMjQtYml0IHN1cHBvcnQgYW5kIGtlZXAgdGhlIDMyIGJpdCBpbi4KPj4+Cj4+Cj4+
IEludGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCAyNGJpdCBm
b3JtYXQgaXNuJ3QKPj4gdXNhYmxlIG9uIFQzMD8KPiAKPiBJZiB0aGVyZSBpcyBhbiBvcHRpb24g
b2YgMjQgcGFja2VkIGludG8gMzIsIHRoZW4gSSB0aGluayB0aGF0IHdvdWxkIHdvcmsuCj4gCj4g
SSBjYW4gdHJ5IHRlc3RpbmcgdGhhdCB3aXRoIHJhdyBkYXRhIG9uIE1vbmRheS4KCkkgbmVlZCB0
byBjaGVjayBzb21lIHRoaW5ncywgSSBhc3N1bWVkIDI0IHdhcyAyNCBwYWNrZWQgYml0cywgaXQg
bG9va3MKbGlrZSB0aGUgZGVmYXVsdCBpcyAyNCBpbiAzMiBiaXRzIHNvIHdlIG1heSBiZSBvay4g
SG93ZXZlciBJIG5lZWQgdG8KcmUtd3JpdGUgbXkgdGVzdCBjYXNlIHdoaWNoIGFzc3VtZWQgaXQg
d2FzIDI0Yml0cyBpbiAzIGJ5dGVzIChTMjRfM0xFKS4KCkknbGwgZm9sbG93IHVwIGxhdGVyLAoK
CgotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5n
aW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRo
aW5rLmNvLnVrL3ByaXZhY3kuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
