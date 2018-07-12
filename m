From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH] mtd: rawnand: tegra: check bounds of die_nr properly
Date: Thu, 12 Jul 2018 13:31:57 +0000
Message-ID: <1531402315.1390.6.camel@toradex.com>
References: <20180704091310.22003-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704091310.22003-1-stefan@agner.ch>
Content-Language: en-US
Content-ID: <9B4C462F86C8A84DB5B35B481971228B@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "stefan@agner.ch" <stefan@agner.ch>, "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "krzk@kernel.org" <krzk@kernel.org>, "dev@lynxeye.de" <dev@lynxeye.de>, "benjamin.lindqvist@endian.se" <benjamin.lindqvist@endian.se>, "digetx@gmail.com" <digetx@gmail.com>, "mirza.krak@gmail.com" <mirza.krak@gmail.com>, "gaireg@gaireg.de" <gaireg@gaireg.de>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>
List-Id: linux-tegra@vger.kernel.org

T24gV2VkLCAyMDE4LTA3LTA0IGF0IDExOjEzICswMjAwLCBTdGVmYW4gQWduZXIgd3JvdGU6DQo+
IFRoZSBUZWdyYSBkcml2ZXIgY3VycmVudGx5IG9ubHkgc3VwcG9ydCBhIHNpbmdsZSBjaGlwIHNl
bGVjdCwgaGVuY2UNCj4gY2hlY2sgYm91bmRhcmllcyBhY2NvcmRpbmdseS4gVGhpcyBmaXhlcyBh
IG9mZiBieSBvbmUgaXNzdWUgY2F0Y2hlZA0KPiB3aXRoIFNtYXRjaDoNCj4gICAgIGRyaXZlcnMv
bXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYzo0NzYgdGVncmFfbmFuZF9zZWxlY3RfY2hpcCgpDQo+
ICAgICB3YXJuOiBhcnJheSBvZmYgYnkgb25lPyAnbmFuZC0+Y3NbZGllX25yXScNCj4gDQo+IEFs
c28gd2FybiBpbiBjYXNlIHRoZSBzdGFjayBhc2tzIGZvciBhIGNoaXAgc2VsZWN0IHdlIGN1cnJl
bnRseSBkbw0KPiBub3Qgc3VwcG9ydC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25l
ciA8c3RlZmFuQGFnbmVyLmNoPg0KPiAtLS0NCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3Jh
X25hbmQuYyB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3Jh
X25hbmQuYw0KPiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYw0KPiBpbmRleCA0
ZGFhODhkODE0MTM0Li5lNjVlZjU4NGRmMGI5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy90ZWdyYV9uYW5kLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFf
bmFuZC5jDQo+IEBAIC00NjgsNyArNDY4LDkgQEAgc3RhdGljIHZvaWQgdGVncmFfbmFuZF9zZWxl
Y3RfY2hpcChzdHJ1Y3QNCj4gbXRkX2luZm8gKm10ZCwgaW50IGRpZV9ucikNCj4gIAlzdHJ1Y3Qg
dGVncmFfbmFuZF9jaGlwICpuYW5kID0gdG9fdGVncmFfY2hpcChjaGlwKTsNCj4gIAlzdHJ1Y3Qg
dGVncmFfbmFuZF9jb250cm9sbGVyICpjdHJsID0gdG9fdGVncmFfY3RybChjaGlwLQ0KPiA+Y29u
dHJvbGxlcik7DQo+ICANCj4gLQlpZiAoZGllX25yIDwgMCB8fCBkaWVfbnIgPiAxKSB7DQo+ICsJ
V0FSTl9PTihkaWVfbnIgPj0gQVJSQVlfU0laRShuYW5kLT5jcykpOw0KDQpVbmZvcnR1bmF0ZWx5
LCB0aGF0IGhhcyBhIHRpbnkgbGl0dGxlIGlzc3VlIGFzIGRpZV9uciBpcyBhIHNpZ25lZA0KaW50
ZWdlciBhbmQgQVJSQVlfU0laRSBvZiBjb3Vyc2UgaXMgdW5zaWduZWQuIFdoaWxlIEkgY291bGQg
aGF2ZSBzd29ybg0KbXkgc2hpcnQgb2ZmIHRoYXQgdGhlIGNvbXBpbGVyIHdvdWxkIGhhdmUgdG8g
cHJvbW90ZSB0aGlzIHRvIHNpZ25lZA0KdGhpcyBpcyBub3QgcXVpdGUgd2hhdCBoYXBwZW5zIGFu
ZCB1cG9uIGRlc2VsZWN0aW5nIHdpdGggLTEgdGhpcw0Kd2FybmluZyBnZXRzIHRyaWdnZXJlZCEN
Cg0KSSB3aWxsIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBleHBsaWNpdGx5IGNhc3RpbmcgdGhlIEFS
UkFZX1NJWkUgc2lkZSB0bw0KaW50IGFzIHdlbGwgc2hvcnRseS4NCg0KPiArDQo+ICsJaWYgKGRp
ZV9uciA8IDAgfHwgZGllX25yID4gMCkgew0KPiAgCQljdHJsLT5jdXJfY3MgPSAtMTsNCj4gIAkJ
cmV0dXJuOw0KPiAgCX0=
