From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
Date: Tue, 23 Jul 2019 17:19:39 +0200
Message-ID: <20190723151939.GA13718@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
 <20190723090532.GA787@ravnborg.org>
 <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3ad60be5-49cf-4017-4b74-53a2d6272deb-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
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
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Alexios
List-Id: linux-tegra@vger.kernel.org

SGkgQW5kcmVqLgoKT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6NDQ6NTBQTSArMDIwMCwgQW5k
cnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IEhpIFNhbSwKPiAKPiBXIGRuaXUgMjMuMDcuMjAx
OSBvwqAxMTowNSwgU2FtIFJhdm5ib3JnIHBpc3plOgo+ID4gSGkgQW5kcnplago+ID4gCj4gPiBP
biBUaHUsIEp1bCAxMSwgMjAxOSBhdCAwMToyNjo0MVBNICswMjAwLCBBbmRyemVqIFBpZXRyYXNp
ZXdpY3ogd3JvdGU6Cj4gPiA+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJvdmlkZWQgYnkgdGhlIGdl
bmVyaWMgY29ubmVjdG9yLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0
cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgZHJp
dmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMgfCAxICsKPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMv
dGlsY2RjX3RmcDQxMC5jCj4gPiA+IGluZGV4IDYyZDAxNGMyMDk4OC4uYzM3M2VkYjk1NjY2IDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYwo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYwo+ID4gPiBA
QCAtMjE5LDYgKzIxOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqdGZwNDEwX2Nv
bm5lY3Rvcl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ID4gICAJdGZwNDEwX2Nv
bm5lY3Rvci0+bW9kID0gbW9kOwo+ID4gPiAgIAljb25uZWN0b3IgPSAmdGZwNDEwX2Nvbm5lY3Rv
ci0+YmFzZTsKPiA+ID4gKwljb25uZWN0b3ItPmRkYyA9IG1vZC0+aTJjOwo+ID4gPiAgIAlkcm1f
Y29ubmVjdG9yX2luaXQoZGV2LCBjb25uZWN0b3IsICZ0ZnA0MTBfY29ubmVjdG9yX2Z1bmNzLAo+
ID4gPiAgIAkJCURSTV9NT0RFX0NPTk5FQ1RPUl9EVklEKTsKPiA+IAo+ID4gV2hlbiByZWFkaW5n
IHRoaXMgY29kZSwgaXQgbG9va3Mgc3RyYW5nZSB0aGF0IHdlIHNldCBjb25uZWN0b3ItPmRkYwo+
ID4gKmJlZm9yZSogdGhlIGNhbGwgdG8gaW5pdCB0aGUgY29ubmVjdG9yLgo+ID4gT25lIGNvdWxk
IHJpc2sgdGhhdCBkcm1fY29ubmVjdG9yX2luaXQoKSB1c2VkIG1lbXNldCguLikgdG8gY2xlYXIg
YWxsCj4gPiBmaWVsZHMgb3Igc28sIGFuZCBpdCB3b3VsZCBicmVhayB0aGlzIG9yZGVyLgo+IAo+
IEkgdmVyaWZpZWQgdGhlIGNvZGUgb2YgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgYW5kIGNhbm5vdCBm
aW5kIGFueSBtZW1zZXQoKQo+IGludm9jYXRpb25zIHRoZXJlLiBXaGF0IGlzIHlvdXIgYWN0dWFs
IGNvbmNlcm4/Ck15IGNvbmNlcm4gaXMgdGhhdCBkcm1fY29ubmVjdG9yX2luaXQoKSBtYXliZSBz
b21ldGltZSBpbiB0aGUgZnV0dXJlCndpbGwgaW5pdCBhbGwgZmlsZWRzIGluIGRybV9jb25uZWN0
b3IsIHNvIHdlIGxvb3NlIGFueSBhc3NpbmdtZW50cwpkb25lIHRvIGRybV9jb25uZWN0b3IgZnJv
bSAqYmVmb3JlKiB3ZSBjYWxsZWQgdGhlIGluaXQgZnVuY3Rpb24uCgpNb3ZpbmcgdGhlIGFzc2ln
bm1lbnQgdG8gYWZ0ZXIgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgd291bGQgbm90CmxldCB1cyBkZXBl
bmQgb24gdGhlIGFjdHVhbCBpbXBsbWVudGF0aW9uIG9mIGRybV9jb25uZWN0b3JfaW5pdCgpLgoK
CVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
