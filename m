From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
Date: Tue, 7 Jan 2020 10:29:10 +0000
Message-ID: <eb90ee78-e462-401a-de60-4a9bfc2a00c4@nvidia.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
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
To: Ben Dooks <ben.dooks@codethink.co.uk>, Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Ck9uIDA1LzAxLzIwMjAgMTA6NTMsIEJlbiBEb29rcyB3cm90ZToKPiAKPiAKPiBPbiAyMDIwLTAx
LTA1IDAxOjQ4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDA1LjAxLjIwMjAgMDM6MDQsIEJl
biBEb29rcyDQv9C40YjQtdGCOgo+Pj4gW3NuaXBdCj4+Pgo+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhy
b3VnaCB0ZXN0aW5nLgo+Pj4KPj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQg
MzItYml0cyB3b3JrLgo+Pj4KPj4+IFRoZSAyNCBiaXQgY2FzZSBzZWVtcyB0byBiZSB3ZWlyZCwg
aXQgbG9va3MgbGlrZSB0aGUgMjQtYml0IGV4cGVjdHMKPj4+IDI0IGJpdCBzYW1wbGVzIGluIDMy
IGJpdCB3b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4gZG8gMjQg
Yml0IGluIDI0IGJpdCwgc28gd2UgbWF5IGhhdmUgdG8gcmVtb3ZlIDI0IGJpdCBzYW1wbGUgc3Vw
cG9ydAo+Pj4gKHdoaWNoIGlzIGEgc2hhbWUpCj4+Pgo+Pj4gTXkgcHJlZmVyZW5jZSBpcyB0byBy
ZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAzMiBiaXQgaW4uCj4+Pgo+Pgo+
PiBJbnRlcmVzdGluZy4uIEpvbiwgY291bGQgeW91IHBsZWFzZSBjb25maXJtIHRoYXQgMjRiaXQg
Zm9ybWF0IGlzbid0Cj4+IHVzYWJsZSBvbiBUMzA/Cj4gCj4gSWYgdGhlcmUgaXMgYW4gb3B0aW9u
IG9mIDI0IHBhY2tlZCBpbnRvIDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZCB3b3JrLgo+IAo+
IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQgd2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCgpJIHdpbGwg
Y2hlY2sgb24gdGhpcy4gSSB3b3VsZCBoYXZlIHRob3VnaHQgdGhhdCBTMjRfTEUgKDI0LWJpdHMg
cGFja2VkCmludG8gMzItYml0IGVsZW1lbnRzKSB3b3VsZCBiZSBmaW5lLiBUeXBpY2FsbHkgd2Ug
ZG9uJ3Qgc3VwcG9ydCBTMjRfM0xFCigyNC1iaXRzIGluIDI0LWJpdCBlbGVtZW50cykuCgpKb24K
Ci0tIApudnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
