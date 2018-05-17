From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/7] drm/tegra: gem: Fill in missing export info
Date: Thu, 17 May 2018 17:41:27 +0200
Message-ID: <20180517154132.10058-3-thierry.reding@gmail.com>
References: <20180517154132.10058-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180517154132.10058-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClNldCB0aGUgb3duZXIg
YW5kIG5hbWUgb2YgdGhlIGV4cG9ydGVkIERNQS1CVUYgaW4gYWRkaXRpb24gdG8gdGhlCmFscmVh
ZHkgZmlsbGVkLWluIGZpZWxkcy4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVk
aW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jIHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwppbmRleCA4YjBi
NGZmNjRiYjQuLjM4N2JhMWRmYmUwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpAQCAtNjYzLDYgKzY2Myw4
IEBAIHN0cnVjdCBkbWFfYnVmICp0ZWdyYV9nZW1fcHJpbWVfZXhwb3J0KHN0cnVjdCBkcm1fZGV2
aWNlICpkcm0sCiB7CiAJREVGSU5FX0RNQV9CVUZfRVhQT1JUX0lORk8oZXhwX2luZm8pOwogCisJ
ZXhwX2luZm8uZXhwX25hbWUgPSBLQlVJTERfTU9ETkFNRTsKKwlleHBfaW5mby5vd25lciA9IGRy
bS0+ZHJpdmVyLT5mb3BzLT5vd25lcjsKIAlleHBfaW5mby5vcHMgPSAmdGVncmFfZ2VtX3ByaW1l
X2RtYWJ1Zl9vcHM7CiAJZXhwX2luZm8uc2l6ZSA9IGdlbS0+c2l6ZTsKIAlleHBfaW5mby5mbGFn
cyA9IGZsYWdzOwotLSAKMi4xNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
