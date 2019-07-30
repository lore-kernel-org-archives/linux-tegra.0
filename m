From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 16/24] drm: sti: Provide ddc symlink in hdmi connector
 sysfs directory
Date: Tue, 30 Jul 2019 14:36:50 +0200
Message-ID: <CA+M3ks46eO_yE+Jd9SWPJ6eD+m1TZPCKuBcZsmpy6Ta9PZFfhw@mail.gmail.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <510765aff8ef99683aa2da48bd08004376b1980a.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <510765aff8ef99683aa2da48bd08004376b1980a.1564161140.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
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
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ramalingam C <ramalingam.c-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <rob>
List-Id: linux-tegra@vger.kernel.org

TGUgdmVuLiAyNiBqdWlsLiAyMDE5IMOgIDE5OjI3LCBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiBhIMOpY3JpdCA6Cj4KPiBVc2UgdGhlIGRkYyBwb2ludGVy
IHByb3ZpZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1i
eTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgfCA2ICsrKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X2hkbWkuYwo+IGluZGV4IGYwM2Q2MTdlZGM0Yy4uMzNkMDZlMGE5MTY4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
dGkvc3RpX2hkbWkuYwo+IEBAIC0xMjg0LDggKzEyODQsMTAgQEAgc3RhdGljIGludCBzdGlfaGRt
aV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpk
YXRhKQo+Cj4gICAgICAgICBkcm1fY29ubmVjdG9yLT5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BP
TExfSFBEOwo+Cj4gLSAgICAgICBkcm1fY29ubmVjdG9yX2luaXQoZHJtX2RldiwgZHJtX2Nvbm5l
Y3RvciwKPiAtICAgICAgICAgICAgICAgICAgICAgICAmc3RpX2hkbWlfY29ubmVjdG9yX2Z1bmNz
LCBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOwo+ICsgICAgICAgZHJtX2Nvbm5lY3Rvcl9pbml0
X3dpdGhfZGRjKGRybV9kZXYsIGRybV9jb25uZWN0b3IsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJnN0aV9oZG1pX2Nvbm5lY3Rvcl9mdW5jcywKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGRtaS0+ZGRjX2FkYXB0KTsKPiAgICAgICAg
IGRybV9jb25uZWN0b3JfaGVscGVyX2FkZChkcm1fY29ubmVjdG9yLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICZzdGlfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKPgo+IC0tCj4gMi4x
Ny4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
