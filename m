From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Date: Thu, 24 Jan 2019 13:39:41 +0100
Message-ID: <20190124123941.GW3271@phenom.ffwll.local>
References: <20190116181018.GA27364@ravnborg.org>
 <20190117210334.13234-1-daniel.vetter@ffwll.ch>
 <20190123170015.GA23138@ravnborg.org>
 <20190124094646.GR3271@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190124094646.GR3271-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksandr Andrushchenko <oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rodrigo Vivi <rod>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgMTA6NDY6NDdBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEphbiAyMywgMjAxOSBhdCAwNjowMDoxNVBNICswMTAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gPiBIaSBEYW5pZWwuCj4gPiAKPiA+IE9uIFRodSwgSmFuIDE3LCAyMDE5
IGF0IDEwOjAzOjM0UE0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IEhhdmluZyB0
aGUgcHJvYmUgaGVscGVyIHN0dWZmICh3aGljaCBwcmV0dHkgbXVjaCBldmVyeW9uZSBuZWVkcykg
aW4KPiA+ID4gdGhlIGRybV9jcnRjX2hlbHBlci5oIGZpbGUgKHdoaWNoIGF0b21pYyBkcml2ZXJz
IHNob3VsZCBuZXZlciBuZWVkKSBpcwo+ID4gPiBjb25mdXNpbmcuIFNwbGl0IHRoZW0gb3V0Lgo+
ID4gPiAKPiA+ID4gVG8gbWFrZSBzdXJlIEkgYWN0dWFsbHkgYWNoaWV2ZWQgdGhlIGdvYWwgaGVy
ZSBJIHdlbnQgdGhyb3VnaCBhbGwKPiA+ID4gZHJpdmVycy4gQW5kIGluZGVlZCwgYWxsIGF0b21p
YyBkcml2ZXJzIGFyZSBub3cgZnJlZSBvZgo+ID4gPiBkcm1fY3J0Y19oZWxwZXIuaCBpbmNsdWRl
cy4KPiA+IAo+ID4gSG93IGFyZSB0aGUgcGxhbnMgdG8gZ2V0IHRoaXMgcGF0Y2hzZXQgbWVyZ2Vk
Pwo+ID4gVGhlcmUgd2VyZSBkZXBlbmRlbmNpZXMgb24gb25naW5nIGRybVAuaCByZW1vdmFsIGlu
IGk5MTUgSUlSQz8KPiA+IEkgZ3Vlc3MgbXkgIk1pbmltaXplIGRybVAuaCBkZXBlbmRlbmNpZXMi
IHBhdGNoLXNldCBhbHNvIGhhdmUgYSByb2xlIGluIHRoaXMuCj4gCj4gV29ya2luZyBvbiBpdCwg
YSBwdWxsIHJlcXVlc3QgZ290IGxvc3QuIEkgb3JpZ2luYWxseSB3YW50ZWQgdG8gZ2V0IHRoaXMK
PiBhbGwgcmVzb2x2ZWQgdGhpcyB3ZWVrLCBwcm9iYWJseSBnb2luZyB0byBiZSBuZXh0IHdlZWsg
bm93IDotKAoKV2UncmUgbHVja3ksIGFsbCBzb3J0ZWQgbm93ICYgcGF0Y2ggbWVyZ2VkLiBJJ20g
YWxzbyBtZXJnaW5nIHlvdXIgc2VyaWVzLApjb3JyZWN0bHkgaW50ZXJsZWF2ZWQuCi1EYW5pZWwK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Zy
ZWVkcmVubwo=
