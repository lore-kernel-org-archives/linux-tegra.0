From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Register host1x node with iommu binding on
 tegra124
Date: Tue, 11 Jul 2017 14:54:04 +0000
Message-ID: <1499784841.1520.20.camel@toradex.com>
References: <20170709163614.6746-1-contact@paulk.fr>
         <1499763009.1340.11.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499763009.1340.11.camel-W9ppeneeCTY@public.gmane.org>
Content-Language: en-US
Content-ID: <95BC908727B53F47952B8ACF0AD2C193-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "contact-W9ppeneeCTY@public.gmane.org" <contact-W9ppeneeCTY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T24gVHVlLCAyMDE3LTA3LTExIGF0IDExOjUwICswMzAwLCBQYXVsIEtvY2lhbGtvd3NraSB3cm90
ZToNCj4gT24gU3VuLCAyMDE3LTA3LTA5IGF0IDE5OjM2ICswMzAwLCBQYXVsIEtvY2lhbGtvd3Nr
aSB3cm90ZToNCj4gPiBUaGlzIHJlZ2lzdGVycyB0aGUgaG9zdDF4IG5vZGUgd2l0aCB0aGUgU01N
VSAoYXMgSEMgc3dncm91cCkgdG8NCj4gPiBhbGxvdw0KPiA+IHRoZSBob3N0MXggY29kZSB0byBh
dHRhY2ggdG8gaXQuIEl0IGF2b2lkIGZhaWxpbmcgdGhlIHByb2JlDQo+ID4gc2VxdWVuY2UsDQo+
ID4gd2hpY2ggcmVzdWx0ZWQgaW4gdGhlIHRlZ3JhIGRybSBkcml2ZXIgbm90IHByb2JpbmcgYW5k
IHRodXMgbm90aGluZw0KPiA+IGJlaW5nIGRpc3BsYXllZCBvbi1zY3JlZW4uDQo+IA0KPiBGaXhl
czogNDA0YmZiNzhkYWYzICgiZ3B1OiBob3N0MXg6IEFkZCBJT01NVSBzdXBwb3J0IikNCj4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPGNvbnRhY3QtDQo+ID4gVzlwcGVu
ZWVDVFlAcHVibGljLmdtYW5lLm9yZz4NCg0KVGVzdGVkLWJ5OsKgTWFyY2VsIFppc3dpbGVyIDxt
YXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQpUZXN0ZWQtb246IEFwYWxpcyBUSzEsIEpldHNv
bi1USzENCg0KPiA+IC0tLQ0KPiA+IMKgYXJjaC9hcm0vYm9vdC9kdHMvdGVncmExMjQuZHRzaSB8
IDEgKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMTI0LmR0c2kNCj4gPiBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3RlZ3JhMTI0LmR0c2kNCj4gPiBpbmRleCAxODdhMzZjNmQwZmMuLmIzYjg5YmVm
ZmZlYiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy90ZWdyYTEyNC5kdHNpDQo+
ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmExMjQuZHRzaQ0KPiA+IEBAIC04NSw2ICs4
NSw3IEBADQo+ID4gwqAJCWNsb2NrcyA9IDwmdGVncmFfY2FyIFRFR1JBMTI0X0NMS19IT1NUMVg+
Ow0KPiA+IMKgCQlyZXNldHMgPSA8JnRlZ3JhX2NhciAyOD47DQo+ID4gwqAJCXJlc2V0LW5hbWVz
ID0gImhvc3QxeCI7DQo+ID4gKwkJaW9tbXVzID0gPCZtYyBURUdSQV9TV0dST1VQX0hDPjsNCj4g
PiDCoA0KPiA+IMKgCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gPiDCoAkJI3NpemUtY2VsbHMg
PSA8Mj47DQoNClNvIEkgdGFrZSBpdCB3ZSBzdGlsbCB3aWxsIG5lZWQgdGhpcyBvbmUgbW92aW5n
IGZvcndhcmQsIGNvcnJlY3Q/DQoNCkhvdyBhYm91dCB0ZWdyYTMwLCBJIGd1ZXNzIHRoZSBzYW1l
IGFwcGxpZXMgdGhlcmUsIGlzbid0IGl0PyBTaG91bGQgSQ0Kc2VuZCBhIHBhdGNoIG9yIGFyZSB5
b3UgZ3V5cyBkb2luZyB0aGF0Pw==
