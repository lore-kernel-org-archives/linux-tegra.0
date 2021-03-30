Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2BFC433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 373F5619D3
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbhC3XFb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 19:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233095AbhC3XFW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 19:05:22 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA5DC061574;
        Tue, 30 Mar 2021 16:05:22 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id c4so17628347qkg.3;
        Tue, 30 Mar 2021 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Imb+SxWawi3m+n6OniYBVnsTMCYaEIQpp22RBVSMzAM=;
        b=Itbh3/9/RALYOzdolSO2nsBLW03gGJ1fQEUQA46bC214y2FEovgqv45PtwlB9sJIKi
         ZdW4Yo00WQUwLi7kDUUTn01POJqLPczxv4eW36SCgsESTRYu/sFQgUXp58Y3uyLu1Kba
         5/jVnnykfSMxASShe6Qdo89itr8Q4tYE/Dx3whG41qll1ZiKoV0iAtMuHc6EjQQBU+6P
         lfh52Pgch3A4XHZTUtMJPIx7ZOZ4k2VDp5CLEPjkqc+pV44d0EGCBDeDq9vSIBaFkCLn
         g5fTZx1codAPxLCKVUgjw2nEcmueOh38+19/1UyD+OHlmIjW/YYvDTA7H+aCOOHdbGTa
         pQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Imb+SxWawi3m+n6OniYBVnsTMCYaEIQpp22RBVSMzAM=;
        b=at2iR9jFO8sFNY0LYY4U1CTSu9qY1YZAMqiv5idvyW9e0K+p9ywc6PU2DOVXC6y7I3
         ZXKm7jcezmdSkkPxRMz6Yd8e8DDTdn0urLjKvV2wmXZ17e5VPrJ6DD8e63BGCtuPHLYZ
         sVBBOVp+KSzl0vCuGeLhmgpipZ+GKQRwCZHmxNh7YSSqyXTMwczqBvovZ+GsYndCAABh
         RZPl6AK70GI86+gXy5xi9YHIop6KuhM6kH9Ea5mDDZ6GfdhvmPB0mIYh2ovc5+jF3ksp
         X9b0qBqW4zeed293AjkkoPRAcLfSm5dRwZrxuhBeMDmgFhtLMYsfJu44m9J/5HZh3x0E
         OSNA==
X-Gm-Message-State: AOAM5301YGEicHn0vkcEI7sdmirazA6WSH7wIBZXeo2tGffxdJpNxoRK
        9dojimQC+jal06611KUa1IU=
X-Google-Smtp-Source: ABdhPJxrUJ+ar8QyG4UdQ3cyz0VLG3P5m+8L9hEXsgj+6piU1K5OPjBdKOef9lGY8RwkexA9hbe+Kw==
X-Received: by 2002:ae9:d60a:: with SMTP id r10mr559154qkk.411.1617145521509;
        Tue, 30 Mar 2021 16:05:21 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.gmail.com with ESMTPSA id 10sm160061qkc.83.2021.03.30.16.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 16:05:21 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: memory: tegra124: emc: Replace core regulator with power domain
Date:   Wed, 31 Mar 2021 02:04:42 +0300
Message-Id: <20210330230445.26619-4-digetx@gmail.com>
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
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 09bde65e1955..9163c3f12a85 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -37,9 +37,10 @@ properties:
     description:
       phandle of the memory controller node
 
-  core-supply:
+  power-domains:
+    maxItems: 1
     description:
-      Phandle of voltage regulator of the SoC "core" power domain.
+      Phandle of the SoC "core" power domain.
 
   operating-points-v2:
     description:
@@ -370,7 +371,7 @@ examples:
 
         nvidia,memory-controller = <&mc>;
         operating-points-v2 = <&dvfs_opp_table>;
-        core-supply = <&vdd_core>;
+        power-domains = <&domain>;
 
         #interconnect-cells = <0>;
 
-- 
2.30.2

