From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v6 20/24] drm/bridge: dw-hdmi: Provide ddc symlink in
 connector sysfs directory
Date: Fri, 26 Jul 2019 21:18:58 +0200
Message-ID: <2759414.3aNxrjZxYY@jernej-laptop>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <4bcf0f154c683c9787fa34f911ebc52de6b4a7a1.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4bcf0f154c683c9787fa34f911ebc52de6b4a7a1.1564161140.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ramalingam C <ramalingam.c-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linu>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Vincent Abriou <vincent.a>
List-Id: linux-tegra@vger.kernel.org

SGkhCgpEbmUgcGV0ZWssIDI2LiBqdWxpaiAyMDE5IG9iIDE5OjIzOjE0IENFU1QgamUgQW5kcnpl
aiBQaWV0cmFzaWV3aWN6IApuYXBpc2FsKGEpOgo+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJvdmlk
ZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWog
UGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CgpBY2tlZC1ieTogSmVybmVq
IFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgoKVGhhbmtzIQoKQmVzdCByZWdhcmRz
LApKZXJuZWoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
IGluZGV4Cj4gMjE4YTdiMjMwOGY3Li44M2I5NGI2NmU0NjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0yMjAwLDggKzIyMDAsMTAgQEAgc3Rh
dGljIGludCBkd19oZG1pX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UKPiAqYnJpZGdl
KQo+IAo+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgCiZkd19oZG1pX2Nv
bm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+IAo+IC0JZHJtX2Nvbm5lY3Rvcl9pbml0KGJyaWRnZS0+
ZGV2LCBjb25uZWN0b3IsIAomZHdfaGRtaV9jb25uZWN0b3JfZnVuY3MsCj4gLQkJCSAgIERSTV9N
T0RFX0NPTk5FQ1RPUl9IRE1JQSk7Cj4gKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoYnJp
ZGdlLT5kZXYsIGNvbm5lY3RvciwKPiArCQkJCSAgICAmZHdfaGRtaV9jb25uZWN0b3JfZnVuY3Ms
Cj4gKwkJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAo+ICsJCQkJICAgIGhkbWktPmRk
Yyk7Cj4gCj4gIAlkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2Rl
cik7CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
