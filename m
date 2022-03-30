Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF88C43219
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Mar 2022 11:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344117AbiC3Lvn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Mar 2022 07:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343894AbiC3LvA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Mar 2022 07:51:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE15270864;
        Wed, 30 Mar 2022 04:47:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A49F261618;
        Wed, 30 Mar 2022 11:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4363C36AE3;
        Wed, 30 Mar 2022 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648640874;
        bh=22FrN/fWz3S0ZkinV5860q4c/43ru8CkhvglXdQ49sk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HuL/0NrBFbDSnMXIRsjhmEvu3Kz41ce4AKSHX59DAfPQog56fdTQPcTJ/Ctf8IdZe
         QwZ+HPGOXEBghaQo1HTt37jJMZ4mHMrRfg+zXFHL/4tIsZDcPOl7GRenqIRlC+7RRL
         VufQ9mD+Db7ZWqyT7eAXrQhG8+ZBiUF943qp4dNmfERK/7uR+k24EbwsSVuHVfckrm
         l9JoFCusjgrSTpInvdHq5RYNO4ZdaWJQOYo8Oi2PscDj077GOnnLklDvP/MTj6FgT0
         AbEBdQ7GjQAJ/EK7n23gRxJroo0k6DFr5/J6NZWtFtYY/AIRDeybigc8c8UfyWl3h3
         qh/Mk6ZnPQj8A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, robh+dt@kernel.org,
        mark.rutland@arm.com, linux@armlinux.org.uk, swarren@wwwdotorg.org,
        thierry.reding@gmail.com, gnurou@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 43/66] ARM: tegra: tamonten: Fix I2C3 pad setting
Date:   Wed, 30 Mar 2022 07:46:22 -0400
Message-Id: <20220330114646.1669334-43-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Richard Leitner <richard.leitner@skidata.com>

[ Upstream commit 0092c25b541a5422d7e71892a13c55ee91abc34b ]

This patch fixes the tristate configuration for i2c3 function assigned
to the dtf pins on the Tamonten Tegra20 SoM.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/tegra20-tamonten.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index de39c5465c0a..0e19bd0a847c 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -183,8 +183,8 @@
 			};
 			conf_ata {
 				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
-					"cdev1", "cdev2", "dap1", "dtb", "gma",
-					"gmb", "gmc", "gmd", "gme", "gpu7",
+					"cdev1", "cdev2", "dap1", "dtb", "dtf",
+					"gma", "gmb", "gmc", "gmd", "gme", "gpu7",
 					"gpv", "i2cp", "irrx", "irtx", "pta",
 					"rm", "slxa", "slxk", "spia", "spib",
 					"uac";
@@ -203,7 +203,7 @@
 			};
 			conf_crtp {
 				nvidia,pins = "crtp", "dap2", "dap3", "dap4",
-					"dtc", "dte", "dtf", "gpu", "sdio1",
+					"dtc", "dte", "gpu", "sdio1",
 					"slxc", "slxd", "spdi", "spdo", "spig",
 					"uda";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-- 
2.34.1

