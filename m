From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 2/2] gpu: host1x: Set the DMA mask for host1x devices
Date: Thu, 25 Feb 2016 19:00:58 +0900
Message-ID: <1456394458-15759-2-git-send-email-acourbot@nvidia.com>
References: <1456394458-15759-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1456394458-15759-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

VGhlIGRlZmF1bHQgRE1BIG1hc2sgY292ZXJzIGEgMzIgYml0cyBhZGRyZXNzIHJhbmdlLCBidXQg
ZGV2aWNlcyBjYW4KYWRkcmVzcyBtb3JlIHRoYW4gdGhhdC4gU2V0IHRoZSBETUEgbWFzayB0byB0
aGUgYWN0dWFsIGFkZHJlc3NhYmxlIHJhbmdlCnRvIGF2b2lkIHRoZSB1c2Ugb2YgdW5uZWVkZWQg
Ym91bmNlIGJ1ZmZlcnMuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJi
b3RAbnZpZGlhLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjE6Ci0gc2V0IHRoZSBtYXNrIGF0IHRo
ZSBidXMgbGV2ZWwgc28gb2ZfZG1hX2NvbmZpZ3VyZSgpIGRvZXMgdGhlIHJpZ2h0IHRoaW5nCgog
ZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0MXgv
YnVzLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMKaW5kZXggYzI3ODU4YWUwNTUyLi5lMDRj
NzExNGY5NzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYworKysgYi9kcml2
ZXJzL2dwdS9ob3N0MXgvYnVzLmMKQEAgLTE5LDYgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9v
Zi5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2Uu
aD4KKyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgogCiAjaW5jbHVkZSAiYnVzLmgiCiAj
aW5jbHVkZSAiZGV2LmgiCkBAIC0zOTQsNyArMzk1LDcgQEAgc3RhdGljIGludCBob3N0MXhfZGV2
aWNlX2FkZChzdHJ1Y3QgaG9zdDF4ICpob3N0MXgsCiAJSU5JVF9MSVNUX0hFQUQoJmRldmljZS0+
bGlzdCk7CiAJZGV2aWNlLT5kcml2ZXIgPSBkcml2ZXI7CiAKLQlkZXZpY2UtPmRldi5jb2hlcmVu
dF9kbWFfbWFzayA9IGhvc3QxeC0+ZGV2LT5jb2hlcmVudF9kbWFfbWFzazsKKwlkZXZpY2UtPmRl
di5jb2hlcmVudF9kbWFfbWFzayA9IERNQV9CSVRfTUFTSygzNCk7CiAJZGV2aWNlLT5kZXYuZG1h
X21hc2sgPSAmZGV2aWNlLT5kZXYuY29oZXJlbnRfZG1hX21hc2s7CiAJZGV2X3NldF9uYW1lKCZk
ZXZpY2UtPmRldiwgIiVzIiwgZHJpdmVyLT5kcml2ZXIubmFtZSk7CiAJb2ZfZG1hX2NvbmZpZ3Vy
ZSgmZGV2aWNlLT5kZXYsIGhvc3QxeC0+ZGV2LT5vZl9ub2RlKTsKLS0gCjIuNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
