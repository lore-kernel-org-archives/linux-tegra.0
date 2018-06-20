From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH v2 1/2] drm: Add generic colorkey properties
Date: Wed, 20 Jun 2018 12:10:07 +0200
Message-ID: <CAKMK7uGMKs2GgP+nrxDV4LbbmrqcHApLsz9pTc=mQojHtSVaUQ@mail.gmail.com>
References: <20180526155623.12610-1-digetx@gmail.com>
 <20180526155623.12610-2-digetx@gmail.com>
 <20180528131501.GK23723@intel.com>
 <efba1801-5b00-1fa1-45df-a5d3a2e3d63a@gmail.com>
 <20180529071103.GL23723@intel.com>
 <20180619174011.GJ17671@n2100.armlinux.org.uk>
 <20180620091750.GD7186@phenom.ffwll.local>
 <20180620093321.GL17671@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180620093321.GL17671@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Neil Armstrong <narmstrong@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Alexandru Gheorghe <Alexandru_Gheorghe@mentor.com>, "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gV2VkLCBKdW4gMjAsIDIwMTggYXQgMTE6MzMgQU0sIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51
eAo8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBPbiBXZWQsIEp1biAyMCwgMjAxOCBh
dCAxMToxNzo1MEFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiBZZXMgLW1vZGVzZXR0
aW5nIChvciB3aGljaGV2ZXIgb3RoZXIgZHJpdmVyKSB3b3VsZCBuZWVkIHRvIHNldCB1cCB0aGUK
Pj4gcHJvcGVydGllcyBjb3JyZWN0bHkgZm9yIFh2aWRlbyBjb2xvciBrZXlpbmcuIFNpbmNlIGRl
ZmF1bHQgYXNzdW1wdGlvbiBmb3IKPj4gYWxsIG90aGVyIChnZW5lcmljKSBjb21wb3NpdG9ycyBp
cyB0aGF0IHBsYW5lcyB3b24ndCBkbyBhbnkgY29sb3Iga2V5aW5nCj4+IGluIHRoZSBib290LXVw
IHN0YXRlLgo+Cj4gVGhhbmtzLCBpcyB0aGF0IGRvY3VtZW50ZWQgYW55d2hlcmU/CgpXaXRoIHRo
ZSBzdGFuZGFyZGl6YXRpb24gb2YgcHJvcGVydGllcyBJJ20gYWxzbyB0cnlpbmcgdG8gZ2V0IHRo
ZXNlCmV4cGVjdGF0aW9ucyBiZXR0ZXIgZG9jdW1lbnRlZCwgZS5nLgoKaHR0cHM6Ly9kcmkuZnJl
ZWRlc2t0b3Aub3JnL2RvY3MvZHJtL2dwdS9kcm0ta21zLmh0bWwjcGxhbmUtY29tcG9zaXRpb24t
cHJvcGVydGllcwoKQnV0IEkgdGhpbmsgd2UncmUgbm90IGRvaW5nIGEgZ29vZCBqb2IgeWV0IGRv
Y3VtZW50aW5nIGRlZmF1bHQKZXhwZWN0YXRpb25zLiBCdXQgdGhlIGFib3ZlIHdvdWxkIGJlIGEg
Z29vZCBwbGFjZSB0byBnZXQgdGhhdCBmaXhlZCAtCnRoaXMgcGF0Y2ggaGVyZSBzaG91bGQgZG8g
dGhhdCwgYXQgbGVhc3QgZm9yIGNvbG9yIGtleWluZy4KLURhbmllbAoKPgo+IC0tCj4gUk1LJ3Mg
UGF0Y2ggc3lzdGVtOiBodHRwOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hl
cy8KPiBGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0
IDguOE1icHMgZG93biA2MzBrYnBzIHVwCj4gQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDgu
MjFNYnBzIGRvd24gNTEwa2JwcyB1cAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
