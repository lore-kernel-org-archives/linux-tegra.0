From: Joe Kniss <djmk@google.com>
Subject: Re: [PATCH libdrm] drm: Remove create_handle() drm_framebuffer
 "virtual".
Date: Wed, 9 Aug 2017 16:13:05 -0700
Message-ID: <CAOvnNvbEt=Uyve3cu_+6BB0EepvO=OKC6gpV3isRef+UdVoX-g@mail.gmail.com>
References: <20170808234237.62051-1-djmk@google.com>
 <8a7bf59a-0f58-21ba-8b82-78e6ba873065@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8a7bf59a-0f58-21ba-8b82-78e6ba873065@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Michel Daenzer <michel.daenzer@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>, "Zhang,
 Jerry" <Jerry.Zhang@amd.com>, Thierry Reding <thierry.reding@gmail.com>, "Vetter, Daniel" <daniel.vetter@intel.com>, baoyou.xie@linaro.org, Alex Xie <AlexBin.Xie@amd.com>, "StDenis, Tom" <tom.stdenis@amd.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, joe@perches.com, linux-mediatek@lists.infradead.org, Russell King <linux@armlinux.org.uk>, krzk@kernel.org, jonathanh@nvidia.com, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Xiaojie.Yuan@amd.com, Alexandre Demers <alexandre.f.demers@gmail.com>, Joe Kniss <djmk@chr>
List-Id: linux-tegra@vger.kernel.org

T24gV2VkLCBBdWcgOSwgMjAxNyBhdCAxMjoxNCBQTSwgTm9yYWxmIFRyw7hubmVzIDxub3JhbGZA
dHJvbm5lcy5vcmc+IHdyb3RlOgo+Cj4gRGVuIDA5LjA4LjIwMTcgMDEuNDIsIHNrcmV2IEpvZSBL
bmlzczoKPj4KPj4gQmVjYXVzZSBhbGwgZHJpdmVycyBjdXJyZW50bHkgdXNlIGdlbSBvYmplY3Rz
IGZvciBmcmFtZWJ1ZmZlciBwbGFuZXMsCj4+IHRoZSB2aXJ0dWFsIGNyZWF0ZV9oYW5kbGUoKSBp
cyBub3QgcmVxdWlyZWQuICBUaGlzIGNoYW5nZSBhZGRzIGEKPj4gc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpnZW1zWzRdIGZpZWxkIHRvIGRybV9mcmFtZWJ1ZmZlciBhbmQgcmVtb3Zlcwo+PiBjcmVh
dGVfaGFuZGxlKCkgZnVuY3Rpb24gcG9pbnRlciBmcm9tIGRybV9mcmFtZWJ1ZmZlcl9mdW5jcy4g
IFRoZQo+PiBjb3JyZXNwb25kaW5nICpfY3JlYXRlX2hhbmRsZSgpIGZ1bmN0aW9uIGlzIHJlbW92
ZWQgZnJvbSBlYWNoIGRyaXZlci4KPj4KPj4gSW4gbWFueSBjYXNlcyB0aGlzIGNoYW5nZSBlbGlt
aW5hdGVzIGEgc3RydWN0ICpfZnJhbWVidWZmZXIgb2JqZWN0LAo+PiBhcyB0aGUgb25seSBuZWVk
IGZvciB0aGUgZGVyaXZlZCBzdHJ1Y3QgaXMgdGhlIGFkZGl0aW9uIG9mIHRoZSBnZW0KPj4gb2Jq
ZWN0IHBvaW50ZXIuCj4+Cj4+IFRFU1RFRDogY29tcGlsZWQ6IGFsbHllc2NvbmZpZyBBUkNIPXg4
Nixhcm0gcGxhdGZvcm1zOmk5MTUsIHJvY2tjaGlwCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvZSBL
bmlzcyA8ZGpta0Bnb29nbGUuY29tPgo+PiAtLS0KPgo+Cj4gSGkgSm9lLAo+Cj4gSSdtIGFsc28g
bG9va2luZyBpbnRvIGFkZGluZyBnZW0gb2JqcyB0byBkcm1fZnJhbWVidWZmZXIgaW4gdGhpcyBw
YXRjaDoKPiBbUEFUQ0ggdjIgMDEvMjJdIGRybTogQWRkIEdFTSBiYWNrZWQgZnJhbWVidWZmZXIg
bGlicmFyeQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZl
bC8yMDE3LUF1Z3VzdC8xNDk3ODIuaHRtbAo+CgpHcmVhdC4gIFRoZXJlJ3Mgb25seSBtaW5pbWFs
IG92ZXJsYXAgaGVyZS4gIEknbGwgcmViYXNlIHRoaXMgY2hhbmdlIG9uIHlvdXJzCm9uY2UgaXQn
cyBpbi4KCj4gWy4uLl0KPgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9j
bWFfaGVscGVyLmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuYwo+PiBp
bmRleCBhZGUzMTlkMTBlNzAuLmY1ZjAxMWI5MTBiMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9m
Yl9jbWFfaGVscGVyLmMKPj4gQEAgLTMxLDE0ICszMSw5IEBACj4+ICAgICAjZGVmaW5lIERFRkFV
TFRfRkJERUZJT19ERUxBWV9NUyA1MAo+PiAgIC1zdHJ1Y3QgZHJtX2ZiX2NtYSB7Cj4+IC0gICAg
ICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAgICAgICAgICBmYjsKPj4gLSAgICAgICBzdHJ1Y3Qg
ZHJtX2dlbV9jbWFfb2JqZWN0ICAgICAgICpvYmpbNF07Cj4+IC19Owo+PiAtCj4+ICAgc3RydWN0
IGRybV9mYmRldl9jbWEgewo+PiAgICAgICAgIHN0cnVjdCBkcm1fZmJfaGVscGVyICAgIGZiX2hl
bHBlcjsKPj4gLSAgICAgICBzdHJ1Y3QgZHJtX2ZiX2NtYSAgICAgICAqZmI7Cj4+ICsgICAgICAg
c3RydWN0IGRybV9mcmFtZWJ1ZmZlciAgKmZiOwo+Cj4KPiBUaGlzIGZiIHBvaW50ZXIgaXNuJ3Qg
bmVjZXNzYXJ5LCBzaW5jZSBmYl9oZWxwZXIgYWxyZWFkeSBoYXMgb25lLgo+CgpJJ2xsIHJlbW92
ZSBpdC4uLiBidXQgSSBhbSBzdXJlIHdoZW4gSSBsb29rIGRlZXBlciB0aGVyZSB3aWxsIGJlIG1v
cmUKb2YgdGhlc2UgaW4gdGhlIHZhcmlvdXMgZHJpdmVycyB0b28uCgo+IE5vcmFsZi4KPgo+Cgot
am9lCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
