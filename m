From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: Re: [PATCH v2 2/3] PM / devfreq: tegra: add devfreq driver for
 Tegra Activity Monitor
Date: Tue, 25 Nov 2014 09:06:59 +0000 (GMT)
Message-ID: <12372901.124221416906419323.JavaMail.weblogic@epmlwas08c>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-pm-owner@vger.kernel.org>
MIME-version: 1.0
Sender: linux-pm-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, =?utf-8?Q?=EB=B0=95=EA=B2=BD=EB=AF=BC?= <kyungmin.park@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

PiBPbiAyNSBOb3ZlbWJlciAyMDE0IGF0IDA4OjA3LCBNeXVuZ0pvbyBIYW0gPG15dW5nam9vLmhh
bUBzYW1zdW5nLmNvbT4gd3JvdGU6DQo+ID4+IFRoZSBBQ1RNT04gYmxvY2sgY2FuIG1vbml0b3Ig
c2V2ZXJhbCBjb3VudGVycywgcHJvdmlkaW5nIGF2ZXJhZ2luZyBhbmQgZmlyaW5nDQo+ID4+IGlu
dGVycnVwdHMgYmFzZWQgb24gd2F0ZXJtYXJraW5nIGNvbmZpZ3VyYXRpb24uIFRoaXMgaW1wbGVt
ZW50YXRpb24gbW9uaXRvcnMNCj4gPj4gdGhlIE1DQUxMIGFuZCBNQ0NQVSBjb3VudGVycyB0byBj
aG9vc2UgYW4gYXBwcm9wcmlhdGUgZnJlcXVlbmN5IGZvciB0aGUNCj4gPj4gZXh0ZXJuYWwgbWVt
b3J5IGNsb2NrLg0KPiA+Pg0KPiA+PiBUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIHdvcmsgYnkgQWxl
eCBGcmlkIDxhZnJpZEBudmlkaWEuY29tPiBhbmQgTWlra28NCj4gPj4gUGVydHR1bmVuIDxtaWtr
by5wZXJ0dHVuZW5Aa2Fwc2kuZmk+Lg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUb21ldSBW
aXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogTXl1bmdKb28gSGFtIDxteXVuZ2pvby5oYW1Ac2Ftc3VuZy5jb20+DQo+ID4NCj4gPiBIb3cg
YXJlIHlvdSBnb2luZyB0byBpbnRlZ3JhdGUgb3RoZXIgdHdvIHBhdGNoZXM/DQo+IA0KPiBJIHRo
aW5rIHRoZXkgc2hvdWxkIGdvIHRocm91Z2ggdGhlIFRlZ3JhIHRyZWUuDQo+IA0KPiA+IE1heSBJ
IGp1c3QgZ28gYWhlYWQgd2l0aCB0aGlzIHBhdGNoIG9ubHk/DQo+IA0KPiBZZXMsIEkgdGhpbmsg
dGhhdCB3b3VsZCBiZSBmaW5lIGFzIHRoZSBvdGhlciBwYXRjaGVzIGFyZW4ndCBhY3R1YWwNCj4g
YnVpbGQgb3IgcnVudGltZSBkZXBlbmRlbmNpZXMuIFRoaXMgZHJpdmVyIHNob3VsZG4ndCBjYXVz
ZSBwcm9ibGVtcw0KPiBlaXRoZXIgaWYgaXQncyByYW4gd2l0aG91dCB0aGUgRU1DIGFuZCBDUFVG
cmVxIHBhdGNoZXMgKHRob3VnaCB3b24ndA0KPiBiZSBmdWxseSBmdW5jdGlvbmFsLCBvZiBjb3Vy
c2UpLg0KDQpPaywgdGhlbiwgYXMgbG9uZyBhcyB0aGUgb3RoZXIgdHdvIHBhdGNoZXMgKGZvciBE
VCBzdXBwb3J0KSBnZXQNCkFDS2VkIChzZWVtcyBmYWlybHkgc3RyYWlnaHRmb3J3YXJkIGFzIHdl
bGwpIG9yIFNpZ25lZC1vZmYgYnkNCmNvcnJlc3BvbmRpbmcgdHJlZSBtYWludGFpbmVycywgSSBm
ZWVsIGZpbmUgdG8NCnNlbmQgdGhpcyBwYXRjaCBhbG9uZyB3aXRoIHRoZSBuZXh0IHB1bGwgcmVx
dWVzdC4NCg0KVGhhbmsgeW91Lg0KDQpDaGVlcnMsDQpNeXVuZ0pvbw0KDQo+IA0KPiBSZWdhcmRz
LA0KPiANCj4gVG9tZXUNCj4gDQo+ID4gQ2hlZXJzLA0KPiA+IE15dW5nSm9vLg0KPiA+DQo+IA0K


