From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH 15/26] ARM: tegra: colibri_t30: add i2c-thermtrip
Date: Wed, 25 Jul 2018 11:14:32 +0000
Message-ID: <1532517270.6124.39.camel@toradex.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
         <20180723123658.980-16-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-16-marcel@ziswiler.com>
Content-Language: en-US
Content-ID: <C3EF246323F23249B9BC433CE55EEC69@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCAyMDE4LTA3LTIzIGF0IDE0OjM2ICswMjAwLCBNYXJjZWwgWmlzd2lsZXIgd3JvdGU6
DQo+IEZyb206IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0K
PiANCj4gQWRkIGkyYy10aGVybXRyaXAgd2hpY2ggd291bGQgc2V0IHRoZSBERVZfT0ZGIGJpdCBp
biB0aGUgRENEQyBjb250cm9sDQo+IHJlZ2lzdGVyIG9mIHRoZSBUUFM2NTkxMSBQTUlDLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRl
eC5jb20+DQo+IA0KPiAtLS0NCj4gDQo+ICBhcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLWNvbGli
cmkuZHRzaSB8IDggKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLWNvbGlicmkuZHRz
aQ0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMzAtY29saWJyaS5kdHNpDQo+IGluZGV4IDgy
NjZlNDJlMTYzMC4uNjYwODI0M2UxZDU1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0
cy90ZWdyYTMwLWNvbGlicmkuZHRzaQ0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTMw
LWNvbGlicmkuZHRzaQ0KPiBAQCAtOTAyLDYgKzkwMiwxNCBAQA0KPiAgCQludmlkaWEsY29yZS1w
d3Itb2ZmLXRpbWUgPSA8MD47DQo+ICAJCW52aWRpYSxjb3JlLXBvd2VyLXJlcS1hY3RpdmUtaGln
aDsNCj4gIAkJbnZpZGlhLHN5cy1jbG9jay1yZXEtYWN0aXZlLWhpZ2g7DQo+ICsNCj4gKwkJLyog
U2V0IERFVl9PRkYgYml0IGluIERDREMgY29udHJvbCByZWdpc3RlciBvZg0KPiBUUFM2NTkxMSBQ
TUlDICovDQo+ICsJCWkyYy10aGVybXRyaXAgew0KPiArCQkJbnZpZGlhLGkyYy1jb250cm9sbGVy
LWlkID0gPDQ+Ow0KPiArCQkJbnZpZGlhLGJ1cy1hZGRyID0gPDB4MmQ+Ow0KPiArCQkJbnZpZGlh
LHJlZy1hZGRyID0gPDB4M2U+Ow0KDQpXaGVuIHJ1bm5pbmcgc29tZSBtb3JlIHRlc3RzIEkganVz
dCByZWFsaXplZCB0aGF0IHRoZSByZWctYWRkciBzaG91bGQNCnJlYWxseSBiZSAweDNmIGluc3Rl
YWQuIFdpbGwgY2hhbmdlIHRoaXMgaW4gYSB2Mi4NCg0KPiArCQkJbnZpZGlhLHJlZy1kYXRhID0g
PDB4MT47DQo+ICsJCX07DQo+ICAJfTsNCj4gIA0KPiAgCWFodWJANzAwODAwMDAgew==
