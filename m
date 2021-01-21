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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85954C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50AE820663
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbhAUS0l (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbhAUSYD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:24:03 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D1BC061756;
        Thu, 21 Jan 2021 10:23:23 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id f17so3580088ljg.12;
        Thu, 21 Jan 2021 10:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=89jyxgrDe0DSWtjs78T4nIeRsMhc0aN5cKbJ7Tw17og=;
        b=QOqIRxf35ewhvn04s/0Q8tI+a3salB7qTTJacThdp+mC1GkhmWRNGOH8E6WL+ELxtU
         i+p5XHaNIGUB9GJ39aD3Y09cIjbBkW306T3WMoJb85kwVrudEMci7s1nEVhPiISv5tvn
         Mu1fyMF0EckKFtj6mTiQQTLaSiKciaYN+m7cYrKkb2nXy2bMCzeoEkfE4OrcFlysqeDX
         6Bhcnej/Au67DV6Mv/gQPkYRkN9C/BB0IVjrK5jIwehOO2tykKdpA1kk+34FSQuW3xhL
         7F4/vpuaXt2XFIYgwrsfIDVA3CFZVodS+nZwlMwMg76vmzeuGsE3/tV+WZ7/J2Obc7ng
         er2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=89jyxgrDe0DSWtjs78T4nIeRsMhc0aN5cKbJ7Tw17og=;
        b=MsXGXGbDW033rYNQfLN4S5oTSfe54oJbvILfxgtxALGDfl1KWWeTTxFtE0Xcg3w/yI
         5+eCckRb3a2M5xFwh1VxkoUPBLI2r82IcWuXYcwk+/ox2g4xn/LIQbqIpd3e8hSAXnXz
         UsjGWnPBTYqduv5lrTLaNptowVUsORDtoUfO3E9H4SPD4+LxMLH7aT05or5Rmmd5r/Ns
         DljqzxmCDO238LQE7pcVGwmPJqB9B1Q258EmBRU7F05IMPld9AVCh6INNHi51GJtHBtE
         ws7/KXmrFs/cF0Frl7nm2nMAt1sjSCyLd053a23H/aUgGfvys1eyVSkmxjdar/zNeMFt
         cP/Q==
X-Gm-Message-State: AOAM531A2XCG08iia6w7TQuuwcADPXnG3CpFf/5GZiz2jLmuwv1BuJl4
        UGwtFuHwW2769kOqEdwZsMA=
X-Google-Smtp-Source: ABdhPJw2L+nKF9lHc5i/UyGsLbd1a1XalDqdXEEinha48a25+KYOzqkvd67l4r1tDRA4mOZ7a5zI2g==
X-Received: by 2002:a2e:9192:: with SMTP id f18mr289786ljg.487.1611253401649;
        Thu, 21 Jan 2021 10:23:21 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:20 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/13] NVIDIA Tegra ARM32 device-tree improvements
Date:   Thu, 21 Jan 2021 21:22:55 +0300
Message-Id: <20210121182308.16080-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series is partially factored out from [1] since the DT patches
could be applied separately. In addition I added couple more new
patches and implemented suggestion given by Daniel Lezcano to [1],
see "Specify all CPU cores as cooling devices" patches.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=221130

Please note that this patchset enables voltage scaling for a few boards,
but currently voltage scaling is limited in kernel by the regulator coupler
drivers, so it's safe to change the device-trees. Voltage scaling will
be fully unlocked once [1] will be merged.

Dmitry Osipenko (13):
  ARM: tegra: ventana: Support CPU and Core voltage scaling
  ARM: tegra: ventana: Support CPU thermal throttling
  ARM: tegra: cardhu: Support CPU frequency and voltage scaling on all
    board variants
  ARM: tegra: cardhu: Support CPU thermal throttling
  ARM: tegra: paz00: Enable full voltage scaling ranges for CPU and Core
    domains
  ARM: tegra: acer-a500: Enable core voltage scaling
  ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
  ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
  ARM: tegra: acer-a500: Rename avdd to vdda of touchscreen node
  ARM: tegra: nexus7: Specify all CPU cores as cooling devices
  ARM: tegra: ouya: Specify all CPU cores as cooling devices
  ARM: tegra: Specify CPU suspend OPP in device-tree
  ARM: tegra: Specify memory suspend OPP in device-tree

 .../boot/dts/tegra124-peripherals-opp.dtsi    |  5 ++
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 14 ++--
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  2 +
 arch/arm/boot/dts/tegra20-paz00.dts           | 14 ++--
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  1 +
 arch/arm/boot/dts/tegra20-ventana.dts         | 78 ++++++++++++++---
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 14 +++-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts      | 48 -----------
 arch/arm/boot/dts/tegra30-cardhu.dtsi         | 83 ++++++++++++++++++-
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi        |  3 +
 arch/arm/boot/dts/tegra30-ouya.dts            | 15 +++-
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi |  3 +
 12 files changed, 196 insertions(+), 84 deletions(-)

-- 
2.29.2

