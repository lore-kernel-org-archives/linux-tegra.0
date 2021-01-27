Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAD6C43381
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 17:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0158E64DA4
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 17:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbhA0ROK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 12:14:10 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17623 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234152AbhA0RMJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 12:12:09 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60119ebd0003>; Wed, 27 Jan 2021 09:11:25 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 17:11:25 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 27 Jan 2021 17:11:23 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] clk: tegra: clk-dfll: Verify regulator vsel values are valid
Date:   Wed, 27 Jan 2021 17:11:21 +0000
Message-ID: <20210127171121.322765-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611767485; bh=URvrDgporW+3OSixaQLjcd3wnqEV05uMiHjiwxC8n7k=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=KY6QDP5aT4GsdCRoRbs+l6wWM3bN7wS0V/Q+hJ/fu2VLuQfqkdf4RRNyEX3JO+6uI
         gRVsKAqaF0is0XZjxyGB3ysoDMdUQ+HdocV68CS9nRDntpO1DvyY+eTUmAIe3DWqxr
         Juzwcs5clENVxwvGh5Za5LHwbER5u2lJ09Unkp46ap+jEY5vI+PKqlthgbuHXYBvi0
         wkMj7YwKWkth5fa3fRo1rE9nEst0O0HFblRaNFh/BOjVLF/MOCVOC1aZVy0iIc9Ww7
         4SH2OYIC2EJ/sWdEowe6pKSzo6j1LgNvmo5EulGNQq0Cyu3++ij25y1KugaGIlTTw7
         vIaYCDl+C0PUg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The regulator function, regulator_list_hardware_vsel(), may return an
negative error code on failure. The Tegra DFLL driver does not check to
see if the value returned by this function is an error. Fix this by
updating the DFLL driver to check if the value returned by
regulator_list_hardware_vsel() is an error and if an error does occur
propagate the error.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-dfll.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index a5f526bb0483..709fb1fe7073 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -672,10 +672,9 @@ static int dfll_force_output(struct tegra_dfll *td, un=
signed int out_sel)
  * Load the voltage-to-PMIC register value lookup table into the DFLL
  * IP block memory. Look-up tables can be loaded at any time.
  */
-static void dfll_load_i2c_lut(struct tegra_dfll *td)
+static int dfll_load_i2c_lut(struct tegra_dfll *td)
 {
-	int i, lut_index;
-	u32 val;
+	int i, lut_index, val;
=20
 	for (i =3D 0; i < MAX_DFLL_VOLTAGES; i++) {
 		if (i < td->lut_min)
@@ -687,10 +686,15 @@ static void dfll_load_i2c_lut(struct tegra_dfll *td)
=20
 		val =3D regulator_list_hardware_vsel(td->vdd_reg,
 						     td->lut[lut_index]);
+		if (val < 0)
+			return val;
+
 		__raw_writel(val, td->lut_base + i * 4);
 	}
=20
 	dfll_i2c_wmb(td);
+
+	return 0;
 }
=20
 /**
@@ -737,9 +741,10 @@ static void dfll_init_i2c_if(struct tegra_dfll *td)
  * disable the I2C command output to the PMIC, set safe voltage and
  * output limits, and disable and clear limit interrupts.
  */
-static void dfll_init_out_if(struct tegra_dfll *td)
+static int dfll_init_out_if(struct tegra_dfll *td)
 {
 	u32 val;
+	int ret;
=20
 	td->lut_min =3D td->lut_bottom;
 	td->lut_max =3D td->lut_size - 1;
@@ -773,9 +778,14 @@ static void dfll_init_out_if(struct tegra_dfll *td)
 			dfll_force_output(td, vsel);
 		}
 	} else {
-		dfll_load_i2c_lut(td);
+		ret =3D dfll_load_i2c_lut(td);
+		if (ret < 0)
+			return ret;
+
 		dfll_init_i2c_if(td);
 	}
+
+	return 0;
 }
=20
 /*
@@ -1497,12 +1507,17 @@ static int dfll_init(struct tegra_dfll *td)
=20
 	dfll_set_open_loop_config(td);
=20
-	dfll_init_out_if(td);
+	ret =3D dfll_init_out_if(td);
=20
 	pm_runtime_put_sync(td->dev);
=20
+	if (ret < 0)
+		goto disable_rpm;
+
 	return 0;
=20
+disable_rpm:
+	pm_runtime_disable(td->dev);
 di_err2:
 	clk_unprepare(td->soc_clk);
 di_err1:
@@ -1547,6 +1562,7 @@ EXPORT_SYMBOL(tegra_dfll_suspend);
 int tegra_dfll_resume(struct device *dev)
 {
 	struct tegra_dfll *td =3D dev_get_drvdata(dev);
+	int ret;
=20
 	reset_control_deassert(td->dvco_rst);
=20
@@ -1560,11 +1576,11 @@ int tegra_dfll_resume(struct device *dev)
=20
 	dfll_set_open_loop_config(td);
=20
-	dfll_init_out_if(td);
+	ret =3D dfll_init_out_if(td);
=20
 	pm_runtime_put_sync(td->dev);
=20
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(tegra_dfll_resume);
=20
--=20
2.25.1

