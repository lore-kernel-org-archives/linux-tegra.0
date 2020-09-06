Return-Path: <SRS0=ZsAf=CP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1E3C433E2
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Sep 2020 19:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 100D4208B3
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Sep 2020 19:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSsmBZGh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgIFTAn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 6 Sep 2020 15:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgIFTAl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 6 Sep 2020 15:00:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1922C061573
        for <linux-tegra@vger.kernel.org>; Sun,  6 Sep 2020 12:00:40 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u21so3335082ljl.6
        for <linux-tegra@vger.kernel.org>; Sun, 06 Sep 2020 12:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Ps58tk2sA1scjdNWdVYBMUoco1/1sCgkm/dm2eifWI=;
        b=rSsmBZGhASU/7JHt/1nKFUaOK1jATFGCZdDWbSUwVLeEMyRcwlbAgJfwMbMrbqGpoE
         FPT2w1kM2SRzdyUQc2xApkG3f/SB1EPOg9SAk3l73HZln1eSOflD1qf9k0A9r6ju6I/o
         6gyQFu0KbJVjfV8uWBP51osDbaKUfr8V7Z95YdtfKsKvubeNG7JIUfKNUM4oG0fsrGlJ
         JLJDXw9VdRmkf5s53azAEC4i02TZMd3BGgs/8cjmYLpO/ezGqknTtgREEtWpou+KYg34
         kwL46VUXsr+jAvmiyHhmh9Vj7FH77rfgZRuZQjNsRwTR0yNlXcHcGs/dz0hpLELSTFgx
         YiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Ps58tk2sA1scjdNWdVYBMUoco1/1sCgkm/dm2eifWI=;
        b=I0fGh680dkB5D8ka9f/89zQrPaT5AEgFt77xapJseKuWBRe/+IIIGwM/a5CYLn2IS7
         WhlfICEOpUhQteG11QM1d7UBr5poqZ4AnQKNFeFmfFkFQv2iU/YE1c0UWbGR5b4kMc2m
         1mt3eeduJzIFMHdlwSWn6WQEMULNIqlK39ohulOQXx0I/AP/Y8d3UpfIkwwJ6z4xoT5C
         17VERuEdgv3oiVI0nf5t7jnQDGhdB/22qKrm9bOB3FcCJ05hcgHIHFU6756Bn/feRAS1
         PTrzfKuBABM5CFNWc+ZYJzlYZTdQwBM3A/7T7juTGa/D+PEq6mtNMXjCiVTJnbkjL25l
         48Qw==
X-Gm-Message-State: AOAM532Ud9pdpQNE1JqySfNhA+DZWG7K3PYJ4+uesW50U+OZ3blldhLy
        QnPhy+yEMBpVyR5vIIjfFcpc0fxq+A4=
X-Google-Smtp-Source: ABdhPJxOq9V3Ded+JjOe29Bp+arwMr31vwI9ud1zCZGMJvWuERHlXihmER2JWTfoi4Wa6XWQu9EyEA==
X-Received: by 2002:a2e:7307:: with SMTP id o7mr8448284ljc.323.1599418838958;
        Sun, 06 Sep 2020 12:00:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s8sm2900756ljo.11.2020.09.06.12.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 12:00:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] ARM: tegra: nexus7: Add aliases for MMC
Date:   Sun,  6 Sep 2020 22:00:06 +0300
Message-Id: <20200906190008.25247-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

MMC core now supports binding to a specific ID, which is very handy for
embedded devices, like Nexus 7, because MMC ID may change depending on
kernel version or configuration which affects MMC driver probe order.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 21387a91c40f..ca44f9596753 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -16,6 +16,9 @@ aliases {
 
 		serial1 = &uartc; /* Bluetooth */
 		serial2 = &uartb; /* GPS */
+
+		mmc0 = &sdmmc4;	/* eMMC */
+		mmc1 = &sdmmc3; /* WiFi */
 	};
 
 	/*
@@ -970,7 +973,7 @@ brcm_wifi_pwrseq: wifi-pwrseq {
 		power-off-delay-us = <300>;
 	};
 
-	mmc@78000400 {
+	sdmmc3: mmc@78000400 {
 		status = "okay";
 
 		#address-cells = <1>;
@@ -999,7 +1002,7 @@ wifi@1 {
 		};
 	};
 
-	mmc@78000600 {
+	sdmmc4: mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		vmmc-supply = <&vcore_emmc>;
-- 
2.27.0

