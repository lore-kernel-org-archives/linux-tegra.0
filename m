Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAD0C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AC24619C9
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhCZOwF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhCZOv3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:29 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537C4C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:28 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso5059769wmi.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dexBEjYiMkS4XXfyY7Y63BCfCtQuPvt6wAmmNMM9uiU=;
        b=sy0LpR6CO/+hGOGtblTJwkDRNfJ0OIYrkXpVb7gzm3NNWD+WbbNHcwjYquArjfkiLp
         3pqD/CIluuv2EH803a7w+8Zpruec3tTOpAo2v9DrUADG0Q1vvvb6t5KkdWBVl4aszjOs
         8WuiMFf8IJtBqfs2rjLhZBYeUQfTVeyUxvSLw2XQ/Q8x3QoT1c5Zb0O/zTD2e59YE3b8
         vRYwATWOzwE/06IhBA/Zbcvh1dmygCiWgw5r3tqYHhKd2DJ2O1zNkA77pygVOqb6CQMf
         Bbhaw4FCKRLPrklpt3UaeOBU5OtLlHNLwHuUVla0NBptfyCpPdwIetjAufT1nb2/0A4/
         wBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dexBEjYiMkS4XXfyY7Y63BCfCtQuPvt6wAmmNMM9uiU=;
        b=OYmExo6A2oF5rVGmXx422tSX/UBUnl/cJ2UYxjIrKvLXJRkZyZClMa5Cu5vJb+xQBq
         ypgTl4iFRFg55th3wGbntxM6frWUXSHXQ08ftMjTv2nzkeCj8rCvvfcZib32iSGtuha7
         OJ5bsd2DqnIgb6n7t4VDYIoB3ezg9UtmTQD8aHasNUrnfEajpTdTvDbxFj7J+jVI7ALb
         kWM/Z2sTWH0lY9EPQTxE+FTop8ACBR2y1Iss++Cpr9ygEhQRIekpQwJqOn8BpBYKJMkz
         DKEPwug+ZqGBqoV6K4LBmZgzwZHa3ModtDft+2lK9ow6QcaKF5qHE5mrMxxmzZmpPfHn
         22BQ==
X-Gm-Message-State: AOAM530saaQdtL/K2DodHteH7rAzeLTeyjLu17IVSu0LKQTVTpoToHL1
        CH5d4SSKNR+EDbKGOvaDr5U=
X-Google-Smtp-Source: ABdhPJyAMzgOJyXp6zRFVElVkH/XLVwQcbL0T9qq9DXloPusNrJUNrrxtee7Loh7WIWQCUuT5ehcaQ==
X-Received: by 2002:a7b:c083:: with SMTP id r3mr13414453wmh.177.1616770287127;
        Fri, 26 Mar 2021 07:51:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r16sm8022566wrx.75.2021.03.26.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 02/10] drm/arm: malidp: Use fourcc_mod_is_vendor() helper
Date:   Fri, 26 Mar 2021 15:51:31 +0100
Message-Id: <20210326145139.467072-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Rather than open-coding the vendor extraction operation, use the newly
introduced helper macro.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index ddbba67f0283..cd218883cff8 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -165,7 +165,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
 		return !malidp_hw_format_is_afbc_only(format);
 	}
 
-	if ((modifier >> 56) != DRM_FORMAT_MOD_VENDOR_ARM) {
+	if (!fourcc_mod_is_vendor(modifier, ARM)) {
 		DRM_ERROR("Unknown modifier (not Arm)\n");
 		return false;
 	}
-- 
2.30.2

