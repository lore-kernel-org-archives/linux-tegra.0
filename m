Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637C9C25B4E
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjATRbU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjATRbR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:17 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDC08BA89;
        Fri, 20 Jan 2023 09:31:10 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id g10so4656915wmo.1;
        Fri, 20 Jan 2023 09:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBbS1vR/mSuCPWTVaI9sYUbEGcKE+xDxJZ9yOEMjCrg=;
        b=qjJVGDJH0jKQ0b4gzTbkmZrDvUkl0cBq7dqS3DzmJkGXk0cUiGw8MiLlBytpyxXpe5
         nPd0+VJ6zqdQsWok6dWwpaQBGSKGsvLc4gOrnwT1BVZvQK+0aLewi7lVVZHJUFxJPn06
         g41pppSD132BYkYxl21lBvFQjz6pO66N66lmvbCaP3vkyAEGnAD2nlCuZ1R5vEuUmPxZ
         2KTrzvHbb3+2zUKcoGlUfsJmTEiwjhSdt2OYDX1MXzRcV6vsbD50CYFwRnlVDpQNTUq2
         QwOeJ4cLfmobuPYC8LGX27KOOZ0rqd+21etuwUqfegxoR29BVSHH88bVUIv61f2xTjHx
         edOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBbS1vR/mSuCPWTVaI9sYUbEGcKE+xDxJZ9yOEMjCrg=;
        b=fqB1jCDpTP2QFOmX0O/tCNdjD1o07GaoIFh2DNmp0LJZZRkeT2DwZJbA9/WhCHj57X
         UBP1esBnEL64MdLVLY/r0G3Qy350yU1SqNmWykgVyZBL9v7l0RHmTTJl6DMEOEBniAuW
         FZkWxv+SQw50xpzxGB2Jdfi5CSVdfN9KZ6DSYK80DXNt/sby5HduFDJvFpHCi+kXj2Xc
         HEE0l/ig1vqAqGsrSDIaN+d28MLguPgDq7YuN13RelkJPE5b3/hgW1xW228dxZYOBWT8
         59Kz4KYsnG8bALeFWJYiffiYDBItGSRj3Ms4ioqoi2US/HmodgAgPNYSlomBVhOfCEv8
         Vb1g==
X-Gm-Message-State: AFqh2kqUaQTLK6OtK3mUuVrWsGViqBAHPj3OyCpJsP3m2Oaqzrma72KS
        lRRhx8FzocM271GWmwuAxuo=
X-Google-Smtp-Source: AMrXdXsbFPG+yPqtgN9BXP7pJsSnwZmnCuFETW1Ckv3V7VUiLfVY2ra6BoEUOfuxX5YKtYvRx/HBcg==
X-Received: by 2002:a05:600c:6006:b0:3db:21b8:5f58 with SMTP id az6-20020a05600c600600b003db21b85f58mr7162938wmb.2.1674235868713;
        Fri, 20 Jan 2023 09:31:08 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w4-20020adfee44000000b0029100e8dedasm36214943wro.28.2023.01.20.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:08 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/8] dt-bindings: display: simple-framebuffer: Document 32-bit BGR format
Date:   Fri, 20 Jan 2023 18:30:57 +0100
Message-Id: <20230120173103.4002342-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is a variant of the 32-bit RGB format where the red and blue
components are swapped.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 3e9857eb002e..3c9f29e428a4 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -99,6 +99,7 @@ properties:
         * `x1r5g5b5` - 16-bit pixels, d[14:10]=r, d[9:5]=g, d[4:0]=b
         * `x2r10g10b10` - 32-bit pixels, d[29:20]=r, d[19:10]=g, d[9:0]=b
         * `x8r8g8b8` - 32-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
+        * `x8b8g8r8` - 32-bit pixels, d[23:16]=b, d[15:8]=g, d[7:0]=r
     enum:
       - a1r5g5b5
       - a2r10g10b10
@@ -110,6 +111,7 @@ properties:
       - x1r5g5b5
       - x2r10g10b10
       - x8r8g8b8
+      - x8b8g8r8
 
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.39.0

