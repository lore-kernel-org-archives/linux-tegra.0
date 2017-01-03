From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [RESEND PATCH 0/6] apalis-tk1: updates for v1.1 hw
Date: Tue, 3 Jan 2017 13:20:48 +0000
Message-ID: <1483449646.2745.1.camel@toradex.com>
References: <20161124010456.24604-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161124010456.24604-1-marcel@ziswiler.com>
Content-Language: en-US
Content-ID: <8A4419F96DE6A44B9DB45B5FB2D5F0AF@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCAyMDE2LTExLTI0IGF0IDAyOjA0ICswMTAwLCBtYXJjZWxAemlzd2lsZXIuY29tIHdy
b3RlOg0KPiBGcm9tOiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNv
bT4NCj4gDQo+IA0KPiBUaGlzIHNlcmllcyB1cGRhdGVzIHRoZSBkZXZpY2UgdHJlZSBmb3IgdGhl
IHVwY29taW5nIFYxLjEgSFcgc2FtcGxlcy4NCj4gQWxsIGNoYW5nZXMgYXJlIHB1cmVseSBvcHBv
cnR1bmlzdGljIG1lYW5pbmcgdGhleSBmaXggc3R1ZmYgd2hpY2ggb24NCj4gb2xkZXIgSFcgd2Fz
IGFueXdheSBicm9rZW4gc28gdGhlcmUgc2hvdWxkIGJlIG5vIGJhY2t3YXJkcw0KPiBjb21wYXRp
YmlsaXR5IGlzc3Vlcy4NCj4gDQo+IA0KPiBNYXJjZWwgWmlzd2lsZXIgKDYpOg0KPiDCoCBhcGFs
aXMtdGsxOiByZW1vdmUgc3B1cmlvdXMgbmV3IGxpbmVzDQo+IMKgIGFwYWxpcy10azE6IHRlbXAg
YWxlcnQgcHVsbC11cA0KPiDCoCBhcGFsaXMtdGsxOiBvcHRpb25hbCBkaXNwbGF5cG9ydCBob3Qt
cGx1ZyBkZXRlY3QNCj4gwqAgYXBhbGlzLXRrMTogYWRqdXN0IHBpbiBtdXhpbmcgZm9yIHYxLjEg
aHcNCj4gwqAgYXBhbGlzLXRrMTogd29ya2luZyBzZCBjYXJkIGRldGVjdCBvbiB2MS4xIGh3DQo+
IMKgIGFwYWxpcy10azE6IHVwZGF0ZSBjb21wYXRpYmlsaXR5IGNvbW1lbnQNCj4gDQo+IMKgYXJj
aC9hcm0vYm9vdC9kdHMvdGVncmExMjQtYXBhbGlzLWV2YWwuZHRzIHwgMTEgKy0tLS0NCj4gwqBh
cmNoL2FybS9ib290L2R0cy90ZWdyYTEyNC1hcGFsaXMuZHRzacKgwqDCoMKgwqB8IDczICsrKysr
KysrKysrLS0tLS0tLS0tDQo+IC0tLS0tLS0tLS0NCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQ0KDQpQaW5nLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
