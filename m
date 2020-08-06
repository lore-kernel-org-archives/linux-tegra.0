Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F13CC433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 760B920786
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7wcRa6H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgHFRHC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgHFRGk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:06:40 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1445C0D9419
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:42:48 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id qc22so36027777ejb.4
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XFcClscJS4TxPRCGlprREAg6mwZmwfJwsz8vYdc5Kfo=;
        b=O7wcRa6HvK9LHDwJimUJKuxn2RXnp7BXl0Hcu1cwEBz/DdywDQYNg55+HKFggrZtum
         zDApmY37orzfz+AHYNKFbV06UD8wBLux06SZ49r94apPHzDsblZXbujLqMfhZBGgxeSB
         Yi0m9JMB8ZvbAve+igkhnQ5yHVPAwusQX3QjXMidiOUF4TQxw5V+TwcfQSJZY3qQVhys
         QjmYO8seZO4Uk7W5zfxuwFxg51lpfX3IzwXyp+eCQ3/j4cQVz9L1JWki3TrzBZgiWxTy
         B8JWuSq+uPA4wuKMoBMG/qlQN9NXKW9ElJYlHQjjhr6h0wsQXA6/73ZecnyNT+hR4cyM
         qOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XFcClscJS4TxPRCGlprREAg6mwZmwfJwsz8vYdc5Kfo=;
        b=T5pZEj3mZzjTo9w42inA07tKzFnWw+xp0rKcBFRfKx1uSYYrEKPdRT9yoOdWaHhC8d
         31LJJPz4hTYYNhAO/xFDRsyhlQqbP/NKTSSmBF+WY+18RrqNc8B7Q1t4vTdniy1ENpJM
         NNALBR8EQMCsJKGObOFVDA5TGOwjFr9jnINEdnh8yrv8sHvhCIId0XA3IPOScHrqQoBm
         rqNwhgBStwFLCzSsGsEAyEoNrl0RYZ4Lzm6jWsm4T0iyZNwudCcGnku+Y1tiY13gAZfM
         LCtzcpFAMX+DogY5I6gvGQOVOIsAFWdJNWUIUQug2SUC6EutleX1wsDFahjGa9WXfQuf
         5glA==
X-Gm-Message-State: AOAM531UqprdqTcB3wCrW6ziXwoFZT2K+UBOhfjgOkNUaw5Gh1QKxpQf
        ZW0Ix0IgPbU5YPRUbSzI77M=
X-Google-Smtp-Source: ABdhPJyY/DhXpibGe/toWZh36aEQOD4ZOVZ5hafHnKi5RIZFuKx7C8vPXAUaf4Ag4OzrT50eFwP17A==
X-Received: by 2002:a17:906:5812:: with SMTP id m18mr5066860ejq.66.1596728567712;
        Thu, 06 Aug 2020 08:42:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q21sm3862238ejr.75.2020.08.06.08.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:42:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Use valid PWM period for VDD_GPU on Tegra210
Date:   Thu,  6 Aug 2020 17:42:45 +0200
Message-Id: <20200806154245.3930633-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PWM on Tegra210 can run at a maximum frequency of 48 MHz and cannot
reach the minimum period is 5334 ns. The currently configured period of
4880 ns is not within the valid range, so set it to 8000 ns. This value
was taken from the downstream DTS files and seems to work fine.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 6a4b50aaa25d..85ee7e6b71ac 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -337,7 +337,7 @@ psci {
 
 	vdd_gpu: regulator@100 {
 		compatible = "pwm-regulator";
-		pwms = <&pwm 1 4880>;
+		pwms = <&pwm 1 8000>;
 		regulator-name = "VDD_GPU";
 		regulator-min-microvolt = <710000>;
 		regulator-max-microvolt = <1320000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 2282ea1c6279..195a43e2356b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -818,7 +818,7 @@ vdd_cpu: regulator@5 {
 
 	vdd_gpu: regulator@6 {
 		compatible = "pwm-regulator";
-		pwms = <&pwm 1 4880>;
+		pwms = <&pwm 1 8000>;
 
 		regulator-name = "VDD_GPU";
 		regulator-min-microvolt = <710000>;
-- 
2.27.0

