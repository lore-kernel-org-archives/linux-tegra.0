Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F092DC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 925E52087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOFkWrjB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgIQKIB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIQKIA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:00 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA1BC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:00 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id a9so1435225wmm.2
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KMExwAt66iw2SC3hzOo9WR0pCQvNfLLx2V1e8GjXC8A=;
        b=iOFkWrjBF+l8JhI69mAkoWS7qItOCa+FaDqSIQR/TGGDKvrBlOFK7GpTQitKMuE5xU
         WzqsMgYJZ8Kv05LA6pwcMbfHTTqBQvz3ZlEnTfebwB262lVLGZNNcds4msrPNA1zGvKb
         /R54jBdnTe3PwVQB/ZML2KptRK0e3ENj30CeHrwdd3VYRImR2kuN0DEVpRVlWi3gWenF
         8prJb2XPzcLylNqf+crnSPPqpjA0HxK+74dzfvRQ7uyeZMEenbFEnkaQsoh2nj/dpsSm
         OKERhRVWBM0LfjXzjl4bwScLpF5Drbm3j9NaVklBHmyQvNuW6jcCAxUnFzmVsTApJteU
         /ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KMExwAt66iw2SC3hzOo9WR0pCQvNfLLx2V1e8GjXC8A=;
        b=FxnPckc3Zfx9CV21pvrPYLakfmedy53/DcyccP8/PC8/M7lZBdSnoejXE4OQU3dUYa
         uYzfPlmxeUZAsmfz0apwqyREy4KVZ+PCd58OLqMv7NGTU/Uy5MYbqaIu9hKcA3XVC5rJ
         CDz5rVVwT9gLrPNeKRPaWSUypV4JSRGaDRCqpVjV8sx6ATqrekrJR6GpUVc/cTcnEY5F
         LEg8PaQt4W4hYfv0l4dfSENgUKHYR4IYIhJr6QpDKAI5YkJAOwdWUebF8IEvUkoqB/Jw
         IM/da4fWUZv02UjA4k4xqLjSsbie9gde5Ikm52SOqSK5NakzlDJ9+xUEvaMk+pdJ8RRE
         ylEg==
X-Gm-Message-State: AOAM533pS9NNFlpin8+YmGKnOQ50AL0eC+U0cA9OFQdFNkfMefWzVzdd
        qn9/ZCEuDVvKuloxwRNA3xJJNeb13yO3vg==
X-Google-Smtp-Source: ABdhPJxRZ/VMAXDq1KyYsA1Cgq4YbyDLQpBUj6oRYVx1wUY/SHojxSMO6uf6Kf4El7M7xjZ+E12eWA==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr9618842wml.39.1600337278744;
        Thu, 17 Sep 2020 03:07:58 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u186sm9983547wmu.34.2020.09.17.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:07:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/14] arm64: tegra: Initial Tegra234 VDK support
Date:   Thu, 17 Sep 2020 12:07:38 +0200
Message-Id: <20200917100752.3516153-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This set of patches introduces support for the new Tegra234 SoC, also
known as Orin. Currently no silicon of this chip is available, so the
support added here is for a simulation platform known as VDK.

Note that this simulation platform is not available publicly. However
the goal is to use the simulation platform as a way of upstreaming as
much support as possible ahead of tapeout.

Once actual silicon becomes available, the plan is to stop supporting
the simulation platform and shift focus to real hardware.

Thierry

Thierry Reding (14):
  dt-bindings: misc: tegra-apbmisc: Add missing compatible strings
  dt-bindings: misc: tegra186-misc: Add missing compatible string
  dt-bindings: misc: tegra186-misc: Add Tegra234 support
  dt-bindings: tegra: Add Tegra234 VDK compatible
  dt-bindings: fuse: tegra: Add Tegra234 support
  dt-bindings: tegra: pmc: Add Tegra234 support
  soc/tegra: fuse: Extract tegra_get_platform()
  soc/tegra: fuse: Implement tegra_is_silicon()
  soc/tegra: fuse: Add Tegra234 support
  soc/tegra: misc: Add Tegra234 support
  soc/tegra: pmc: Reorder reset sources/levels definitions
  soc/tegra: pmc: Add Tegra234 support
  firmware: tegra: Enable BPMP support on Tegra234
  arm64: tegra: Initial Tegra234 VDK support

 .../devicetree/bindings/arm/tegra.yaml        |   4 +
 .../arm/tegra/nvidia,tegra186-pmc.txt         |   3 +-
 .../bindings/fuse/nvidia,tegra20-fuse.txt     |   1 +
 .../bindings/misc/nvidia,tegra186-misc.txt    |   8 +-
 .../bindings/misc/nvidia,tegra20-apbmisc.txt  |  13 +-
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../boot/dts/nvidia/tegra234-sim-vdk.dts      |  40 ++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 189 ++++++++++++++++++
 drivers/firmware/tegra/bpmp.c                 |   3 +-
 drivers/mailbox/tegra-hsp.c                   |   9 +-
 drivers/soc/tegra/Kconfig                     |  10 +
 drivers/soc/tegra/fuse/fuse-tegra.c           |   8 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c         |  30 +++
 drivers/soc/tegra/fuse/fuse.h                 |  10 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c        |  26 +++
 drivers/soc/tegra/pmc.c                       | 145 ++++++++++----
 include/dt-bindings/clock/tegra234-clock.h    |  14 ++
 include/dt-bindings/reset/tegra234-reset.h    |  10 +
 include/soc/tegra/fuse.h                      |   3 +
 19 files changed, 474 insertions(+), 53 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
 create mode 100644 include/dt-bindings/clock/tegra234-clock.h
 create mode 100644 include/dt-bindings/reset/tegra234-reset.h

-- 
2.28.0

