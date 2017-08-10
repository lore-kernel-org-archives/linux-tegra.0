From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Intel-gfx] [PATCH libdrm] drm: Remove create_handle()
 drm_framebuffer "virtual".
Date: Fri, 11 Aug 2017 00:52:13 +0100
Message-ID: <CACvgo53_Xfyaqhqe=+LMKOwJUbBnnoLuJu+gi0P+4AfJmH7Fmg@mail.gmail.com>
References: <20170808234237.62051-1-djmk@google.com>
 <8a7bf59a-0f58-21ba-8b82-78e6ba873065@tronnes.org>
 <CAOvnNvbEt=Uyve3cu_+6BB0EepvO=OKC6gpV3isRef+UdVoX-g@mail.gmail.com>
 <CAOvnNvbNNtuLFy+7-beF=kGB0qYJckT_MEef3_=t-eWi-NFGXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAOvnNvbNNtuLFy+7-beF=kGB0qYJckT_MEef3_=t-eWi-NFGXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Joe Kniss <djmk-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Edward O'Callaghan <funfunctor-dczkZgxz+BNUPWh3PAxdjQ@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:VIRTIO CORE,
 NET..." <virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, amd-gfx mailing list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Vetter,
 Daniel" <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Xie <AlexBin.Xie-5C7GfCeVMHo@public.gmane.org>, "StDenis, Tom" <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, zhoucm1 <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tomi
List-Id: linux-tegra@vger.kernel.org

