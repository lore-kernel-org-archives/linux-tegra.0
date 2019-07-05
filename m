From: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 21/22] drm/amdgpu: Provide ddc symlink in
 connector sysfs directory
Date: Fri, 5 Jul 2019 16:17:28 -0400
Message-ID: <CADnq5_MT58vOop65dOSK95R2khChAAzkWfsO9-RYYvJ37XbPug@mail.gmail.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <5e355b8bec8fb3907566a741db8cc3e356246a32.1561735433.git.andrzej.p@collabora.com>
 <CADnq5_MrVoScVFgj3TP2Z+Ky8_32k=Cou5jebuMT5gE1+GZ0cA@mail.gmail.com>
 <fc26ac17-dc18-f995-53cf-42b50754c916@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <fc26ac17-dc18-f995-53cf-42b50754c916-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
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
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk@kernel>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA5OjE3IEFNIEFuZHJ6ZWogUGlldHJhc2lld2ljego8YW5k
cnplai5wQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gVyBkbml1IDAyLjA3LjIwMTkgbyAyMjo1
NCwgQWxleCBEZXVjaGVyIHBpc3plOgo+ID4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTI6MzEg
UE0gQW5kcnplaiBQaWV0cmFzaWV3aWN6Cj4gPiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+IHdy
b3RlOgo+ID4+Cj4gPj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJp
YyBjb25uZWN0b3IuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdp
Y3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+ID4+IC0tLQo+ID4+ICAgLi4uL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jICAgIHwgNzAgKysrKysrKysrKysrKystLS0t
LQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jb25uZWN0b3JzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVj
dG9ycy5jCj4gPj4gaW5kZXggNzNiMmVkZTc3M2QzLi41ZjhhN2UzODE4YjkgMTAwNjQ0Cj4gPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nvbm5lY3RvcnMuYwo+ID4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMKPiA+
PiBAQCAtMTU3MywxMSArMTU3MywxNSBAQCBhbWRncHVfY29ubmVjdG9yX2FkZChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBmYWls
ZWQ7Cj4gPj4gICAgICAgICAgICAgICAgICBhbWRncHVfY29ubmVjdG9yLT5jb25fcHJpdiA9IGFt
ZGdwdV9kaWdfY29ubmVjdG9yOwo+ID4+ICAgICAgICAgICAgICAgICAgaWYgKGkyY19idXMtPnZh
bGlkKSB7Cj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2Nvbm5lY3Rvci0+ZGRj
X2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOwo+ID4+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGlmIChhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzKQo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfY29ubmVjdG9yICphY24gPSBhbWRncHVfY29u
bmVjdG9yOwo+ID4+ICsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBhY24tPmRkY19idXMg
PSBhbWRncHVfaTJjX2xvb2t1cChhZGV2LCBpMmNfYnVzKTsKPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoYWNuLT5kZGNfYnVzKSB7Cj4gPgo+ID4gVGhpcyBodW5rIHNlZW1zIHBvaW50
bGVzcyB1bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLiAgQ2FuIHlvdSBkcm9wCj4gPiB0aGlz
IGh1bms/ICBTYW1lIGNvbW1lbnQgb24gZWFjaCBpbnN0YW5jZSBvZiB0aGlzIGJlbG93LiAgVGhp
cyBhbHNvCj4gPiBvbmx5IGNvdmVycyB0aGUgbGVnYWN5IG1vZGVzZXR0aW5nIGNvZGUgd2hpY2gg
aXMgbm90IHVzZWQgYnkgZGVmYXVsdAo+ID4gb24gbW9zdCBjaGlwcy4gIFRoZSBEQyBjb2RlIGlu
IGFtZC9kaXNwbGF5LyBpcyBwcm9iYWJseSBtb3JlIHJlbGV2YW50Lgo+ID4KPgo+IElmIEkgZG9u
J3QgZG8gdGhhdCBjaGVja3BhdGNoIHJlcG9ydHMgdGhhdCBsaW5lcyBJIGNyZWF0ZWQgZXhjZWVk
IDgwIGNoYXJhY3RlcnMuCgpEb24ndCB3b3JyeSBhYm91dCB0aGF0LgoKQWxleApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBs
aXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
