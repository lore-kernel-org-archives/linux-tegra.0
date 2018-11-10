From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/2] ARM: tegra: avoid touching Secure registers in reset
 handler
Date: Sat, 10 Nov 2018 22:18:09 +0100
Message-ID: <c93b79b052370f4058033dae716225aec94c4991.1541884486.git.mirq-linux@rere.qmqm.pl>
References: <cover.1541884486.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1541884486.git.mirq-linux@rere.qmqm.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

VGhpcyBhbGxvd3Mgc2Vjb25kYXJ5IENQVXMgdG8gYm9vdCB3aXRoIFRydXN0ZWQgRm91bmRhdGlv
bnMgZmlybXdhcmUuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51
eEByZXJlLnFtcW0ucGw+Ci0tLQogYXJjaC9hcm0vbWFjaC10ZWdyYS9yZXNldC1oYW5kbGVyLlMg
fCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9tYWNoLXRlZ3JhL3Jlc2V0LWhhbmRsZXIuUyBiL2FyY2gvYXJtL21hY2gtdGVn
cmEvcmVzZXQtaGFuZGxlci5TCmluZGV4IGZlNGM1NjhhZWFjZS4uNTYzMDBlYzlmMWEwIDEwMDY0
NAotLS0gYS9hcmNoL2FybS9tYWNoLXRlZ3JhL3Jlc2V0LWhhbmRsZXIuUworKysgYi9hcmNoL2Fy
bS9tYWNoLXRlZ3JhL3Jlc2V0LWhhbmRsZXIuUwpAQCAtMTM5LDYgKzEzOSwxMyBAQCBFTlRSWShf
X3RlZ3JhX2NwdV9yZXNldF9oYW5kbGVyKQogCWNwc2lkCWFpZiwgMHgxMwkJCUAgU1ZDIG1vZGUs
IGludGVycnVwdHMgZGlzYWJsZWQKIAogCXRlZ3JhX2dldF9zb2NfaWQgVEVHUkFfQVBCX01JU0Nf
QkFTRSwgcjYKKworI2lmZGVmIENPTkZJR19UUlVTVEVEX0ZPVU5EQVRJT05TCisJYWRyCXIzLCBf
X3RlZ3JhX2NwdV9yZXNldF9oYW5kbGVyX2RhdGEKKwlsZHIJcjAsIFtyMywgI1JFU0VUX0RBVEEo
VEZfUFJFU0VOVCldCisJY21wCXIwLCAjMAorCWJuZQlhZnRlcl9lcnJhdGEKKyNlbmRpZgkvKiBD
T05GSUdfVFJVU1RFRF9GT1VOREFUSU9OUyAqLwogI2lmZGVmIENPTkZJR19BUkNIX1RFR1JBXzJ4
X1NPQwogdDIwX2NoZWNrOgogCWNtcAlyNiwgI1RFR1JBMjAKLS0gCjIuMTkuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
