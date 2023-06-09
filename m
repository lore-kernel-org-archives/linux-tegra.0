Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815C6C7EE43
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 14:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240442AbjFIOH5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240765AbjFIOHn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 10:07:43 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457513C28
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 07:07:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-977d02931d1so274100666b.0
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686319644; x=1688911644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1yU3QubXEzlvIVqe0FBrqWJQ2xtPQAVemT5Khnt0wM=;
        b=LNfP72yCmAwQ/v0U2ueBWosYZjMzKusItqlpre9t4oVzkDZL+BX7y5K9cViTetyZy1
         Nd2aLjrwSdkWn+lRyJgH6On1a9v517mhhB/vmSnHFEUZ5GL5NJ93F61e5NfkYfG3iGPf
         rBE4WGGRtkLC/WI5J4/uPXzMM/kBctua1vKSnKxCuTKMThA/4mcLYO3R1f3h8tYtH199
         vE8WSpt3wadApdUMtXqgosLMN+Vyhcsdne8siY9Va+9hxGCxk8JkAPwMelGt7R1h7Z/H
         DV7n766ucmb/Q1viv5C2G0x61eHgaeVBs6v0N6hhtMF6jABd429SNp4J2VJfxhr2R5xA
         aUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319644; x=1688911644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1yU3QubXEzlvIVqe0FBrqWJQ2xtPQAVemT5Khnt0wM=;
        b=gs8A1heRgz3yqT7lQTJu2Kf6Hgncokk1OxkPNs0DwnBLZPCbUwApzZPdYu6v00FdjQ
         lv2med6Rg8xqET0A1PVexilW5eycMXj7Tu+N9JOmGJVC7pAvMxicqGmGlI2FaH9LomAD
         mCcYmTzkB5t81bxa2EHfvZ9hzj9KRgwcTzfv4obUYcJaXr2yVqmrF37b7N12CR7jOpSc
         CoY9N8c74lDBx/83QZo6R7QtUmEZUxfDw4n0aN1brJOapHRzeZMo04yg97DaQiqXLZTe
         ZgXRZdAgqptYAIIxSyMFrQ4eE3cxnH8sAd+z9K38U4WuZcw4W2YZ6/JivtoEO1hrmn7t
         qAmQ==
X-Gm-Message-State: AC+VfDxlaj118cbCCosQe8GMjL8dy+IoYtzJuuIqLoLVQiIabV4b0IcK
        Jt+4cn6ZusnqiBoD4TXT7MtroQ==
X-Google-Smtp-Source: ACHHUZ5PiCvWmVfl3y4Z9+jGF1gDaeU+xAsLZ75ziXqJ08jJgC3hSe1sysIuVF/zrCK6HemswyKQ8Q==
X-Received: by 2002:a17:907:1626:b0:977:95f4:5cca with SMTP id hb38-20020a170907162600b0097795f45ccamr1762811ejc.54.1686319644668;
        Fri, 09 Jun 2023 07:07:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ce14-20020a170906b24e00b00977cc3d37a2sm1318150ejb.133.2023.06.09.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:07:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: memory-controllers: drop unneeded quotes
Date:   Fri,  9 Jun 2023 16:07:20 +0200
Message-Id: <20230609140720.64743-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.yaml         | 2 +-
 .../devicetree/bindings/memory-controllers/ti,gpmc.yaml         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
index 2fa44951cfde..f54e553e6c0e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
@@ -165,7 +165,7 @@ patternProperties:
         const: 0
 
       lpddr2:
-        $ref: "ddr/jedec,lpddr2.yaml#"
+        $ref: ddr/jedec,lpddr2.yaml#
         type: object
 
     patternProperties:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
index bc9406929f6c..b049837ee669 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
@@ -129,7 +129,7 @@ patternProperties:
       The child device node represents the device connected to the GPMC
       bus. The device can be a NAND chip, SRAM device, NOR device
       or an ASIC.
-    $ref: "ti,gpmc-child.yaml"
+    $ref: ti,gpmc-child.yaml
 
 
 required:
-- 
2.34.1

