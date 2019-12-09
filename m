From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/25] drm/panel infrastructure + backlight update
Date: Mon, 9 Dec 2019 23:04:59 +0100
Message-ID: <20191209220459.GA11015@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>, Jitao Shi <jitao.shi@mediatek.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
List-Id: linux-tegra@vger.kernel.org

T24gU2F0LCBEZWMgMDcsIDIwMTkgYXQgMDM6MDM6MjhQTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IFRoaXMgcGF0Y2hzZXQgaW5jbHVkZSBhIGNvdXBsZSBvZiBkaWZmZXJlbnQKPiB0aGlu
Z3MgLSBhbGwgcmVsYXRlZCB0byBwYW5lbHMuCj4gCj4gLSBUaGUgY2FsbGJhY2tzIGFyZSBvcHRp
b25hbCAtIHNvIGRyb3AgZXJyb3IgaWYKPiAgIGNhbGxiYWNrIGlzIG5vdCBwcmVzZW50Lgo+ICAK
PiAtIEFkZCBzdXBwb3J0IGZvciBiYWNrbGlnaHQgaW4gZHJtX3BhbmVsLgo+ICAgVGhpcyBhbGxv
d3MgdXMgdG8gbWFrZSBtdWNoIHNpbXBsZXIgYmFja2xpZ2h0Cj4gICBzdXBwb3J0IHRvIG1vc3Qg
cGFuZWxzLgo+ICAgVGhlIHBhdGNoc2V0IGluY2x1ZGUgY29udmVyc2lvbiBvZiBtb3N0IG9mIHRo
ZQo+ICAgdHJpdmlhbCBjYXNlcy4KPiAKPiAtIERyb3AgZHJtX2Nvbm5lY3RvciBmcm9tIGRybV9w
YW5lbC4KPiAgIFRoaXMgY2hhbmdlIHJlcXVpcmVkIG1hbnkgY2hhbmdlcyB0byBtb3N0Cj4gICBw
YW5lbHMgYW5kIG1hbnkgYnJpZGdlcyBhbmQgZGlzcGxheSBkcml2ZXJzLgo+ICAgVGhpcyBpcyBi
eSBmYXIgdGhlIG1vc3QgaW52YXNpdmUgY2hhbmdlIGluIHRoaXMgcGF0Y2hzZXQuCj4gCj4gV2l0
aCB0aGlzIHBhdGNoc2V0IGRybV9wYW5lbF8oYXR0YWNofGRldGFjaCkgYXJlIG5vcCdzCj4gYnV0
IHRoZXkgYXJlIGtlcHQgZm9yIG5vdy4KPiAKPiBBIGZldyBvZiB0aGVzZSBwYXRjaGVzIGhhcyBi
ZWVuIHNlbnQgb3V0IGJlZm9yZSAtIGJ1dCB2ZXJzaW9uaW5nCj4gc3RhcnRlZCBhZ2FpbiBmcm9t
IHYxIC0gYXMgdGhlIG1vc3QgcGF0Y2hlcyBhcmUgbmV3Lgo+IAo+IEkgaGF2ZSB0ZXN0ZWQgdGhl
IHBhbmVsLXNpbXBsZSBjaGFuZ2VzLCBhbmQgdGh1cyBzb21lCj4gb2YgdGhlIGluZnJhc3RydWN0
dXJlIGNoYW5nZXMuCj4gVGhlIHRlc3Rpbmcgd2FzIGRvbmUgb24gYW4gZWFybGllciBpdGVyYXRp
b24gLSBhbmQgSSBlbmRlZAo+IHVwIHN1Ym1pdHRpbmcgdGhpcyBhcyBMYXVyZW50IGFuZCBvdGhl
cnMgc3RhcnRlZCB0byBkZXBlbmQgb24gaXQuCj4gCj4gdjI6Cj4gICBUaGlzIGlzIG1vc3RseSBh
ZGRyZXNzaW5nIGNvbW1lbnRzIGZyb20gTGF1cmVudC4KPiAgIC0gZHJvcCBnZXRfdGltaW5ncyBy
ZW1vdmFsLCB3ZSBzaG91bGQgc3RhcnQgdXNpbmcgaXQKPiAgIC0gZG8gbm90IGZhaWwgaW4gZHJt
X3BhbmVsX29mX2JhY2tsaWdodCgpIGlmIERUIGlzIG5vdCBlbmFibGVkCj4gICAtIHVwZGF0ZWQg
Y2hhbmdlbG9ncyBhbmQgY29kZSBjb21tZW50cyBpbiBtYW55IHBsYWNlcyAodGhhbmtzIExhdXJl
bnQhKQo+ICAgLSBnZXRfbW9kZXMgaXMgYSBtYW5kYXRvcnkgY2FsbGJhY2sgLSByZXR1cm4gLUVP
UE5PVFNVUFAgaWYgbm90IHNwZWNpZmllZAo+ICAgLSBsb2cgaWYgYmFja2xpZ2h0IHVwZGF0ZSBm
YWlscwo+ICAgLSBhZGRlZCBhLWIvci1icwo+ICAgICBvIHRoYW5rcyB0byBMYXVyZW50IGFuZCBM
aW51cyBmb3IgdGhlIHByb21wdCByZXZpZXdzIQo+IAo+IFdoZW4gImRybS9wYW5lbDogYWRkIGJh
Y2tsaWdodCBzdXBwb3J0IiBpcyByZXZpZXdlZCBJIHBsYW4gdG8KPiBhcHBseSB0aGUgZnVsbCBz
ZXJpZXMgdG8gZHJtLW1pc2MtbmV4dC4KCkZpeGVkIHRoZSBsYXN0IGJpdHMgcG9pbnRlZCBvdXQg
YnkgTGF1cmVudCBhbmQgcHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgoJU2FtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
