Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4066CC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Sep 2021 11:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29F8061BD1
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Sep 2021 11:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242520AbhIILzo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Sep 2021 07:55:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:55048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242885AbhIILwx (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 9 Sep 2021 07:52:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFD5E61284;
        Thu,  9 Sep 2021 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631187865;
        bh=coTEE2e2se+Ci9VeyJk1DGFCnuhSlS+Wd/wPEjybggM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NQkBTxu450BAzdrGWaZWFVZSQMC/CjLyNaIImFQ70Yaw0Lr5dcOxjM64BnriM8S/A
         vpHYKOo6Oociv3W27vOlbVbYtg5kLErnMAwNMbu2PgnKoVpC9pfDB+M09KtbA472Ul
         8YG/MJwe0gdS6fniwRxaxlzuYG3Uo13o4p9IiG/HlTzJA7R9j3RQC+4x1WT37sqX8d
         lk8stCBFe9GfcKy7TPP6UZUDPmQVT3Wbh9138OG6lQNADtoZK9JfRPaIoUPagFx8Wo
         cyI8DsIpVPeCRF2cyXLH4YDjwDf4RsLBQ48+fZDUVHEghthRJgtfvdNbE8jXjCvBpF
         nEsAmwX2Cv5Jg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 152/252] arm64: tegra: Fix compatible string for Tegra132 CPUs
Date:   Thu,  9 Sep 2021 07:39:26 -0400
Message-Id: <20210909114106.141462-152-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit f865d0292ff3c0ca09414436510eb4c815815509 ]

The documented compatible string for the CPUs found on Tegra132 is
"nvidia,tegra132-denver", rather than the previously used compatible
string "nvidia,denver".

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 9928a87f593a..b0bcda8cc51f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -1227,13 +1227,13 @@ cpus {
 
 		cpu@0 {
 			device_type = "cpu";
-			compatible = "nvidia,denver";
+			compatible = "nvidia,tegra132-denver";
 			reg = <0>;
 		};
 
 		cpu@1 {
 			device_type = "cpu";
-			compatible = "nvidia,denver";
+			compatible = "nvidia,tegra132-denver";
 			reg = <1>;
 		};
 	};
-- 
2.30.2

