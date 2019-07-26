From: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 22/24] drm/amdgpu: Provide ddc symlink in connector
 sysfs directory
Date: Fri, 26 Jul 2019 16:00:59 -0400
Message-ID: <CADnq5_PJj8_dtq0aJWECcRJ0_uC-XpG6Z6p9Gj3fV_fTLGwZBA@mail.gmail.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <7fee0fa0d0f77af6595d283d5f3ae5d551475821.1564161140.git.andrzej.p@collabora.com>
 <CADnq5_O1B59Q+68fJgtf_bn_=WQ9yrVPq-V5tL1VQ3+vzgf1Zw@mail.gmail.com>
 <038809c7-e664-e365-a778-03bc11299193@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <038809c7-e664-e365-a778-03bc11299193-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
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
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Allison Randal <allison-wcfNWazeolPR7s880joybQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Wentland, Harry" <Harry.Wentland-5C7GfCeVMHo@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Intel
List-Id: linux-tegra@vger.kernel.org

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMzo0MiBQTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEhpIEFsZXgsCj4KPgo+IFcgZG5pdSAy
Ni4wNy4yMDE5IG8gMjE6MjgsIEFsZXggRGV1Y2hlciBwaXN6ZToKPiA+IE9uIEZyaSwgSnVsIDI2
LCAyMDE5IGF0IDE6MjggUE0gQW5kcnplaiBQaWV0cmFzaWV3aWN6Cj4gPiA8YW5kcnplai5wQGNv
bGxhYm9yYS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRl
ZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
emVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+ID4KPiA+IE5vdGUg
dGhhdCB0aGlzIG9ubHkgY292ZXJzIHRoZSBsZWdhY3kgZGlzcGxheSBjb2RlLiAgVGhlIG5ldyBE
Qwo+ID4gZGlzcGxheSBjb2RlIGFsc28gbmVlZHMgdG8gYmUgY29udmVydGVkLiAgU2VlOgo+ID4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ID4gZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMK
Pgo+IEluIGFtZGdwdV9kbV9jb25uZWN0b3JfaW5pdCgpIHRoZSBkZGMgaXMgJmkyYy0+YmFzZSwg
aXMgaXQ/CgpZZXMuCgo+Cj4gQnV0IGl0IGlzIG5vdCBjbGVhciB0byBtZSBob3cgY2FuIEkgZmlu
ZCBkZGMgcG9pbnRlciBpbgo+IGRtX2RwX2FkZF9tc3RfY29ubmVjdG9yKCk/CgorIEhhcnJ5IGFu
ZCBOaWNrLgoKaG1tbSwgbm90IHN1cmUgYWJvdXQgTVNULiAgTWF5YmUganVzdCBza2lwIHRoZW0g
Zm9yIG5vdy4KCkFsZXgKCj4KPiBBbmRyemVqCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
