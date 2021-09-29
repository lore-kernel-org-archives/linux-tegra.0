Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00024C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 22:28:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6DBC61269
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 22:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346670AbhI2WaW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Sep 2021 18:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbhI2WaW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Sep 2021 18:30:22 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A9BC061767
        for <linux-tegra@vger.kernel.org>; Wed, 29 Sep 2021 15:28:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i4so17102657lfv.4
        for <linux-tegra@vger.kernel.org>; Wed, 29 Sep 2021 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tA+KKGOLRJY1ixD7Pul8ODDIk67Mm56gd0/u9zf4oKY=;
        b=dLxBXIwdypum+ES9aYEtVXoL6oAEUkFY0NQZFL46k5u3Zp9lqyMYUv0iJgDZ8sEuh6
         q5sntL/XSGJWcBPRKarzVKwWlu9c9OLbX0DifvgAZFepWmCuuAEQBh8ssXgRJmVyRqMm
         WtHKdxLXQ7qLY2TdeJqiNFPWcdSbFytLICHIBKvHylBzsDa6CorXj74mfThdM6ndJWjv
         jVqk7j7T0CCcvbaAaH05FYSrtUFAotwlx+OUnS+ImQg1EgYsWrR06j0uSNoXrL88+Zz5
         JAOay23HnbWiAnYFVz4Ml9XJ8sWF/I2Fm7hR5BfCexnYNjERaZg+yZiZ2LOMrSbuzCn9
         u4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tA+KKGOLRJY1ixD7Pul8ODDIk67Mm56gd0/u9zf4oKY=;
        b=SFCD0NTqAKUEDDxtiAJSRKHLhc9lHcDOnPhS20CHYIzSPSsnOuFw5RqrAPXn0zD2ab
         v+GsKu9AHgtU8fCtVTitZkFoFAxWME9yRdYUaMnPQUqC8FQBYIumijWsWqG6NIqXRZcT
         2ldgwTN7nJQ2oOrxVnTcUGI0EkyGKev6zTILkhxwGQ86NLYB8yJ/DZfp0uEjoY0Q8/j8
         s3qDs36Y+Obrv5sPuhgnXfZds8xAXmM22yOLgF20aNtZXTt//bRRK30LfRa1Fkm05hbU
         E/bFfQ8NfescdIh4w6iYiE7ZIv5Qv3XeklcauKdkJxVzJc3LEctyF6O7o3sUMvy1JnW/
         w/Fg==
X-Gm-Message-State: AOAM530OP0tu4LKs5Px4tulWVEQ9LgiALB4rabJmRIHSy0KzhrzJ5RQg
        jAKzIPZacAdD6ZPaeSpkpjo=
X-Google-Smtp-Source: ABdhPJwWK0tddMF9iQtWSoycsuyb4XD9f8jRwyNj1fwPLDeZnvbPIJpbTGCFhRmM4HJlJVCzixhSIQ==
X-Received: by 2002:a2e:9598:: with SMTP id w24mr2392660ljh.77.1632954519231;
        Wed, 29 Sep 2021 15:28:39 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id br40sm137782lfb.64.2021.09.29.15.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 15:28:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] drm/tegra: dc: rgb: Move PCLK shifter programming to CRTC
Date:   Thu, 30 Sep 2021 01:28:04 +0300
Message-Id: <20210929222805.16511-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929222805.16511-1-digetx@gmail.com>
References: <20210929222805.16511-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Asus TF700T tablet uses TC358768 DPI->DSI bridge that sits between Tegra's
DPI output and display panel input. Bridge requires to have stable PCLK
output before RGB encoder is enabled because it uses PCLK by itself to
clock internal logic and bridge is programmed before Tegra's encoder is
enabled. Hence the PCLK clock shifter must be programmed when CRTC is
enabled, otherwise clock is unstable and bridge hangs because of it.
Move the shifter programming from RGB encoder into CRTC.

Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c  | 6 ++++++
 drivers/gpu/drm/tegra/rgb.c | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a29d64f87563..a582ce28b632 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2107,6 +2107,12 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 		tegra_dc_writel(dc, value, DC_COM_RG_UNDERFLOW);
 	}
 
+	if (dc->rgb) {
+		/* XXX: parameterize? */
+		value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
+		tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
+	}
+
 	tegra_dc_commit(dc);
 
 	drm_crtc_vblank_on(crtc);
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 606c78a2b988..933e14e4609f 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -116,10 +116,6 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 		DISP_ORDER_RED_BLUE;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
 
-	/* XXX: parameterize? */
-	value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
-	tegra_dc_writel(rgb->dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
-
 	tegra_dc_commit(rgb->dc);
 }
 
-- 
2.32.0

