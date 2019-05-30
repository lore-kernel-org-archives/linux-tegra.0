From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V4 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Thu, 30 May 2019 10:45:51 +0800
Message-ID: <f59d78aa-aa70-574f-a8b6-1364861f8319@nvidia.com>
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-6-josephl@nvidia.com>
 <5bd95d0b-e1a5-e717-4d5a-b9ef5d5fa4a5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5bd95d0b-e1a5-e717-4d5a-b9ef5d5fa4a5@gmail.com>
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

T24gNS8yOS8xOSA5OjM3IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjkuMDUuMjAxOSAx
MToyMSwgSm9zZXBoIExvINC/0LjRiNC10YI6Cj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgcmVxdWly
ZWQgQVBJcyBhbmQgdmFyaWFibGVzIGZvciB0aGUgRU1DIHNjYWxpbmcKPj4gc2VxdWVuY2UgY29k
ZSBvbiBUZWdyYTIxMC4KPj4KPj4gQmFzZWQgb24gdGhlIHdvcmsgb2YgUGV0ZXIgRGUgU2Nocmlq
dmVyIDxwZGVzY2hyaWp2ZXJAbnZpZGlhLmNvbT4uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvc2Vw
aCBMbyA8am9zZXBobEBudmlkaWEuY29tPgo+PiAtLS0KPj4gdjQ6Cj4+IC0gZml4IHRoZSBBUEkg
d2l0aCBnZW5lcmljIG5hbWluZwo+PiAtIHVzZSAndTE2JyBpbiAnc3RydWN0IGVtY190YWJsZV9y
ZWdpc3Rlcl9vZmZzZXQnCj4+IC0tLQo+IAo+IFtzbmlwXQo+IAo+PiArdm9pZCBlbWNfd3JpdGVs
KHN0cnVjdCB0ZWdyYV9lbWMgKmVtYywgdTMyIHZhbCwgdW5zaWduZWQgbG9uZyBvZmZzZXQpCj4+
ICt7Cj4+ICsJd3JpdGVsX3JlbGF4ZWQodmFsLCBlbWMtPmVtY19iYXNlW1JFR19FTUNdICsgb2Zm
c2V0KTsKPj4gK30KPj4gKwo+PiAgIHUzMiBlbWNfcmVhZGwoc3RydWN0IHRlZ3JhX2VtYyAqZW1j
LCB1bnNpZ25lZCBsb25nIG9mZnNldCkKPj4gICB7Cj4+ICAgCXJldHVybiByZWFkbF9yZWxheGVk
KGVtYy0+ZW1jX2Jhc2VbUkVHX0VNQ10gKyBvZmZzZXQpOwo+PiAgIH0KPj4gICAKPj4gK3UzMiBl
bWMxX3JlYWRsKHN0cnVjdCB0ZWdyYV9lbWMgKmVtYywgdW5zaWduZWQgbG9uZyBvZmZzZXQpCj4+
ICt7Cj4+ICsJcmV0dXJuIHJlYWRsX3JlbGF4ZWQoZW1jLT5lbWNfYmFzZVtSRUdfRU1DMV0gKyBv
ZmZzZXQpOwo+PiArfQo+IAo+IFBsZWFzZSBtYWtlIGFsbCB0aGUgZ2xvYmFsIG9uZS1saW5lIGZ1
bmN0aW9ucyBzdGF0aWMgYW5kIGlubGluZWQsIHRoZW4KPiBtb3ZlIHRoZW0gb3V0IGludG8gdGhl
IGhlYWRlci4gVGhpcyB3aWxsIGFsbG93IGNvbXBpbGVyIHRvIG9wdGltaXplIGNvZGUKPiBiZXR0
ZXIgYW5kIGFsc28gd2lsbCBoaWRlIHRoZXNlIGdlbmVyaWMtbG9va2luZyBnbG9iYWwgc3ltYm9s
IG5hbWVzIGZyb20KPiB1bnJlbGF0ZWQgcGFydGllcyBpbiB0aGUgbXVsdGlwbGF0Zm9ybSBrZXJu
ZWwgYnVpbGQuCgpPa2F5LCB3aWxsIGRvLgoKVGhhbmtzLApKb3NlcGgKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
