From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/14] gpu: host1x: Do not limit DMA segment size
Date: Mon, 14 Oct 2019 14:50:36 +0200
Message-ID: <20191014125049.425101-2-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCk5vbmUgb2YgdGhlIGhv
c3QxeCBjbGllbnRzIGhhdmUgYW55IGxpbWl0YXRpb25zIG9uIHRoZSBETUEgc2VnbWVudCBzaXpl
LApzbyBkb24ndCBwcmV0ZW5kIHRoYXQgdGhleSBkby4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkg
UmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jIGIvZHJpdmVycy9ncHUvaG9zdDF4
L2J1cy5jCmluZGV4IDc0MmFhOWZmMjFiOC4uMmM4NTU5ZmYzNDgxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9ob3N0MXgvYnVzLmMKKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jCkBAIC00
NDUsNyArNDQ1LDcgQEAgc3RhdGljIGludCBob3N0MXhfZGV2aWNlX2FkZChzdHJ1Y3QgaG9zdDF4
ICpob3N0MXgsCiAJb2ZfZG1hX2NvbmZpZ3VyZSgmZGV2aWNlLT5kZXYsIGhvc3QxeC0+ZGV2LT5v
Zl9ub2RlLCB0cnVlKTsKIAogCWRldmljZS0+ZGV2LmRtYV9wYXJtcyA9ICZkZXZpY2UtPmRtYV9w
YXJtczsKLQlkbWFfc2V0X21heF9zZWdfc2l6ZSgmZGV2aWNlLT5kZXYsIFNaXzRNKTsKKwlkbWFf
c2V0X21heF9zZWdfc2l6ZSgmZGV2aWNlLT5kZXYsIFVJTlRfTUFYKTsKIAogCWVyciA9IGhvc3Qx
eF9kZXZpY2VfcGFyc2VfZHQoZGV2aWNlLCBkcml2ZXIpOwogCWlmIChlcnIgPCAwKSB7Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
