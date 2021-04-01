Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1877CC004D6
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E73C861155
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbhDARm7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234771AbhDARj6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 13:39:58 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB19C0319D4
        for <linux-tegra@vger.kernel.org>; Thu,  1 Apr 2021 10:26:02 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id hq27so3993116ejc.9
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 10:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=REwstNQho+0HF6CmmQ9jvF2oPascfGsNa3A+M63+ZoA=;
        b=sxlOIJzZWh+CM7b7PEGZxLFNmCHPX6k8wsPuZ6h2RIHxQ0LKn/Lxg1y+Y3CEr8pR1L
         vyBGPjPtURl7QlifNLXLDJondO6It08jh0ZWcQVaKiQFiZ/U688PazfVCeubkHrMduUi
         9Kp7t9jF33JvgaMh8/eoiN2GNvhCfsXLfW7OWr/xpSQo8ThPPPqqyk9+Z9YME8uh9ssT
         vN+W3bpuoF/G0RPRTWrN199/fhPtfcyc8RIOWVgXdd0CFycQU2BjKZKDDdWZ3KOIjLsp
         GbRm/AyKxmCKL1oOee0YjrY0UOI0N+SEThm6AJHL3Ccr7fBEyLnfb8LqBLBh7xG5GGYp
         DYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=REwstNQho+0HF6CmmQ9jvF2oPascfGsNa3A+M63+ZoA=;
        b=OBVIbfvmHmKijBH/hOs1Pt0jqeR5weNeji1g+kfWLH3ZGU5VXYg4cMtlU1F8hsD2v0
         7FoONuJqCCq9i15xYXXqi7Pvm0PRfxn4es4+Q39BQOtD+yxIEnNrb4rQSp/smJavv9Wz
         MGKM18HbJqZf3lxofsu3KI+BtGxfoMzZNK6qv4yy1gsZooYu/Bcl51ULEU6NxKF8blc6
         Xlwb0HQZHP0rCAxieM8Eq01hj/GyCaIxxCFhiNzcgz2g6gKaOGHifQJdNQBhp1cAu6nr
         TMxzq7QQOj9zAlnSemTFiZiIWC+a9iz5IkF7RBkHyTWR0YXRvmveoAXmOBlr/dlwQLoz
         v0kQ==
X-Gm-Message-State: AOAM5307rP1MIeZ8fIjne+meO7mDldmpydHlETy3xpf9JBamoMNu5iVA
        cycAmn/fAoPUzZc5GLxRPXk=
X-Google-Smtp-Source: ABdhPJxE13Lorh6skVD7dPNFfE3hH5Aow2jkICl6k92P5R+PgadH2/fn/9VFL8Fy9EYLRoXz6Hzn1g==
X-Received: by 2002:a17:907:629c:: with SMTP id nd28mr10385959ejc.267.1617297960950;
        Thu, 01 Apr 2021 10:26:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id hd8sm2995528ejc.92.2021.04.01.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:25:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] clk: tegra: Changes for v5.13-rc1
Date:   Thu,  1 Apr 2021 19:26:19 +0200
Message-Id: <20210401172622.3352990-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-clk

for you to fetch changes up to 0c7ea2b1c850756140fef03bed0fbaf0957f120a:

  clk: tegra: Don't enable PLLE HW sequencer at init (2021-03-24 14:02:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.13-rc1

This adds PLLE HW sequencer support which is necessary for USB sleepwalk
functionality.

----------------------------------------------------------------
JC Kuo (2):
      clk: tegra: Add PLLE HW power sequencer control
      clk: tegra: Don't enable PLLE HW sequencer at init

 drivers/clk/tegra/clk-pll.c      | 12 ---------
 drivers/clk/tegra/clk-tegra210.c | 53 +++++++++++++++++++++++++++++++++++++++-
 include/linux/clk/tegra.h        |  4 ++-
 3 files changed, 55 insertions(+), 14 deletions(-)
