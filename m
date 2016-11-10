From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 2/8] drm/tegra: Allocate BOs from lower 4G when without IOMMU
Date: Thu, 10 Nov 2016 20:23:39 +0200
Message-ID: <20161110182345.31777-3-mperttunen@nvidia.com>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161110182345.31777-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

T24gNjQtYml0IFRlZ3JhcywgYnVmZmVyIG9iamVjdCBtZW1vcnkgYWxsb2NhdGlvbiBtYXkKcmV0
dXJuIG1lbW9yeSBhYm92ZSA0RyB0aGF0IHVuaXRzIGJlaGluZCBIb3N0MXggY2Fubm90CmFjY2Vz
cy4gQWRkIHRoZSBHRlBfRE1BIGZsYWcgdG8gdGhlc2UgYWxsb2NhdGlvbiB3aGVuCklPTU1VIGlz
IG5vdCBlbmFibGVkIHRvIGVuc3VyZSB1bml0cyBjYW4gYWx3YXlzIGFjY2VzcwpCTyBtZW1vcnku
CgpTaWduZWQtb2ZmLWJ5OiBNaWtrbyBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKaW5kZXggMTliZjlj
ZC4uZTM2ZTZjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpAQCAtMjMzLDcgKzIzMyw3IEBAIHN0YXRpYyBp
bnQgdGVncmFfYm9fYWxsb2Moc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IHRlZ3JhX2Jv
ICpibykKIAkJc2l6ZV90IHNpemUgPSBiby0+Z2VtLnNpemU7CiAKIAkJYm8tPnZhZGRyID0gZG1h
X2FsbG9jX3djKGRybS0+ZGV2LCBzaXplLCAmYm8tPnBhZGRyLAotCQkJCQkgR0ZQX0tFUk5FTCB8
IF9fR0ZQX05PV0FSTik7CisJCQkJCSBHRlBfS0VSTkVMIHwgR0ZQX0RNQSB8IF9fR0ZQX05PV0FS
Tik7CiAJCWlmICghYm8tPnZhZGRyKSB7CiAJCQlkZXZfZXJyKGRybS0+ZGV2LAogCQkJCSJmYWls
ZWQgdG8gYWxsb2NhdGUgYnVmZmVyIG9mIHNpemUgJXp1XG4iLAotLSAKMi4xMC4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
