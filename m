From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/14] drm/tegra: gem: Use dma_get_sgtable()
Date: Mon, 14 Oct 2019 14:50:47 +0200
Message-ID: <20191014125049.425101-13-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJhdGhlciB0aGFuIG1h
bnVhbGx5IGNyZWF0aW5nIGFuIFNHIHRhYmxlIGluIGFuIGluY29ycmVjdCB3YXksIGxldCB0aGUK
c3RhbmRhcmQgZG1hX2dldF9zZ3RhYmxlKCkgZnVuY3Rpb24gZG8gaXQuCgpTaWduZWQtb2ZmLWJ5
OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9nZW0uYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0u
YyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwppbmRleCA3NDEyZTIzNTAwZDEuLjMzNDVj
Y2UxNDY2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpAQCAtNTIwLDExICs1MjAsOSBAQCB0ZWdyYV9nZW1f
cHJpbWVfbWFwX2RtYV9idWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAogCQlp
ZiAoZG1hX21hcF9zZyhhdHRhY2gtPmRldiwgc2d0LT5zZ2wsIHNndC0+bmVudHMsIGRpcikgPT0g
MCkKIAkJCWdvdG8gZnJlZTsKIAl9IGVsc2UgewotCQlpZiAoc2dfYWxsb2NfdGFibGUoc2d0LCAx
LCBHRlBfS0VSTkVMKSkKKwkJaWYgKGRtYV9nZXRfc2d0YWJsZShhdHRhY2gtPmRldiwgc2d0LCBi
by0+dmFkZHIsIGJvLT5pb3ZhLAorCQkJCSAgICBnZW0tPnNpemUpIDwgMCkKIAkJCWdvdG8gZnJl
ZTsKLQotCQlzZ19kbWFfYWRkcmVzcyhzZ3QtPnNnbCkgPSBiby0+aW92YTsKLQkJc2dfZG1hX2xl
bihzZ3QtPnNnbCkgPSBnZW0tPnNpemU7CiAJfQogCiAJcmV0dXJuIHNndDsKLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
