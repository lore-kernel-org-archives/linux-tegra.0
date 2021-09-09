Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0165CC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Sep 2021 12:50:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCA5A604E9
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Sep 2021 12:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355010AbhIIMvy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Sep 2021 08:51:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:42504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344941AbhIIMrj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 9 Sep 2021 08:47:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F379663222;
        Thu,  9 Sep 2021 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188591;
        bh=yxYUSrgywU7Lb2n1z5YWmFZNy3ZpxmtpTFWAF0xA7Bk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WhspqtAalEA46XceKpK3nMX7yVzMRKK9BjWmvZl5RD6nh7mPKYfGyo+gogzck9hZt
         +TZyNFbvc6gRDGXdESHnwsCd8RjDa/nis4cc63waMtHk+OSiXq8P3mOEcJyyE2JlVB
         ZuAGa651eKv/S0WKFqC0ZmiGtX1eYp84Va+hH03oB3V40MpTVdgM8fmP3G9code8L1
         jPM8bxWq8yZwBZcLjuRnHKeMIvkIgZGuM8VvHHhKuTm8XBCKheJgxmERgVnD+QCVqx
         c6q3Dn7YFs1WGD3TRWg3PHh1tWjp4mWhOpByu1sWwbm9G7URP66M0ae/bSkN3DjmwL
         IIoZj77t7Ar5w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 066/109] arm64: tegra: Fix compatible string for Tegra132 CPUs
Date:   Thu,  9 Sep 2021 07:54:23 -0400
Message-Id: <20210909115507.147917-66-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115507.147917-1-sashal@kernel.org>
References: <20210909115507.147917-1-sashal@kernel.org>
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
index 631a7f77c386..0b3eb8c0b8df 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -1082,13 +1082,13 @@ cpus {
 
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

