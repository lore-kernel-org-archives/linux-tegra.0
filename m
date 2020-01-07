From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Tue, 7 Jan 2020 04:39:55 +0300
Message-ID: <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
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
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
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
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

MDYuMDEuMjAyMCAyMjowMCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gT24gMDUvMDEvMjAyMCAx
MDo1MywgQmVuIERvb2tzIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0
cnkgT3NpcGVua28gd3JvdGU6Cj4+PiAwNS4wMS4yMDIwIDAzOjA0LCBCZW4gRG9va3Mg0L/QuNGI
0LXRgjoKPj4+PiBbc25pcF0KPj4+Pgo+Pj4+IEkndmUganVzdCBnb25lIHRocm91Z2ggdGVzdGlu
Zy4KPj4+Pgo+Pj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQgMzItYml0cyB3
b3JrLgo+Pj4+Cj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdlaXJkLCBpdCBsb29r
cyBsaWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4+IDI0IGJpdCBzYW1wbGVzIGluIDMyIGJpdCB3
b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4+IGRvIDI0IGJpdCBp
biAyNCBiaXQsIHNvIHdlIG1heSBoYXZlIHRvIHJlbW92ZSAyNCBiaXQgc2FtcGxlIHN1cHBvcnQK
Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pgo+Pj4+IE15IHByZWZlcmVuY2UgaXMgdG8gcmVt
b3ZlIHRoZSAyNC1iaXQgc3VwcG9ydCBhbmQga2VlcCB0aGUgMzIgYml0IGluLgo+Pj4+Cj4+Pgo+
Pj4gSW50ZXJlc3RpbmcuLiBKb24sIGNvdWxkIHlvdSBwbGVhc2UgY29uZmlybSB0aGF0IDI0Yml0
IGZvcm1hdCBpc24ndAo+Pj4gdXNhYmxlIG9uIFQzMD8KPj4KPj4gSWYgdGhlcmUgaXMgYW4gb3B0
aW9uIG9mIDI0IHBhY2tlZCBpbnRvIDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZCB3b3JrLgo+
Pgo+PiBJIGNhbiB0cnkgdGVzdGluZyB0aGF0IHdpdGggcmF3IGRhdGEgb24gTW9uZGF5Lgo+IAo+
IEkgbmVlZCB0byBjaGVjayBzb21lIHRoaW5ncywgSSBhc3N1bWVkIDI0IHdhcyAyNCBwYWNrZWQg
Yml0cywgaXQgbG9va3MKPiBsaWtlIHRoZSBkZWZhdWx0IGlzIDI0IGluIDMyIGJpdHMgc28gd2Ug
bWF5IGJlIG9rLiBIb3dldmVyIEkgbmVlZCB0bwo+IHJlLXdyaXRlIG15IHRlc3QgY2FzZSB3aGlj
aCBhc3N1bWVkIGl0IHdhcyAyNGJpdHMgaW4gMyBieXRlcyAoUzI0XzNMRSkuCj4gCj4gSSdsbCBm
b2xsb3cgdXAgbGF0ZXIsCgpPa2F5LCB0aGUgUzI0XzNMRSBpc24ndCBzdXBwb3J0ZWQgYnkgUlQ1
NjQwIGNvZGVjIGluIG15IGNhc2UuIEkgYnJpZWZseQpsb29rZWQgdGhyb3VnaCB0aGUgVFJNIGRv
YyBhbmQgZ290IGltcHJlc3Npb24gdGhhdCBBSFVCIGNvdWxkIHJlLXBhY2sKZGF0YSBzdHJlYW0g
aW50byBzb21ldGhpbmcgdGhhdCBjb2RlYyBzdXBwb3J0cywgYnV0IG1heWJlIGl0J3MgYSB3cm9u
ZwppbXByZXNzaW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
