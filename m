From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] drm/tegra: Fix comparison operator for buffer size
Date: Wed, 20 Jun 2018 16:03:58 +0300
Message-ID: <20180620130358.26247-1-mperttunen@nvidia.com>
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
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, digetx@gmail.com, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

SGVyZSB3ZSBhcmUgY2hlY2tpbmcgZm9yIHRoZSBidWZmZXIgbGVuZ3RoLCBub3QgYW4gb2Zmc2V0
IGZvciB3cml0aW5nCnRvLCBzbyB1c2luZyA+IGlzIGNvcnJlY3QuIFRoZSBjdXJyZW50IGNvZGUg
aW5jb3JyZWN0bHkgcmVqZWN0cyBhCmNvbW1hbmQgYnVmZmVyIGVuZGluZyBhdCB0aGUgbWVtb3J5
IGJ1ZmZlcidzIGVuZC4KClNpZ25lZC1vZmYtYnk6IE1pa2tvIFBlcnR0dW5lbiA8bXBlcnR0dW5l
bkBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0u
YwppbmRleCA3NzZjMTUxM2U1ODIuLmEyYmQ1ODc2YzYzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RybS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYwpAQCAt
Mzk4LDcgKzM5OCw3IEBAIGludCB0ZWdyYV9kcm1fc3VibWl0KHN0cnVjdCB0ZWdyYV9kcm1fY29u
dGV4dCAqY29udGV4dCwKIAkJICogdW5hbGlnbmVkIG9mZnNldCBpcyBtYWxmb3JtZWQgYW5kIGNh
dXNlIGNvbW1hbmRzIHN0cmVhbQogCQkgKiBjb3JydXB0aW9uIG9uIHRoZSBidWZmZXIgYWRkcmVz
cyByZWxvY2F0aW9uLgogCQkgKi8KLQkJaWYgKG9mZnNldCAmIDMgfHwgb2Zmc2V0ID49IG9iai0+
Z2VtLnNpemUpIHsKKwkJaWYgKG9mZnNldCAmIDMgfHwgb2Zmc2V0ID4gb2JqLT5nZW0uc2l6ZSkg
ewogCQkJZXJyID0gLUVJTlZBTDsKIAkJCWdvdG8gZmFpbDsKIAkJfQotLSAKMi4xNi4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
