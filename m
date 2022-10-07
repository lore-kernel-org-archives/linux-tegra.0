Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDE9C433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 12:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiJGMuW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiJGMuU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 08:50:20 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65CD442E74;
        Fri,  7 Oct 2022 05:50:06 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id j23so5469997lji.8;
        Fri, 07 Oct 2022 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f59EU1a1WnDP8FmZf3wrh4O5KrGlofpHUXUgEfyspJQ=;
        b=CLZRyqPhA5+M6uyWDg31r6F8m+wKuz4Ptz9QRZt1FtszgNSWuDe5YGR3aeXy6AcqKT
         9tOE+oHq71rji+2VsBi5nKN5iHMLBSeUkMBJFFz+0ivIJRjXu9Kj9soi41d9E1xo65QC
         EsOszCdKg8/8ejmsZ+fXL92Os6Z2ej9gn1sJYMqJLIS/RzwHFWeEjbCLhXXQ50kWYDJl
         dzx+anyHHwGvYJnFoC3GCmOw/kY+iPbdje81zsQEfcnU3tK667WRAKPvl+jbImBNLlSq
         cbxGJh61HQ3VB8T7VReug6JcELNSW7Ng/KgSNbbob6ktvF+UVt7pFPg7+Yln2vqdNypH
         wNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f59EU1a1WnDP8FmZf3wrh4O5KrGlofpHUXUgEfyspJQ=;
        b=hIRDeB6djaOc6zgci6yG9DhO1QgT0sVbbgkkiVwfjT2/OAmu3fINsAVG3ztK+LdAgh
         74JZYziTGLESrGYwBlFZZex/i+9LNmM3ynlAkT2+gho3BCausPUtwDEVg3NNFmoBdpZr
         Z7vSnW2+HmmZgdzi/lE7LJV7Jonpf3wUM/3T1ryGWx7zeFPIhN3U6w5tuADTABJ27ymI
         t3BYvqvLouiauk1SVkVsnMwgg7O5G/02pJ1oRbLACa2/vxGdZD2gVVkGIWp7NrrG57Ed
         42l/f+YPoEa4xEfBe8L1EieIS2qgLwc7WgoPsX5SF63i5JZdH6A2IAk0qA48LxVl6ZEt
         vwmQ==
X-Gm-Message-State: ACrzQf2pNX4aCXNrMU1QXkOBOfrEBOHd+MsQMayNSe4wWAnIfiBoot4R
        j1v+EjKj66f3kFjTM7tyylo=
X-Google-Smtp-Source: AMsMyM5SeUv5h3OUh7LPJ7KiK1szc0oaT23XlSZ9LQ469HdOnpVCJpK8bPnerKLBmkxqF7Uxlp8l/g==
X-Received: by 2002:a2e:bcc3:0:b0:26c:4c59:75ed with SMTP id z3-20020a2ebcc3000000b0026c4c5975edmr1564412ljp.505.1665147004219;
        Fri, 07 Oct 2022 05:50:04 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a21-20020ac25055000000b0048b0099f40fsm281404lfm.216.2022.10.07.05.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:50:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 6/7] drm/simpledrm: Support the XB24/AB24 format
Date:   Fri,  7 Oct 2022 14:49:45 +0200
Message-Id: <20221007124946.406808-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add XB24 and AB24 to the list of supported formats. The format helpers
support conversion to these formats and they are documented in the
simple-framebuffer device tree bindings.

v2: treat AB24 as XB24 and support both at the same time

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tiny/simpledrm.c       | 2 ++
 include/linux/platform_data/simplefb.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index cf36f67d22e4..ecb303c89320 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -559,6 +559,8 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 static const uint32_t simpledrm_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB565,
 	//DRM_FORMAT_XRGB1555,
 	//DRM_FORMAT_ARGB1555,
diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
index 27ea99af6e1d..4f94d52ac99f 100644
--- a/include/linux/platform_data/simplefb.h
+++ b/include/linux/platform_data/simplefb.h
@@ -22,6 +22,7 @@
 	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 }, \
 	{ "x8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_XRGB8888 }, \
 	{ "a8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {24, 8}, DRM_FORMAT_ARGB8888 }, \
+	{ "x8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {0, 0}, DRM_FORMAT_XBGR8888 }, \
 	{ "a8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {24, 8}, DRM_FORMAT_ABGR8888 }, \
 	{ "x2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {0, 0}, DRM_FORMAT_XRGB2101010 }, \
 	{ "a2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {30, 2}, DRM_FORMAT_ARGB2101010 }, \
-- 
2.37.3

