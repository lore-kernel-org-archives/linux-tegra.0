Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07BDC5517A
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8393822280
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPBytRlt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbgKDONJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729946AbgKDONI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:08 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61333C0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:08 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id 23so23079596ljv.7
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=812JiusyFQ9WrzswHWJkwLDoaqtOd7JdwlMOTUFbkWc=;
        b=HPBytRltVM9mgvrpEM/ysWt9If/SXR3Tg24Tx0iZtNUScbCVbLVLXMqr4ch5d89cgs
         zaYBjNHJWwtavUmKV7wDvJyMegReBiBjgzERhfPHnKcT7HfYfJMjunzkZGZRnAdpHdPl
         GeWjoe1kV2Wni9sNb6+8hXbcq+adSfpyUiZ1pdv3sRbj50Ww3EBcxEYqIkuHEB9aCVm+
         3jPhaH60cwuqT2TGdOg/BSuE1CBgT/jMEKYcWLXbSBd78msUqZZdVWghkg3YSgtI3MSk
         AoCR3RaAHtYXlMdGtZfuWyv93tKoTjJNhQMW27+bqHp9TTjXn042Q13dXT9CYVwjTl9j
         DKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=812JiusyFQ9WrzswHWJkwLDoaqtOd7JdwlMOTUFbkWc=;
        b=raAp3dt4UMhC0Cc0wboIcmWSm0z8Fd5h49ib0tvO9e5EBfvtCuXW4cxniHXB8juFZF
         B0lPYZzBgpG8M72y41PE0HSu1YQoo2ctMmeKauM+qaxq3sfEn9iGkFQ6wn/JM17ISKyW
         traRaVA270itN3XEsbMnjT8NlI4k3f+EKRoLXyXsdThZEukXpF8JbDGNDELdO1syJG44
         nm60ORqp8tZWOD/ioplOQv2nfqXPerpdVmOLjaPD89beeUvhPVFR/sBJblzOQKccakVp
         aGFHvG/Er9WXSDZlys+UFMsbSseadC59wc/lfkjbix7GEFmZPhzs6oU4yS4rpoSkHKrx
         LYRw==
X-Gm-Message-State: AOAM530XksxP4da8D+bHjoSGPMuHl28oQHA45gR2AUbAVpDliU8/4WZE
        3z/hRQOCDWU1UOmsM8ZQ/K0=
X-Google-Smtp-Source: ABdhPJwhfwIfdA3jvWMtHDmP4W8goz4d9sPM08et6aUTi8KTk43QtpLyUt4bkrV8G7ggUirX+V7kXQ==
X-Received: by 2002:a05:651c:30c:: with SMTP id a12mr10352564ljp.230.1604499186940;
        Wed, 04 Nov 2020 06:13:06 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:06 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/8] ARM: tegra: nexus7: Rename gpio-hog nodes
Date:   Wed,  4 Nov 2020 17:12:49 +0300
Message-Id: <20201104141251.25834-7-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
References: <20201104141251.25834-1-digetx@gmail.com>
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
index c2b1229f0d83..7fe584d69f5d 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -91,7 +91,7 @@ dc@54240000 {
 	};
 
 	gpio@6000d000 {
-		init-mode {
+		init-mode-hog {
 			gpio-hog;
 			gpios =	<TEGRA_GPIO(DD, 7) GPIO_ACTIVE_HIGH>,
 				<TEGRA_GPIO(CC, 6) GPIO_ACTIVE_HIGH>,
@@ -99,7 +99,7 @@ init-mode {
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

