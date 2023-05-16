Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E4FC7EE2D
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 08:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjEPI2o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 04:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjEPI2m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 04:28:42 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D923C03;
        Tue, 16 May 2023 01:28:40 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 2A67C6004411;
        Tue, 16 May 2023 09:28:39 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id 7ryfeNSuBZrZ; Tue, 16 May 2023 09:28:36 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id B8EDE6004412;
        Tue, 16 May 2023 09:28:36 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1684225716;
        bh=bL0KNlmoW6VUoAG7LAfPoCLBx/vGsSzvpVBmifOS6No=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=Gr2tH9wVZjPnRjZqV3xxDRmTXu8WP3X58SoKn47kZbTiQ1Y0G5Air+7sKfeqDocDr
         LxLyakIGTKj3hzuBM9CYAyBhwR3O6ATzHUAfnuo3GvGK56SWoCF4jHUT03VOk85Hm8
         xUXunSpeU0eLM8qojI5XI3b5iiedM0tIiYwmOjzs=
Received: from wslaptop.Home (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 662FE360076;
        Tue, 16 May 2023 09:28:36 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: tegra: smaug: add GPU node
Date:   Tue, 16 May 2023 09:28:29 +0100
Message-Id: <20230516082829.15326-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the GPU on the Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 929372f24339..db25f3ae8e0b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -67,6 +67,11 @@ dpaux: dpaux@545c0000 {
 		};
 	};
 
+	gpu@57000000 {
+		vdd-supply = <&max77621_gpu>;
+		status = "okay";
+	};
+
 	pinmux: pinmux@700008d4 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
-- 
2.40.1

