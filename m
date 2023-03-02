Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637B3C6FA8E
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Mar 2023 09:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjCBJeB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Mar 2023 04:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjCBJeA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Mar 2023 04:34:00 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D2514EA2;
        Thu,  2 Mar 2023 01:33:59 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id g3so9565068eda.1;
        Thu, 02 Mar 2023 01:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677749637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKDeRQ/4JLfwuQ8OdxmCXpTuWBhIo0gbvATYdHXRLEQ=;
        b=ih++S7fnHJ04ORwtbMTVqTpMuwCk2PKSX2FYJZwPgekoz7g0cQPGQzc2nhQYXcNM1v
         yM0FkuIfoR8tOZyrmx6Pp/yrRPgiaEz1AHO+m19e5GGmN4dewrMcdVlP5jxv4yg0h2eD
         klBXvzpL9bq2zdKggZSWOzM8B/36dLcB52UpSzmfBqusi2bniiXUoJTSlbFrZYxioOu7
         jtCk2NwWb66fhIThXaxfCJ5wUNXGM/LLaOETMXEtxr9DicP+Ha6NBTPSdsfXGDGqVA0X
         oLRDaQueRbp6Wu4NRvW4E/1Kpa17NlSZpZGDmxTScoTpiNvWalxJ42fQjP8icKBv+6D8
         J+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKDeRQ/4JLfwuQ8OdxmCXpTuWBhIo0gbvATYdHXRLEQ=;
        b=5N24SeAA7Dy2t/l/Q3UdYWo3eGoLcTZ9PrZpQ28KGZnBaQc4iVTg8l9GYeDPyg+yWK
         usiFApinLOuZCS9xdej9y1l58Cx2rruW5HoadOPAxpXfwTv8ovheOA2YKGmLlUuxMLrW
         J/pdkJxJYuozZZmpCn7VR+y1rPrXGrnY6fZVWeEwMMHXAl2Bi/eg4R1VBTNXg+x1Xb/c
         29oD3YfMdlL46XhIVxieeTAyXqbcdw95aSelos42kKoZ1WLEkntugWyOduQSMfhcS8NT
         4L3+v7UH8oKJ/xU76o+JIW71jBRjXRQkLYW2hF5LFB6K80ylPYpM1GNoPZTDNxi/eiHn
         Eezw==
X-Gm-Message-State: AO0yUKVEEVTbsI6yWv7XncJjb/qrJnUBX+JOagdDZJh2Ge1Qtfw+nkyU
        YrkJ3NjqUUSVsgD29s29+4E=
X-Google-Smtp-Source: AK7set+SvI+Kkueg3IpSyU/iRjuqghNL9lpO9dAXmgvOIQ7kroCKqlb02D4T9ERKJu+x7FPQuyiGZw==
X-Received: by 2002:a05:6402:416:b0:4ad:7c30:2599 with SMTP id q22-20020a056402041600b004ad7c302599mr11097738edv.13.1677749637208;
        Thu, 02 Mar 2023 01:33:57 -0800 (PST)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b44-20020a509f2f000000b004bf76fdfdb3sm868339edf.26.2023.03.02.01.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:33:56 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: tegra: Document Jetson Orin NX
Date:   Thu,  2 Mar 2023 10:33:50 +0100
Message-Id: <20230302093353.3873247-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson Orin NX is the latest iteration in the NX family of Jetson
products. Document the compatible strings used for these devices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 939a77c767bb..6c13d5e5719a 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -213,5 +213,9 @@ properties:
           - const: nvidia,p3737-0000+p3701-0000
           - const: nvidia,p3701-0000
           - const: nvidia,tegra234
+      - description: Jetson Orin NX
+        items:
+          - const: nvidia,p3767-0000
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.39.2

