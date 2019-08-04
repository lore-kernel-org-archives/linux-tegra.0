From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/4] drm/i2c/tda998x: drop use of drmP.h
Date: Sun,  4 Aug 2019 11:41:29 +0200
Message-ID: <20190804094132.29463-2-sam@ravnborg.org>
References: <20190804094132.29463-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804094132.29463-1-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, malidp@foss.arm.com, linux-tegra@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-tegra@vger.kernel.org

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpGaXggZmFsbG91
dC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFJ1
c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pMmMvdGRhOTk4eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwpp
bmRleCA2MWUwNDI5MThhN2YuLjg0YzZkNGM5MWM2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2kyYy90ZGE5OTh4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9k
cnYuYwpAQCAtMTMsMTAgKzEzLDEwIEBACiAjaW5jbHVkZSA8c291bmQvYXNvdW5kZWYuaD4KICNp
bmNsdWRlIDxzb3VuZC9oZG1pLWNvZGVjLmg+CiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZWRpZC5o
PgogI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vaTJjL3RkYTk5
OHguaD4KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
