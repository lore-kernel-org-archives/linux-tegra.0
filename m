Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05320C04FDF
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Aug 2023 13:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjHGNeR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Aug 2023 09:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbjHGNeK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Aug 2023 09:34:10 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3DE1BF5;
        Mon,  7 Aug 2023 06:33:54 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 13ECA6002983;
        Mon,  7 Aug 2023 14:33:28 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id 6TjEs70n-Ccu; Mon,  7 Aug 2023 14:33:24 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id B7211600240B;
        Mon,  7 Aug 2023 14:33:24 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1691415204;
        bh=Nh+a2iIaDZwErnz9WD7BqJI7aLyjEaYkkvHY1vk/Hpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=E2DYKQzXF9iQAbr2Nh/4fWG4NPXNwW2ugEwhi7Ya+za2tJr1Yivl9/2ycYMdBB88D
         U1Q7vFk8hCc5Qj1w4a6Zr9B+zu7GGsTUW8hS6nS0H4X1lSyb2ihFm0r7Sr3XEncKQV
         fzcdCS7dIgWdi0Vbf/nWlk88HUe+ayweo74E90Ac=
Received: from diogo-gram.Home (unknown [IPv6:2001:8a0:fbe7:6700:e50a:b22:79be:5827])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 80282360077;
        Mon,  7 Aug 2023 14:33:24 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 5/5] arm64: dts: smaug: Add display panel node
Date:   Mon,  7 Aug 2023 14:33:05 +0100
Message-ID: <20230807133307.27456-6-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Google Pixel C has a JDI LPM102A188A display panel, so add a
DT node for it.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 84ccb1495f21..8c68106eaa98 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -31,6 +31,33 @@ memory {
 	};
 
 	host1x@50000000 {
+		dsia: dsi@54300000 {
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+			status = "okay";
+
+			link2: panel@0 {
+				compatible = "jdi,lpm102a188a";
+				reg = <0>;
+			};
+		};
+
+		dsib: dsi@54400000 {
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+			nvidia,ganged-mode = <&dsia>;
+			status = "okay";
+
+			link1: panel@0 {
+				compatible = "jdi,lpm102a188a";
+				reg = <0>;
+				power-supply = <&pplcd_vdd>;
+				ddi-supply = <&pp1800_lcdio>;
+				enable-gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+				link2 = <&link2>;
+				backlight = <&backlight>;
+			};
+		};
+
 		dpaux: dpaux@545c0000 {
 			status = "okay";
 		};
-- 
2.41.0

