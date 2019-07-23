From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in
 connector sysfs directory
Date: Tue, 23 Jul 2019 11:05:32 +0200
Message-ID: <20190723090532.GA787@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Alexios Zavras <alexios.zavras@>
List-Id: linux-tegra@vger.kernel.org

SGkgQW5kcnplagoKT24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDE6MjY6NDFQTSArMDIwMCwgQW5k
cnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJvdmlkZWQg
YnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGll
dHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNk
Y190ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCj4gaW5k
ZXggNjJkMDE0YzIwOTg4Li5jMzczZWRiOTU2NjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2Rj
L3RpbGNkY190ZnA0MTAuYwo+IEBAIC0yMTksNiArMjE5LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1f
Y29ubmVjdG9yICp0ZnA0MTBfY29ubmVjdG9yX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+ICAJdGZwNDEwX2Nvbm5lY3Rvci0+bW9kID0gbW9kOwo+ICAKPiAgCWNvbm5lY3RvciA9ICZ0
ZnA0MTBfY29ubmVjdG9yLT5iYXNlOwo+ICsJY29ubmVjdG9yLT5kZGMgPSBtb2QtPmkyYzsKPiAg
Cj4gIAlkcm1fY29ubmVjdG9yX2luaXQoZGV2LCBjb25uZWN0b3IsICZ0ZnA0MTBfY29ubmVjdG9y
X2Z1bmNzLAo+ICAJCQlEUk1fTU9ERV9DT05ORUNUT1JfRFZJRCk7CgpXaGVuIHJlYWRpbmcgdGhp
cyBjb2RlLCBpdCBsb29rcyBzdHJhbmdlIHRoYXQgd2Ugc2V0IGNvbm5lY3Rvci0+ZGRjCipiZWZv
cmUqIHRoZSBjYWxsIHRvIGluaXQgdGhlIGNvbm5lY3Rvci4KT25lIGNvdWxkIHJpc2sgdGhhdCBk
cm1fY29ubmVjdG9yX2luaXQoKSB1c2VkIG1lbXNldCguLikgdG8gY2xlYXIgYWxsCmZpZWxkcyBv
ciBzbywgYW5kIGl0IHdvdWxkIGJyZWFrIHRoaXMgb3JkZXIuCkFzIGl0IGlzIHRvZGF5IHRoZSBj
b2RlIHdvcmtzIGFzIEkgcmVhZCBpdC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZnJlZWRyZW5v
