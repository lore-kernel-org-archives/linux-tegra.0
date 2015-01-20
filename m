From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 31/36] drm/tegra: Atomic conversion, phase 3, step 2
Date: Tue, 20 Jan 2015 11:48:50 +0100
Message-ID: <1421750935-4023-32-git-send-email-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJlcGxhY2UgZHJtX2Ny
dGNfaGVscGVyX3NldF9jb25maWcoKSBieSBkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnKCku
CkFsbCBkcml2ZXJzIGhhdmUgbm93IGJlZW4gY29udmVydGVkIHRvIHVzZSAtPmF0b21pY19jaGVj
aygpIHRvIHNldCB0aGUKYXRvbWljIHN0YXRlLCB0aGVyZWZvcmUgdGhlIGF0b21pYyBtb2RlIHNl
dHRpbmcgaGVscGVycyBjYW4gYmUgdXNlZC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5n
IDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9kYy5jCmluZGV4IGI0YTJhMTdjYWYwNS4uOWE5MzRhNjA3N2E2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpA
QCAtMTA2NCw3ICsxMDY0LDcgQEAgc3RhdGljIHZvaWQgdGVncmFfY3J0Y19hdG9taWNfZGVzdHJv
eV9zdGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2NydGNfZnVuY3MgdGVncmFfY3J0Y19mdW5jcyA9IHsKIAkucGFnZV9mbGlwID0gdGVncmFfZGNf
cGFnZV9mbGlwLAotCS5zZXRfY29uZmlnID0gZHJtX2NydGNfaGVscGVyX3NldF9jb25maWcsCisJ
LnNldF9jb25maWcgPSBkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnLAogCS5kZXN0cm95ID0g
dGVncmFfZGNfZGVzdHJveSwKIAkucmVzZXQgPSB0ZWdyYV9jcnRjX3Jlc2V0LAogCS5hdG9taWNf
ZHVwbGljYXRlX3N0YXRlID0gdGVncmFfY3J0Y19hdG9taWNfZHVwbGljYXRlX3N0YXRlLAotLSAK
Mi4xLjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
