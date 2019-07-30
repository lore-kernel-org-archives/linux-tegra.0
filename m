From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 21/24] drm/bridge: ti-tfp410: Provide ddc
 symlink in connector sysfs directory
Date: Tue, 30 Jul 2019 14:30:22 +0200
Message-ID: <6ebbb98e-b54b-6ed1-1b20-ef5acae5a232@baylibre.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <3b61da77a6456805db0deffe6d1a2343dd784730.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3b61da77a6456805db0deffe6d1a2343dd784730.1564161140.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
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
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ramalingam C <ramalingam.c-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk@>
List-Id: linux-tegra@vger.kernel.org

T24gMjYvMDcvMjAxOSAxOToyMywgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IFVzZSB0
aGUgZGRjIHBvaW50ZXIgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCA2ICsrKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+IGluZGV4IGRiZjM1YzdiYzg1ZS4uNjFjYzIz
NTRlZjFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCj4gQEAgLTEzNCw4ICsx
MzQsMTAgQEAgc3RhdGljIGludCB0ZnA0MTBfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UpCj4gIAo+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZkdmktPmNvbm5lY3RvciwKPiAg
CQkJCSAmdGZwNDEwX2Nvbl9oZWxwZXJfZnVuY3MpOwo+IC0JcmV0ID0gZHJtX2Nvbm5lY3Rvcl9p
bml0KGJyaWRnZS0+ZGV2LCAmZHZpLT5jb25uZWN0b3IsCj4gLQkJCQkgJnRmcDQxMF9jb25fZnVu
Y3MsIGR2aS0+Y29ubmVjdG9yX3R5cGUpOwo+ICsJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dp
dGhfZGRjKGJyaWRnZS0+ZGV2LCAmZHZpLT5jb25uZWN0b3IsCj4gKwkJCQkJICAmdGZwNDEwX2Nv
bl9mdW5jcywKPiArCQkJCQkgIGR2aS0+Y29ubmVjdG9yX3R5cGUsCj4gKwkJCQkJICBkdmktPmRk
Yyk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJZGV2X2VycihkdmktPmRldiwgImRybV9jb25uZWN0b3Jf
aW5pdCgpIGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gIAkJcmV0dXJuIHJldDsKPiAKClJldmlld2Vk
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
