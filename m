Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C7EC4167B
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Nov 2021 14:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355559AbhK0Od6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Nov 2021 09:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355058AbhK0Obv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 09:31:51 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EA0C06175E;
        Sat, 27 Nov 2021 06:26:46 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id u22so24595137lju.7;
        Sat, 27 Nov 2021 06:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MVMeO5TsjpG7X103IJ0vtCcKisfNOPmQ/M/aYmMnN4k=;
        b=pPhpTSNLK1J4Kqw9WoHHLWWJ50NlLUtfzYhEK38Rj4jCoi1vvASrL0VVW/ZPKv0tBO
         CnpG88BupjH05BbX2Ms5t2cir9A5uH/TXYrtwprGrVXB+vZkPKM1x84qtumttgGQURgE
         sqfs8P6FiTYmyrGHzG1AzS44xyDJX6faCBydWcWFfhxVDtT0MKPZ5FRc2NoQiwy8qSQB
         ++7EF1+3gshiYsoX44/c795qe1cXYZJWS0ZofEAfB5Ukahlb+5uB0cayKbzoHJh0Riw1
         WP1jbbk7kJqgT2HlJ7Lsq//cOSEAIIhzR7/RQ01XNbiM1GTARY6OJK0Fzw49IHm4NZT5
         P3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MVMeO5TsjpG7X103IJ0vtCcKisfNOPmQ/M/aYmMnN4k=;
        b=EuffCjrsn0ORZJSlfivCZ+79nuoWpRR2ISTWhOQnciwuzj99elXXSt45mt/FLuoho0
         nW11m2v9o6AcVVMDbLI5l4TThF7MRuHmb7vnfYzzdggONsyQhNhS5xg6+Jy625KY0Wub
         uPelaYK3iV9AQUnPCrUVnBREfyzjTrhnK7g22iaAHbj8c+/SWZpdH+HgQeCeRqxApYV9
         o9qpQpO6013n5kbBXcCPGP095CmWbpx9YSWuX6cUXEffJ3GxPG8T/RtCSLgWfy4YIYTx
         sn4WdWNrZh40NU/YIZH6MqTKkyxLDmiC8gxeuVYQDl2n1tjZP0Qqn70AaxRoh9aRgorb
         ZYqw==
X-Gm-Message-State: AOAM531sTBg2w7Tq3T3h0aAdTXRZX+6Y2DDXZtbwiL8iy6yGAYyy67Tu
        7dHrUdZJuA6+v6lkUdoPssU=
X-Google-Smtp-Source: ABdhPJyvdMzCuUTbkmi/liPKZZXlKJP0I+2pXAuIwXf7cUcJDOQrU+0daPcxHuLQlVSQan8pHNOdOA==
X-Received: by 2002:a2e:815a:: with SMTP id t26mr37372758ljg.79.1638023204837;
        Sat, 27 Nov 2021 06:26:44 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t22sm812382ljg.83.2021.11.27.06.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:26:44 -0800 (PST)
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
Subject: [PATCH v3 13/14] ARM: tegra: nexus7: Drop clock-frequency from NFC node
Date:   Sat, 27 Nov 2021 17:23:26 +0300
Message-Id: <20211127142327.17692-14-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211127142327.17692-1-digetx@gmail.com>
References: <20211127142327.17692-1-digetx@gmail.com>
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