T24gMTAgQXVndXN0IDIwMTcgYXQgMjA6MjksIEpvZSBLbmlzcyA8ZGpta0Bnb29nbGUuY29tPiB3
cm90ZToKPiBPbiBXZWQsIEF1ZyA5LCAyMDE3IGF0IDQ6MTMgUE0sIEpvZSBLbmlzcyA8ZGpta0Bn
b29nbGUuY29tPiB3cm90ZToKPj4gT24gV2VkLCBBdWcgOSwgMjAxNyBhdCAxMjoxNCBQTSwgTm9y
YWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IHdyb3RlOgo+Pj4KPj4+IERlbiAwOS4w
OC4yMDE3IDAxLjQyLCBza3JldiBKb2UgS25pc3M6Cj4+Pj4KPj4+PiBCZWNhdXNlIGFsbCBkcml2
ZXJzIGN1cnJlbnRseSB1c2UgZ2VtIG9iamVjdHMgZm9yIGZyYW1lYnVmZmVyIHBsYW5lcywKPj4+
PiB0aGUgdmlydHVhbCBjcmVhdGVfaGFuZGxlKCkgaXMgbm90IHJlcXVpcmVkLiAgVGhpcyBjaGFu
Z2UgYWRkcyBhCj4+Pj4gc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW1zWzRdIGZpZWxkIHRvIGRy
bV9mcmFtZWJ1ZmZlciBhbmQgcmVtb3Zlcwo+Pj4+IGNyZWF0ZV9oYW5kbGUoKSBmdW5jdGlvbiBw
b2ludGVyIGZyb20gZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzLiAgVGhlCj4+Pj4gY29ycmVzcG9uZGlu
ZyAqX2NyZWF0ZV9oYW5kbGUoKSBmdW5jdGlvbiBpcyByZW1vdmVkIGZyb20gZWFjaCBkcml2ZXIu
Cj4+Pj4KPj4+PiBJbiBtYW55IGNhc2VzIHRoaXMgY2hhbmdlIGVsaW1pbmF0ZXMgYSBzdHJ1Y3Qg
Kl9mcmFtZWJ1ZmZlciBvYmplY3QsCj4+Pj4gYXMgdGhlIG9ubHkgbmVlZCBmb3IgdGhlIGRlcml2
ZWQgc3RydWN0IGlzIHRoZSBhZGRpdGlvbiBvZiB0aGUgZ2VtCj4+Pj4gb2JqZWN0IHBvaW50ZXIu
Cj4+Pj4KPj4+PiBURVNURUQ6IGNvbXBpbGVkOiBhbGx5ZXNjb25maWcgQVJDSD14ODYsYXJtIHBs
YXRmb3JtczppOTE1LCByb2NrY2hpcAo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9lIEtuaXNz
IDxkam1rQGdvb2dsZS5jb20+Cj4+Pj4gLS0tCj4+Pgo+Pj4KPj4+IEhpIEpvZSwKPj4+Cj4+PiBJ
J20gYWxzbyBsb29raW5nIGludG8gYWRkaW5nIGdlbSBvYmpzIHRvIGRybV9mcmFtZWJ1ZmZlciBp
biB0aGlzIHBhdGNoOgo+Pj4gW1BBVENIIHYyIDAxLzIyXSBkcm06IEFkZCBHRU0gYmFja2VkIGZy
YW1lYnVmZmVyIGxpYnJhcnkKPj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hp
dmVzL2RyaS1kZXZlbC8yMDE3LUF1Z3VzdC8xNDk3ODIuaHRtbAo+Pj4KPj4KPj4gR3JlYXQuICBU
aGVyZSdzIG9ubHkgbWluaW1hbCBvdmVybGFwIGhlcmUuICBJJ2xsIHJlYmFzZSB0aGlzIGNoYW5n
ZSBvbiB5b3Vycwo+PiBvbmNlIGl0J3MgaW4uCj4+Cj4+PiBbLi4uXQo+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMKPj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5jCj4+Pj4gaW5kZXggYWRlMzE5ZDEwZTcwLi5mNWYw
MTFiOTEwYjEgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVs
cGVyLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuYwo+Pj4+
IEBAIC0zMSwxNCArMzEsOSBAQAo+Pj4+ICAgICAjZGVmaW5lIERFRkFVTFRfRkJERUZJT19ERUxB
WV9NUyA1MAo+Pj4+ICAgLXN0cnVjdCBkcm1fZmJfY21hIHsKPj4+PiAtICAgICAgIHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgICAgICAgICAgZmI7Cj4+Pj4gLSAgICAgICBzdHJ1Y3QgZHJtX2dlbV9j
bWFfb2JqZWN0ICAgICAgICpvYmpbNF07Cj4+Pj4gLX07Cj4+Pj4gLQo+Pj4+ICAgc3RydWN0IGRy
bV9mYmRldl9jbWEgewo+Pj4+ICAgICAgICAgc3RydWN0IGRybV9mYl9oZWxwZXIgICAgZmJfaGVs
cGVyOwo+Pj4+IC0gICAgICAgc3RydWN0IGRybV9mYl9jbWEgICAgICAgKmZiOwo+Pj4+ICsgICAg
ICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAgKmZiOwo+Pj4KPj4+Cj4+PiBUaGlzIGZiIHBvaW50
ZXIgaXNuJ3QgbmVjZXNzYXJ5LCBzaW5jZSBmYl9oZWxwZXIgYWxyZWFkeSBoYXMgb25lLgo+Pj4K
Pgo+IFNvLCBsb29raW5nIGRlZXBlciBpbnRvIHRoaXMsIGl0IHNlZW1zIHRoYXQgdGhlIHN0cnVj
dAo+IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyAqZmJfZnVuY3MgaXMgYWxzbyByZWR1bmRhbnQgaGVy
ZT8gIEluIHdoaWNoIGNhc2UKPiB0aGlzIHdob2xlIHN0cnVjdCBjYW4gZ28uLi4KPgpJIHRoaW5r
IHlvdSdyZSBzcG90IG9uLgoKUGVyaGFwcyB0aGUgZ29hbCB3YXMgdG8gYWxsb3cgZHJpdmVycyB0
byB1c2Ugc2VwYXJhdGUgZnVuY3MgZm9yIGZiIHZzIGZiZGV2PwpOb3Qgc3VyZSBob3cgd2VsbCB0
aGF0IHdpbGwgZmFpciwgeWV0IGFnYWluLCBhbGwgY3VycmVudCB1c2VycyB1c2UgdGhlCnNhbWUg
ZnVuY3MgZm9yIGJvdGguCgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngK
