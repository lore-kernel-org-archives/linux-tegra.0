Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A36C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240121AbiKQSkv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbiKQSku (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:40:50 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6227FF33;
        Thu, 17 Nov 2022 10:40:49 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id a5so3830607edb.11;
        Thu, 17 Nov 2022 10:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGgALic+DS30S9ojwPdceibK9s2MAtsj8xO33zz+Z+0=;
        b=N7v2MmJAOX3Kmxwd0jdOood/vNl6v21crSGC2mYfyU1BFBOaMCdfIqjKeYPA3RE1+q
         uPu3PDYPkhadmdoQuUDlVvIw1eOFBirFTHLq2MsfL0JjxvusJNCc2dvn2174kPre+Uqb
         tJxUq9Ce0hqAR7fkDjEZGmUtfVLx3JUnzl8iI9PbDY7NcJ7dmtHlpmKXDjq0xcDvzENc
         QOtOTMpPccGzZ6ScUnyNMLls09dACDKTSEJjifFV8x3MPx6CJOPx3BX8OBnZwZ1E8fp1
         YWHcB97GAXh9WAAWNCTpKl513LQkRJzatUZ+VTf+kPwb28BnexS72xWZkFgmPG0K6Iax
         tXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGgALic+DS30S9ojwPdceibK9s2MAtsj8xO33zz+Z+0=;
        b=yk4nssyF9cY1f7FqeyU+XRhMfZq7HC8UbXvnLbG4plxdFdh5tkFlz9CaFQdEDWvmU3
         MC7wYzqq0oEY4tvz4P3WWbb1IH3Q13pqaXH1KSDpuE7zD0aX3juK02sNLp2DY3Zq4cQT
         z4cHWbLUE0dBeV+1VLEs8NXyhky2G2p2BkXGZp0fzMGLzMHC6wPbqh80cXisQdfhmnRg
         Fr0DCJkHr+FpJ3/VnB7+y4Z4rGJ5uCY9oH5CN8YpHfF4JzSWAirEhrg0+d0ftcFZYIJq
         3Lmq5kBi79G+WiS96Y1Q05iT7V0TnFcoGSp9OFsOH8SQZIESSbQzQiCJT6pVF+/D4g1z
         DHAg==
X-Gm-Message-State: ANoB5pkb/A4ec+V/cICvEvkAzTdYd7VbBVjHTtPJXQeWjpTHPf37ydEM
        80Qs4YuYJUIrAn6EUB8YzbnWbUU4ANQ=
X-Google-Smtp-Source: AA0mqf6T53dT7P1u6RpvE4BnHTqtPV7QDbZHfM/zbVoHXOKBSCvcYjV8zXOiBCE4ZTH8FiwEafnEBQ==
X-Received: by 2002:a50:9fa7:0:b0:469:4e6:344f with SMTP id c36-20020a509fa7000000b0046904e6344fmr396962edf.226.1668710448409;
        Thu, 17 Nov 2022 10:40:48 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ew20-20020a170907951400b0073d84a321c8sm680132ejc.166.2022.11.17.10.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:40:47 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/8] dt-bindings: display: simple-framebuffer: Document 32-bit BGR format
Date:   Thu, 17 Nov 2022 19:40:33 +0100
Message-Id: <20221117184039.2291937-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
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
2.38.1

