Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BB7C47092
	for <linux-tegra@archiver.kernel.org>; Sun, 30 May 2021 19:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2932F610C9
	for <linux-tegra@archiver.kernel.org>; Sun, 30 May 2021 19:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhE3T6X (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 30 May 2021 15:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhE3T6W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 May 2021 15:58:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E6DC061574
        for <linux-tegra@vger.kernel.org>; Sun, 30 May 2021 12:56:42 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id t17so2536145ljk.7
        for <linux-tegra@vger.kernel.org>; Sun, 30 May 2021 12:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D81tkCGvXzSWAObvwaaOuSmUSpOoTX5y4oeB4l92ReY=;
        b=BLEX8CY4gexNiThfWiILWu6TCNAv3Ps/RTYWT3Z6aPpGd7b5PndGFEU3bnMJCOOKQV
         /u16Pep+mpJdLq8JuKwkTFMuMIcUI4KSDv6B8VF2pHIQFY19ySlbvPxGD77KevNURFvd
         xgl4NZtvcn+HCIOJKpDdiBylUrxhKw+z9GaGtf2ThE5Mh7RtA9AtBH14lbcjpSaKnwbK
         lB9aWQhpL4K5OlTT+Mrhp5smRvc7GHpXUxJDA/3Mk9pgnwrrjWV0Hpex6GCwxilL8etu
         yDH9X3CHhdFJptWTUOwzNtW9P2v1vTE4KV7vEPOlSW+/dTAApr7QqKKGRM48OMSMcOSS
         7+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D81tkCGvXzSWAObvwaaOuSmUSpOoTX5y4oeB4l92ReY=;
        b=Tm3fgNZ5jLRlIOsoYXQaW/DzO5Mz6WGJH877TMvlzTALBEYyhEm/zcRu7NEioeG/Q4
         e/GYjlqBBIS/JCmwJNiXb9vADYAY8MJ2TiVIf49XytAV9ch2kMiu4kE/VoS4R3khx1/O
         qNIbmmNwEnPBQI8rOphiDEJ5q4ALdEKUzwWR5zwdJbdF2JoKgwuHXEdSHCP7XVz1RiZv
         HfVrenjuImGpKtovu3ly7EDvCShodkifDav3878xwOiMSOG/ethdPNCCNYIq5aVFAEWx
         3FK3ets12Qk6wGBxENe9cL0JRh9QwbLKTXhltTs+PeDqa3fNLA6SDsXVYDTH5/18tZwn
         4w8w==
X-Gm-Message-State: AOAM531OywwWBbWnif69SfvqGvi05vA8C/3YJO4/zPi75ACS3RRbVHWe
        4eLVn0K33WTTE8nRuI8QnFg=
X-Google-Smtp-Source: ABdhPJwfr39KewKZkvjI8u/JePNezVfJTcOSzxX02pjxKhqCnMhaT+T4nfJ5zOmjtn00KBp2QEne1A==
X-Received: by 2002:a2e:8797:: with SMTP id n23mr14210761lji.248.1622404601004;
        Sun, 30 May 2021 12:56:41 -0700 (PDT)
Received: from localhost.localdomain (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.gmail.com with ESMTPSA id z20sm1332398ljz.33.2021.05.30.12.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 12:56:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
Date:   Sun, 30 May 2021 22:55:06 +0300
Message-Id: <20210530195506.19124-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The format modifier is 64bit, while DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
uses BIT() macro that is 32bit on ARM32.

The (modifier &= ~DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) doesn't work as
expected on ARM32 and tegra_fb_get_tiling() fails for the tiled formats
on 32bit Tegra because modifier mask isn't applied properly. Use the
BIT_ULL() macro to fix this trouble.

Fixes: 7b6f846785f4 ("drm/tegra: Support sector layout on Tegra194")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 87df251c1fcf..0cb868065348 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -25,7 +25,7 @@
 #include "trace.h"
 
 /* XXX move to include/uapi/drm/drm_fourcc.h? */
-#define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT(22)
+#define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT_ULL(22)
 
 struct reset_control;
 
-- 
2.30.2

