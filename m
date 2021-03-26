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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609C8C433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4031261A24
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhCZOwG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhCZOvo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:44 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C2DC0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:44 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id x7so5893198wrw.10
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4EQdWnddGJ/kQ9X+WOHcXmmOLEE1Ao3uU331cQ38SAg=;
        b=enao8mgcKZYIHmmSc8fP82R7Uvh5QdsPispc717XCpG6siaR54TOWpeF3DKjpLc+Ja
         79PmIeugt5218rNrH3KIVqmI4FL2tBxuFWQOx9vj5cNY35FpMtFflT+pwLSoJb8Sy4vO
         19mDrwlvSEu2rNPMAOwxQvhBH+9dCBWXkq3wU3gChs9cFfxr2UHT6LRktMB3c18OxpiZ
         83CE5WA6zDOlCUqEzGPIJxd4v00sdapJ9CTurSR+brPo5AYl8C2gjeMaxps4vHQ/4L5H
         2F9TY+3AcZ29uI1ynUFfPSaE0IdvTxFQbR1qE7gb43l9+vZnXbFsd/xyawtRdSAdzCK0
         Ec3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4EQdWnddGJ/kQ9X+WOHcXmmOLEE1Ao3uU331cQ38SAg=;
        b=DYPyrUDA1TM7Srcv4UB5deROOOgua5RR02cRFTd/f+rXLWe7WoXv4tcNbEBo56VuGF
         e6FLorXQ5hHJFJrChbd92ZYQ9M2Gevg0nLZdrQrNPm3PN09Ejn4hSupa308Pm5ii+e3G
         Y30Vp8cExwzudf99PBiaWn2Izeg4Oejzua0++1K3P/9dw46fb59ZJeqbZTfJzRsuFcSV
         ff53P7DLvhhTOvhB37swkyddWvFGaAetFIxu6HxcXj52iosqEez/OU4etKq7qKQ2vOCg
         KYxieHV2QMfTVJAxhs6vN3XP6hwcIrHySVSWrrg/AlJzTqNIcE6uUTIFAyTM+fyO1Lp+
         M3jQ==
X-Gm-Message-State: AOAM5327OwLn2Ov51gMrB+r4Gaz2GpZdMA1Hwq0mtUN572Lk9kmvGFcm
        ROAMAfkIVNK0Cr1LF88coj8=
X-Google-Smtp-Source: ABdhPJwiV0JfMVHYmX9QVc6SlgIQK3InJMu/Yympz5YY5VgTY6Mefe9ZAZ/YHRIpFZvbvFX+mH+RMQ==
X-Received: by 2002:adf:e391:: with SMTP id e17mr14934194wrm.285.1616770303332;
        Fri, 26 Mar 2021 07:51:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i10sm13028664wrs.11.2021.03.26.07.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:42 -0700 (PDT)
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
Subject: [PATCH v2 06/10] drm/tegra: fb: Add diagnostics for framebuffer modifiers
Date:   Fri, 26 Mar 2021 15:51:35 +0100
Message-Id: <20210326145139.467072-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add a debug message to let the user know when a framebuffer modifier is
not supported.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 01939c57fc74..350f33206076 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -86,6 +86,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 		break;
 
 	default:
+		DRM_DEBUG_KMS("unknown format modifier: %llx\n", modifier);
 		return -EINVAL;
 	}
 
-- 
2.30.2

