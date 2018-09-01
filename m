From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 01/13] fbdev: show fbdev number for debugging
Date: Sat, 01 Sep 2018 16:08:44 +0200
Message-ID: <ef584ecd8642e8b1a04f28d6d9c1864b5aa507bb.1535810304.git.mirq-linux@rere.qmqm.pl>
References: <cover.1535810304.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1535810304.git.mirq-linux@rere.qmqm.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org, linux-tegra@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Maxime Ripard <maxime.ripard@bootlin.com>, virtualization@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

U2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBs
PgpBY2tlZC1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1
bmcuY29tPgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
Ym1lbS5jCmluZGV4IGY3NDFiYThkZjAxYi4uMzBhMThkNGM5ZGU0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJtZW0uYwpAQCAtMTYxOCw4ICsxNjE4LDggQEAgc3RhdGljIGludCBkb19yZW1vdmVfY29u
ZmxpY3RpbmdfZnJhbWVidWZmZXJzKHN0cnVjdCBhcGVydHVyZXNfc3RydWN0ICphLAogCQkJKHBy
aW1hcnkgJiYgZ2VuX2FwZXIgJiYgZ2VuX2FwZXItPmNvdW50ICYmCiAJCQkgZ2VuX2FwZXItPnJh
bmdlc1swXS5iYXNlID09IFZHQV9GQl9QSFlTKSkgewogCi0JCQlwcmludGsoS0VSTl9JTkZPICJm
Yjogc3dpdGNoaW5nIHRvICVzIGZyb20gJXNcbiIsCi0JCQkgICAgICAgbmFtZSwgcmVnaXN0ZXJl
ZF9mYltpXS0+Zml4LmlkKTsKKwkJCXByaW50ayhLRVJOX0lORk8gImZiJWQ6IHN3aXRjaGluZyB0
byAlcyBmcm9tICVzXG4iLAorCQkJICAgICAgIGksIG5hbWUsIHJlZ2lzdGVyZWRfZmJbaV0tPmZp
eC5pZCk7CiAJCQlyZXQgPSBkb191bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKHJlZ2lzdGVyZWRfZmJb
aV0pOwogCQkJaWYgKHJldCkKIAkJCQlyZXR1cm4gcmV0OwotLSAKMi4xOC4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
