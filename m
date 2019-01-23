From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] drm/tegra: vic: Do not clear driver data
Date: Wed, 23 Jan 2019 17:56:15 +0300
Message-ID: <a213287c-bd58-42e4-e683-87e0a1ce9ae6@gmail.com>
References: <20190123134234.2625-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190123134234.2625-1-thierry.reding@gmail.com>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

MjMuMDEuMjAxOSAxNjo0MiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFVwb24gZHJpdmVyIGZhaWx1cmUs
IHRoZSBkcml2ZXIgY29yZSB3aWxsIHRha2UgY2FyZSBvZiBjbGVhcmluZyB0aGUKPiBkcml2ZXIg
ZGF0YSwgc28gdGhlcmUncyBubyBuZWVkIHRvIGRvIHNvIGV4cGxpY2l0bHkgaW4gdGhlIGRyaXZl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMgfCAxIC0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL3ZpYy5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jCj4gaW5kZXggOWNiMTBkMWU5
MjNhLi5kMjBmY2JmNjE5NmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Zp
Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jCj4gQEAgLTQxMiw3ICs0MTIs
NiBAQCBzdGF0aWMgaW50IHZpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICAJZXJyID0gaG9zdDF4X2NsaWVudF9yZWdpc3RlcigmdmljLT5jbGllbnQuYmFzZSk7Cj4gIAlp
ZiAoZXJyIDwgMCkgewo+ICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGhvc3Qx
eCBjbGllbnQ6ICVkXG4iLCBlcnIpOwo+IC0JCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5V
TEwpOwo+ICAJCWdvdG8gZXhpdF9mYWxjb247Cj4gIAl9Cj4gIAo+IAoKTG9va3MgZ29vZCwKClJl
dmlld2VkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
