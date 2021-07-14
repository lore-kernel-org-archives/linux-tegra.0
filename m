Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1815BC47E50
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 19:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3C0B613E6
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 19:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234817AbhGNTmS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 15:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:36978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229818AbhGNTmD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 15:42:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB89B613D3;
        Wed, 14 Jul 2021 19:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626291551;
        bh=9Nk3/spMfVozeWDhx63OJP8tGztlAFpk4J1r7m/We0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Etk50Txt6NPCctXy++CK0UQF+kLkFOMZP9D3xZ3SY0CbkzYwsKSiXlF1TwmmNEJfG
         0FuM2AwaDvVc9AC9lAFtAeBjcBTpPgSsiQFiIme7izJ95tE5+SuRj3AUWC+AfsnUDp
         XAl7z8HQ7vmWZ+BrnQHgRQqZgn4MdERo2w3uCgsd337dN05Pzc4vLkHmL32NQYuEsW
         asIKUl7+m0xPm3fcl1DDny3ijn8wi5DLKVWGyVHjFIbIVQ/TVLIJxLVmdQVlVIA5LY
         dJRiZTkRhsjkQKIlZau5ajR0UcyOSgM9ajzA+IpnaAzZSeTz96TA6clgbcvMxjVNry
         6unlX80+EW6UQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 049/108] arm64: tegra: Add PMU node for Tegra194
Date:   Wed, 14 Jul 2021 15:37:01 -0400
Message-Id: <20210714193800.52097-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714193800.52097-1-sashal@kernel.org>
References: <20210714193800.52097-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>

[ Upstream commit 9e79e58f330ea4860f2ced65a8a35dfb05fc03c1 ]

Populate the device-tree node for the PMU device on Tegra194. This also
fixes the following warning that is observed on booting Tegra194.

 ERR KERN kvm: pmu event creation failed -2

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 9449156fae39..2e40b6047283 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2345,6 +2345,20 @@ l3c: l3-cache {
 		};
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0_0 &cpu0_1 &cpu1_0 &cpu1_1
+				      &cpu2_0 &cpu2_1 &cpu3_0 &cpu3_1>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		status = "okay";
-- 
2.30.2

