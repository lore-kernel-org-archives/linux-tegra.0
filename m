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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EA6C433E5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 184C7619A7
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhC2TrR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 15:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbhC2Tq6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 15:46:58 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA69C061574;
        Mon, 29 Mar 2021 12:46:58 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 184so17235900ljf.9;
        Mon, 29 Mar 2021 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C4GHPpzkyHtlwelWWh2GVIiRpMBP8m1U6hjGVol+xG8=;
        b=ViAeN+Bvgp8XqE3Jie/o+s3zn3NdCl4piicYQB4Jn7S13J4hWdrtdVcsXqgmiEvJ0G
         infdcxHA8riGnPgxhoibZV0g+caLz2WqKFIU+0WLkLmv8EZRtS2R1wd5/YLi8CIWQd5R
         pkRXm2vx6I+0xyd14aIo5kgQrYzbJoeK4kaSTPqf/zC/U/TOq1Dqu4PdXSDnAJ15QDJw
         7hA9AkqWjHsBuSL2MNqKS7bWtYO0LozDhsFrswjYEAPhIVlXz7KudM0B4e22FSE0EHhn
         V3tOVueOJtUtnLUVDcunTaSVmtak4IA8IFlQo7stQLbDHi7Rpx5tZbRquTRL19SwSpVT
         N17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C4GHPpzkyHtlwelWWh2GVIiRpMBP8m1U6hjGVol+xG8=;
        b=Tdh0Fx0ZKwHVehzeutEecyz+eCOAUbp/SANQXHvBCPoenPxpqK9giVahSNLdR95K2X
         fPGNa4qUq9qwzm+Cc5OBf5l3ccmCzgdT1rEhm3RYRFXtHwn2X6yiK0GTOoMft0WF2UG8
         50zeIB+BDARXoOcrbH0tHpk+9Omhwn1k8i3G2ccRsVmyMLxCGBS+ZFp3mjUI4fcXRBPM
         KL4hqyIZPTHKkDSd9+RhDJGTB+NvL1aygsRXnjxQFRSSS6Icm1y4ve7jOBcpk554s4Tu
         ppvSTci++Hi04NZI5/RLHYXZR9oZpQA+SCGFuMNEdSnEOATcPw2W+1MOzOU08IfH3d80
         Cvtw==
X-Gm-Message-State: AOAM530mwmjnprtLWfcJKGE3MBjYLQPTqg76L/Ka9KqGmPnb5rOFQCDK
        kOmZi+NNRHyt/rUa6VIKBWE=
X-Google-Smtp-Source: ABdhPJzatMI4dwqZCfNHMPiPeR74Z1k3Oe9EznLkzfkoR84QROokFIXymhoyPDyFMdkXYIvdwo2K9A==
X-Received: by 2002:a2e:8984:: with SMTP id c4mr18014883lji.456.1617047216606;
        Mon, 29 Mar 2021 12:46:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id p24sm1927693lfj.76.2021.03.29.12.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:46:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/6] dt-bindings: memory: tegra30: emc: Replace core regulator with power domain
Date:   Mon, 29 Mar 2021 22:45:58 +0300
Message-Id: <20210329194602.17049-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329194602.17049-1-digetx@gmail.com>
References: <20210329194602.17049-1-digetx@gmail.com>
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
index 0a2e2c0d0fdd..4a2edb9b8bdc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
@@ -39,9 +39,10 @@ properties:
     description:
       Phandle of the Memory Controller node.
 
-  core-supply:
+  power-domains:
+    $ref: /schemas/types.yaml#/definitions/phandle
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

