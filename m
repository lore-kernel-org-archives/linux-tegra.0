Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66985C6FA83
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 16:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbiIEQdT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbiIEQdP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 12:33:15 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3977D4BD25;
        Mon,  5 Sep 2022 09:33:09 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id cu2so18209140ejb.0;
        Mon, 05 Sep 2022 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UsGHds8dL3ejKYB+jlPaiDkEXV7AX3OaV0OJSZr3sdo=;
        b=h6e97oJcX3gPDg94V5fEFyDY6uvhG/lA7N68Tjf0PJZlq4E1xxFL1Lrk/alhEhlzyv
         XX+LMsVbaKuSSBRpIL1b1mYh0B91wBP+rtfO2E61NcPJ21Yfu/Yz9JBWND/pozn+PJm+
         a8CpHhZcwY6VcI19wydqnS6N6FS5ibM2abbNn4w9eP2A5VcgQw6KjtelDiiVtHGp+Bv7
         fNGfgbpG1sLUXWtMbTYUD46UaIyZo+zG48Bkn/dtij8k+a0AasBS50FT6YnxD5evV2lq
         Fs0egNPLhMM6W9Ii5TybY6FETeSvSbSOQB5Na0j/ALybrUkQsfiO8riV1CJ9N2Sh/sQm
         Mm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UsGHds8dL3ejKYB+jlPaiDkEXV7AX3OaV0OJSZr3sdo=;
        b=kvlcjU0xgmiifZSaY5T3bUD/GGsI1Tj+0fjs1NN2JYmdRT8UTirWVycKfhjPxmPc4y
         Z4PNJ2Gj0TsBfqU8ZHcmFCcN/bsyMiX+rahhkMWPsgPHhaz258aqtmJ9OHwk7cjNOcY1
         8ItW1ebm8L8lc/UKBPAYK3qI1mhbRsw2zW92DIemHsjxBvyWoD0+XgesR+uhkQF7oPUW
         d44OeQS9eHs1TT5rhvjCq/ox2o5wVhBAA+0tltPdvtUy95XltHSttzMMXPIaO3cYnFDb
         55ogpfDO5r7/N6DOCrnzJmDcaw5AcNztchHArUznTlgeBkO24k46RdXC+f8+koO3b3sc
         L0fA==
X-Gm-Message-State: ACgBeo0Lw8uuMa/N4V7SxjzsZFT770a2I0vqIdtUxacMfO2WPtZSFGG8
        pCWJOYkcd21k9jR1yZttxXs=
X-Google-Smtp-Source: AA6agR5AiFzASwCVW26MfoGCb5KcGtrpyNfm9M2F3k/LBi79yp5sf6vEB2XM5cter5q14y+TspfkIQ==
X-Received: by 2002:a17:906:d552:b0:74f:8506:2dc8 with SMTP id cr18-20020a170906d55200b0074f85062dc8mr11525832ejc.345.1662395586658;
        Mon, 05 Sep 2022 09:33:06 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cm20-20020a0564020c9400b0044e74c9dfedsm2828945edb.86.2022.09.05.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 09:33:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: display: simple-framebuffer: Support system memory framebuffers
Date:   Mon,  5 Sep 2022 18:32:55 +0200
Message-Id: <20220905163300.391692-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to support framebuffers residing in system memory, allow the
memory-region property to override the framebuffer memory specification
in the "reg" property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..3e9857eb002e 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -63,6 +63,11 @@ properties:
   reg:
     description: Location and size of the framebuffer memory
 
+  memory-region:
+    maxItems: 1
+    description: Phandle to a node describing the memory to be used for the
+      framebuffer. If present, overrides the "reg" property (if one exists).
+
   clocks:
     description: List of clocks used by the framebuffer.
 
-- 
2.37.2

