Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBFDC47080
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F639610A5
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbhEWX6D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhEWX6C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:58:02 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EA8C061574;
        Sun, 23 May 2021 16:56:33 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id w15so31199260ljo.10;
        Sun, 23 May 2021 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WzJLvDAWH/PwIk8Vq+fBiDvMEBtw82x4t9gNcqY6QO4=;
        b=Y/HFi4/9BIcCFoI35jfyA2sm1lZu0/qF1vAG2lVBwxBCeI3vOtV43u/NMpbaGqrzEo
         DvDoSAvZ7JjGAXkpHK8bewdKj/P9BFY3OavVrDuZS3y0UR+bG5YAF0HiAU0eV427RPw6
         7sUIbT8nartBLp6hAtTrJsFOPyHL5Ygn01SHcbWNmtlnlF5DfmwoqyqDPAgR0TSjbHWb
         Xf2nfSMtHxTFCsAB1LSqOQ1JM5fm0bTcLbalL90WKRvx7geFN+EnK8iInxdVAN3Tqlxx
         LIwPC6UWEfbaqn4kxtlZX3RfJsgKvCJ6xWLL1dz3Cv6oMWrSZqCM+9xd3yGNB3sqU/YV
         KJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WzJLvDAWH/PwIk8Vq+fBiDvMEBtw82x4t9gNcqY6QO4=;
        b=OTiUJ2OCWx1ZCSZTv/+uWBHvk9tC0jjckD7i5ogSuj9tEj8Y6yu2ImEQYsDxeIRFhw
         C9/vGTg/aadi4sEkrXU5V45g3NFgoKdKdg/nEGsB5CBJVc9UcEnjo9CxqU/O3r5oTMjR
         ApD66dgrPR24ZIcBioyVxV7N/b1xl4Wgp6DooIBfRJ+hp/YGnEDpUqwtN6V1XfiW0YrY
         7IC7SCkSTBRBk8yQcnOekfi2awouSXUgCH4BJ6aVPKFDV8+imUZs/BWipLZbMdLJyKgE
         FYxPN+M24S9cnFMGH4zu/blCwUC6itheLGMdmXmwC54MVml5z0pLkPXGwiGJW0f/gxh+
         ubqg==
X-Gm-Message-State: AOAM532UeuBrXb2OLw0A1TO+h0ZEkGPxUJ1D409Rlg00CCba09fY2hSN
        SWfm2lEmzmORIZMTnnLj09A=
X-Google-Smtp-Source: ABdhPJzMcuk4OcI5KUgFWj/cSleIH1yRR056EWtob7rYKFy/m0bGNL86u6ab+p/EYt7WfTTnZxvFsg==
X-Received: by 2002:a2e:a40a:: with SMTP id p10mr12504531ljn.145.1621814191509;
        Sun, 23 May 2021 16:56:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id h4sm1092987lfv.247.2021.05.23.16.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:56:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/7] Add driver for NVIDIA Tegra30 SoC Thermal sensor
Date:   Mon, 24 May 2021 02:56:13 +0300
Message-Id: <20210523235620.31538-1-digetx@gmail.com>
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

Please note that this series is made on top of ACMTON patches! [1].
Otherwise tegra30.dtsi will fail to compile.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=243115

Changelog:

v2: - Made a very minor improvement to one error message, it now prints
      number of channel at which error occurred.

    - Added r-b from Rob Herring to the binding.

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
 drivers/thermal/tegra/tegra30-tsensor.c       | 736 ++++++++++++++++++
 drivers/thermal/thermal_of.c                  |   3 +
 drivers/thermal/thermal_sysfs.c               |   1 +
 10 files changed, 933 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
 create mode 100644 drivers/thermal/tegra/tegra30-tsensor.c

-- 
2.30.2

