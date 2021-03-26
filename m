Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8B5C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 19:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7E3161A13
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 19:51:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhCZTui (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 15:50:38 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:33317 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhCZTuG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 15:50:06 -0400
Received: by mail-io1-f51.google.com with SMTP id n198so6635965iod.0;
        Fri, 26 Mar 2021 12:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QMADa3hLSWQ6fsdPZyxglXagkduiht0CfsajenFjEE8=;
        b=IhQY693YZqnTE1PDJBeskfLwXVvZVmAsx9jZmKO0NYZoWlsEbDsdfxIdpAK7Oq5MmW
         8fWy/7y9sJEzndMauJwNRWMUFOlKNWj0wz4GsThq/vckNqbo6cPdVPLsURrrVXJ7BhbM
         RZCQJoU+7uell97DqummmXz/GRXzz3fMVzkIP6/wO0OnGyD5yQfYbhqV1noCAieIR7yE
         fTrHA6lHbO6ugFMTdzet62EBp35I5nPCt7T3grCspggR40Bq5aSTvdhZw8los0thptiY
         Cht/Z0YcKQav9V2Lb63MNInDgbawrM+ELT75sSq1TNMxP75CJtzQCkmm10c3N4A5DjTR
         sNRg==
X-Gm-Message-State: AOAM533loejv2Oj9QrGaeoZbpFnJ9oKmGz2qj6xO/AMsm5ZSq7OWuCfd
        GVzR7Rk/yUxop4YYji5Row==
X-Google-Smtp-Source: ABdhPJx+B5BxlFABLodj85dQF/ZfrrYTvXbR1H6ArMkSNfY0AO+aQiPUFwiyecNqyYOc/2oHUxRoVw==
X-Received: by 2002:a05:6638:2603:: with SMTP id m3mr13456452jat.64.1616788205884;
        Fri, 26 Mar 2021 12:50:05 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id h2sm4645441ioj.30.2021.03.26.12.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 12:50:05 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: nvidia,tegra210-ahub: Add missing child nodes
Date:   Fri, 26 Mar 2021 13:50:03 -0600
Message-Id: <20210326195003.3756394-1-robh@kernel.org>
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
v2:
 - Also add 'dspk' child node

This patch ideally should be applied before this series[1].

[1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/
---
 .../bindings/sound/nvidia,tegra210-ahub.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index e568d6c7dddd..1118a9488345 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -69,6 +69,22 @@ properties:
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
+  '^dspk@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra186-dspk.yaml#
+
 required:
   - compatible
   - reg
-- 
2.27.0

