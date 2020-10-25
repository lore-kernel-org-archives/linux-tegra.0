Return-Path: <SRS0=lnQj=EA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FFCC56202
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95399222C2
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWliyEWU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731833AbgJYWjy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1420210AbgJYWjs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:39:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4048C0613CE
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:47 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c21so7766471ljj.0
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WcZrfCFx5B/EypZjcK/Qk5DAcn6hfZKCRPVRuxnzPfM=;
        b=pWliyEWUE7fXIUgMlPsfheiN0HG4G08A2xl75C/qEsN8oEdb3kPNzHFXbPmjAHb3Mk
         roUge63K8t/5a5Ryiti6BWWkPRcJq0lK5c5tlmuyY7O6hwpSH0rEFWadtngiDL9lE1lu
         /mPV6/poy47R6xe1QZaGC5BIYgisPV1fezF1uHUdH6glbxWNmq/g7kd905OxPp5UmkDT
         ysPbzm7ucMOUaCYh8ZLsh/Qwkjlv3evOrpylh9qd5HbxyltbsrnOBj470tHmx9G3PYYE
         JlhIFfD9BJBmERTWN6heHnaM38U35Yde1k/SW/WQ2mS49gH9jlHw3xiuGTSPrkOHRcyX
         ouwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WcZrfCFx5B/EypZjcK/Qk5DAcn6hfZKCRPVRuxnzPfM=;
        b=DtktioC4gfcsgMVhtE10rbe7DQ2MjOf7yOfmQ3B8czPQlNUlbz+9vQVBh3l/J3hInJ
         scyO8gB2NN9FyV+ppzzAcp/n3n6FJgfIA4Qae29mM1zsg8wKqcWVG6AEaRr2csDD55AG
         iPL9/i3Q70Tol9XCXgaTJbsOGFBWeNMkz8CDR8rLX19cicZo1QM3kN88gqFcttukWS0f
         +rW6Znz6M0rMjzT3lMrQRiBdbDHOmPvK+w37oebKvTXhR0QQF7S/FxDfwps/1pG3MnKN
         Ql0vQTOxzDtg3Z7deMWVwtGDpzEyFhqFqrJ2ksqJGO+JuzTj50UqXgEQ6tXzWIjWPPxn
         0ccQ==
X-Gm-Message-State: AOAM532P96p3rF4sQNnkczpDQGjphCq5QQCoFOjYOyS0t1LWmfjVvw3Q
        o090jXrTCQzS0DUNbibAMWM=
X-Google-Smtp-Source: ABdhPJwXkQYvQ9mq+gujhyHZysbNxWlsp9O9gHcKZ3r2eHOv2v1Y/3hSVrvVODTDsoLzyrDWvgThZQ==
X-Received: by 2002:a2e:a49a:: with SMTP id h26mr2525582lji.464.1603665586266;
        Sun, 25 Oct 2020 15:39:46 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id f15sm855957lfk.186.2020.10.25.15.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:39:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 6/6] ARM: tegra: nexus7: Rename gpio-hog nodes
Date:   Mon, 26 Oct 2020 01:38:51 +0300
Message-Id: <20201025223851.6984-7-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025223851.6984-1-digetx@gmail.com>
References: <20201025223851.6984-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Devicetree schema now requires gpio-hog nodes to have a certain naming
pattern, like a -hog suffix. This patch fixes dtbs_check warnings about
the names.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi     | 4 ++--
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi | 2 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index f8a531350998..8def1d2e34f9 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -75,7 +75,7 @@ lcd_output: endpoint {
 	};
 
 	gpio@6000d000 {
-		init-mode {
+		init-mode-hog {
 			gpio-hog;
 			gpios =	<TEGRA_GPIO(DD, 7) GPIO_ACTIVE_HIGH>,
 				<TEGRA_GPIO(CC, 6) GPIO_ACTIVE_HIGH>,
@@ -83,7 +83,7 @@ init-mode {
 			output-low;
 		};
 
-		init-low-power-mode {
+		init-low-power-mode-hog {
 			gpio-hog;
 			gpios = <TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
 			input;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
index b25b3fa90ac6..17b6682ffce8 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
@@ -29,7 +29,7 @@ gpio4 {
 				};
 			};
 
-			cpu-pwr-req {
+			cpu-pwr-req-hog {
 				gpio-hog;
 				gpios = <6 GPIO_ACTIVE_HIGH>;
 				input;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
index e3da89f1941a..a681ad51fddd 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
@@ -23,7 +23,7 @@ panel-timing {
 	};
 
 	gpio@6000d000 {
-		init-mode-3g {
+		init-mode-3g-hog {
 			gpio-hog;
 			gpios =	<TEGRA_GPIO(D, 2) GPIO_ACTIVE_HIGH>,
 				<TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>,
-- 
2.27.0

