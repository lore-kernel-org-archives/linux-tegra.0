Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC80C43217
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Nov 2022 01:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbiKSBsW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 20:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbiKSBsE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 20:48:04 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EB013D36
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:29 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id n20so17145081ejh.0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Bjbo5YJKcpln2X8QrAZ7UuD3Iy9TmzDT1PmReXtXbg=;
        b=gJpODAoQG0qQIF/YTfe63MO5R/zX/GoWOuHRIuATPX3STrZBiaQ/00yzNNAg/ekU3r
         RyoEQ5kVLpJurkav75km2GQ6/X2700SIP39lXHHPvelVcJbuYNmpt/71gCGw+9dZL3va
         gYnhJRPujfOmSLFtUrdBV6S3FcRxOA9e8Y0nDbWJIlCDv1HsckfX+++w+RA/ib/xzd30
         2b/wKeuE1pn9ufnPquBj6+I3iweYCfJ1PvB6Nr8uPtpcmofHSLkffAWcmAEhiUeonG8g
         MMJPr913OGwvstEwZAY3tzReso6MmHaYbLfRKRyUkRvQMFzkQdK564Trh4JZMD/z3cnI
         16Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Bjbo5YJKcpln2X8QrAZ7UuD3Iy9TmzDT1PmReXtXbg=;
        b=b51qqSqgSlqdN9NiFG2TLz5t6vqmCeSytC58A34ScBciPhSiVMC1KDeDwO9qH2U6QP
         Muvxm14hr/4nUPm6Vb4H9RSlCuqxmaa3CQgyNgAg/1OUw8tJU3XvNZrbRCJrjnCaNuNt
         ixHxTnds2NCh7HjGsQe54dKzH6qiGMc6m4QeXAHrUEwOT2wEbRjO08Gfg+ikWBupAwrN
         GKDT3p88Ev4QWYW4I4QA1JH2aoagc9+39vLMlFB6asJz/pFzIHBy5ljWLzYC1wkZWPmm
         WyChQg2AF6AfJ5TjxYLcRzITx1Yy7V1cDCS6/yu6uWH0MkU9EbbWjmvI8A32autZggGM
         enBA==
X-Gm-Message-State: ANoB5plsovMZZFk9yCWbfmBJQCmZbZP48YR84CSataFLoNbq2WeX+VDS
        yidS/Ek2gikV6zrKHLRJ5vo=
X-Google-Smtp-Source: AA0mqf7EwLuGaKPO2HngUZcQhMIrYM0afEX9fvZl4w78yBaKjTUYgwZ8MLoJcLMYbDlO3huhykF34A==
X-Received: by 2002:a17:907:6d12:b0:7b2:bb8c:5398 with SMTP id sa18-20020a1709076d1200b007b2bb8c5398mr3734733ejc.573.1668820828278;
        Fri, 18 Nov 2022 17:20:28 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b004618a89d273sm2389186edb.36.2022.11.18.17.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:27 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] clk: tegra: Changes for v6.2-rc1
Date:   Sat, 19 Nov 2022 02:20:20 +0100
Message-Id: <20221119012025.3968358-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-clk

for you to fetch changes up to 1d9e77b644d2e5c49e6d35f77684bd260ad98557:

  clk: tegra: Support BPMP-FW ABI deny flags (2022-11-19 02:00:32 +0100)

I've included this in the ARM SoC pull requests because it has a
dependency on the BPMP ABI updates. The clk patch is Acked-by Stephen.

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v6.2-rc1

Implements new ABI flags for certain clocks for which the parent rate
or clock state cannot be changed.

----------------------------------------------------------------
Peter De Schrijver (2):
      firmware: tegra: Update BPMP ABI
      clk: tegra: Support BPMP-FW ABI deny flags

Thierry Reding (4):
      firmware: tegra: bpmp: Prefer u32 over uint32_t
      firmware: tegra: bpmp: Use iosys-map helpers
      firmware: tegra: bpmp: Do not support big-endian
      Merge branch 'for-6.2/firmware' into for-6.2/clk

 drivers/clk/tegra/clk-bpmp.c               |   37 +-
 drivers/firmware/tegra/bpmp-debugfs.c      |   62 +-
 drivers/firmware/tegra/bpmp-tegra186.c     |   36 +-
 drivers/firmware/tegra/bpmp-tegra210.c     |    7 +-
 drivers/firmware/tegra/bpmp.c              |   33 +-
 drivers/firmware/tegra/ivc.c               |  150 ++-
 drivers/thermal/tegra/tegra-bpmp-thermal.c |   15 +-
 include/soc/tegra/bpmp-abi.h               | 1796 +++++++++++++++++++++-------
 include/soc/tegra/bpmp.h                   |   17 +-
 include/soc/tegra/ivc.h                    |   11 +-
 10 files changed, 1577 insertions(+), 587 deletions(-)
