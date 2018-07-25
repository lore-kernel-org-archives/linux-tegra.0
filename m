From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH 22/28] ARM: tegra: apalis_t30: add i2c-thermtrip
Date: Wed, 25 Jul 2018 11:11:52 +0000
Message-ID: <1532517111.6124.38.camel@toradex.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
         <20180722164936.20581-23-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-23-marcel@ziswiler.com>
Content-Language: en-US
Content-ID: <EDB412CC915171439E04D55B39F14A77@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCAyMDE4LTA3LTIyIGF0IDE4OjQ5ICswMjAwLCBNYXJjZWwgWmlzd2lsZXIgd3JvdGU6
DQo+IEZyb206IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0K
PiANCj4gQWRkIGkyYy10aGVybXRyaXAgd2hpY2ggd291bGQgc2V0IHRoZSBERVZfT0ZGIGJpdCBp
biB0aGUgRENEQyBjb250cm9sDQo+IHJlZ2lzdGVyIG9mIHRoZSBUUFM2NTkxMSBQTUlDLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRl
eC5jb20+DQo+IA0KPiAtLS0NCj4gDQo+ICBhcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLWFwYWxp
cy5kdHNpIHwgOCArKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMzAtYXBhbGlzLmR0c2kN
Cj4gYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLWFwYWxpcy5kdHNpDQo+IGluZGV4IDRlOGVh
MWE4ZDllYy4uZjhjYWYzZjA3ZmZmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy90
ZWdyYTMwLWFwYWxpcy5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMzAtYXBh
bGlzLmR0c2kNCj4gQEAgLTEwNTUsNiArMTA1NSwxNCBAQA0KPiAgCQludmlkaWEsY29yZS1wd3It
b2ZmLXRpbWUgPSA8MD47DQo+ICAJCW52aWRpYSxjb3JlLXBvd2VyLXJlcS1hY3RpdmUtaGlnaDsN
Cj4gIAkJbnZpZGlhLHN5cy1jbG9jay1yZXEtYWN0aXZlLWhpZ2g7DQo+ICsNCj4gKwkJLyogU2V0
IERFVl9PRkYgYml0IGluIERDREMgY29udHJvbCByZWdpc3RlciBvZg0KPiBUUFM2NTkxMSBQTUlD
ICovDQo+ICsJCWkyYy10aGVybXRyaXAgew0KPiArCQkJbnZpZGlhLGkyYy1jb250cm9sbGVyLWlk
ID0gPDQ+Ow0KPiArCQkJbnZpZGlhLGJ1cy1hZGRyID0gPDB4MmQ+Ow0KPiArCQkJbnZpZGlhLHJl
Zy1hZGRyID0gPDB4M2U+Ow0KDQpXaGVuIHJ1bm5pbmcgc29tZSBtb3JlIHRlc3RzIEkganVzdCBy
ZWFsaXplZCB0aGF0IHRoZSByZWctYWRkciBzaG91bGQNCnJlYWxseSBiZSAweDNmIGluc3RlYWQu
IFdpbGwgY2hhbmdlIHRoaXMgaW4gYSB2Mi4NCg0KPiArCQkJbnZpZGlhLHJlZy1kYXRhID0gPDB4
MT47DQo+ICsJCX07DQo+ICAJfTsNCj4gIA0KPiAgCWFodWJANzAwODAwMDAgew==
