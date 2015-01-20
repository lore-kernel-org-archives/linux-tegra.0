From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/36] drm/plane: Make ->atomic_update() mandatory
Date: Tue, 20 Jan 2015 11:48:21 +0100
Message-ID: <1421750935-4023-3-git-send-email-thierry.reding@gmail.com>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZXJlIGlzIG5vIHVz
ZS1jYXNlIHdoZXJlIGl0IHdvdWxkIGJlIHVzZWZ1bCBmb3IgZHJpdmVycyBub3QgdG8KaW1wbGVt
ZW50IHRoaXMgZnVuY3Rpb24gYW5kIHRoZSB0cmFuc2l0aW9uYWwgcGxhbmUgaGVscGVycyBhbHJl
YWR5CnJlcXVpcmUgZHJpdmVycyB0byBwcm92aWRlIGFuIGltcGxlbWVudGF0aW9uLgoKU2lnbmVk
LW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMK
aW5kZXggZDQ2NzE4NWY3OTQyLi4wMTA2NjFmMjMwMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWlj
X2hlbHBlci5jCkBAIC0xMTA4LDcgKzExMDgsNyBAQCB2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nv
bW1pdF9wbGFuZXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAogCQlmdW5jcyA9IHBsYW5lLT5o
ZWxwZXJfcHJpdmF0ZTsKIAotCQlpZiAoIWZ1bmNzIHx8ICFmdW5jcy0+YXRvbWljX3VwZGF0ZSkK
KwkJaWYgKCFmdW5jcykKIAkJCWNvbnRpbnVlOwogCiAJCW9sZF9wbGFuZV9zdGF0ZSA9IG9sZF9z
dGF0ZS0+cGxhbmVfc3RhdGVzW2ldOwotLSAKMi4xLjMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
