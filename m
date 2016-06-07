From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 17/20] drm/bridge: anx78xx: Rely on the
	default ->best_encoder() behavior
Date: Tue,  7 Jun 2016 13:48:12 +0200
Message-ID: <1465300095-16971-18-git-send-email-boris.brezillon@free-electrons.com>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1465300095-16971-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Inki Dae <inki.dae@sams>
List-Id: linux-tegra@vger.kernel.org

V2UgaGF2ZSBhIDE6MSByZWxhdGlvbnNoaXAgYmV0d2VlbiBjb25uZWN0b3JzIGFuZCBlbmNvZGVy
cywgYW5kIHRoZSBkcml2ZXIKaXMgcmVseWluZyBvbiB0aGUgYXRvbWljIGhlbHBlcnM6IHdlIGNh
biBkcm9wIHRoZSBjdXN0b20gLT5iZXN0X2VuY29kZXIoKSwKYW5kIGxldCB0aGUgY29yZSBjYWxs
IGRybV9hdG9taWNfaGVscGVyX2Jlc3RfZW5jb2RlcigpIGZvciB1cy4KClNpZ25lZC1vZmYtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyB8IDggLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC1hbng3OHh4LmMKaW5kZXggZDA4N2IwNS4uZjlmMDNiYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKQEAgLTk4NiwxNiArOTg2LDggQEAgdW5sb2Nr
OgogCXJldHVybiBudW1fbW9kZXM7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgZHJtX2VuY29kZXIgKmFu
eDc4eHhfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCi17Ci0J
c3RydWN0IGFueDc4eHggKmFueDc4eHggPSBjb25uZWN0b3JfdG9fYW54Nzh4eChjb25uZWN0b3Ip
OwotCi0JcmV0dXJuIGFueDc4eHgtPmJyaWRnZS5lbmNvZGVyOwotfQotCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGFueDc4eHhfY29ubmVjdG9yX2hlbHBl
cl9mdW5jcyA9IHsKIAkuZ2V0X21vZGVzID0gYW54Nzh4eF9nZXRfbW9kZXMsCi0JLmJlc3RfZW5j
b2RlciA9IGFueDc4eHhfYmVzdF9lbmNvZGVyLAogfTsKIAogc3RhdGljIGVudW0gZHJtX2Nvbm5l
Y3Rvcl9zdGF0dXMgYW54Nzh4eF9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJl
bm8K
