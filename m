Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54538C433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 17:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C23E61A36
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 17:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhCZRql (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 13:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhCZRq2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 13:46:28 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B90C0613AA;
        Fri, 26 Mar 2021 10:46:27 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id l18so7236265edc.9;
        Fri, 26 Mar 2021 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=os+9/VMYzB1H1UbPnrF9rJA6nq0Q0gyQyXCcPqKK+BM=;
        b=hQ6DJEUWcpjnL3RpkG3UWrQAqrQUQDtso9X9yzDBTUCprQuGqGrjZ9Zv5oKn79891h
         ZUeZgBWGoVOm4N0D2swBM4hDtzaTynhl2fcc6fHnqijYOcG4hMnq1Wany0dPxQXyMetp
         LcDNMIRWNBQvDWoaw9kgryxpFJkIfSWU29NuNqS66A1Dctnp/QD9/ewmdrBznd/YFC6R
         uhvgQ7l7/HZGs7ZBU+3OZHo+cdJLJ2n6Q0qKfPHY+qsbrtWYmCpaCh6A94ebUBdMKuiV
         BzEcD0ZYZfCnJcKBGEzfsR7c8tSKtTxXY/tYannPhVxALvr6NtSeTlTSa+nBIXuo1fH8
         pVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=os+9/VMYzB1H1UbPnrF9rJA6nq0Q0gyQyXCcPqKK+BM=;
        b=aAvRGA4baef2YFmrInv7v/DK7eeIWoN7kNHjJS9zD8/4MOBKRfFwALrRP8/iBSzbI1
         r4Xiq0MQVJsGSojGuJWTgBD4S0DRyEja/JKUX0yLxmwbWntOuI6FGMivoMyZ6OXGlo7N
         UyvThWsnvjY3pY98lvzo4i3aCxFsh5T1nz7N6e+SPrf+Oc326/JO/M+id6PU9acbiO/J
         +Y7VD4Fu63Nb6l1tHLtAC0uM8C1MlJBv29yY2QoiJI8GJT70qJQtOggwi9J6Fvp80F7P
         Tp0TMlpoctt26EotvNHq1YX7VCMolJhfE+NyU/R1uoljRWKNw/QBZgz0nADM61Haxgj9
         p+Rg==
X-Gm-Message-State: AOAM533rFL7KIFUaE9Bz2FmHdGWmQNUsJHT3zKoVJH5hxaDnFAc0TziB
        oIs2Cocggh3wqTZMb+A3B2w=
X-Google-Smtp-Source: ABdhPJz3x7m+Qw8lw5Enn9ElN8emgSzOZE7JCPzU460kI0Vo27IaZu+GzbdQU/YFytrBXETKl7C6dQ==
X-Received: by 2002:a05:6402:5255:: with SMTP id t21mr16672315edd.91.1616780786607;
        Fri, 26 Mar 2021 10:46:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q19sm4078401ejy.50.2021.03.26.10.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:46:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: serial: tegra-tcu: Document "reg" property
Date:   Fri, 26 Mar 2021 18:46:40 +0100
Message-Id: <20210326174641.1612738-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326174641.1612738-1-thierry.reding@gmail.com>
References: <20210326174641.1612738-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to support early console support with the Tegra TCU, add an
optional "reg" property that points to the TX mailbox.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/serial/nvidia,tegra194-tcu.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
index 0a321658ccb5..8c9ed7cfaa52 100644
--- a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
+++ b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
@@ -24,6 +24,9 @@ properties:
   compatible:
     const: nvidia,tegra194-tcu
 
+  reg:
+    maxItems: 1
+
   mbox-names:
     items:
       - const: rx
@@ -48,8 +51,9 @@ examples:
   - |
     #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-    tcu: tcu {
+    tcu: tcu@c168000 {
         compatible = "nvidia,tegra194-tcu";
+        reg = <0x0c168000 0x4>;
         mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM 0>,
                  <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM 1>;
         mbox-names = "rx", "tx";
-- 
2.30.2

