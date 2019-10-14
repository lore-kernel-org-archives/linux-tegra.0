From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 08/14] drm/tegra: vic: Inherit DMA mask from host1x
Date: Mon, 14 Oct 2019 14:50:43 +0200
Message-ID: <20191014125049.425101-9-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClZJQywganVzdCBsaWtl
IGFsbCBvdGhlciBob3N0MXggY2xpZW50cywgaGFzIHRoZSBzYW1lIGFkZHJlc3NpbmcgcmFuZ2UK
YXMgaXRzIHBhcmVudCBob3N0MXggZGV2aWNlLiBJbmhlcml0IHRoZSBETUEgbWFzayB0byByZWZs
ZWN0IHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyB8IDcgKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS92aWMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYwppbmRleCA3NDg3OThmMmNk
YzguLmQ2MGU0NzljZGU5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYwpAQCAtMzg1LDYgKzM4NSwxMyBAQCBz
dGF0aWMgaW50IHZpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVj
dCB2aWMgKnZpYzsKIAlpbnQgZXJyOwogCisJLyogaW5oZXJpdCBETUEgbWFzayBmcm9tIGhvc3Qx
eCBwYXJlbnQgKi8KKwllcnIgPSBkbWFfY29lcmNlX21hc2tfYW5kX2NvaGVyZW50KGRldiwgKmRl
di0+cGFyZW50LT5kbWFfbWFzayk7CisJaWYgKGVyciA8IDApIHsKKwkJZGV2X2VycigmcGRldi0+
ZGV2LCAiZmFpbGVkIHRvIHNldCBETUEgbWFzazogJWRcbiIsIGVycik7CisJCXJldHVybiBlcnI7
CisJfQorCiAJdmljID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCp2aWMpLCBHRlBfS0VSTkVM
KTsKIAlpZiAoIXZpYykKIAkJcmV0dXJuIC1FTk9NRU07Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
