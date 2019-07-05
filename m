From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 00/22] Associate ddc adapters with
 connectors
Date: Fri, 5 Jul 2019 11:39:34 +0300
Message-ID: <20190705083934.GB4994@pendragon.ideasonboard.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <20190628161137.GH4779@pendragon.ideasonboard.com>
 <44f98134-bc8a-133a-b702-589f007b175e@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <44f98134-bc8a-133a-b702-589f007b175e-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
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
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>D
List-Id: linux-tegra@vger.kernel.org

SGkgQW5kcnplaiwKCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDEwOjM4OjI3QU0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBXIGRuaXUgMjguMDYuMjAxOSBvwqAxODoxMSwg
TGF1cmVudCBQaW5jaGFydCBwaXN6ZToKPiA+IEhpIEFuZHJ6ZWosCj4gPiAKPiA+IEp1c3QgRllJ
LCBJIGhhdmUgYSBwYXRjaCBzZXJpZXMgdGhhdCByZXdvcmtzIGhvdyBicmlkZ2VzIGFuZCBjb25u
ZWN0b3JzCj4gPiBhcmUgaGFuZGxlZCwgYW5kIGl0IHdpbGwgaGVhdmlseSBjb25mbGljdCB3aXRo
IHRoaXMuIFRoZSBwdXJwb3NlIG9mIHRoZQo+ID4gdHdvIHNlcmllcyBpc24ndCB0aGUgc2FtZSwg
c28gYm90aCBtYWtlIHNlbnNlLiBJIHdpbGwgcG9zdCB0aGUgcGF0Y2hlcwo+ID4gdGhpcyB3ZWVr
ZW5kLCBhbmQgd2lsbCB0aGVuIHJldmlldyB0aGlzIHNlcmllcyBpbiB0aGF0IGNvbnRleHQuCj4g
PiBIb3BlZnVsbHkgd2UnbGwgZ2V0IHRoZSBiZXN0IG9mIGJvdGggd29ybGRzIDotKQo+IAo+IEhp
IExhdXJlbnQsCj4gCj4gRGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIHJldmlldyBteSBwYXRjaCBz
ZXJpZXM/CgpOb3QgeWV0IEknbSBhZnJhaWQuIEkndmUgYmVlbiBmYWlybHkgYnVzeSB0aGlzIHdl
ZWssIGFuZCBjb3VwbGVkIHdpdGgKc29tZSBoZWFsdGggaXNzdWVzIChidXQgSSdtIGZlZWxpbmcg
YmV0dGVyIG5vdywgc28gbm90aGluZyB0byB3b3JyeQphYm91dCkgaXQgZGVsYXllZCBteSByZXZp
ZXdzLiBJJ2xsIGdldCB0byBpdCBhcyBzb29uIGFzIHBvc3NpYmxlLiBUaGFuawp5b3UgZm9yIHBp
bmdpbmcgbWUuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApG
cmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
