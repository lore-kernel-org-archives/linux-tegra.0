From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [Intel-gfx] [PATCH] drm/core: Remove drm_dev_unref() and it's uses
Date: Thu, 26 Apr 2018 15:52:42 +0200
Message-ID: <CAKMK7uEsL7y8QnPhKu8N+-v3XmdPppqD+Z2ywt-P2Kv91Xq6Bw@mail.gmail.com>
References: <20180426102819.6985-1-vthakkar1994@gmail.com>
 <20180426123615.GA12521@phenom.ffwll.local>
 <1556510.Xu6NnhyFGZ@avalon> <20180426131404.GP4813@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180426131404.GP4813-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "open list:VIRTIO CORE, NET..." <virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Xinliang Liu <z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCBBcHIgMjYsIDIwMTggYXQgMzoxNCBQTSwgQWxleGFuZHJlIEJlbGxvbmkKPGFsZXhh
bmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiBIaSwKPgo+IE9uIDI2LzA0LzIwMTgg
MTU6NDU6NDQrMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPj4gSGkgRGFuaWVsLAo+Pgo+
PiBPbiBUaHVyc2RheSwgMjYgQXByaWwgMjAxOCAxNTozNjoxNSBFRVNUIERhbmllbCBWZXR0ZXIg
d3JvdGU6Cj4+ID4gT24gVGh1LCBBcHIgMjYsIDIwMTggYXQgMDM6NTg6MTlQTSArMDUzMCwgVmFp
c2hhbGkgVGhha2thciB3cm90ZToKPj4gPiA+IEl0J3MgYmVlbiBhIHdoaWxlIHNpbmNlIHdlIGlu
dHJvZHVjZWQgZHJtX2RldntnZXQvcHV0fSBmdW5jdGlvbnMKPj4gPiA+IHRvIHJlcGxhY2UgcmVm
ZXJlbmNlL3VucmVmZXJlbmNlIGluIGRybSBzdWJzeXN0ZW0gZm9yIHRoZQo+PiA+ID4gY29uc2lz
dGVuY3kgcHVycG9zZS4gU28sIHdpdGggdGhpcyBwYXRjaCwgbGV0J3MganVzdCByZXBsYWNlCj4+
ID4gPiBhbGwgY3VycmVudCB1c2UgY2FzZXMgb2YgZHJtX2Rldl91bnJlZigpIHdpdGggZHJtX2Rl
dl9wdXQgYW5kIHJlbW92ZQo+PiA+ID4gdGhlIGZ1bmN0aW9uIGl0c2VsZi4KPj4gPiA+Cj4+ID4g
PiBDb2NjaW5lbGxlIHdhcyB1c2VkIGZvciBtYXNzLXBhdGNoaW5nLgo+PiA+ID4KPj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFZhaXNoYWxpIFRoYWtrYXIgPHZ0aGFra2FyMTk5NEBnbWFpbC5jb20+Cj4+
ID4KPj4gPiBUaGFua3MgZm9yIGRvaW5nIHRoaXMuIFVuZm9ydHVuYXRlbHkgZHJtIG1vdmVzIHBy
ZXR0eSBmYXN0LCBzbyBhbHJlYWR5IGEKPj4gPiBjb25mbGljdCB3aGVuIEkgdHJpZWQgdG8gYXBw
bHkgdGhpcy4gU29tZSBkcml2ZXJzIGFyZSBhbHNvIGluIHRoZWlyIG93bgo+PiA+IHRyZWVzLCBz
byB0aGlzIG1pZ2h0IGxlYWQgdG8gbW9yZSBmdW4gOi0vCj4+ID4KPj4gPiBDYW4geW91IHBscyBz
cGxpdCBpdCB1cCBwZXItZHJpdmVyIChqdXN0IHRoZSBkaXJlY3RvcmllcyB1bmRlcgo+PiA+IGRy
aXZlcnMvZ3B1L2RybS8gaXMgZW5vdWdoKT8gRmluYWwgcGF0Y2ggdG8gcmVtb3ZlIHRoZSBmdW5j
dGlvbiBtaWdodCB0aGVuCj4+ID4gZ2V0IHN0YWxsZWQgYSBiaXQgb2ZjLgo+Pgo+PiBJIHJlcXVl
c3RlZCBhIHNpbmdsZSBwYXRjaCBpbnN0ZWFkIG9mIHNwbGl0dGluZyBpdCBwZXIgZHJpdmVyLCB5
b3UgbWlnaHQgd2FudAo+PiB0byBibGFtZSBtZSBmb3IgdGhhdC4KPj4KPgo+IERvZXNuJ3Qgc3Bs
aXR0aW5nIHRoZSBjaGFuZ2UgcGVyIGRyaXZlciBicmVhayBiaXNlY3RhYmlsaXR5IHVubGVzcyB0
aGVyZQo+IGlzIGEgZ3VhcmFudGVlIHRoYXQgdGhlIGNoYW5nZSBpbiBpbmNsdWRlL2RybS9kcm1f
ZHJ2LmggaXMgYXBwbGllZCBhZnRlcgo+IGFsbCB0aGUgZHJpdmVyIHRyZWVzIGhhdmUgYmVlbiBt
ZXJnZWQ/CgpUaGF0J3Mgd2h5IEkgc2FpZCB0aGUgZmluYWwgcGF0Y2ggd2lsbCBsaWtlbHkgdGFr
ZSBhIGJpdCBsb25nZXIgdG8gZ2V0Cm1lcmdlZCwgc2luY2Ugd2UgaGF2ZSB0byB3YWl0IHVudGls
IGFsbCB0aGUgdHJlZXMgY29udmVyZ2UgYWdhaW4uIEJ1dApzaW5jZSBJIGhhdmUgY29uZmxpY3Rz
IGFscmVhZHkgbG9va3MgbGlrZSB3ZSBjYW4ndCB0YWtlIHRoZSBzaG9ydGN1dAo6LSgKLURhbmll
bAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
KzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
