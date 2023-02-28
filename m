Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9288C7EE2E
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Feb 2023 11:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjB1LZA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Feb 2023 06:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbjB1LYV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Feb 2023 06:24:21 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E71D196AC
        for <linux-tegra@vger.kernel.org>; Tue, 28 Feb 2023 03:23:47 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r18so9356994wrx.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Feb 2023 03:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677583421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2s/AS9OMV5i6t0w60QjnkUP8k7sKtqb93EMncEZug0=;
        b=N1SdnoGvKYGN2Vws5l0m8bcPfavEc4K0A4F9KTKBWfG/Nb0s8I5k9D6IRUSUVBcyDL
         uwVkHBmtI91xam5l/NcxmrXmcpBr/tjYMrufe3fRHk33fy9VZ3Zi+T0fcimH5aCrWvnr
         MztRwhT6t9MqIzmQ2+PkEQxZWf205MP6mVhGJoDOsSLZ/B2VxgYAntMAuDkxd82VDN+m
         TRENFIe8GgQH1oeZHfsH1oNavvj+GohpMAi77UedP0NHqCNCk04BW1JO+OZ0nkzUf0Bv
         UB2nE7XYdh240oMkq6wxig6p3QDtMQBBX4VoSzUFbsDWCA44IfPSO0g6dt55Wy96Kixe
         BfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677583421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2s/AS9OMV5i6t0w60QjnkUP8k7sKtqb93EMncEZug0=;
        b=HasB0h5KvsjSc9XRGEy09M9vkCkpJu/F4WJVkavTfVby9OFznhsfcu6xFPdznTjyt/
         F1//pFNfjDQhaQPJdtloMB27/a7x1Tx0tTa7oPXRTX/FGU+ZP5lrT0KYuI3q7rCAn9VE
         CBrD8eufNZSzk+VCSo4T9Nnon+eSqTUQ420D4CvcqmvAY1btAByHGrVcXw1a4ZQXEKo5
         yH599Rd9wgTr2M/irRrBgblxHyrk1D89+QD3XtsOuCWMiRgD37Hq/bPOtX2JlQIGo6Rl
         dinxwPFGkfG2ZeNIkybonOdjQElQngNrF+gFRZMbWPmL0R4PKu80tm/KtkehaWK4/L1S
         6yGA==
X-Gm-Message-State: AO0yUKW24oC4qEUkZEdFkjOsQxQICje/nvQxXOCRknMyL405A9Fcdubs
        P0Py2UZYwuJEChZbwTVlZDkD3w==
X-Google-Smtp-Source: AK7set893dtApA+PVirrgABbejGlUZ/tdFO6ZM9P8rKwNvTZEa6EkjOUXkqwVnAT0zCKAtuOxBBNFQ==
X-Received: by 2002:a5d:4a0d:0:b0:2c3:f026:9085 with SMTP id m13-20020a5d4a0d000000b002c3f0269085mr1795742wrq.13.1677583421190;
        Tue, 28 Feb 2023 03:23:41 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6830:6390:2815:b6a5])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d6545000000b002c5501a5803sm9598130wrv.65.2023.02.28.03.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:23:40 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH v4 17/19] thermal/tegra: Do not enable the thermal zone, it is already enabled
Date:   Tue, 28 Feb 2023 12:22:36 +0100
Message-Id: <20230228112238.2312273-18-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
References: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The code enables the thermal zone after setting it up. But the thermal
zone is already enabled by thermal_of_zone_register() function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/tegra/tegra30-tsensor.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/thermal/tegra/tegra30-tsensor.c b/drivers/thermal/tegra/tegra30-tsensor.c
index 3506c3f3c474..e38902abf207 100644
--- a/drivers/thermal/tegra/tegra30-tsensor.c
+++ b/drivers/thermal/tegra/tegra30-tsensor.c
@@ -346,7 +346,7 @@ static int tegra_tsensor_enable_hw_channel(const struct tegra_tsensor *ts,
 {
 	const struct tegra_tsensor_channel *tsc = &ts->ch[id];
 	struct thermal_zone_device *tzd = tsc->tzd;
-	int err, hot_trip = 0, crit_trip = 0;
+	int hot_trip = 0, crit_trip = 0;
 	u32 val;
 
 	if (!tzd) {
@@ -401,12 +401,6 @@ static int tegra_tsensor_enable_hw_channel(const struct tegra_tsensor *ts,
 	val |= FIELD_PREP(TSENSOR_SENSOR0_CONFIG0_INTR_THERMAL_RST_EN, 1);
 	writel_relaxed(val, tsc->regs + TSENSOR_SENSOR0_CONFIG0);
 
-	err = thermal_zone_device_enable(tzd);
-	if (err) {
-		dev_err(ts->dev, "ch%u: failed to enable zone: %d\n", id, err);
-		return err;
-	}
-
 	return 0;
 }
 
-- 
2.34.1

