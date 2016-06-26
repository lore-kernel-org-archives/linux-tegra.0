From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 1/3] arm: tegra: initial support for apalis tk1
Date: Sun, 26 Jun 2016 20:09:16 +0000
Message-ID: <1466971755.3308.3.camel@toradex.com>
References: <201606261116.9IwjfA6i%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201606261116.9IwjfA6i%fengguang.wu@intel.com>
Content-Language: en-US
Content-ID: <078D1942DA62734AA8C686015B641BE9@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "lkp@intel.com" <lkp@intel.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCAyMDE2LTA2LTI2IGF0IDExOjUyICswODAwLCBrYnVpbGQgdGVzdCByb2JvdCB3cm90
ZToNCj4gSGksDQo+IA0KPiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIHJvYmgvZm9yLW5leHRd
DQo+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gdjQuNy1yYzQgbmV4dC0yMDE2MDYyNF0NCj4g
W2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBk
cm9wIHVzIGENCj4gbm90ZSB0byBoZWxwIGltcHJvdmUgdGhlIHN5c3RlbV0NCj4gDQo+IHVybDrC
oMKgwqDCoGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvTWFyY2VsLVpp
c3dpbGVyL2FybS0NCj4gdGVncmEtaW5pdGlhbC1zdXBwb3J0LWZvci1hcGFsaXMtdGsxLzIwMTYw
NjE5LTA5MTIwNA0KPiBiYXNlOsKgwqDCoGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3JvYmgvbGludXgNCj4gZm9yLW5leHQNCj4gY29uZmlnOiBhcm0tdGVn
cmFfZGVmY29uZmlnIChhdHRhY2hlZCBhcyAuY29uZmlnKQ0KPiBjb21waWxlcjogYXJtLWxpbnV4
LWdudWVhYmktZ2NjIChEZWJpYW4gNS4zLjEtOCkgNS4zLjEgMjAxNjAyMDUNCj4gcmVwcm9kdWNl
Og0KPiDCoMKgwqDCoMKgwqDCoMKgd2dldCBodHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGlu
dXgva2VybmVsL2dpdC93ZmcvbGtwLXRlcw0KPiB0cy5naXQvcGxhaW4vc2Jpbi9tYWtlLmNyb3Nz
IC1PIH4vYmluL21ha2UuY3Jvc3MNCj4gwqDCoMKgwqDCoMKgwqDCoGNobW9kICt4IH4vYmluL21h
a2UuY3Jvc3MNCj4gwqDCoMKgwqDCoMKgwqDCoCMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0
byBsaW51eCBidWlsZCB0cmVlDQo+IMKgwqDCoMKgwqDCoMKgwqBtYWtlLmNyb3NzIEFSQ0g9YXJt
wqANCj4gDQo+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4gDQo+IMKg
wqDCoEVSUk9SIChkdXBsaWNhdGVfbGFiZWwpOiBEdXBsaWNhdGUgbGFiZWwgJ3Bpbm11eCcgb24g
L3Bpbm11eEA3MDAwMA0KPiA4NjggYW5kIC9waW5tdXhAMCw3MDAwMDg2OA0KPiA+IA0KPiA+ID4g
DQo+ID4gPiBFUlJPUjogSW5wdXQgdHJlZSBoYXMgZXJyb3JzLCBhYm9ydGluZyAodXNlIC1mIHRv
IGZvcmNlIG91dHB1dCkNCj4gLS0tDQo+IDAtREFZIGtlcm5lbCB0ZXN0IGluZnJhc3RydWN0dXJl
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBPcGVuIFNvdXJjZQ0KPiBUZWNobm9sb2d5
IENlbnRlcg0KPiBodHRwczovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwva2J1aWxkLWFsbMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwNCj4gQ29ycG9yYXRpb24NCg0K
WWVzLCBhcyBzdGF0ZWQgdW5kZXIgJ2NoYW5nZXMgaW4gdjInIHRoaXMgZGVwZW5kcyBvbiBiZWxv
dyBwYXRjaCBhcw0Kd2VsbDoNCg0KLSByZW1vdmUgY29tbWFzIGZyb20gdW5pdCBhZGRyZXNzZXMg
YXMgc3VnZ2VzdGVkIGJ5IFJvYiAodGhpcyByZXF1aXJlcw0KwqAgdGhlIHNlcGFyYXRlIHBhdGNo
IHRvIGNsZWFuIHVwIHRlZ3JhMTI0LmR0c2kgYXMgd2VsbCBhcyBhbGwgdGhlIG90aGVyDQrCoCBi
b2FyZHMgYmFzaW5nIG9uIGl0IHRvIGJlIGFwcGxpZWQgZmlyc3QpDQoNCmh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTE4NTk3Ny8NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
