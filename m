From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Wed, 15 May 2019 18:26:50 +0300
Message-ID: <6a42ff62-44fe-c420-7645-d57ecc1defaa@gmail.com>
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-6-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190510084719.18902-6-josephl@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

MTAuMDUuMjAxOSAxMTo0NywgSm9zZXBoIExvINC/0LjRiNC10YI6Cj4gVGhpcyBwYXRjaCBhZGRz
IHRoZSByZXF1aXJlZCBBUElzIGFuZCB2YXJpYWJsZXMgZm9yIHRoZSBFTUMgc2NhbGluZwo+IHNl
cXVlbmNlIGNvZGUgb24gVGVncmEyMTAuCj4gCj4gQmFzZWQgb24gdGhlIHdvcmsgb2YgUGV0ZXIg
RGUgU2NocmlqdmVyIDxwZGVzY2hyaWp2ZXJAbnZpZGlhLmNvbT4uCj4gCj4gU2lnbmVkLW9mZi1i
eTogSm9zZXBoIExvIDxqb3NlcGhsQG52aWRpYS5jb20+Cj4gLS0tCgo+ICsKPiArdm9pZCBkb19j
bG9ja19jaGFuZ2Uoc3RydWN0IHRlZ3JhX2VtYyAqZW1jLCB1MzIgY2xrc3JjKQo+ICt7Cj4gKwlp
bnQgZXJyOwo+ICsKPiArCW1jX3JlYWRsKGVtYy0+bWMsIE1DX0VNRU1fQURSX0NGRyk7Cj4gKwll
bWNfcmVhZGwoZW1jLCBFTUNfSU5UU1RBVFVTKTsKPiArCj4gKwl0ZWdyYTIxMF9jbGtfZW1jX3Vw
ZGF0ZV9zZXR0aW5nKGNsa3NyYyk7Cj4gKwo+ICsJZXJyID0gd2FpdF9mb3JfdXBkYXRlKGVtYywg
RU1DX0lOVFNUQVRVUywKPiArCQkJICAgICAgRU1DX0lOVFNUQVRVU19DTEtDSEFOR0VfQ09NUExF
VEUsIHRydWUsIFJFR19FTUMpOwo+ICsJaWYgKGVycikgewo+ICsJCXByX2VycigiJXM6IGNsb2Nr
IGNoYW5nZSBjb21wbGV0aW9uIGVycm9yOiAlZCIsIF9fZnVuY19fLCBlcnIpOwo+ICsJCVdBUk5f
T04oMSk7Cj4gKwl9CgpFdGhlciBXQVJOKGVyciwgLi4uKSBvciBkZXZfd2Fybiwgb3IganVzdCBk
ZXZfZXJyLgoKLS0gCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
