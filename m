From: zhengbin <zhengbin13@huawei.com>
Subject: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Date: Mon, 18 Nov 2019 19:46:10 +0800
Message-ID: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: treding@nvidia.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: zhengbin13@huawei.com
List-Id: linux-tegra@vger.kernel.org

emhlbmdiaW4gKDIpOgogIGRybS90ZWdyYTogVXNlIFBUUl9FUlJfT1JfWkVSTygpIHRvIHNpbXBs
aWZ5IGNvZGUgaW4KICAgIHRlZ3JhX2JvX2R1bWJfY3JlYXRlCiAgZHJtL3RlZ3JhOiBVc2UgUFRS
X0VSUl9PUl9aRVJPKCkgdG8gc2ltcGxpZnkgY29kZSBpbiB0ZWdyYV9nZW1fY3JlYXRlCgogZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIHwgNSArLS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2dlbS5jIHwgNSArLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
