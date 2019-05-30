From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V4 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Thu, 30 May 2019 19:14:13 +0300
Message-ID: <1e197124-57f5-285b-1624-bba2f3d31386@gmail.com>
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
bGVfcmVnaXN0ZXJfb2Zmc2V0Jwo+IC0tLQoKPiAgCj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgZW1j
X3RhYmxlX3JlZ2lzdGVyX29mZnNldCByZWdfb2ZmOwo+ICtleHRlcm4gdW5zaWduZWQgbG9uZyBk
cmFtX292ZXJfdGVtcF9zdGF0ZTsKClBsZWFzZSBhdm9pZCBnbG9iYWwgdmFyaWFibGVzIHdoZXJl
IHRoZXkgYXJlIG5vdCByZWFsbHkgbmVlZGVkLgoKQWRkIHJlZ19vZmYgcG9pbnRlciB0byB0ZWdy
YV9lbWMuCgpSZW1vdmUgZHJhbV9vdmVyX3RlbXBfc3RhdGUgdmFyaWFibGUgZW50aXJlbHkgYW5k
IHJlcGxhY2UgaXQgd2l0aApURUdSQV9EUkFNX09WRVJfVEVNUF9OT05FIGluIHRoZSBjb2RlIHNp
bmNlIG5vdGhpbmcgY2hhbmdlcyB0aGUgdmFyaWFibGUuCgpBZ2FpbiwgcHJlcGVuZCBhbGwgZ2xv
YmFsIHN5bWJvbHMgd2l0aCB0ZWdyYTIxMF8uCgpBbHRlcm5hdGl2ZWx5IHlvdSBjb3VsZCBzaW1w
bHkgaW5jbHVkZSB0ZWdyYTIxMC1lbWMtY2MtcjIxMDIxLmMgaW50bwp0ZWdyYTIxMC1lbWMuYywg
SSBkb24ndCBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0aCB0aGF0IHZhcmlhbnQuCgoJI2luY2x1ZGUg
InRlZ3JhMjEwLWVtYy1jYy1yMjEwMjEuYyIKCk9yIHlvdSBjb3VsZCBzcXVhc2ggaXQgYWxsIGlu
dG8gYSBzaW5nbGUgc291cmNlIGZpbGUgaWYgdmFyaWFudHMgb3RoZXIKdGhhbiAicjIxMDIxIiBh
cmUgbm90IHBsYW5uZWQgdG8gYmUgc3VwcG9ydGVkLiBUaGlzIHdpbGwgaGVscCB0byByZWR1Y2UK
bWVzc2luZXNzIG9mIHRoZSBjb2RlIGFuZCB3aWxsIGFsbG93IGNvbXBpbGVyIHRvIGJldHRlciBv
cHRpbWl6ZSBpdCBhbGwuCgotLSAKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
