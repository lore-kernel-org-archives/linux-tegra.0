Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FB1C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E95C610FF
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbhHMQWc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 12:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbhHMQWb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 12:22:31 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2DEC0617AE
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:04 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q6so2512915wrv.6
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uRtDnJs579S8DQ0elL799P54sAOR8oc9lSTGgP3ImMM=;
        b=mq/x1BjkO89XxfqlypJiDWRNrxxIHgUjX1881n5Wnsk52axruxmKwRv0CBu5966Z5i
         38BPHe4HiBfI88cAGDzWPtUEBcikX/L6vX9BPPo1eZL3Ape8nsMZRNUWbV10wpEuW8ws
         TyNB5phwmi+rcKBh9R8hjC4lvj6tOZZBm9WfhSRGIS5acy4i7ka3V+cxYTgkNe3QOv+G
         i6dL2kojTFCo5sDhLYGWDzEjvexRPtlMexEIGsEYBruScrUDKHZH/O9f0kamKI4j1dDh
         5+omiiGgTfvU0QZ4r31u4343z3BnkFJ0hgIhp0gqAlm1/aQsD6OUUhuntN1Dy4BMSbBZ
         fz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uRtDnJs579S8DQ0elL799P54sAOR8oc9lSTGgP3ImMM=;
        b=PuQoOpzrDTIdhq+M4YwTIOR4ufigP+smzUf0+Z3wa21EXuoA3LxNsfshuC4FTr5UxN
         CylrFJq7MXNdD9FC86d9xcHV6csmQIMzjhaUHZm30j8T0OimifGvYs81/9Y1pBtAtgAC
         X7X6zqpuYwOdNLNNQmFgQQ7qupwhrzvCoEwlj9e0vwkVujXNM9MzcgKncUX7XWFVC9hP
         TH+LW6eVU/8qVIeGZGEF/at8ukDQZ1mF+mUUn7fTFVGBc8v6Xf+Eg2gaVn8lBGdmRytr
         oCWpIQlwRIlHw1zVT0S9DumVIfRzrNPIoahUlXZllwVfqnkq7v0nCggR1JI6GEI3mCAd
         PfPg==
X-Gm-Message-State: AOAM533/NRzbDYhrkSvNL9J9w38u6elX8X5tpcjDsHcPppBIICxwH5cJ
        J7t5D5G5NZb2Tw/9tmY6ukY=
X-Google-Smtp-Source: ABdhPJwRzJ1/teEVA+58c0ZHKHWrTdY6YACsc16HWVMeCFJctL3uAmd72gnNyIbsheE4zzJdBLD+UA==
X-Received: by 2002:a5d:5592:: with SMTP id i18mr4096606wrv.271.1628871723366;
        Fri, 13 Aug 2021 09:22:03 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b10sm2380957wrn.9.2021.08.13.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:22:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] soc/tegra: Changes for v5.15-rc1
Date:   Fri, 13 Aug 2021 18:21:54 +0200
Message-Id: <20210813162157.2820913-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-soc

for you to fetch changes up to 59c6fceb2ecc382c3d20508a235b539bf23af1f0:

  soc/tegra: fuse: Enable fuse clock on suspend for Tegra124 (2021-08-11 11:55:56 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.15-rc1

Implements runtime PM support for the FUSE block and prepares the driver
to work better in conjunction with the CPUIDLE driver.

----------------------------------------------------------------
Cai Huoqing (1):
      soc/tegra: bpmp: Remove unused including <linux/version.h>

Dmitry Osipenko (4):
      soc/tegra: pmc: Prevent racing with cpuilde driver
      soc/tegra: fuse: Clear fuse->clk on driver probe failure
      soc/tegra: fuse: Add runtime PM support
      soc/tegra: fuse: Enable fuse clock on suspend for Tegra124

 arch/arm/mach-tegra/pm.c              |  2 +-
 arch/arm/mach-tegra/pm.h              |  6 ----
 arch/arm/mach-tegra/tegra.c           |  2 --
 drivers/soc/tegra/fuse/fuse-tegra.c   | 60 +++++++++++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra20.c | 11 ++++---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 16 +++++++---
 drivers/soc/tegra/fuse/fuse.h         |  2 ++
 drivers/soc/tegra/pmc.c               | 14 +++++++-
 drivers/soc/tegra/powergate-bpmp.c    |  1 -
 include/soc/tegra/pm.h                |  6 ++++
 10 files changed, 100 insertions(+), 20 deletions(-)
