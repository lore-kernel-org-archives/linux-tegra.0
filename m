From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 04/13] mailbox: mediatek: cmdq: convert to
 devm_platform_ioremap_resource
Date: Mon, 30 Dec 2019 09:58:20 +0800
Message-ID: <1577671100.8160.0.camel@mtksdaap41>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
         <20191228183538.26189-4-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228183538.26189-4-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, lftan@altera.com, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

SGksIFlhbmd0YW86DQoNCk9uIFNhdCwgMjAxOS0xMi0yOCBhdCAxODozNSArMDAwMCwgWWFuZ3Rh
byBMaSB3cm90ZToNCj4gVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNp
bXBsaWZ5IGNvZGUuDQo+IA0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDx0aW55LndpbmR6ekBnbWFpbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyB8IDQgKy0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgYi9kcml2ZXJz
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+IGluZGV4IDlhNmNlOWY1YTdkYi4uN2Y5ZTM0
YjAyMWM4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5j
DQo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gQEAgLTQ1OCw3
ICs0NTgsNiBAQCBzdGF0aWMgc3RydWN0IG1ib3hfY2hhbiAqY21kcV94bGF0ZShzdHJ1Y3QgbWJv
eF9jb250cm9sbGVyICptYm94LA0KPiAgc3RhdGljIGludCBjbWRxX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsNCj4gLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gIAlzdHJ1Y3QgY21kcSAqY21kcTsN
Cj4gIAlpbnQgZXJyLCBpOw0KPiAgDQo+IEBAIC00NjYsOCArNDY1LDcgQEAgc3RhdGljIGludCBj
bWRxX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJaWYgKCFjbWRxKQ0K
PiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gIA0KPiAtCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJj
ZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+IC0JY21kcS0+YmFzZSA9IGRldm1faW9yZW1h
cF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+ICsJY21kcS0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9y
ZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gIAlpZiAoSVNfRVJSKGNtZHEtPmJhc2UpKSB7DQo+
ICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGlvcmVtYXAgZ2NlXG4iKTsNCj4gIAkJcmV0dXJu
IFBUUl9FUlIoY21kcS0+YmFzZSk7DQoNCg==
