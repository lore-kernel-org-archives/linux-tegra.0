From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 07/16] gpu: host1x: Support 40-bit addressing on Tegra186
Date: Fri,  1 Feb 2019 14:28:28 +0100
Message-ID: <20190201132837.12327-8-thierry.reding@gmail.com>
References: <20190201132837.12327-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190201132837.12327-1-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBob3N0MXggYW5k
IGNsaWVudHMgaW5zdGFudGlhdGVkIG9uIFRlZ3JhMTg2IHN1cHBvcnQgYWRkcmVzc2luZyA0MApi
aXRzIG9mIG1lbW9yeS4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52
aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvaG9zdDF4L2Rldi5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCmluZGV4IDU0NGI2
N2YyYjNmZi4uZWUzYzdiODFhMjlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2
LmMKKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCkBAIC0xMzYsNyArMTM2LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBob3N0MXhfaW5mbyBob3N0MXgwNl9pbmZvID0gewogCS5uYl9iYXNl
cyA9IDE2LAogCS5pbml0ID0gaG9zdDF4MDZfaW5pdCwKIAkuc3luY19vZmZzZXQgPSAweDAsCi0J
LmRtYV9tYXNrID0gRE1BX0JJVF9NQVNLKDM0KSwKKwkuZG1hX21hc2sgPSBETUFfQklUX01BU0so
NDApLAogCS5oYXNfaHlwZXJ2aXNvciA9IHRydWUsCiAJLm51bV9zaWRfZW50cmllcyA9IEFSUkFZ
X1NJWkUodGVncmExODZfc2lkX3RhYmxlKSwKIAkuc2lkX3RhYmxlID0gdGVncmExODZfc2lkX3Rh
YmxlLAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
