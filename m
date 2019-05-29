From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V4 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Wed, 29 May 2019 16:37:20 +0300
Message-ID: <5bd95d0b-e1a5-e717-4d5a-b9ef5d5fa4a5@gmail.com>
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-6-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190529082139.5581-6-josephl@nvidia.com>
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

MjkuMDUuMjAxOSAxMToyMSwgSm9zZXBoIExvINC/0LjRiNC10YI6Cj4gVGhpcyBwYXRjaCBhZGRz
IHRoZSByZXF1aXJlZCBBUElzIGFuZCB2YXJpYWJsZXMgZm9yIHRoZSBFTUMgc2NhbGluZwo+IHNl
cXVlbmNlIGNvZGUgb24gVGVncmEyMTAuCj4gCj4gQmFzZWQgb24gdGhlIHdvcmsgb2YgUGV0ZXIg
RGUgU2NocmlqdmVyIDxwZGVzY2hyaWp2ZXJAbnZpZGlhLmNvbT4uCj4gCj4gU2lnbmVkLW9mZi1i
eTogSm9zZXBoIExvIDxqb3NlcGhsQG52aWRpYS5jb20+Cj4gLS0tCj4gdjQ6Cj4gLSBmaXggdGhl
IEFQSSB3aXRoIGdlbmVyaWMgbmFtaW5nCj4gLSB1c2UgJ3UxNicgaW4gJ3N0cnVjdCBlbWNfdGFi
bGVfcmVnaXN0ZXJfb2Zmc2V0Jwo+IC0tLQoKW3NuaXBdCgo+ICt2b2lkIGVtY193cml0ZWwoc3Ry
dWN0IHRlZ3JhX2VtYyAqZW1jLCB1MzIgdmFsLCB1bnNpZ25lZCBsb25nIG9mZnNldCkKPiArewo+
ICsJd3JpdGVsX3JlbGF4ZWQodmFsLCBlbWMtPmVtY19iYXNlW1JFR19FTUNdICsgb2Zmc2V0KTsK
PiArfQo+ICsKPiAgdTMyIGVtY19yZWFkbChzdHJ1Y3QgdGVncmFfZW1jICplbWMsIHVuc2lnbmVk
IGxvbmcgb2Zmc2V0KQo+ICB7Cj4gIAlyZXR1cm4gcmVhZGxfcmVsYXhlZChlbWMtPmVtY19iYXNl
W1JFR19FTUNdICsgb2Zmc2V0KTsKPiAgfQo+ICAKPiArdTMyIGVtYzFfcmVhZGwoc3RydWN0IHRl
Z3JhX2VtYyAqZW1jLCB1bnNpZ25lZCBsb25nIG9mZnNldCkKPiArewo+ICsJcmV0dXJuIHJlYWRs
X3JlbGF4ZWQoZW1jLT5lbWNfYmFzZVtSRUdfRU1DMV0gKyBvZmZzZXQpOwo+ICt9CgpQbGVhc2Ug
bWFrZSBhbGwgdGhlIGdsb2JhbCBvbmUtbGluZSBmdW5jdGlvbnMgc3RhdGljIGFuZCBpbmxpbmVk
LCB0aGVuCm1vdmUgdGhlbSBvdXQgaW50byB0aGUgaGVhZGVyLiBUaGlzIHdpbGwgYWxsb3cgY29t
cGlsZXIgdG8gb3B0aW1pemUgY29kZQpiZXR0ZXIgYW5kIGFsc28gd2lsbCBoaWRlIHRoZXNlIGdl
bmVyaWMtbG9va2luZyBnbG9iYWwgc3ltYm9sIG5hbWVzIGZyb20KdW5yZWxhdGVkIHBhcnRpZXMg
aW4gdGhlIG11bHRpcGxhdGZvcm0ga2VybmVsIGJ1aWxkLgoKLS0gCkRtaXRyeQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
