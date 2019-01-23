From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Date: Wed, 23 Jan 2019 18:00:15 +0100
Message-ID: <20190123170015.GA23138@ravnborg.org>
References: <20190116181018.GA27364@ravnborg.org>
 <20190117210334.13234-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190117210334.13234-1-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksandr Andrushchenko <oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-tegra@vger.k
List-Id: linux-tegra@vger.kernel.org

SGkgRGFuaWVsLgoKT24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMTA6MDM6MzRQTSArMDEwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBIYXZpbmcgdGhlIHByb2JlIGhlbHBlciBzdHVmZiAod2hpY2gg
cHJldHR5IG11Y2ggZXZlcnlvbmUgbmVlZHMpIGluCj4gdGhlIGRybV9jcnRjX2hlbHBlci5oIGZp
bGUgKHdoaWNoIGF0b21pYyBkcml2ZXJzIHNob3VsZCBuZXZlciBuZWVkKSBpcwo+IGNvbmZ1c2lu
Zy4gU3BsaXQgdGhlbSBvdXQuCj4gCj4gVG8gbWFrZSBzdXJlIEkgYWN0dWFsbHkgYWNoaWV2ZWQg
dGhlIGdvYWwgaGVyZSBJIHdlbnQgdGhyb3VnaCBhbGwKPiBkcml2ZXJzLiBBbmQgaW5kZWVkLCBh
bGwgYXRvbWljIGRyaXZlcnMgYXJlIG5vdyBmcmVlIG9mCj4gZHJtX2NydGNfaGVscGVyLmggaW5j
bHVkZXMuCgpIb3cgYXJlIHRoZSBwbGFucyB0byBnZXQgdGhpcyBwYXRjaHNldCBtZXJnZWQ/ClRo
ZXJlIHdlcmUgZGVwZW5kZW5jaWVzIG9uIG9uZ2luZyBkcm1QLmggcmVtb3ZhbCBpbiBpOTE1IElJ
UkM/CkkgZ3Vlc3MgbXkgIk1pbmltaXplIGRybVAuaCBkZXBlbmRlbmNpZXMiIHBhdGNoLXNldCBh
bHNvIGhhdmUgYSByb2xlIGluIHRoaXMuCgpUaGlzIGRvZXMgbm90IGhvbGQgdXAgYW55IHdvcmsg
b2YgbWluZSwgbWFpbmx5IHdhbnRlZCB0byBtYWtlCnN1cmUgdGhpcyB3YXMgbm90IGxvc3QgYmV0
d2VlbiBhbGwgdGhlIG90aGVyIHBhdGNoZXMuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeAo=
