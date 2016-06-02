From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 16/20] drm: omap: Rely on the default
	->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:43 +0200
Message-ID: <1464877907-27723-17-git-send-email-boris.brezillon@free-electrons.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Stefan Agner <stefan@agner.ch>, virtualization@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexey Brodkin <abrodkin@synopsys.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.>
List-Id: linux-tegra@vger.kernel.org

V2UgaGF2ZSBhIDE6MSByZWxhdGlvbnNoaXAgYmV0d2VlbiBjb25uZWN0b3JzIGFuZCBlbmNvZGVy
cyBhbmQgdGhlCmRyaXZlciBpcyByZWx5aW5nIG9uIHRoZSBhdG9taWMgaGVscGVyczogd2UgY2Fu
IGRyb3AgdGhlIGN1c3RvbQotPmJlc3RfZW5jb2RlcigpIGltcGxlbWVudGF0aW9uIGFuZCBsZXQg
dGhlIGNvcmUgY2FsbApkcm1fYXRvbWljX2hlbHBlcl9iZXN0X2VuY29kZXIoKSBmb3IgdXMuCgpT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0
cm9ucy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYyB8
IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jCmluZGV4IGNlMmQ2N2IuLjgwYWY1ZTEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYwpAQCAtMjU2LDEzICsyNTYsNiBA
QCBzdGF0aWMgaW50IG9tYXBfY29ubmVjdG9yX21vZGVfdmFsaWQoc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvciwKIAlyZXR1cm4gcmV0OwogfQogCi1zdHJ1Y3QgZHJtX2VuY29kZXIgKm9t
YXBfY29ubmVjdG9yX2F0dGFjaGVkX2VuY29kZXIoCi0JCXN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCi17Ci0Jc3RydWN0IG9tYXBfY29ubmVjdG9yICpvbWFwX2Nvbm5lY3RvciA9IHRv
X29tYXBfY29ubmVjdG9yKGNvbm5lY3Rvcik7Ci0JcmV0dXJuIG9tYXBfY29ubmVjdG9yLT5lbmNv
ZGVyOwotfQotCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3Mgb21hcF9j
b25uZWN0b3JfZnVuY3MgPSB7CiAJLmRwbXMgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3Jf
ZHBtcywKIAkucmVzZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQsCkBAIC0y
NzYsNyArMjY5LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIG9t
YXBfY29ubmVjdG9yX2Z1bmNzID0gewogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9y
X2hlbHBlcl9mdW5jcyBvbWFwX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgPSB7CiAJLmdldF9tb2Rl
cyA9IG9tYXBfY29ubmVjdG9yX2dldF9tb2RlcywKIAkubW9kZV92YWxpZCA9IG9tYXBfY29ubmVj
dG9yX21vZGVfdmFsaWQsCi0JLmJlc3RfZW5jb2RlciA9IG9tYXBfY29ubmVjdG9yX2F0dGFjaGVk
X2VuY29kZXIsCiB9OwogCiAvKiBpbml0aWFsaXplIGNvbm5lY3RvciAqLwotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBt
YWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
