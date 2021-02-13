Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95555C433DB
	for <linux-tegra@archiver.kernel.org>; Sat, 13 Feb 2021 10:16:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B6B364E3D
	for <linux-tegra@archiver.kernel.org>; Sat, 13 Feb 2021 10:16:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhBMKQ3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 13 Feb 2021 05:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhBMKQ1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 13 Feb 2021 05:16:27 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B2AC061756;
        Sat, 13 Feb 2021 02:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ZJTqnpRPioBJYh9dZNpaJRfCxom3vgjHm1a3kM192/Y=; b=P4AlHK0AMUz3Vkzko2CSjS3x9z
        5DFHQadoLD1Bf/TJ+nkdpvSMXCKTogT0/xcx7iygx7IsLksL2/f5OOIhgDZ3uV4JMDEn0Cd7rYTdh
        SRfUtI7t2kGSOh2TJmqWxSjtOZoRj18lreet5wjdizV4ymgQXXz9CMZyr9Fv95MPVWTuf3E3X8YLt
        Kybk+b571lC62JhI5T2nswWpmXOXeJK42HRKrmMqQTLyD7Vnht0H/yNGDCQgMaeQi8NF2IU4QXGIe
        oE3naBQ1LUELlIsgaHJdj2sUAMlQEyQ5h6euyo/LSVcSEQnL/GSiYV5mJJYpagIlVJu6JqurCo+DM
        1Yo3bJZw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lArxe-0002D2-Od; Sat, 13 Feb 2021 12:15:34 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 2/3] arm64: tegra: Add NVDEC to Tegra186 device tree
Date:   Sat, 13 Feb 2021 12:15:11 +0200
Message-Id: <20210213101512.3275069-3-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210213101512.3275069-1-mperttunen@nvidia.com>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add a device tree node for NVDEC on Tegra186.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 58c51965df47..4bb6fbe6b9ce 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1340,6 +1340,21 @@ dsib: dsi@15400000 {
 			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
 		};
 
+		nvdec@15480000 {
+			compatible = "nvidia,tegra186-nvdec";
+			reg = <0x15480000 0x40000>;
+			clocks = <&bpmp TEGRA186_CLK_NVDEC>;
+			clock-names = "nvdec";
+			resets = <&bpmp TEGRA186_RESET_NVDEC>;
+			reset-names = "nvdec";
+
+			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
+			interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
+					<&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA186_SID_NVDEC>;
+		};
+
 		sor0: sor@15540000 {
 			compatible = "nvidia,tegra186-sor";
 			reg = <0x15540000 0x10000>;
-- 
2.30.0

