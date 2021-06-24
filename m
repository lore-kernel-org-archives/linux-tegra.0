Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750D3C49EA6
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 08:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59E52613D8
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 08:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhFXIuJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 04:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhFXIuJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 04:50:09 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F97C061574
        for <linux-tegra@vger.kernel.org>; Thu, 24 Jun 2021 01:47:49 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r7so7342390edv.12
        for <linux-tegra@vger.kernel.org>; Thu, 24 Jun 2021 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3beJCK47iYcCQoPpTeNCafKWJMPyjBWHMs2C9W8/fyY=;
        b=tLd/qzhMHVLKc+9KmNB81Fu7KJ2HXQJrg9oX23hvl1usJCk9a3rf20uhOoutD8mwrG
         7mXS4ME3/sJ7CpVanjyQd8CZ6e8kaCbiidDi6TpJ3+wScAiVXrF06jxRk7eqWX8atzSn
         Qu5fNZs8l8GkqBBK81H0PJmcqK7Ram+TeXnd5zVER28SOVgm38YORaA0Piu6dqDwRtCz
         71C0+GIw5+yUkbFBhdgw27QOaOzoyBsXWg329u/kqLQmgm2ZvDnRqyKdDdpkUm1hRlEN
         nPNqCTyhADIeMDlRAAYw0j/LtrR53kca+0YXLLIbwHuOOkZ6TBdwlbZgRF4eZy6MHGQG
         Jtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3beJCK47iYcCQoPpTeNCafKWJMPyjBWHMs2C9W8/fyY=;
        b=Gd/eJ1wIGtl78+fMH30xWjnrc6UA8rVQoR55khiljl+tZx7HZMTVed4h0mR2Qj1+Dt
         xEOuhjPlP+swPmowvmAhx/fzKbaqSq6R01gb4rhBO0BjIQoMx9qIAHa72teKDZTykE5j
         UwXtOZL9pcq46sKOKfOKji/5e62SFRGXEEXtw4vSO68aQ+i69nypMHP/Kd2GcPMxzIzt
         6vUpqH6KYUdmaTLvqP8Sxgd7Cq9Fmt5MDIpw+NpcQrFdUfkvGIe8WZH1vIC3q/paRvbt
         m09shxNl9F/TfbmJ1tcqENdnLye94LdJumrPCz1w+2xdjOUHG1+97pBWA/EZmg068wDS
         l+Nw==
X-Gm-Message-State: AOAM530lp1MPPIJieAP9Wp3RMTQMlvV410qeORNaRatXIqiViPl/EM0E
        54q0do2iw2fCsO/li5GgswCOwg==
X-Google-Smtp-Source: ABdhPJzFUyIQeIv0Hj7mjfxoBxRanCL1jf/TWrJO9oCt2Rky48z9Hu7axK1WWB0nTyh327UMJkpbcQ==
X-Received: by 2002:a05:6402:781:: with SMTP id d1mr5749413edy.32.1624524468124;
        Thu, 24 Jun 2021 01:47:48 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id hz11sm883612ejc.125.2021.06.24.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 01:47:47 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] clk: tegra: clk-tegra124-dfll-fcpu: don't use devm functions for regulator
Date:   Thu, 24 Jun 2021 11:47:37 +0300
Message-Id: <20210624084737.42336-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The purpose of the device-managed functions is to bind the life-time of an
object to that of a parent device object.

This is not the case for the 'vdd-cpu' regulator in this driver. A
reference is obtained via devm_regulator_get() and immediately released
with devm_regulator_put().

In this case, the usage of devm_ functions is slightly excessive, as the
un-managed versions of these functions is a little cleaner (and slightly
more economical in terms of allocation).

This change converts the devm_regulator_{get,put}() to
regulator_{get,put}() in the get_alignment_from_regulator() function of
this driver.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 2ac2679d696d..5e339ad0a97c 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -537,7 +537,7 @@ static void get_alignment_from_dt(struct device *dev,
 static int get_alignment_from_regulator(struct device *dev,
 					 struct rail_alignment *align)
 {
-	struct regulator *reg = devm_regulator_get(dev, "vdd-cpu");
+	struct regulator *reg = regulator_get(dev, "vdd-cpu");
 
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
@@ -545,7 +545,7 @@ static int get_alignment_from_regulator(struct device *dev,
 	align->offset_uv = regulator_list_voltage(reg, 0);
 	align->step_uv = regulator_get_linear_step(reg);
 
-	devm_regulator_put(reg);
+	regulator_put(reg);
 
 	return 0;
 }
-- 
2.31.1

