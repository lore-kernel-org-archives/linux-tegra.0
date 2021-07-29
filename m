Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2343CC4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Jul 2021 14:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09AFA60EBB
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Jul 2021 14:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237559AbhG2Oqc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Jul 2021 10:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237825AbhG2OoY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Jul 2021 10:44:24 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529CFC0613C1;
        Thu, 29 Jul 2021 07:44:20 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id c16so7241113wrp.13;
        Thu, 29 Jul 2021 07:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QONJvagN9ws6tf6fSosJAxib6FmQVL/pCUAju2Cappc=;
        b=OhQraQEWoeuRYN19Ds7AMR7+SvajLjAHKcJZGuXkkdVWK/PTtxKc8cE8qfNueWiqQg
         hKUV2IUqQYHt9DCtA2BHMlR13ix7IVhiuQgJGW+N75Yu0CMCIrRLOlBFMV+lgwQAJVb/
         vn2W0ifo0WKnR+OO3OZapcHCpmMukO5a7aQmqnhwqSkYjDLJKhhi6QondtoGFn85jvVy
         t4twblJVYRxQEa0xN2eQ2BQo83Chr2yZJBgtRLkEd+QMUfbzAIuG2WSkzPouMUnae5SJ
         T2eVVap002Htki+P75/mjPaaFiXRClJhLw6+QIuuiFSgftLLcCdX1XIUx4/vWQpAki+f
         5NKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QONJvagN9ws6tf6fSosJAxib6FmQVL/pCUAju2Cappc=;
        b=DvZ8b1ZOPnugZ9JnymBq/WkJZXHRxhfskE3WrIrpwQgW5/jTFQDkCI1nBufU1v0m0G
         kiL+A2duEyyeI6ASmuF7OZrzcUhseae0wXiV28bb8oYznruw2+HVuy8t71qW4sNakrXP
         ix2OX2OhDZzann3/YuLzoVVSmxW7bIl5Tzri3olk7fgshHO/qpbiphbfUMn7H1/hW6JW
         oMiVnzNqNgxvLS16Lde1zGh6ShJ8SnMgiqybXjDN4CPSNM5iWqUrL54nXIsPAnAEMNVv
         7s4FIsCzdBGrK9b33PjmP4Ji3DQ4Z7PboauXABImNF08v+CLNZR4nxfgJj4ojGhmZCeJ
         eDag==
X-Gm-Message-State: AOAM532Iuyv24TCjj373W1EwExAmxC3sojUb7n8jCxKL2Evk5SkXjilv
        Z0Es8DK8S+t4Tg4gR0wAnk9QMsJYQ2akOm78
X-Google-Smtp-Source: ABdhPJyeYQP9mZmrNRMGNDAbza/Vs5f4RZMsz/ei4HZNiOV5tYzw0s+MbsAu8yiVPiLrkc/Vm8BBpA==
X-Received: by 2002:a5d:5481:: with SMTP id h1mr1387970wrv.93.1627569858933;
        Thu, 29 Jul 2021 07:44:18 -0700 (PDT)
Received: from ltoban.skidata.net (195-192-77-216.dyn.cablelink.at. [195.192.77.216])
        by smtp.gmail.com with ESMTPSA id 6sm9549423wmi.3.2021.07.29.07.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 07:44:18 -0700 (PDT)
From:   Andreas Obergschwandtner <andreas.obergschwandtner@gmail.com>
Cc:     andreas.obergschwandtner@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: tegra: tamonten: Fix UART pad setting
Date:   Thu, 29 Jul 2021 16:42:26 +0200
Message-Id: <20210729144226.111900-1-andreas.obergschwandtner@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch fixes the tristate and pullup configuration for UART 1 to 3
on the Tamonten SOM.

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@gmail.com>
---
 arch/arm/boot/dts/tegra20-tamonten.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index 95e6bccdb4f6..dd4d506683de 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -185,8 +185,9 @@ conf_ata {
 				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
 					"cdev1", "cdev2", "dap1", "dtb", "gma",
 					"gmb", "gmc", "gmd", "gme", "gpu7",
-					"gpv", "i2cp", "pta", "rm", "slxa",
-					"slxk", "spia", "spib", "uac";
+					"gpv", "i2cp", "irrx", "irtx", "pta",
+					"rm", "slxa", "slxk", "spia", "spib",
+					"uac";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
@@ -211,7 +212,7 @@ conf_crtp {
 			conf_ddc {
 				nvidia,pins = "ddc", "dta", "dtd", "kbca",
 					"kbcb", "kbcc", "kbcd", "kbce", "kbcf",
-					"sdc";
+					"sdc", "uad", "uca";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
@@ -221,10 +222,9 @@ conf_hdint {
 					"lvp0", "owc", "sdb";
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			conf_irrx {
-				nvidia,pins = "irrx", "irtx", "sdd", "spic",
-					"spie", "spih", "uaa", "uab", "uad",
-					"uca", "ucb";
+			conf_sdd {
+				nvidia,pins = "sdd", "spic", "spie", "spih",
+					"uaa", "uab", "ucb";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-- 
2.31.1

