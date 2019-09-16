From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 11/11] arm64: tegra: Enable SMMU for GPU on Tegra186
Date: Mon, 16 Sep 2019 17:04:12 +0200
Message-ID: <20190916150412.10025-12-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBHUFUgaGFzIGEg
Y29ubmVjdGlvbiB0byB0aGUgQVJNIFNNTVUgZm91bmQgb24gVGVncmExODYsIHdoaWNoIGNhbiBi
ZQp1c2VkIHRvIHN1cHBvcnQgbGFyZ2UgcGFnZXMuIE1ha2Ugc3VyZSB0aGUgR1BVIGlzIGF0dGFj
aGVkIHRvIHRoZSBTTU1VCnRvIHRha2UgYWR2YW50YWdlIG9mIGl0cyBjYXBhYmlsaXRpZXMuCgpT
aWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTg2LmR0c2kgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZp
ZGlhL3RlZ3JhMTg2LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4Ni5k
dHNpCmluZGV4IDQ3Y2Q4MzFmY2Y0NC4uMTcxZmQ0ZGZhNThkIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4Ni5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbnZpZGlhL3RlZ3JhMTg2LmR0c2kKQEAgLTExNzIsNiArMTE3Miw3IEBACiAJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7CiAKIAkJcG93ZXItZG9tYWlucyA9IDwmYnBtcCBURUdSQTE4Nl9QT1dFUl9E
T01BSU5fR1BVPjsKKwkJaW9tbXVzID0gPCZzbW11IFRFR1JBMTg2X1NJRF9HUFU+OwogCX07CiAK
IAlzeXNyYW1AMzAwMDAwMDAgewotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
