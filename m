Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C66377ED4
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417779; cv=none; b=eebHAxi29niy9IZAWtbBqIcl+KqULOz1ZrC67jeODCFw+QV64hXnVqa4ZQsTL0sAltAFhL3dioIzPKrBJZ/EdCTL9FK7yBD729+qAy8BkeDu/Mz8TjSEaHXxpo89NfWPuWZKzmhtXFdEFRpfom0YJRhu9WL5lGQY+ws6m7k07b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417779; c=relaxed/simple;
	bh=FzaaA8oyQ+zKZNM1VMh3E01ofgfkWOkBgZAPrI0ucuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLfEa/7D2gYfyhOqKgGaxQQyqQg5tQneAmCFuM/7JV4ThhcbNQSJ1rjF2Risy6t2Gu55fCmK1nIjRb2t5Dp2gVA8s2xv56iLt5oTfABznVj9MrA92sZNnQre0P2Z+xHjPJ1Ut9+2jSaw+s5kAbX8HSTA+XBDRHoEz7m9a2F8roU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1Z5N5GP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1Z5N5GP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7181805e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417776; x=1785022576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=c1Z5N5GPwun56tkXeaL69vJvD2b0x05WOcKURcROA3KHGHT/xyQk+VoloT6W86mdOp
         ECshGY+sQWRylsCjUwj/EbO5t0IocpxeDG77ucNsxHH5JdaBN/tJciTHKBORCpgtxdKW
         WFtSKIOuccB7AhCjBt/8yMdzlKIC0utd0iBQr3Vn+jZGedpFKezZIWUFPF/WFiadVWwP
         ofKqKXhV52gyQ4BldIzLHRjWl4lXCdmoRUuvniKbh62UU2G8WC8HhgPQ8VoRSor0/FUu
         5peDvlv0mCT6e3OMca8J7OO+fD6kdaMc/6ZkzIVN5oUlAMjWztUpVkS6O8F4a2qe4K89
         rNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417776; x=1785022576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=aZmEntd1EgAOigyr9sibXU+OdD0m3PDmHWt+gpvFJh9oQqmhKTiBdDBe+o3od3bfSZ
         gJSrBrWHPYn6cCIzDpMHfJ2A2EKakHIRdKJJaKUO8+1FVIq4OqLZf3RVip7FglH3Dalb
         NeWoytGrNTaFCuBvm6LTLxI7yiDAZswCzgg3lsF0o5SuzCKPczVPhGvN8hR58DqDMaHC
         ecBvmYQ2l/K3u3Ja0JJUl0Lk3FKeGnJbuhF2gLyf3xR0yAT3SrhaN1EXbYOfuUmw7gMs
         DrRT6PCmwo8zzdywad+gSZdZoJWBvo3uwzsoibAAjqKdpEv9liC9YXivvf7oxduagJxd
         00NQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnpsPTVVCw+1iwFxL9bwvlxqAWo2LIb3YY8ZzXt/uUZarx5gTza0IKd530/CNPEXmTxQKFYfi0GYbkdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJWh5CuFJ7ZCIcSpKc07LCHSdUNPZSTiXhRrjzaLV9UV1RcloY
	igXbG9hqAfqTD241Jj7HhcfOtx/TkeZRRNauyHoETpjthhUrIyT6fB4/
X-Gm-Gg: AfdE7cmEhvUa0He5tETJ52Rd0t0i8vYM+N73oj1BPU+qKmcp/dHTBRVjUJcpTPPj+l2
	ziDWmWQwzsej1jiKwLQ5R56ojPC5krga2QYM1fYEHIKJGmvTbGHtow755APHFiLFcyI4kLWKUU0
	GL0DNfAIZkRgIkjAnXgpSqK7Hn5nCAq+KrE8ihnlAHEIEUbSxwh7V+0BjZ8kU+9sGSrc4zNKHo0
	+nHoTWUTHDMXv5jWgeloEzM2JC9qNfoZzJa1Wy9hJZnIuR4xtN1F1Ykkpp9dVyLEj2rnu/c2lGv
	lrmboMQzj8R8H543QPndBS0rnAiQIf4drK0htTOI4ffnuTnU+FNFh+5ZnA/VwHW30N2KTV7qtWy
	QW4Z2iYHIIWnBt0zNP0lA81sX6Chr1zAbyHwnwA0yI80PQtTPrd1udUxsSEabASLFnTTXcihlLP
	VEEEcXGV3msA==
X-Received: by 2002:a05:600c:4585:b0:495:3eb2:b763 with SMTP id 5b1f17b1804b1-4954a50c51bmr85840985e9.21.1784417775709;
        Sat, 18 Jul 2026 16:36:15 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:15 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:36 +0200
Subject: [PATCH 05/15] drm/kmb: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-5-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 59d0e856392f..13adba96bc78 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -14,8 +14,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1427,6 +1427,10 @@ struct kmb_dsi *kmb_dsi_init(struct platform_device *pdev)
 	return kmb_dsi;
 }
 
+static const struct drm_encoder_funcs kmb_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 {
 	struct drm_encoder *encoder;
@@ -1437,7 +1441,8 @@ int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(dev, encoder, &kmb_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		dev_err(kmb_dsi->dev, "Failed to init encoder %d\n", ret);
 		return ret;

-- 
2.54.0

