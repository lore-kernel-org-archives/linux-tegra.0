From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 19/20] drm/bridge: ps8622: Rely on the
	default ->best_encoder() behavior
Date: Tue,  7 Jun 2016 13:48:14 +0200
Message-ID: <1465300095-16971-20-git-send-email-boris.brezillon@free-electrons.com>
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
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhcmFkZS1wczg2MjIuYyB8IDEwIC0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3BhcmFkZS1wczg2MjIuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFy
YWRlLXBzODYyMi5jCmluZGV4IGJlODgxZTkuLjVjZDhkZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvcGFyYWRlLXBzODYyMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvcGFyYWRlLXBzODYyMi5jCkBAIC00NzQsMTggKzQ3NCw4IEBAIHN0YXRpYyBpbnQgcHM4NjIy
X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXJldHVybiBkcm1f
cGFuZWxfZ2V0X21vZGVzKHBzODYyMi0+cGFuZWwpOwogfQogCi1zdGF0aWMgc3RydWN0IGRybV9l
bmNvZGVyICpwczg2MjJfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCi17Ci0Jc3RydWN0IHBzODYyMl9icmlkZ2UgKnBzODYyMjsKLQotCXBzODYyMiA9IGNvbm5l
Y3Rvcl90b19wczg2MjIoY29ubmVjdG9yKTsKLQotCXJldHVybiBwczg2MjItPmJyaWRnZS5lbmNv
ZGVyOwotfQotCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNz
IHBzODYyMl9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewogCS5nZXRfbW9kZXMgPSBwczg2MjJf
Z2V0X21vZGVzLAotCS5iZXN0X2VuY29kZXIgPSBwczg2MjJfYmVzdF9lbmNvZGVyLAogfTsKIAog
c3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgcHM4NjIyX2RldGVjdChzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
