Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC170C433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 12:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A3F464FF3
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 12:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbhCLM6O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 07:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhCLM6K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 07:58:10 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6E9C061574
        for <linux-tegra@vger.kernel.org>; Fri, 12 Mar 2021 04:58:10 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id z2so1723714wrl.5
        for <linux-tegra@vger.kernel.org>; Fri, 12 Mar 2021 04:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6uDJQzZtOqCqHQxlOj0SSiJNZhaoXcljRspe7yhtDq8=;
        b=Q28uiCn1W0cVaV0DtawW8Fc9F2aInKIGzCIqYqm7S9082H5f+JMC1NOvt7NwX71DZk
         Be05Y2clsg8nZFw1KynxWcn5VXAe3VtpTjv2lzAsVbpJQQhodI7WDHUS52wiL2fYBBzA
         CKPMIkZOLM8doLGCTfvEwzkaJY75eB0yfIeX3K82IGTIjOFTABGGMkWn71LugG1yKB1v
         6tVC+irwnQUP0y3je+VVg+kXnbQ+RV4XzyuV4ODDWLYt4CctdoQH9N8wykFkTSTvSeol
         df+GmeMoxR9rdGVv0kRMBU9PUpLmmocLDTw/ZOhIGShZ7bDMIuNimudeNWpBSEvWxr8e
         9Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6uDJQzZtOqCqHQxlOj0SSiJNZhaoXcljRspe7yhtDq8=;
        b=QJSogRRXW0fulOMWsaDG98AI3M+uYALeFrMbwuYrZGcMeIGnYPTaMpR5Apenq506G4
         7Kp9Kdc2vm7QggScwChd2+qkmIjCWU+HhMBnBky1vz5yJBzv5aGq9dSHd93Wys0iMlke
         fi0Ba5jmztmeKhBBd9ngeXehT7Dzyi99+zPDuGq13XqGkKzeAYDkKUc2GHqjV5f/QqRb
         umX6N1ds5tswb9YOlLdGAQb8EyvlxQQG4GxZ2Q4wFL9g6rYChKStZkwrBYVY0QrbZTTm
         2U680E86Iyao9qfzCLAMnQAU4TgeEXG7eLbmzH7Yq1Qc79bUXsIMhHJWDwBQUH32wdYK
         vnGA==
X-Gm-Message-State: AOAM532ULUeq9bifJconyhdl6wbAyxO1rbEQgp41KXBjouQn+s/t4YFc
        oglijON+rnle9Ph5sE8H1M0=
X-Google-Smtp-Source: ABdhPJzApIqUmpRupzr8vYdXw+7RVmJLjnLnl0OIt+5jhGhWQA9f7Vy5JHH+EDnWfXMZijhw0pdzHw==
X-Received: by 2002:adf:e64d:: with SMTP id b13mr14153223wrn.204.1615553889158;
        Fri, 12 Mar 2021 04:58:09 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j136sm2173624wmj.35.2021.03.12.04.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 04:58:05 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Add unit-address for ACONNECT on Tegra186
Date:   Fri, 12 Mar 2021 13:58:08 +0100
Message-Id: <20210312125808.659431-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The ACONNECT device tree node has a unit-address on all other SoC
generations and there's really no reason not to have it on Tegra186.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 9f5f5e1fa82e..683743f81849 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -10,7 +10,7 @@ / {
 	model = "NVIDIA Jetson TX2 Developer Kit";
 	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
 
-	aconnect {
+	aconnect@2900000 {
 		status = "okay";
 
 		dma-controller@2930000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 02b26b39cedc..9f75bbf00cf7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -73,7 +73,7 @@ ethernet@2490000 {
 		snps,rxpbl = <8>;
 	};
 
-	aconnect {
+	aconnect@2900000 {
 		compatible = "nvidia,tegra186-aconnect",
 			     "nvidia,tegra210-aconnect";
 		clocks = <&bpmp TEGRA186_CLK_APE>,
-- 
2.30.1

