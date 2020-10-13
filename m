Return-Path: <SRS0=bDis=DU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02D3C433DF
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Oct 2020 09:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95E74207C3
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Oct 2020 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602583146;
	bh=qlxobwjWhl2P5iAy5mCVmz0GY1/JgqsIlYnM3d89OYM=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=vawpE9OCM5Zi9ygGlAYqlMlhm5Uz6EdB2rdkR6dzAIMRLOSpcf7gG8oShJK0h+nG7
	 QlredDAfsrd09H4OQT7ueTHoqi3r/t/aHbxb3ER+sKMeEVlbjIZPJCD3gfGeQV9ok/
	 +QQj0fOdpNZ2q0eJJOwpIHsAaT9V129TC1SjMWCA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgJMJ7G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Oct 2020 05:59:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:47962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgJMJ7G (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Oct 2020 05:59:06 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5029205CA;
        Tue, 13 Oct 2020 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602583145;
        bh=qlxobwjWhl2P5iAy5mCVmz0GY1/JgqsIlYnM3d89OYM=;
        h=From:To:Cc:Subject:Date:From;
        b=dbTg4mokRxYkLgRJy29fjf7imyGO1f4KoJU1nlJJ1/IAUbgikezwaq6bgWeyeP871
         EaYsVhPW1aP8N4wQHfbjNI3b1HWhLchpJGnCTnHwEEa47pOE8iTF/xxpC2s1z8Fk+v
         QvePW3GXSU68N7D1EYQB+OBIqVROf7H0NKwyXlD0=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=hot-poop.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kSH5C-000nBg-Ro; Tue, 13 Oct 2020 10:59:03 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: tegra186: Add missing CPU PMUs
Date:   Tue, 13 Oct 2020 10:58:51 +0100
Message-Id: <20201013095851.311478-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, nkristam@nvidia.com, skomatineni@nvidia.com, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the description of CPU PMUs for both the Denver and A57 clusters,
which enables the perf subsystem.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 28 +++++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index fd44545e124d..6bb03668a8d3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1321,7 +1321,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		denver_0: cpu@0 {
 			compatible = "nvidia,tegra186-denver";
 			device_type = "cpu";
 			i-cache-size = <0x20000>;
@@ -1334,7 +1334,7 @@ cpu@0 {
 			reg = <0x000>;
 		};
 
-		cpu@1 {
+		denver_1: cpu@1 {
 			compatible = "nvidia,tegra186-denver";
 			device_type = "cpu";
 			i-cache-size = <0x20000>;
@@ -1347,7 +1347,7 @@ cpu@1 {
 			reg = <0x001>;
 		};
 
-		cpu@2 {
+		ca57_0: cpu@2 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
 			i-cache-size = <0xC000>;
@@ -1360,7 +1360,7 @@ cpu@2 {
 			reg = <0x100>;
 		};
 
-		cpu@3 {
+		ca57_1: cpu@3 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
 			i-cache-size = <0xC000>;
@@ -1373,7 +1373,7 @@ cpu@3 {
 			reg = <0x101>;
 		};
 
-		cpu@4 {
+		ca57_2: cpu@4 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
 			i-cache-size = <0xC000>;
@@ -1386,7 +1386,7 @@ cpu@4 {
 			reg = <0x102>;
 		};
 
-		cpu@5 {
+		ca57_3: cpu@5 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
 			i-cache-size = <0xC000>;
@@ -1418,6 +1418,22 @@ L2_A57: l2-cache1 {
 		};
 	};
 
+	pmu_denver {
+		compatible = "nvidia,denver-pmu", "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&denver_0 &denver_1>;
+	};
+
+	pmu_a57 {
+		compatible = "arm,cortex-a57-pmu", "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&ca57_0 &ca57_1 &ca57_2 &ca57_3>;
+	};
+
 	thermal-zones {
 		a57 {
 			polling-delay = <0>;
-- 
2.28.0

