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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DAEC433E2
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7770619A5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhC2TrQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 15:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhC2Tq5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 15:46:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D445C061574;
        Mon, 29 Mar 2021 12:46:57 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b83so20187141lfd.11;
        Mon, 29 Mar 2021 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hM3oGGoU1XkWBbm6zDENhRNBn2pOgCUo+5XYNt0fTmQ=;
        b=PB5h8/lD6VvVkOUIdgs8MTpMyJqxXTKQk1gU4v6u2fhm4XtBGcbIq9C/Tx83IVMUXp
         UhmJ3W5MWwEwApsS7Huiz4DXViQVt19QkgmXhlwn21ldRpHL2+T5g0Gph7sql5arJmTp
         T8e7v2BR67NPt/2f/Kl9tzncmgiMi9Rdr+f5WE9pTraxyCTA8FdBoem1qbSNWlyllUQG
         HtTVa3XppaFOgmB6RWTYB4nikxKuHArrxcWjvhKXftVYFpyPSKt9Wbt/O8cJaQv9hujc
         LyP1L6HDCMApsme5A4yOUBF1dkm0MUC5owyA3r7lk9tqk5LK02Ov5sExyJWyVT4eDWkF
         OToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hM3oGGoU1XkWBbm6zDENhRNBn2pOgCUo+5XYNt0fTmQ=;
        b=I1o7p8pAHYFcR4fNXJlBipNIx8NK5Xg+N2ACgUHd/f0e4it6gzqbY7f+bTQkPOErII
         jn5GX/49vu6ruQhRDAH7LI09Z+80b/h8Oj7hbE53tl0wNi4gOuqaLEW+PmpSH/feEOJK
         LZUDDlHytDFfgQA9xoIkjokVfy3FWhKQwijXk7WSBkWHcNbMJQl/z5pOjg+E77D3jXhM
         kXBZM/vPj2+9apn+D6di5onCMcsYE1Gs6EEQFQKseL/wV+bCKRgV1ApxBXEyf+InEtWw
         fbM+Ha0RWLPa8mFKHJPg2VpX1bKWMSSLSkP+a5gsQgK0OBQj/Hh8ayY0skzWjDmXFxfT
         d5mQ==
X-Gm-Message-State: AOAM530O0pxTF39hxcCCakSYt2slvTxnphIcIjU9J7bCh+pmoFMdOpR2
        9/a80gcu7IvEokA8vJFIUrI=
X-Google-Smtp-Source: ABdhPJxHpZTLl/I/lv0DPyAJlLmEOLIJ4LVMVb9DSCZZKXvIJ+nI3qIE/eDqwswAcxNRkinKM41zSw==
X-Received: by 2002:ac2:485c:: with SMTP id 28mr16948442lfy.68.1617047215725;
        Mon, 29 Mar 2021 12:46:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id p24sm1927693lfj.76.2021.03.29.12.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:46:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: memory: tegra20: emc: Replace core regulator with power domain
Date:   Mon, 29 Mar 2021 22:45:57 +0300
Message-Id: <20210329194602.17049-2-digetx@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index cc443fcf4bec..d2250498c36d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -23,7 +23,7 @@ For each opp entry in 'operating-points-v2' table:
 	matches, the OPP gets enabled.
 
 Optional properties:
-- core-supply: Phandle of voltage regulator of the SoC "core" power domain.
+- power-domains: Phandle of the SoC "core" power domain.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -48,7 +48,7 @@ Example:
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		nvidia,memory-controller = <&mc>;
-		core-supply = <&core_vdd_reg>;
+		power-domains = <&domain>;
 		operating-points-v2 = <&opp_table>;
 	}
 
-- 
2.30.2

