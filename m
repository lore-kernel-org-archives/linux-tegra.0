Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA67C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:04:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9D2C60FE8
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbhKNWF5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 17:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbhKNWFj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 17:05:39 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FDCC06121D;
        Sun, 14 Nov 2021 14:02:08 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f18so38200867lfv.6;
        Sun, 14 Nov 2021 14:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MVMeO5TsjpG7X103IJ0vtCcKisfNOPmQ/M/aYmMnN4k=;
        b=L6sswe3/Zz0LvUC8wTQh34U0cJhZewXYzQNh13PJBoaOE1xiIPA6T7AWtP2dgVQNa4
         1eyEmMEHXROiUJxIsFDXtyMlzyYaZ+4I/xiueslnAGQ7lFOKvUtjjv3K/2+bSQexSDfD
         YeSjp3dpj8SbkmDuuWwj1gJbcy5qPBKithxNk8zKcs37+2licxf6TIJuASBZ3zh58Zuh
         gMdcq/3GojuTRl3Gp3lWFtZRbJ3Kt+j4OPN3rZNDSJKIHn4Eg2H0/GV3FLJ1Gh7tp3jt
         0UMYMmg2WzCzYki7bHacHsogPzQi8U+GRJOZlmBHuE11cJReisE1NSqonPu4gSRp/kT0
         I7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MVMeO5TsjpG7X103IJ0vtCcKisfNOPmQ/M/aYmMnN4k=;
        b=bnPdXGZAkU5DlaW5FnG7dJiarTopUoDhfIxL4yKsQOtYsaB4gerBrr7Vxg7DnH9mpz
         jTLsjnbaetx3gCy+CWefulelm1Wk8JXFWWmWqClkq31xt7fIRmlZXqNK/PkJOzGsX6hQ
         9KkIjw9Vkbof/riuAXuGEyHBOOYo76YVcXkb/dsmLvT3e3uPdCsCq2LLgJ/ATHQoSwS0
         xG5ISJdu1wfmGWpX62EdogPTPM57YfRWwpydAkH/f7Cf5E29XQR4WL/FF6BrewCJtUSM
         ZNU7JQie6rsfTdTSZh8zb7lS2to55Bxvp2/aWqX6LTf48OuG15+92ZO4AgHeC6rJEFys
         UBFQ==
X-Gm-Message-State: AOAM532/8fLULQpkw609dCVwHX2DIkU09edyF6zoAIhzRf3WgsotzaKz
        PqaIvJw+PooxL05IdL4k3CE=
X-Google-Smtp-Source: ABdhPJw2Ifp+ZZ4lDe7Ny6nGB0diJjuR0av8WUhdWFR5Bkzxgr31fS/BwRuRN8pTdK/skWG2mJ8XJg==
X-Received: by 2002:a05:6512:2216:: with SMTP id h22mr30748366lfu.383.1636927327272;
        Sun, 14 Nov 2021 14:02:07 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id t5sm1353842lfd.80.2021.11.14.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:02:07 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 13/14] ARM: tegra: nexus7: Drop clock-frequency from NFC node
Date:   Mon, 15 Nov 2021 01:01:18 +0300
Message-Id: <20211114220119.18909-14-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114220119.18909-1-digetx@gmail.com>
References: <20211114220119.18909-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: David Heidelberg <david@ixit.cz>

The clock-frequency property was never used and is deprecated now.
Remove it from Nexus 7 device-tree.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi | 1 -
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
index a044dbd200a9..564cfcde21a9 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
@@ -137,7 +137,6 @@ i2c@7000c500 {
 		nfc@28 {
 			compatible = "nxp,pn544-i2c";
 			reg = <0x28>;
-			clock-frequency = <100000>;
 
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(X, 0) IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
index a681ad51fddd..cd63e0ef7445 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
@@ -223,8 +223,6 @@ nfc@2a {
 			compatible = "nxp,pn544-i2c";
 			reg = <0x2a>;
 
-			clock-frequency = <100000>;
-
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(S, 7) IRQ_TYPE_EDGE_RISING>;
 
-- 
2.33.1

