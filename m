Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32111C001E0
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 13:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjGGNRV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjGGNRU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 09:17:20 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6EB1FEA;
        Fri,  7 Jul 2023 06:17:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fbbfaacfc1so2983796e87.1;
        Fri, 07 Jul 2023 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735837; x=1691327837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+1LFMubo++ug8jFRY3vtws8bJ8kHKDkjh6RHI+s+u0=;
        b=oyVuJzRPJgC7hcc98TTUhLl3fE4ZILQcPbRP+U9DFibE/aqPlk5QnLRihDYlTdiwSd
         lNPkZQ1BET0GsIxp+7Zca6NXJ0x5Q1OcbeSHZGBka95SdsL0/GfIdAKZLy6y+oIv0Enf
         kAD6giBXao/KHrb98xdLiJeTnH4AXQj49LIHDCUvSnLYX95viancZwUpxt7geAEgpJYF
         F0JysSxXirucAbyzBsq0CFw519V82EaY0b9OcXxoT1seUWYBHyyosy/CdjBCcONQ7Pw0
         trONk+jYYzc8zGnldgyggZgEkT4IDKH12qIa5eaX29YuH+Gckg0rw0P5ycztaEmFNDpj
         QjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735837; x=1691327837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+1LFMubo++ug8jFRY3vtws8bJ8kHKDkjh6RHI+s+u0=;
        b=Xm947dBXOgJadaBV4MAIYQCtuz19iBq+Ntxsgqx6GWVo9unmehHI7dP5T7cQUWg4D+
         uJ9ATq6SvHexaHT1sLiw+89lOoKq0mbtrnnA9ohAH0pR+tfvhHVn07YdbD/9R8qfLwY2
         49JuqBtR6rY6DC6l2En3/DFBVSFm+toUduhCQCOtaly8lMKHziGo/jcARO4eHW9DQwnC
         czbF5AbK6grm8ftifxc0RcMjnKWrWG7rwXU1owPN9Vq1B/GEeDvraNjJDqxqKxPEX6fa
         uAySA6jNgfQBObepOLRz+eTYm5izQmTw91s7AluZx1xq3RA26NFA9RBMU+d7TBw5Eb54
         usag==
X-Gm-Message-State: ABy/qLazt0uENpIBpEgt2ELog1g2uOyNdG3H3nex+A7lfhUDZyhjsMP4
        ZE8dP+dch/Tb+ASIUltHxJXv+Jq6wlo=
X-Google-Smtp-Source: APBJJlE9WmBI36/PG9IFrouyVkdDnFdNZUqA3YhK6gT85PqjNKJntBOl2kbx5ru57w2x7t+MItq6zQ==
X-Received: by 2002:a19:4f10:0:b0:4f8:5960:49a9 with SMTP id d16-20020a194f10000000b004f8596049a9mr3815966lfb.23.1688735837120;
        Fri, 07 Jul 2023 06:17:17 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b003fa9a00d74csm9543789wmo.3.2023.07.07.06.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:17:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: arm: tegra: pmc: Move additionalProperties
Date:   Fri,  7 Jul 2023 15:17:07 +0200
Message-ID: <20230707131711.2997956-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707131711.2997956-1-thierry.reding@gmail.com>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For indented subschemas it can be difficult to understand which block an
additionalProperties property belongs to. Moving it closer to the
beginning of a block is a good way to clarify this.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml         | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index c5a1ae44c5e3..1d8b99938323 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -127,6 +127,7 @@ properties:
     description: The vast majority of hardware blocks of Tegra SoC belong to a
       core power domain, which has a dedicated voltage rail that powers the
       blocks.
+    additionalProperties: false
     properties:
       operating-points-v2:
         description: Should contain level, voltages and opp-supported-hw
@@ -140,12 +141,11 @@ properties:
       - operating-points-v2
       - "#power-domain-cells"
 
-    additionalProperties: false
-
   i2c-thermtrip:
     type: object
     description: On Tegra30, Tegra114 and Tegra124 if i2c-thermtrip subnode
       exists, hardware-triggered thermal reset will be enabled.
+    additionalProperties: false
     properties:
       nvidia,i2c-controller-id:
         $ref: /schemas/types.yaml#/definitions/uint32
@@ -177,10 +177,9 @@ properties:
       - nvidia,reg-addr
       - nvidia,reg-data
 
-    additionalProperties: false
-
   powergates:
     type: object
+    additionalProperties: false
     description: |
       This node contains a hierarchy of power domain nodes, which should match
       the powergates on the Tegra SoC. Each powergate node represents a power-
@@ -225,7 +224,6 @@ properties:
       "^[a-z0-9]+$":
         type: object
         additionalProperties: false
-
         properties:
           clocks:
             minItems: 1
@@ -247,8 +245,6 @@ properties:
           - resets
           - '#power-domain-cells'
 
-    additionalProperties: false
-
 patternProperties:
   "^[a-f0-9]+-[a-f0-9]+$":
     type: object
-- 
2.41.0

