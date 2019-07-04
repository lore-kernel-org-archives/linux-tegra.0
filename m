From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 21/22] drm/amdgpu: Provide ddc symlink in
 connector sysfs directory
Date: Thu, 4 Jul 2019 15:17:01 +0200
Message-ID: <fc26ac17-dc18-f995-53cf-42b50754c916@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <5e355b8bec8fb3907566a741db8cc3e356246a32.1561735433.git.andrzej.p@collabora.com>
 <CADnq5_MrVoScVFgj3TP2Z+Ky8_32k=Cou5jebuMT5gE1+GZ0cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CADnq5_MrVoScVFgj3TP2Z+Ky8_32k=Cou5jebuMT5gE1+GZ0cA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk@kernel>
List-Id: linux-tegra@vger.kernel.org

VyBkbml1IDAyLjA3LjIwMTkgb8KgMjI6NTQsIEFsZXggRGV1Y2hlciBwaXN6ZToKPiBPbiBGcmks
IEp1biAyOCwgMjAxOSBhdCAxMjozMSBQTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPiA8YW5kcnpl
ai5wQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBVc2UgdGhlIGRkYyBwb2ludGVyIHByb3Zp
ZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcnpl
aiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+ICAgLi4u
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jICAgIHwgNzAgKysrKysrKysr
KysrKystLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAxOSBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jb25uZWN0b3JzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29u
bmVjdG9ycy5jCj4+IGluZGV4IDczYjJlZGU3NzNkMy4uNWY4YTdlMzgxOGI5IDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMKPj4gQEAg
LTE1NzMsMTEgKzE1NzMsMTUgQEAgYW1kZ3B1X2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWxlZDsKPj4g
ICAgICAgICAgICAgICAgICBhbWRncHVfY29ubmVjdG9yLT5jb25fcHJpdiA9IGFtZGdwdV9kaWdf
Y29ubmVjdG9yOwo+PiAgICAgICAgICAgICAgICAgIGlmIChpMmNfYnVzLT52YWxpZCkgewo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzID0gYW1kZ3B1
X2kyY19sb29rdXAoYWRldiwgaTJjX2J1cyk7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGlm
IChhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgYW1kZ3B1X2Nvbm5lY3RvciAqYWNuID0gYW1kZ3B1X2Nvbm5lY3RvcjsKPj4gKwo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBhY24tPmRkY19idXMgPSBhbWRncHVfaTJjX2xvb2t1cChh
ZGV2LCBpMmNfYnVzKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGFjbi0+ZGRjX2J1
cykgewo+IAo+IFRoaXMgaHVuayBzZWVtcyBwb2ludGxlc3MgdW5sZXNzIEknbSBtaXNzaW5nIHNv
bWV0aGluZy4gIENhbiB5b3UgZHJvcAo+IHRoaXMgaHVuaz8gIFNhbWUgY29tbWVudCBvbiBlYWNo
IGluc3RhbmNlIG9mIHRoaXMgYmVsb3cuICBUaGlzIGFsc28KPiBvbmx5IGNvdmVycyB0aGUgbGVn
YWN5IG1vZGVzZXR0aW5nIGNvZGUgd2hpY2ggaXMgbm90IHVzZWQgYnkgZGVmYXVsdAo+IG9uIG1v
c3QgY2hpcHMuICBUaGUgREMgY29kZSBpbiBhbWQvZGlzcGxheS8gaXMgcHJvYmFibHkgbW9yZSBy
ZWxldmFudC4KPiAKCklmIEkgZG9uJ3QgZG8gdGhhdCBjaGVja3BhdGNoIHJlcG9ydHMgdGhhdCBs
aW5lcyBJIGNyZWF0ZWQgZXhjZWVkIDgwIGNoYXJhY3RlcnMuCgpBbmRyemVqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
