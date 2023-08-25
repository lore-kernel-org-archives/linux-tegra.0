Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786E2C71133
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 13:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245077AbjHYNWm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 09:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244157AbjHYNWe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 09:22:34 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1B32107
        for <linux-tegra@vger.kernel.org>; Fri, 25 Aug 2023 06:22:31 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99cce6f7de2so112061766b.3
        for <linux-tegra@vger.kernel.org>; Fri, 25 Aug 2023 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692969750; x=1693574550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/49YrZqjNimW06cF+vnlS/a15tY0huxh3tp9jjiGD8=;
        b=hLgoXa/3gicDXJ9UA0YdWtUO80OR8JXJ66SCx+TXsal85sBzoFLnbabUuI/MrETyrd
         nmLk9o+nyQZuNN8MCOTnpxD/KcwbU46nrSbjvZ9+MuN7F0NaF9CSTqlOklw5+gE8FVu1
         uX7tnJ5q+fKpEijPaNj3PUU1Zp0NbrAEpE5WX6t8Xm+5xCBZcBV5BmDk3CGNYpG+ezZK
         j4/uDIh7S9Esuh9sWLHcwmyq0pmeDmuKio2ulbjwVumWzDUYPpEXSwa0g36w0KVMIBym
         wFQjmsT9/BU1jC+oMCvkyVAKkVIREG6Ir7iZ/+nnNel7wdaDxL59C6M/c/b11f/j5QrP
         jucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692969750; x=1693574550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/49YrZqjNimW06cF+vnlS/a15tY0huxh3tp9jjiGD8=;
        b=la5wa8HjA+xJ7IS9ViIakdXPYiG5RG3y0yxQnGl5DQfOVXNGigcRpzRrZVfKkLymkq
         gocZXTEykxGkMshmoNIrQvKY6UB6HjtXrgufhqnQ296DVlapcMSxQ2D3vs+dn58fbmxw
         a+LFWgZTglddih5N7BhewA4uv8Q+auw+uDUR9dmEdpv2nZlPkfNvjXsNaaNsnJyOwbjl
         q/F95MFb5RRCfK1AiW4wOK7JjaHbxW8EkJcEq2otoE9rD3A0fk2brQWqbYUZLI9ZfU4g
         ReaTOcpTyirguHPV82YUThJEk7O0yVn2qTRHAcxERdFPO3p7z6V3UKzNE0+Bi3HOiyEe
         t7iQ==
X-Gm-Message-State: AOJu0Yx+NAs4xb5D7mkaPpQFN/6BtnyLOwcwJ1iydqOKjWjR3hYXIvk9
        xA7tCN6DxKb/QRMRsWIoUGM=
X-Google-Smtp-Source: AGHT+IHiPTg8Yu9UyjHFcEcRp7nIs2XpiN6eegnfnsUN8QcgbybMaw3YR2oSAUPJ9uJ6EDI8vm1mLA==
X-Received: by 2002:a17:906:220f:b0:9a3:faf:7aa8 with SMTP id s15-20020a170906220f00b009a30faf7aa8mr2478509ejs.10.1692969749976;
        Fri, 25 Aug 2023 06:22:29 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d5-20020a1709067f0500b0099b7276235esm961691ejr.93.2023.08.25.06.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 06:22:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Remove existing framebuffer only if we support display
Date:   Fri, 25 Aug 2023 15:22:29 +0200
Message-ID: <20230825132229.1109445-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra DRM doesn't support display on Tegra234 and later, so make sure
not to remove any existing framebuffers in that case.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index b1e1a78e30c6..7a38dadbc264 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm_mode_config_reset(drm);
 
-	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
-	if (err < 0)
-		goto hub;
+	if (drm->mode_config.num_crtc > 0) {
+		err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
+		if (err < 0)
+			goto hub;
+	}
 
 	err = drm_dev_register(drm, 0);
 	if (err < 0)
-- 
2.41.0

