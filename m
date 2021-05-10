Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0662CC43603
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC90361581
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhEJWl4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhEJWly (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:41:54 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0715C061574;
        Mon, 10 May 2021 15:40:44 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f12so10176057ljp.2;
        Mon, 10 May 2021 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R+Rd07GeXg7osdvqVYsm1E0rafFFbHSRMuRffChtsHA=;
        b=mLg7i8sKP/iAGsLbKXtizzcb9N5sqQeeK+YWUL5uhSjcnxqQoAjWZSAyHHIsabjP1a
         en7ZPR/txARAXcSPayM28409Aqt1uVADNHFQtTwCp5HtSsHk0vm+EjrMKCt604FG79xA
         Jr9XreHjfs3J99X4zAWsh/XcSXmEPKtgHjITDQJVtZ7OTAHBEkFilQCf8J6Q5ipF8Jqg
         NlBNeGtvKPQON3N8ktFOHTpbYWI9Gu9NjMLdm5NPuoZ+WP9VGKLrmKmPHMEMWfaRzZ0n
         eUcKXE0ql1t9spCDBiJMgz4q5PJhOn+eacN6m4mbWyUagnms48j9HIIs/d8+bse8/Doe
         ZpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R+Rd07GeXg7osdvqVYsm1E0rafFFbHSRMuRffChtsHA=;
        b=R5Ip1dfvPPjEJNkXY5MsFMax1nhJgeVDYQV/cg5rFwMvcmjIujzH12zgtnncEOT+ms
         Hr0Wrqfl+NlG3+L+X2YHuoS2S/28qHwcgqiolAR9W1DgCak848lcuvcNr8fxRzDfHZJ8
         TNoPmC/UNzM6+apPf3VCUp4aDQ4cDbCK6RU1pSDjjKu3po7aLwu9IOx7JDI69MSqJh7J
         X8VruoWXNgPrLt/iIRM41TteHpHC0GlMIaOKee5ogP/mDGBSpAi81HAkmIOlhzY7yS1J
         pSeCDbw8HDBDTWXKar5LMxRXo8+qOSk+76LU8LdEDzaGQK4FVsiT1E0SpekXJri3ebfY
         XoKg==
X-Gm-Message-State: AOAM532BGax++kea8zgfiC232rwQYE2VOWBcWJtHBtujrRiGjLSwx/xH
        1Aga4f/TU8QY6hrOfYEwsY8=
X-Google-Smtp-Source: ABdhPJyfRdt0aXWo4Qap7V1prAzpUdwAoOzQwX7ctxtAbHlHm2FXe2zdtZ6NcyMRstEOCYSsco9oMg==
X-Received: by 2002:a2e:a0ca:: with SMTP id f10mr22304951ljm.66.1620686443312;
        Mon, 10 May 2021 15:40:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id g24sm2780698lja.63.2021.05.10.15.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:40:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/7] Add driver for NVIDIA Tegra30 SoC Thermal sensor
Date:   Tue, 11 May 2021 01:38:09 +0300
Message-Id: <20210510223816.18565-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series adds support for the thermal sensor that is found on NVIDIA
Tegra30 SoC. Sensor monitors temperature and voltage of the SoC, it also
emits signals to the power management and clock controllers that are
performing the emergency shut down and the CPU frequency throttling
when a pre-programmed temperature levels are reached.

Dmitry Osipenko (7):
  dt-bindings: thermal: Add binding for Tegra30 thermal sensor
  thermal: thermal_of: Stop zone device before unregistering it
  thermal/core: Export thermal_cooling_device_stats_update()
  thermal/drivers/tegra: Add driver for Tegra30 thermal sensor
  ARM: tegra_defconfig: Enable CONFIG_TEGRA30_TSENSOR
  ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR
  ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees

 .../thermal/nvidia,tegra30-tsensor.yaml       |  78 ++
 arch/arm/boot/dts/tegra30-ouya.dts            |  16 +
 arch/arm/boot/dts/tegra30.dtsi                |  93 ++-
 arch/arm/configs/multi_v7_defconfig           |   1 +
 arch/arm/configs/tegra_defconfig              |   1 +
 drivers/thermal/tegra/Kconfig                 |   7 +
 drivers/thermal/tegra/Makefile                |   1 +
 drivers/thermal/tegra/tegra30-tsensor.c       | 735 ++++++++++++++++++
 drivers/thermal/thermal_of.c                  |   3 +
 drivers/thermal/thermal_sysfs.c               |   1 +
 10 files changed, 932 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
 create mode 100644 drivers/thermal/tegra/tegra30-tsensor.c

-- 
2.30.2

