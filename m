From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH -next] drm/tegra: Use PTR_ERR_OR_ZERO in tegra_gem_create()
Date: Tue, 25 Sep 2018 09:37:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1809250936290.2702@hadrien>
References: <1537839351-104885-1-git-send-email-yuehaibing@huawei.com>
 <ad3ed7e3-17dd-a418-f951-3cae69b0ac32@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ad3ed7e3-17dd-a418-f951-3cae69b0ac32@kapsi.fi>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

CgpPbiBUdWUsIDI1IFNlcCAyMDE4LCBNaWtrbyBQZXJ0dHVuZW4gd3JvdGU6Cgo+IEknbSBub3Qg
dGhlIG1haW50YWluZXIsIGJ1dCBpbiBsaW5lIHdpdGggcHJldmlvdXMgc2ltaWxhciBwYXRjaGVz
Li4KPgo+IE5BSzogdGhpcyBtYWtlcyB0aGUgY29kZSBoYXJkZXIgdG8gcmVhZC4KCklmIHBlb3Bs
ZSBkb24ndCBsaWtlIGl0LCBJIHdvbmRlciBpZiBpdCBpcyBhIGdvb2QgdGhpbmcgZm9yIHRoZSBm
dW5jdGlvbgp0byBldmVuIGV4aXN0PyAgT3IgYXQgbGVhc3QgdGhlIHNlbWFudGljIHBhdGNoIHRo
YXQgc3VnZ2VzdHMgdGhpcyBjb3VsZCBiZQpyZW1vdmVkLgoKanVsaWEKCj4KPiBUaGFua3MsCj4g
TWlra28KPgo+IE9uIDI1LzA5LzIwMTggMTAuMzUsIFl1ZUhhaWJpbmcgd3JvdGU6Cj4gPiBVc2Ug
UFRSX0VSUl9PUl9aRVJPIHJhdGhlciB0aGFuIGlmKElTX0VSUiguLi4pKSArIFBUUl9FUlIKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4g
PiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIHwgNSArLS0tLQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcm0uYwo+ID4gaW5kZXggZTIyMzUyYy4uMDU2Zjc0OSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RybS5jCj4gPiBAQCAtNDk3LDEwICs0OTcsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX2dlbV9jcmVh
dGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKPiA+IHZvaWQgKmRhdGEsCj4gPiAgICAgCWJvID0g
dGVncmFfYm9fY3JlYXRlX3dpdGhfaGFuZGxlKGZpbGUsIGRybSwgYXJncy0+c2l6ZSwgYXJncy0+
ZmxhZ3MsCj4gPiAgIAkJCQkJICZhcmdzLT5oYW5kbGUpOwo+ID4gLQlpZiAoSVNfRVJSKGJvKSkK
PiA+IC0JCXJldHVybiBQVFJfRVJSKGJvKTsKPiA+IC0KPiA+IC0JcmV0dXJuIDA7Cj4gPiArCXJl
dHVybiBQVFJfRVJSX09SX1pFUk8oYm8pOwo+ID4gICB9Cj4gPiAgICAgc3RhdGljIGludCB0ZWdy
YV9nZW1fbW1hcChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpkYXRhLAo+ID4KPiA+Cj4g
Pgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCj4gPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
