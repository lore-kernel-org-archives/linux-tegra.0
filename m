Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E21C433E3
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D20A619DC
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbhC3XFa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 19:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233093AbhC3XFU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 19:05:20 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F88CC061574;
        Tue, 30 Mar 2021 16:05:20 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id 7so17620203qka.7;
        Tue, 30 Mar 2021 16:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vD7aA50daokeImwQI/Xuv/wV35uFSogSSArZHXkVpXw=;
        b=MqAir8VAOaL65B4g4ozKoGcvXhnOh/80s/TvA2rdwPF8krxAlGRhiMEq0ngiPLdb+A
         VdT1kXFKLA4n4+n+ZA/rMF6Ak3fwvpLHTAyPBqlxaQlpe4HHe38O5q2VY3W1W7pgtXS8
         2JC+tpstL+OQzP6v8LsGuTkE+ww0+WYVgUTO/EdWXLdGRoAC1qGn8KT3guxnpmoGuVB+
         Vy7KWIX8T5XqherHj4V8RWyPm07wR5h5q0lOtxFztPWqQiFR+ykqjLRdIydFT22zo6wD
         1nz8FaRTHH3CaQEMdPy5LiTBeiueY4rFPABW7pcmwtniqP/7WjKctwgw36gvDeDCJIV5
         1gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vD7aA50daokeImwQI/Xuv/wV35uFSogSSArZHXkVpXw=;
        b=bD0GmaegB1VMQhoPBIli+XPeZge+OHlFu8WJu0Ai/u6dqON47xUAMfPdglAZnay69f
         4ffl1Edu+N08Sbk9/VCJKN6pJ0I/FsbxX0SQcUXxQNtxIo57Jade8jiTrV0DVmh5VHzn
         NzypiVf4xhYSw5MYZiY2HpiR3saU+Zhc7czjWblr7oqAppLnNS8pNIE1WZFrkKL7dR2d
         hff6ljegI87iyD5kksU69oycZsi8B56bhzOMVhQesyMx3rm9+jqhbQAtiuH027LPMgAU
         dZ7eSkaFxuVpOo3WiARH5vt4jHud2Rmj8M4LZrgwlMOShZFJ/dj3aNVSPP+stiJzfxUr
         m2SQ==
X-Gm-Message-State: AOAM532jzlISBd43xLukjsKxWu6Flez2mY4n+CiKoADgegDbJWgRiSAv
        IFAhfiKO6D9Z1pdF8Wyt1nmj5EV6SYI=
X-Google-Smtp-Source: ABdhPJwKDAX9PJmdWpyX7H4JrqUrvt8DXbd3FGqPIdAaJcaGE5kGnEbINmXluuR/7TSeRzEnzLcGmA==
X-Received: by 2002:a37:7985:: with SMTP id u127mr587652qkc.333.1617145519481;
        Tue, 30 Mar 2021 16:05:19 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.gmail.com with ESMTPSA id 10sm160061qkc.83.2021.03.30.16.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 16:05:19 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: memory: tegra30: emc: Replace core regulator with power domain
Date:   Wed, 31 Mar 2021 02:04:41 +0300
Message-Id: <20210330230445.26619-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330230445.26619-1-digetx@gmail.com>
References: <20210330230445.26619-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Power domain fits much better than a voltage regulator in regards to
a proper hardware description and from a software perspective as well.
Hence replace the core regulator with the power domain. Note that this
doesn't affect any existing DTBs because we haven't started to use the
regulator yet, and thus, it's okay to change it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-emc.yaml    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
index 0a2e2c0d0fdd..fb6af14cb49c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
@@ -39,9 +39,10 @@ properties:
     description:
       Phandle of the Memory Controller node.
 
-  core-supply:
+  power-domains:
+    maxItems: 1
     description:
-      Phandle of voltage regulator of the SoC "core" power domain.
+      Phandle of the SoC "core" power domain.
 
   operating-points-v2:
     description:
@@ -241,7 +242,7 @@ examples:
 
         nvidia,memory-controller = <&mc>;
         operating-points-v2 = <&dvfs_opp_table>;
-        core-supply = <&vdd_core>;
+        power-domains = <&domain>;
 
         #interconnect-cells = <0>;
 
-- 
2.30.2

