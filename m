Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65068C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Apr 2022 13:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243349AbiDZN3F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Apr 2022 09:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351028AbiDZN3C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Apr 2022 09:29:02 -0400
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79FCAE71
        for <linux-tegra@vger.kernel.org>; Tue, 26 Apr 2022 06:25:51 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id u3so25491469wrg.3
        for <linux-tegra@vger.kernel.org>; Tue, 26 Apr 2022 06:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGstbvCQFYzz8vn8LblpLlSNcpbwlW/x1uAR6+zdlmM=;
        b=gCaJIgrCL1vAXOJBp+ka8yqbN4FluY/emYhsS+PdrpmVxMoqFh2kNWUTEGnq/j/Na8
         NtcwVKVYvBfqnIXafP/zahHVHPCGGsxeXbquMN0LRrD2CC8R69Q1Zw5EDx+G+B8OZIEQ
         ecH6ogs8ZVk72CaXf6cHCUFKASO7uCmqJa9yKF4/43mtbN6jE8E9075sfHR800bi2Mp4
         Dp/dxTv6NCJeR2pvMnVjwfMPzWhrx5IkIzIjCarAqSzRwMJuu7p5JaJOj8aBuu4/rsb0
         3uU2Xv1GliwPzngL8NhPcK0e2sAExeNzx989iBVY/DCpXvupuGAUbtiPA98hheQsHIBv
         PNgA==
X-Gm-Message-State: AOAM533eb6mtggcuj7w3MA0pYDyv9mHa8JmV5ykjygpCpFUqG2SzO6+d
        At1E9J2HyoOva727nHFdq5JTE16edsZ1JQ==
X-Google-Smtp-Source: ABdhPJyIzVHkLdvDKdWkJqaB+L+4VYG+6EdIAV83d9dsjlPM6iYUYIrQ6Dq+bP4RB/1S8n0NVAd0WQ==
X-Received: by 2002:adf:d1c9:0:b0:203:c4f8:dd17 with SMTP id b9-20020adfd1c9000000b00203c4f8dd17mr17997669wrd.633.1650979550214;
        Tue, 26 Apr 2022 06:25:50 -0700 (PDT)
Received: from diogo-laptop.lan (82.59.63.94.rev.vodafone.pt. [94.63.59.82])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c4f8200b003928e8e85eesm11251659wmq.10.2022.04.26.06.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 06:25:49 -0700 (PDT)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     thierry.reding@gmail.com
Cc:     linux-tegra@vger.kernel.org,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH] clk: tegra: Add missing reset deassertion
Date:   Tue, 26 Apr 2022 14:23:43 +0100
Message-Id: <20220426132343.777966-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 4782c0a5dd88e3797426e08c5c437e95a3156631 ("clk: tegra: Don't
deassert reset on enabling clocks") removed deassertion of reset lines
when enabling peripheral clocks. This breaks the initialization of the
DFLL driver which relied on this behaviour.

Fix this problem by adding explicit deassert/assert requests to the
driver and the corresponding reset to the DT. Tested on Google Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
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
index 6144447f86c6..db74ec0d82f5 100644
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
 
+	td->dfll_rst = devm_reset_control_get(td->dev, "dfll");
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
2.35.3

