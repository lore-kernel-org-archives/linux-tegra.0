Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504E2C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Sep 2021 12:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 389DE61132
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Sep 2021 12:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353488AbhIIMiG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Sep 2021 08:38:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:45824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353786AbhIIMe5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 9 Sep 2021 08:34:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE83B61B72;
        Thu,  9 Sep 2021 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188420;
        bh=whpcVyJRZN+NsnXXC9/NR7/jIQ+/1/X+427Ww8E2Fns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YIe5dA+jP+RJg+dL+TsR+0xDTK8SmNE2W8PP3j67UTFPOCMIquyC4E+5sLwGV47VW
         sBnpVq6+shynmDukv+zq9zIRB2hmz5UWKDCWIOhoJtq6EPmKYEu01Cata3j6p4fRoE
         LvFBiCddveekkJWuvu8L6osXzDIvpFeuCJBbF8FtUn2y2nRXiSY6Zyc3Y+YmUDx2aa
         gDZjS8e1JZbeT35rLeP2vJGE5BF1v8vI9ZlWw6QCccX7PeWtwkfew9CZla9l/U7YIj
         cPdIY6iXZ1k9mjRehkE4Ws7RwPdtAzET57welw7j71uVc18DBgvJZgy6hvCTIOFCsm
         Jqxj5+5SAUbqg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 110/176] arm64: tegra: Fix compatible string for Tegra132 CPUs
Date:   Thu,  9 Sep 2021 07:50:12 -0400
Message-Id: <20210909115118.146181-110-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
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
index e40281510c0c..b14e9f3bfdbd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -1215,13 +1215,13 @@ cpus {
 
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

