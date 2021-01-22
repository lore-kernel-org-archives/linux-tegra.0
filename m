Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A79C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 182B723B06
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbhAVUtW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730161AbhAVU2P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:15 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8149AC0611BD;
        Fri, 22 Jan 2021 12:25:08 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id i17so8010479ljn.1;
        Fri, 22 Jan 2021 12:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nNNjzOh5LEYNsraOgURM0WTcIUGPz5juJNaVys9vt0E=;
        b=TrxY0Ho2ODW4EhFQGeRk/IUZJQHdyZhiljCL8eFdvByRDIv7oiIFq7Hs0eW88A14EY
         5YQdk42gwLdmKeNIogoYnzkCGwUFjX3P+JrI2dCoieNuB/hcFDSbnBmkR+jHOreXHiKb
         W3VroD9t7LUoZJdWdDQSaBi4WJWrUOB/ufZFlBde9s3cvG+wkCIImfd+HffLxx7n8UkH
         f9J2mQ0c4xYPcZQ8wBHIkfT5FS9/lAxtP/iQ0e5LTPZOOQf9YJnLk57W2HpJKF04FBUg
         FtDOlQPAF7yx+4EgneHjV+tQTtK2gGpBmPzk0RiIHNpKHx1zy2qqSgBcskCw23a9ot9n
         neJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nNNjzOh5LEYNsraOgURM0WTcIUGPz5juJNaVys9vt0E=;
        b=d3uGrnsVzwtIvhogQ5ss4jNuztFwitbDas/uFfxzNwJUxrPSsBhoC6MYtmTHUbjKI1
         uCt5DDhwiPqCW8T2HXcOTo5ZpFQnH5aiIGFXw0w1lebZr5v66rZB3apc87zPtgewu5TE
         POEcRpUIiRyukatXdxIdq9ZI8lw8KFgkjR/B8fas0m0LU1diJzrPvg2AqV4NRxcbXmku
         +nofc0jF65L/Q2t5WYJ6/1tLpc6Cv1f3GLuIiXMG3blV1gaV9lcz4UqL99Z494UDWLyM
         WNvVF09HS7mhRSQ2NgquHpnZrxY7vQ8mwPJOCRDv7VPmzZ2b+dLOn5g6gsOAxFZ4e3Yw
         3vxQ==
X-Gm-Message-State: AOAM530ftQkJvKAU8ggNysx0X4ROS6t4URzwkOI4YrI1kColtC5A9IVO
        XR6j5yAYZuw63QzHbTtdvLg=
X-Google-Smtp-Source: ABdhPJy+A6VltDcwNVfOFrktSBqHuRdwS6aUmzaO0DIC3gsMbmRujwuHoqVfpuM6NaI0O5V21SiLew==
X-Received: by 2002:a2e:910b:: with SMTP id m11mr23047ljg.499.1611347107079;
        Fri, 22 Jan 2021 12:25:07 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:06 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] NVIDIA Tegra ARM32 device-tree improvements
Date:   Fri, 22 Jan 2021 23:24:44 +0300
Message-Id: <20210122202457.13326-1-digetx@gmail.com>
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

v2: - The "acer-a500: Rename avdd to vdda of touchscreen node" patch
      now shouldn't have merge conflicts with the upstream kernel since
      v1 was based on a patch that adds a new atmel,wakeup-method property,
      which is not supported by upstream yet.

    - Fixed unwrapped commit description in the "cardhu: Support CPU
      frequency and voltage" patch.

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

