From: Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] arm: tegra: Restore host1x/dc dm-pre-reloc
	properties
Date: Wed, 11 Jul 2018 20:42:57 +0200
Message-ID: <20180711184257.13999-1-kwizart@gmail.com>
References: <20180711151948.21779-1-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20180711151948.21779-1-kwizart@gmail.com>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: swarren@nvidia.com
Cc: linux-tegra@vger.kernel.org, u-boot@lists.denx.de
List-Id: linux-tegra@vger.kernel.org

U2luY2UgY29tbWl0IGYyZmFmZmVjYjAxNiwgdGVncmE6IENvbnZlcnQgdG8gdXNlIGJpbm1hbgp0
aGUgZG0tcHJlLXJlbG9jIHByb3BlcnRpZXMgYXJlIHJlbW92ZWQuCgpUaGlzIGxlYWRzIFUtQm9v
dCBub3QgdG8gZW5hYmxlIHRoZSBkaXNwbGF5IG9uIHBhejAwCgpUaGlzIHBhdGNoIHJlc3RvcmUg
dGhlIGRtLXByZS1yZWxvYyBwcm9wZXJ0aWVzIGFsbG93aW5nCnRoZSBib290bG9hZGVyIHRvIG91
dHB1dCB0byB0aGUgZGlzcGxheSBwYW5lbAoKdjQ6IC0gU3BlbGwgcHJvamVjdCBuYW1lIGFzIGFw
cHJvcHJpYXRlCnYzOiAtIEZpeCBmZXcgdHlwb3MKdjI6IC0gQWRkIG1vcmUgY2hhcmFjdGVycyB0
byBjb21taXQgaGFzaAoKU2lnbmVkLW9mZi1ieTogTmljb2xhcyBDaGF1dmV0IDxrd2l6YXJ0QGdt
YWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgotLS0K
IGFyY2gvYXJtL2R0cy90ZWdyYTIwLXUtYm9vdC5kdHNpIHwgMTAgKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvdGVn
cmEyMC11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy90ZWdyYTIwLXUtYm9vdC5kdHNpCmluZGV4
IDdjMTE5NzI1NTIuLmY2NDY2N2U1NDkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2R0cy90ZWdyYTIw
LXUtYm9vdC5kdHNpCisrKyBiL2FyY2gvYXJtL2R0cy90ZWdyYTIwLXUtYm9vdC5kdHNpCkBAIC0x
LDMgKzEsMTMgQEAKICNpbmNsdWRlIDxjb25maWcuaD4KIAogI2luY2x1ZGUgInRlZ3JhLXUtYm9v
dC5kdHNpIgorCisKKy8geworCWhvc3QxeEA1MDAwMDAwMCB7CisJCXUtYm9vdCxkbS1wcmUtcmVs
b2M7CisJCWRjQDU0MjAwMDAwIHsKKwkJCXUtYm9vdCxkbS1wcmUtcmVsb2M7CisJCX07CisJfTsK
K307Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClUtQm9vdCBtYWlsaW5nIGxpc3QKVS1Cb290QGxpc3RzLmRlbnguZGUKaHR0cHM6Ly9s
aXN0cy5kZW54LmRlL2xpc3RpbmZvL3UtYm9vdAo=
