From: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] gpu: Consistently use octal not symbolic permissions
Date: Fri, 25 May 2018 09:41:22 +0300
Message-ID: <87a7so44q5.fsf@intel.com>
References: <9b0f5f5cf6bccc003beef82f0972be655613075d.1527193246.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <9b0f5f5cf6bccc003beef82f0972be655613075d.1527193246.git.joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Zhenyu Wang <zhenyuw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Zhi Wang <zhi.a.wang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Roger He <Hongbo.He-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCAyNCBNYXkgMjAxOCwgSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGU6
Cj4gVGhlcmUgaXMgY3VycmVudGx5IGEgbWl4dHVyZSBvZiBvY3RhbCBhbmQgc3ltYm9saWMgcGVy
bWlzc2lvbnMgdXNlcwo+IGluIGZpbGVzIGluIGRyaXZlcnMvZ3B1L2RybSBhbmQgb25lIGZpbGUg
aW4gZHJpdmVycy9ncHUuCj4KPiBUaGVyZSBhcmUgfjI3MCBleGlzdGluZyBvY3RhbCB1c2VzIGFu
ZCB+MTE1IFNfPEZPTz4gdXNlcy4KPgo+IENvbnZlcnQgYWxsIHRoZSBTXzxGT08+IHN5bWJvbGlj
IHBlcm1pc3Npb25zIHRvIHRoZWlyIG9jdGFsIGVxdWl2YWxlbnRzCj4gYXMgdXNpbmcgb2N0YWwg
YW5kIG5vdCBzeW1ib2xpYyBwZXJtaXNzaW9ucyBpcyBwcmVmZXJyZWQgYnkgbWFueSBhcyBtb3Jl
Cj4gcmVhZGFibGUuCj4KPiBzZWU6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE2LzgvMi8xOTQ1
Cj4KPiBEb25lIHdpdGggYXV0b21hdGVkIGNvbnZlcnNpb24gdmlhOgo+ICQgLi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwgLWYgLS10eXBlcz1TWU1CT0xJQ19QRVJNUyAtLWZpeC1pbnBsYWNlIDxmaWxl
cy4uLj4KPgo+IE1pc2NlbGxhbmVhOgo+Cj4gbyBXcmFwcGVkIG1vZGlmaWVkIG11bHRpLWxpbmUg
Y2FsbHMgdG8gYSBzaW5nbGUgbGluZSB3aGVyZSBhcHByb3ByaWF0ZQo+IG8gUmVhbGlnbiBtb2Rp
ZmllZCBtdWx0aS1saW5lIGNhbGxzIHRvIG9wZW4gcGFyZW50aGVzaXMKPiBvIGRyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E1eHhfZGVidWdmcy5jIGhhcyBhIHdvcmxkLXdyaXRlYWJsZQo+ICAg
ZGVidWcgcGVybWlzc2lvbiBmb3IgInJlc2V0IiAtIHBlcmhhcHMgdGhhdCBzaG91bGQgYmUgbW9k
aWZpZWQKPgo+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgICAgICAg
ICAgICAgfCA5OCArKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yaW5nLmMgICAgICAgICAgIHwgIDMgKy0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgICAgICAgICAgfCAgOSArLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYXJtYWRhL2FybWFkYV9kZWJ1Z2ZzLmMgICAgICAgICAgICB8ICA0ICstCj4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jICAgICAgICAgICAgICAgICAgfCAgNCAr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9maXJtd2FyZS5jICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMgICAgICAg
ICAgICAgICAgfCAgOCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BlcmYuYyAgICAg
ICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc3lzZnMu
YyAgICAgICAgICAgICAgICAgIHwgMjIgKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfcGlwZV9jcmMuYyAgICAgICAgICAgICAgfCAgMiArLQoKUGxlYXNlIHNlbmQgYXQgbGVhc3Qg
aTkxNSBjaGFuZ2VzIHNlcGFyYXRlbHkuIFRoZXJlJ3MgemVybyByZWFzb24gdG8KbWFrZSBvdXIg
bGl2ZXMgaGFyZGVyIGZvciB0aGlzIGNoYW5nZS4KCkJSLApKYW5pLgoKLS0gCkphbmkgTmlrdWxh
LCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4Cg==
