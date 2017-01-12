From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drm: tegra: shut up harmless warning on NOMMU
Date: Thu, 12 Jan 2017 12:13:51 +0100
Message-ID: <20170112111425.3228358-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

VGhlIHRlZ3JhIERSTSBkcml2ZXIgaXMgYWxtb3N0IG9rIHdpdGhvdXQgYW4gTU1VLCBidXQgdGhl
cmUKaXMgb25lIHNtYWxsIHdhcm5pbmcgdGhhdCBJIGdldDoKCmRyaXZlcnMvZ3B1L2RybS90ZWdy
YS9nZW0uYzogSW4gZnVuY3Rpb24gJ3RlZ3JhX2RybV9tbWFwJzoKZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2dlbS5jOjUwODoxMjogdW51c2VkIHZhcmlhYmxlICdwcm90JwoKVGhpcyBtYXJrcyB0aGUg
dmFyaWFibGUgYXMgX19tYXliZV91bnVzZWQgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jIGIvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2dlbS5jCmluZGV4IDdkODUzZTZiNWZmMC4uNjNmMTRiN2E1OWEwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2dlbS5jCkBAIC01MDUsNyArNTA1LDcgQEAgaW50IHRlZ3JhX2RybV9tbWFwKHN0cnVjdCBmaWxl
ICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAogCQl2bWEtPnZtX3Bnb2ZmID0g
dm1fcGdvZmY7CiAJfSBlbHNlIHsKLQkJcGdwcm90X3QgcHJvdCA9IHZtX2dldF9wYWdlX3Byb3Qo
dm1hLT52bV9mbGFncyk7CisJCXBncHJvdF90IHByb3QgX19tYXliZV91bnVzZWQgPSB2bV9nZXRf
cGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwogCiAJCXZtYS0+dm1fZmxhZ3MgfD0gVk1fTUlYRURN
QVA7CiAJCXZtYS0+dm1fZmxhZ3MgJj0gflZNX1BGTk1BUDsKLS0gCjIuOS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
