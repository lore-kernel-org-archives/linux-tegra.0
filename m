From: Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] arm: tegra: Restore host1x/dc dm-pre-reloc
	properties
Date: Wed, 11 Jul 2018 17:19:48 +0200
Message-ID: <20180711151948.21779-1-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
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

U2luY2UgY29tbWl0IGYyZmFmZmVjYmQsIHRlZ3JhOiBDb252ZXJ0IHRvIHVzZSBiaW5tYW4KdGhl
IGRtLXByZS1yZWxvYyBwcm9wZXJ0aWVzIGFyZSByZW1vdmVkLgoKVGhpcyBsZWFkIHVib290IG5v
dCB0byBlbmFibGUgdGhlIGRpc3BsYXkgb24gcGF6MDAKClRoaXMgcGF0Y2ggcmVzdG9yZSB0aGUg
ZG0tcHJlLXJlbG9jIHByb3BlcnRpZXMgYWxsb3dpbmcKdGhlIGJvb3Rsb2FkZXIgdG8gb3V0cHV0
IHRvIHRoZSBkaXNwbGF5IHBhbmVsCgpTaWduZWQtb2ZmLWJ5OiBOaWNvbGFzIENoYXV2ZXQgPGt3
aXphcnRAZ21haWwuY29tPgotLS0KIGFyY2gvYXJtL2R0cy90ZWdyYTIwLXUtYm9vdC5kdHNpIHwg
MTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy90ZWdy
YTIwLXUtYm9vdC5kdHNpCmluZGV4IDdjMTE5NzI1NTIuLmY2NDY2N2U1NDkgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2R0cy90ZWdyYTIwLXUtYm9vdC5kdHNpCisrKyBiL2FyY2gvYXJtL2R0cy90ZWdy
YTIwLXUtYm9vdC5kdHNpCkBAIC0xLDMgKzEsMTMgQEAKICNpbmNsdWRlIDxjb25maWcuaD4KIAog
I2luY2x1ZGUgInRlZ3JhLXUtYm9vdC5kdHNpIgorCisKKy8geworCWhvc3QxeEA1MDAwMDAwMCB7
CisJCXUtYm9vdCxkbS1wcmUtcmVsb2M7CisJCWRjQDU0MjAwMDAwIHsKKwkJCXUtYm9vdCxkbS1w
cmUtcmVsb2M7CisJCX07CisJfTsKK307Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClUtQm9vdCBtYWlsaW5nIGxpc3QKVS1Cb290QGxp
c3RzLmRlbnguZGUKaHR0cHM6Ly9saXN0cy5kZW54LmRlL2xpc3RpbmZvL3UtYm9vdAo=
