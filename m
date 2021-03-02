Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060E2C41621
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC77864E6B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377861AbhCCDbN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443607AbhCBMLm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:11:42 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F44C061756;
        Tue,  2 Mar 2021 04:11:02 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id v9so13119156lfa.1;
        Tue, 02 Mar 2021 04:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EjvRzx4UI7KkW1vLn6idWaWGlY8WUMkCaEebmJcQing=;
        b=r/ytU08viF+buERIKb/p5tAcs9b/DHa2JzGWLccFt9GZbFjAAphw1Hb9srvPA6ukoR
         j5Jqr6YG8S6uI/f7LFvPK/yLLMUfK5BlFshqLfv0Ha9gy5R0W8wwR0Uz2a9hGuvtjmqt
         uiaziwwrcbfAx6elYH+sSPX8cfC1U/d9uj1b6m1zzzX9VWwCLKTEAeEXm2aw5F0Z3fEW
         GtIIFtH5xsise09P3RhgIgM1Dj50rmH0QCX31GJmOZ0Qv0O8/o5Olo+IkzcivfP3Omzg
         lnTZYg0qS/B7oTHpFYkkyQ4FrQCdG3ObpEqOw2d7iqIALnuLoaNv8Mry6WQAg5SVmCua
         Q0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EjvRzx4UI7KkW1vLn6idWaWGlY8WUMkCaEebmJcQing=;
        b=NpV53MEMOzLgdYmf9JqAKURe8iGB3yLoxImkxZDvKgfN//4jGq0zd3noOu3NGv37B8
         zGTerPdKbHsqX5vaw2J6bLXRDXfXAv4abVc5RKDb6lzyrfGslQKCDDSm/u4cJXtSc+hn
         dTLlZ3z1fZh1Mb8lcMPQTRFVDWX6+8Vl3D1eOuRamvUnUgb4VUtbV6awstuH/qjBZ5ya
         NPmgQuF0l4+V+21P7xnRcJ92YlBwBaSqF9seINHbrwMkIlHVDlRXuX82M9/7xRuTyHvK
         FxWn1bAjdft7XN9iM242+pmHH47j4ybrmti8x1xauw5FxgqIqRPze0EwaWm20zuJM953
         wYRw==
X-Gm-Message-State: AOAM5310is130stWQtWPCVTZ1tuvLSZyfrNNWSpopW3z5rwCm6sA8cWJ
        mGD+Htaf02f8LHrCOXQu3e8=
X-Google-Smtp-Source: ABdhPJzEvMgpSyRtmnITirgGOPwM+bjt7Ti4xJ5ayf1s0K4KvQvgjfZLgDTATpfjiXz1DOFW4Zm1+g==
X-Received: by 2002:a19:e12:: with SMTP id 18mr411703lfo.296.1614687060596;
        Tue, 02 Mar 2021 04:11:00 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:00 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/14] NVIDIA Tegra ARM32 device-tree improvements
Date:   Tue,  2 Mar 2021 15:09:49 +0300
Message-Id: <20210302121003.15058-1-digetx@gmail.com>
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

Changelog:

v3: - Added new "Specify tps65911 as wakeup source" patch, which previously
      was a part of series that added wakeup-source support to TPS65911 RTC
      driver [1]. The RTC series was partially applied, excluding the DT
      patch.

      [1] https://lore.kernel.org/linux-rtc/20210120211603.18555-1-digetx@gmail.com/

v2: - The "acer-a500: Rename avdd to vdda of touchscreen node" patch
      now shouldn't have merge conflicts with the upstream kernel since
      v1 was based on a patch that adds a new atmel,wakeup-method property,
      which is not supported by upstream yet.

    - Fixed unwrapped commit description in the "cardhu: Support CPU
      frequency and voltage" patch.

Dmitry Osipenko (14):
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
  ARM: tegra: Specify tps65911 as wakeup source

 .../boot/dts/tegra124-peripherals-opp.dtsi    |  5 ++
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 14 ++--
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  2 +
 arch/arm/boot/dts/tegra20-paz00.dts           | 14 ++--
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  1 +
 arch/arm/boot/dts/tegra20-ventana.dts         | 78 ++++++++++++++---
 arch/arm/boot/dts/tegra30-apalis.dtsi         |  1 +
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 14 +++-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  1 +
 arch/arm/boot/dts/tegra30-beaver.dts          |  1 +
 arch/arm/boot/dts/tegra30-cardhu-a04.dts      | 48 -----------
 arch/arm/boot/dts/tegra30-cardhu.dtsi         | 84 ++++++++++++++++++-
 arch/arm/boot/dts/tegra30-colibri.dtsi        |  1 +
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi        |  3 +
 arch/arm/boot/dts/tegra30-ouya.dts            | 16 +++-
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi |  3 +
 16 files changed, 202 insertions(+), 84 deletions(-)

-- 
2.29.2

