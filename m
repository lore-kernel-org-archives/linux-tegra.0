Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC294C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 20:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97C70619C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 20:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbhCWUAi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 16:00:38 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:45700 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbhCWUAI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 16:00:08 -0400
Received: by mail-il1-f174.google.com with SMTP id v3so19287664ilj.12;
        Tue, 23 Mar 2021 13:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2+gwQRwJup3xL0mb4hvSYNYdy7ZwaZULvsFMgTdxQKI=;
        b=SBHqAfGLTTbRlzheLNnHVGPIw2vUBuFZFSEaF0QHk09yas/QlbMTHLb53q7fX9cvoZ
         0BSQIoGQZ8yX9j9BQAleTQeHLY0u73BXl1eKQnA0EM/a/goB2AVro5ndoEitj427a8N5
         CnvmZM2AYbAahU737ucjJnuDYBb58T1fJrErBjNbnMUqBLI+/Dj0Jxcx5h23M9i5xTbA
         OZxoROMbieO8svLnNqBdvSpF0S/XdRmHAPDDLNeO0Rrpybs3F2u5oBCkzHIisrnhnkyt
         VxZMVI8376qT/EISzzo/DKgUpEpsgxoM+myknU2W+RgLxcSlW0Hkhd4gda64sZ07/s/x
         zjwg==
X-Gm-Message-State: AOAM530V16Yn9wG8m9aHhUfQqj+iMtJSVAHH594aewgr7XgmFzTuq4vU
        J0QjQL/2o2cBzuKg95/A8A==
X-Google-Smtp-Source: ABdhPJxWk785Y6kqJD0UsIL60c05TtY//Srf33pd4qaDjuUZKvywgeZNaFjKz60gvS9yXWkKir9BwQ==
X-Received: by 2002:a92:c24c:: with SMTP id k12mr6327880ilo.282.1616529607734;
        Tue, 23 Mar 2021 13:00:07 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id 13sm9766293ioz.40.2021.03.23.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 13:00:07 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: nvidia,tegra210-ahub: Add missing child nodes
Date:   Tue, 23 Mar 2021 14:00:05 -0600
Message-Id: <20210323200005.1196572-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The nvidia,tegra210-ahub binding is missing schema for child nodes. This
results in warnings if 'additionalProperties: false' is set (or when the
tools implement 'unevaluatedProperties' support). Add the child nodes
and reference their schema if one exists.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This patch ideally should be applied before this series[1].

[1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/

 .../bindings/sound/nvidia,tegra210-ahub.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index e568d6c7dddd..d7a5eb77ed4f 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -69,6 +69,18 @@ properties:
         $ref: audio-graph-port.yaml#
         unevaluatedProperties: false
 
+patternProperties:
+  '^i2s@[0-9a-f]+$':
+    type: object
+
+  '^dmic@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-dmic.yaml#
+
+  '^admaif@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-admaif.yaml#
+
 required:
   - compatible
   - reg
-- 
2.27.0

