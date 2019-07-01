From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 01/22] drm: Include ddc adapter pointer
 in struct drm_connector
Date: Mon, 1 Jul 2019 15:27:40 +0200
Message-ID: <cf1984e4-50af-302d-ef67-9ad530118c29@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <d6381c020ea1c848a7044d830bdb0ec9663d1619.1561735433.git.andrzej.p@collabora.com>
 <9b03d145-ec50-927c-55a8-dff1cd51d655@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <9b03d145-ec50-927c-55a8-dff1cd51d655-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>David
List-Id: linux-tegra@vger.kernel.org

SGkgVGhvbWFzLAoKVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLiBQbGVhc2Ugc2VlIGlubGlu
ZS4KClcgZG5pdSAzMC4wNi4yMDE5IG/CoDEwOjEyLCBUaG9tYXMgWmltbWVybWFubiBwaXN6ZToK
PiBIaQo+IAo+IEkgbGlrZSB0aGUgaWRlYSwgYnV0IHdvdWxkIHByZWZlciBhIG1vcmUgc3RydWN0
dXJlZCBhcHByb2FjaC4KPiAKPiBTZXR0aW5nIGNvbm5lY3Rvci0+ZGRjIGJlZm9yZSBjYWxsaW5n
IGRybV9zeXNmc19jb25uZWN0b3JfYWRkKCkgc2VlbXMKPiBlcnJvciBwcm9uZS4gVGhlIGRlcGVu
ZGVuY3kgaXMgbm90IHJlYWxseSBjbGVhciBmcm9tIHRoZSBjb2RlIG9yIGludGVyZmFjZXMuCj4g
Cj4gVGhlIG90aGVyIHRoaW5nIGlzIHRoYXQgZHJpdmVycyBJIG1vc3RseSB3b3JrIG9uLCBhc3Qg
YW5kIG1nYWcyMDAsIGhhdmUKPiBjb2RlIGxpa2UgdGhpczoKPiAKPiAgICBzdHJ1Y3QgYXN0X2ky
Y19jaGFuIHsKPiAJc3RydWN0IGkyY19hZGFwdGVyIGFkYXB0ZXI7Cj4gCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXY7Cj4gCXN0cnVjdCBpMmNfYWxnb19iaXRfZGF0YSBiaXQ7Cj4gICAgfTsKPiAKPiAg
ICBzdHJ1Y3QgYXN0X2Nvbm5lY3RvciB7Cj4gCXN0cnVjdCBkcm1fY29ubmVjdG9yIGJhc2U7Cj4g
CXN0cnVjdCBhc3RfaTJjX2NoYW4gKmkyYzsKPiAgICB9Owo+IAo+IEl0IGFscmVhZHkgZW5jb2Rl
cyB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuIGNvbm5lY3RvciBhbmQgZGRjIGFkYXB0ZXIuCj4gCj4g
SSBzdWdnZXN0IHRvIGludHJvZHVjZSBzdHJ1Y3QgZHJtX2kyY19hZGFwdGVyCj4gCj4gICAgc3Ry
dWN0IGRybV9pMmNfYWRhcHRlciB7Cj4gCXN0cnVjdCBpMmNfYWRhcHRlciBiYXNlOwo+IAlzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ICAgIH07Cj4gCj4gYW5kIGNvbnZlcnQgZHJp
dmVycyBvdmVyIHRvIGl0LiBBc3Qgd291bGQgbG9vayBsaWtlIHRoaXM6Cj4gCj4gICAgc3RydWN0
IGFzdF9pMmNfY2hhbiB7Cj4gCXN0cnVjdCBkcm1faTJjX2FkYXB0ZXIgYWRhcHRlcjsKPiAJc3Ry
dWN0IGkyY19hbGdvX2JpdF9kYXRhIGJpdDsKPiAgICB9Owo+IAoKVGhlcmUgYXJlIGZldyBmbGF2
b3JzIG9mIHRoZXNlIGRyaXZlcnMuIEluIHNvbWUgb2YgdGhlbQp0aGUgaTJjX2FkYXB0ZXIgZm9y
IGRkYyBpcyBhbGxvY2F0ZWQgYW5kIGluaXRpYWxpemVkIGJ5CnRoZSBkcml2ZXIsIHdoaWNoIG11
c3QgcHJvdmlkZSBhIHBsYWNlIGluIG1lbW9yeSB0byBob2xkCnRoZSBhZGFwdGVyLiBhc3QgaXMg
YW4gZXhhbXBsZSBvZiB0aGlzIGFwcHJvYWNoLgoKQnV0IHRoZXJlIGFyZSBvdGhlcnMsIHN1Y2gg
YXMgZm9yIGV4YW1wbGUgZXh5bm9zX2hkbWkuYy4KSXQgZ2V0cyBpdHMgZGRjIGFkYXB0ZXIgd2l0
aCBvZl9maW5kX2kyY19hZGFwdGVyX2J5X25vZGUoKQphbmQgbWVyZWx5IHN0b3JlcyBhIHBvaW50
ZXIgdG8gaXQsIHdoaWxlIG5vdCBtYW5hZ2luZyB0aGUKbWVtb3J5IG5lZWRlZCB0byBob2xkIHRo
ZSBpMmNfYWRhcHRlci4KCkRvIHlvdSBoYXZlIGFueSBpZGVhIGhvdyB0byBhY2NvbW1vZGF0ZSB0
aGVzZSB2YXJpb3VzCmZsYXZvcnMgb2YgZHJpdmVycyBpbiB0aGUgc2NoZW1lIHlvdSBwcm9wb3Nl
PwoKQW5kcnplagoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVu
bw==
