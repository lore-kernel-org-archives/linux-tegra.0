From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH -next] drm/tegra: Use PTR_ERR_OR_ZERO in tegra_gem_create()
Date: Tue, 25 Sep 2018 16:29:37 +0900
Message-ID: <ad3ed7e3-17dd-a418-f951-3cae69b0ac32@kapsi.fi>
References: <1537839351-104885-1-git-send-email-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1537839351-104885-1-git-send-email-yuehaibing@huawei.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YueHaibing <yuehaibing@huawei.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

SSdtIG5vdCB0aGUgbWFpbnRhaW5lciwgYnV0IGluIGxpbmUgd2l0aCBwcmV2aW91cyBzaW1pbGFy
IHBhdGNoZXMuLgoKTkFLOiB0aGlzIG1ha2VzIHRoZSBjb2RlIGhhcmRlciB0byByZWFkLgoKVGhh
bmtzLApNaWtrbwoKT24gMjUvMDkvMjAxOCAxMC4zNSwgWXVlSGFpYmluZyB3cm90ZToKPiBVc2Ug
UFRSX0VSUl9PUl9aRVJPIHJhdGhlciB0aGFuIGlmKElTX0VSUiguLi4pKSArIFBUUl9FUlIKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgfCA1ICstLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYwo+
IGluZGV4IGUyMjM1MmMuLjA1NmY3NDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RybS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCj4gQEAgLTQ5Nywx
MCArNDk3LDcgQEAgc3RhdGljIGludCB0ZWdyYV9nZW1fY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0sIHZvaWQgKmRhdGEsCj4gICAKPiAgIAlibyA9IHRlZ3JhX2JvX2NyZWF0ZV93aXRoX2hh
bmRsZShmaWxlLCBkcm0sIGFyZ3MtPnNpemUsIGFyZ3MtPmZsYWdzLAo+ICAgCQkJCQkgJmFyZ3Mt
PmhhbmRsZSk7Cj4gLQlpZiAoSVNfRVJSKGJvKSkKPiAtCQlyZXR1cm4gUFRSX0VSUihibyk7Cj4g
LQo+IC0JcmV0dXJuIDA7Cj4gKwlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKGJvKTsKPiAgIH0KPiAg
IAo+ICAgc3RhdGljIGludCB0ZWdyYV9nZW1fbW1hcChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2
b2lkICpkYXRhLAo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
