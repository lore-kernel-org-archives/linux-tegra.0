From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
Date: Mon, 5 Aug 2019 13:54:50 +0200
Message-ID: <20190805115450.GB16513@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-6-sam@ravnborg.org>
 <8567eb4c916a0b1d134bd62112a11903@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <8567eb4c916a0b1d134bd62112a11903@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stefan Agner <stefan@agner.ch>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam.ravnborg@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.>
List-Id: linux-tegra@vger.kernel.org

SGkgU3RlZmFuLgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgpPbiBNb24sIEF1ZyAwNSwgMjAx
OSBhdCAxMToxNjoyNkFNICswMjAwLCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4gT24gMjAxOS0wOC0w
NCAyMjoxNiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gVXNlIGRybV9wYW5lbF9nZXRfbW9kZXMo
KSB0byBhY2Nlc3MgbW9kZXMuCj4gPiBUaGlzIGhhcyBhIG5pY2Ugc2lkZSBlZmZlY3QgdG8gc2lt
cGxpZnkgdGhlIGNvZGUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KPiA+IENjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiA+
IENjOiBBbGlzb24gV2FuZyA8YWxpc29uLndhbmdAbnhwLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jIHwgMTAgKy0tLS0tLS0tLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jCj4gPiBpbmRleCAy
NzlkODNlYWZmYzAuLmE5MmZkNmM3MGIwOSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZnNs
LWRjdS9mc2xfZGN1X2RybV9yZ2IuYwo+ID4gQEAgLTY1LDE3ICs2NSw5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcwo+ID4gZnNsX2RjdV9kcm1fY29ubmVjdG9yX2Z1
bmNzID0gewo+ID4gIHN0YXRpYyBpbnQgZnNsX2RjdV9kcm1fY29ubmVjdG9yX2dldF9tb2Rlcyhz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ID4gIHsKPiA+ICAJc3RydWN0IGZzbF9k
Y3VfZHJtX2Nvbm5lY3RvciAqZnNsX2Nvbm5lY3RvcjsKPiA+IC0JaW50ICgqZ2V0X21vZGVzKShz
dHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gPiAtCWludCBudW1fbW9kZXMgPSAwOwo+ID4gIAo+
ID4gIAlmc2xfY29ubmVjdG9yID0gdG9fZnNsX2RjdV9jb25uZWN0b3IoY29ubmVjdG9yKTsKPiA+
IC0JaWYgKGZzbF9jb25uZWN0b3ItPnBhbmVsICYmIGZzbF9jb25uZWN0b3ItPnBhbmVsLT5mdW5j
cyAmJgo+ID4gLQkgICAgZnNsX2Nvbm5lY3Rvci0+cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMpIHsK
PiA+IC0JCWdldF9tb2RlcyA9IGZzbF9jb25uZWN0b3ItPnBhbmVsLT5mdW5jcy0+Z2V0X21vZGVz
Owo+ID4gLQkJbnVtX21vZGVzID0gZ2V0X21vZGVzKGZzbF9jb25uZWN0b3ItPnBhbmVsKTsKPiA+
IC0JfQo+ID4gLQo+ID4gLQlyZXR1cm4gbnVtX21vZGVzOwo+ID4gKwlyZXR1cm4gZHJtX3BhbmVs
X2dldF9tb2Rlcyhmc2xfY29ubmVjdG9yLT5wYW5lbCk7Cj4gCj4gT2gsIHRoYXQgb2xkIGNvZGUg
bG9va3MgcmF0aGVyIG1lc3N5LiBUaGFua3MgZm9yIHRoZSBzaW1wbGlmaWNhdGlvbiEKPiAKPiBU
aGlzIGJlaGF2ZXMgc2xpZ2h0bHkgZGlmZmVyZW50IHNpbmNlIGl0IG5vdyByZXR1cm5zIC1FSU5W
QUwgb3IgLUVOT1NZUywKPiBidXQgdGhhdCBpcyB3aGF0IHdlIHdhbnQuCgpZb3UgYXJlIHJpZ2h0
LCBhbmQgSSB3aWxsIGFkZCB0aGlzIHRvIHRoZSBjaGFuZ2Vsb2cgd2hlbiBJIGFwcGx5LgoKCVNh
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
