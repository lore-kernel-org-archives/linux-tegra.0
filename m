From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V3 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 May 2019 16:47:37 +0800
Message-ID: <54203d4d-aced-543e-6ebb-6ffacb7c8a85@nvidia.com>
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-6-josephl@nvidia.com>
 <dc580a9b-4d37-ae20-888d-3956b284c43b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <dc580a9b-4d37-ae20-888d-3956b284c43b@gmail.com>
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
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

T24gNS8xNC8xOSAxOjAyIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTAuMDUuMjAxOSAx
MTo0NywgSm9zZXBoIExvINC/0LjRiNC10YI6Cj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgcmVxdWly
ZWQgQVBJcyBhbmQgdmFyaWFibGVzIGZvciB0aGUgRU1DIHNjYWxpbmcKPj4gc2VxdWVuY2UgY29k
ZSBvbiBUZWdyYTIxMC4KPj4KPj4gQmFzZWQgb24gdGhlIHdvcmsgb2YgUGV0ZXIgRGUgU2Nocmlq
dmVyIDxwZGVzY2hyaWp2ZXJAbnZpZGlhLmNvbT4uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvc2Vw
aCBMbyA8am9zZXBobEBudmlkaWEuY29tPgo+PiAtLS0Kc25pcC4KPj4gK3ZvaWQgZG9fY2xvY2tf
Y2hhbmdlKHN0cnVjdCB0ZWdyYV9lbWMgKmVtYywgdTMyIGNsa3NyYykKPj4gK3sKPj4gKwlpbnQg
ZXJyOwo+PiArCj4+ICsJbWNfcmVhZGwoZW1jLT5tYywgTUNfRU1FTV9BRFJfQ0ZHKTsKPj4gKwll
bWNfcmVhZGwoZW1jLCBFTUNfSU5UU1RBVFVTKTsKPj4gKwo+PiArCXRlZ3JhMjEwX2Nsa19lbWNf
dXBkYXRlX3NldHRpbmcoY2xrc3JjKTsKPj4gKwo+PiArCWVyciA9IHdhaXRfZm9yX3VwZGF0ZShl
bWMsIEVNQ19JTlRTVEFUVVMsCj4+ICsJCQkgICAgICBFTUNfSU5UU1RBVFVTX0NMS0NIQU5HRV9D
T01QTEVURSwgdHJ1ZSwgUkVHX0VNQyk7Cj4+ICsJaWYgKGVycikgewo+PiArCQlwcl9lcnIoIiVz
OiBjbG9jayBjaGFuZ2UgY29tcGxldGlvbiBlcnJvcjogJWQiLCBfX2Z1bmNfXywgZXJyKTsKPj4g
KwkJV0FSTl9PTigxKTsKPj4gKwl9Cj4+ICt9Cj4+ICsKPj4gK3N0cnVjdCBlbWNfdGFibGUgKmdl
dF90aW1pbmdfZnJvbV9mcmVxKHN0cnVjdCB0ZWdyYV9lbWMgKmVtYywKPj4gKwkJCQkgICAgICAg
dW5zaWduZWQgbG9uZyByYXRlKQo+PiArewo+PiArCWludCBpOwo+PiArCj4+ICsJZm9yIChpID0g
MDsgaSA8IGVtYy0+ZW1jX3RhYmxlX3NpemU7IGkrKykKPj4gKwkJaWYgKGVtYy0+ZW1jX3RhYmxl
W2ldLnJhdGUgPT0gcmF0ZSkKPj4gKwkJCXJldHVybiAmZW1jLT5lbWNfdGFibGVbaV07Cj4+ICsK
Pj4gKwlyZXR1cm4gTlVMTDsKPj4gK30KPj4gKwo+PiAraW50IHdhaXRfZm9yX3VwZGF0ZShzdHJ1
Y3QgdGVncmFfZW1jICplbWMsIHUzMiBzdGF0dXNfcmVnLCB1MzIgYml0X21hc2ssCj4+ICsJCSAg
ICBib29sIHVwZGF0ZWRfc3RhdGUsIGludCBjaGFuKQo+PiArewo+IAo+IFRoaXMgYW5kIGFsbCBv
dGhlciBnbG9iYWwgZnVuY3Rpb25zIGhhdmUgdmVyeSBnZW5lcmljIG5hbWVzLiBFaXRoZXIKPiBz
cXVhc2ggaXQgYWxsIGludG8gYSBzaW5nbGUgc291cmNlIGZpbGUgYW5kIG1ha2UgYWxsIGZ1bmN0
aW9ucyBzdGF0aWMsCj4gb3IgY2hhbmdlIHRoZSBuYW1lcyB0byBzb21ldGhpbmcgbW9yZSB1bmlx
dWUuCj4gCgpPa2F5LCB3aWxsIGZpeCBpdC4KClRoYW5rcywKSm9zZXBoCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
