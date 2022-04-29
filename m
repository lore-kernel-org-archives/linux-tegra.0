Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9637C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Apr 2022 13:10:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbiD2NOF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Apr 2022 09:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbiD2NOE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 09:14:04 -0400
X-Greylist: delayed 595 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 29 Apr 2022 06:10:44 PDT
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281DD13D5F
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 06:10:42 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 1BD566007C2A;
        Fri, 29 Apr 2022 14:00:44 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id u7nSgF5q5JFQ; Fri, 29 Apr 2022 14:00:41 +0100 (WEST)
Received: from mail2.tecnico.ulisboa.pt (mail2.ist.utl.pt [193.136.128.12])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 4E62A6007C16;
        Fri, 29 Apr 2022 14:00:41 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1651237241;
        bh=kCfBKaj1BH+TdkrY/D3yrbzEHDFbee6cYtXUGBIAg2s=;
        h=Date:From:To:Cc:Subject;
        b=RNofzZJPAUEO3u/geVy58PEvddux+5wg/7tkZuFXK7uMLdjjIgVxRmLuKyIrfdYBN
         2H9ip+MZcQXSJvVpWBeQFlXveFMOB7M3r4ULUsvR3HmMrNLnkSdhe8E7Fu7+OhSe44
         OsrV7AtwLYcRp7D0M8ZSvDhWdDw9QR8mJ4nw1pbE=
Received: from diogo-laptop (unknown [IPv6:2001:818:dcb5:dc00:dfee:869a:467:3ce2])
        (Authenticated sender: ist187313)
        by mail2.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0E217560085;
        Fri, 29 Apr 2022 14:00:40 +0100 (WEST)
Date:   Fri, 29 Apr 2022 13:58:43 +0100
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     dmitry.osipenko@collabora.com, thierry.reding@gmail.com
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2] clk: tegra: Add missing reset deassertion
Message-ID: <20220429125843.neqitcrxc7ntjclk@diogo-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 4782c0a5dd88e3797426e08c5c437e95a3156631 ("clk: tegra: Don't
deassert reset on enabling clocks") removed deassertion of reset lines
when enabling peripheral clocks. This breaks the initialization of the
DFLL driver which relied on this behaviour.

Fix this problem by adding explicit deassert/assert requests to the
driver and the corresponding reset to the DT. Tested on Google Pixel C.

Cc: stable@vger.kernel.org
Fixes: 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling clocks")
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v2:
 - Changed reset getter to the optional variant

 arch/arm64/boot/dts/nvidia/tegra210.dtsi |  5 +++--
 drivers/clk/tegra/clk-dfll.c             | 12 ++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 218a2b32200f..4f0e51f1a343 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1366,8 +1366,9 @@ dfll: clock@70110000 {
 			 <&tegra_car TEGRA210_CLK_DFLL_REF>,
 			 <&tegra_car TEGRA210_CLK_I2C5>;
 		clock-names = "soc", "ref", "i2c";
-		resets = <&tegra_car TEGRA210_RST_DFLL_DVCO>;
-		reset-names = "dvco";
+		resets = <&tegra_car TEGRA210_RST_DFLL_DVCO>,
+			 <&tegra_car 155>;
+		reset-names = "dvco", "dfll";
 		#clock-cells = <0>;
 		clock-output-names = "dfllCPU_out";
 		status = "disabled";
diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 6144447f86c6..62238dca9a53 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -271,6 +271,7 @@ struct tegra_dfll {
 	struct clk			*ref_clk;
 	struct clk			*i2c_clk;
 	struct clk			*dfll_clk;
+	struct reset_control		*dfll_rst;
 	struct reset_control		*dvco_rst;
 	unsigned long			ref_rate;
 	unsigned long			i2c_clk_rate;
@@ -1464,6 +1465,7 @@ static int dfll_init(struct tegra_dfll *td)
 		return -EINVAL;
 	}
 
+	reset_control_deassert(td->dfll_rst);
 	reset_control_deassert(td->dvco_rst);
 
 	ret = clk_prepare(td->ref_clk);
@@ -1509,6 +1511,7 @@ static int dfll_init(struct tegra_dfll *td)
 	clk_unprepare(td->ref_clk);
 
 	reset_control_assert(td->dvco_rst);
+	reset_control_assert(td->dfll_rst);
 
 	return ret;
 }
@@ -1530,6 +1533,7 @@ int tegra_dfll_suspend(struct device *dev)
 	}
 
 	reset_control_assert(td->dvco_rst);
+	reset_control_assert(td->dfll_rst);
 
 	return 0;
 }
@@ -1548,6 +1552,7 @@ int tegra_dfll_resume(struct device *dev)
 {
 	struct tegra_dfll *td = dev_get_drvdata(dev);
 
+	reset_control_deassert(td->dfll_rst);
 	reset_control_deassert(td->dvco_rst);
 
 	pm_runtime_get_sync(td->dev);
@@ -1951,6 +1956,12 @@ int tegra_dfll_register(struct platform_device *pdev,
 
 	td->soc = soc;
 
+	td->dfll_rst = devm_reset_control_get_optional(td->dev, "dfll");
+	if (IS_ERR(td->dfll_rst)) {
+		dev_err(td->dev, "couldn't get dfll reset\n");
+		return PTR_ERR(td->dfll_rst);
+	}
+
 	td->dvco_rst = devm_reset_control_get(td->dev, "dvco");
 	if (IS_ERR(td->dvco_rst)) {
 		dev_err(td->dev, "couldn't get dvco reset\n");
@@ -2087,6 +2098,7 @@ struct tegra_dfll_soc_data *tegra_dfll_unregister(struct platform_device *pdev)
 	clk_unprepare(td->i2c_clk);
 
 	reset_control_assert(td->dvco_rst);
+	reset_control_assert(td->dfll_rst);
 
 	return td->soc;
 }
-- 
2.36.0

