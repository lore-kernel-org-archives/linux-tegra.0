From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/5] gpu: host1x: Supports 40-bit addressing on Tegra186
Date: Wed, 23 Jan 2019 10:39:51 +0100
Message-ID: <20190123093951.24908-6-thierry.reding@gmail.com>
References: <20190123093951.24908-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190123093951.24908-1-thierry.reding@gmail.com>
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
cy9ncHUvaG9zdDF4L2Rldi5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCmluZGV4IDQxOWQ4
OTI5YTk4Zi4uMzJmYWQ0ZGE3OTM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2
LmMKKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCkBAIC0xMjcsNyArMTI3LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBob3N0MXhfaW5mbyBob3N0MXgwNl9pbmZvID0gewogCS5uYl9iYXNl
cyA9IDE2LAogCS5pbml0ID0gaG9zdDF4MDZfaW5pdCwKIAkuc3luY19vZmZzZXQgPSAweDAsCi0J
LmRtYV9tYXNrID0gRE1BX0JJVF9NQVNLKDM0KSwKKwkuZG1hX21hc2sgPSBETUFfQklUX01BU0so
NDApLAogCS5oYXNfaHlwZXJ2aXNvciA9IHRydWUsCiB9OwogCi0tIAoyLjE5LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
