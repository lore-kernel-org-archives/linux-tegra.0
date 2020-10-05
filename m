Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A899C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 13:33:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ED2420774
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601904789;
	bh=1A2qwG3LybK4oPn2enZzeiwMqjcB9vJ04gRWBfbv3Qw=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=2WDj/EP3cdYwojyBEWwDZ2Ajg9bjxPfp/msSp9VRkzjV1zLgAaqa9Uq43qE4C6vC5
	 FbDe0XLj63+0mV5q21AhU3cWSYIVsgNtEier8rgIYLP2Bp0sqlCmBomVZwLQpzWi+m
	 Fv/98l3BA1WgKQp16JNvCplOobQGETIKFGPe+4y8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgJENdD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:33:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbgJENdD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Oct 2020 09:33:03 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18ADD20756;
        Mon,  5 Oct 2020 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601904783;
        bh=1A2qwG3LybK4oPn2enZzeiwMqjcB9vJ04gRWBfbv3Qw=;
        h=From:To:Cc:Subject:Date:From;
        b=DYIP8mGtj2LQeYn/yk3FAcoiuVRL/GEgJvOhLRy7ri5SpEtvDI2oXHkqH1vBdFQh1
         mf0f5FVB2e5OX+9BjbcIwpZdtSztEFtmrghyiXmAgO3dVOjUix3RBaNSpvhBKpub6Q
         kwQCV/UHkQKuglorDV1nwmBPdTmucnIH/fBGC8yQ=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPQbs-00HNke-W8; Mon, 05 Oct 2020 14:33:01 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel-team@android.com
Subject: [PATCH] arm64: tegra: Fix GIC400 missing GICH/GICV register regions
Date:   Mon,  5 Oct 2020 14:32:56 +0100
Message-Id: <20201005133256.1390543-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com, jonathanh@nvidia.com, nkristam@nvidia.com, skomatineni@nvidia.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

GIC400 has full support for virtualization, and yet the tegra186
DT doesn't expose the GICH/GICV regions (despite exposing the
maintenance interrupt that only makes sense for virtualization).

Add the missing regions, based on the hunch that the HW doesn't
use the CPU build-in interfaces, but instead the external ones
provided by the GIC. KVM's virtual GIC now works with this change.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 8eb61dd9921e..fd44545e124d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -630,7 +630,9 @@ gic: interrupt-controller@3881000 {
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x03881000 0x0 0x1000>,
-		      <0x0 0x03882000 0x0 0x2000>;
+		      <0x0 0x03882000 0x0 0x2000>,
+		      <0x0 0x03884000 0x0 0x2000>,
+		      <0x0 0x03886000 0x0 0x2000>;
 		interrupts = <GIC_PPI 9
 			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		interrupt-parent = <&gic>;
-- 
2.28.0

