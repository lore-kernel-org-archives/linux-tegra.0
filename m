Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05547C433C1
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 12:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE8C7619C9
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 12:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhC0Mgc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Mar 2021 08:36:32 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14936 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbhC0Mgc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Mar 2021 08:36:32 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F6yw74FGnzkg35;
        Sat, 27 Mar 2021 20:34:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Mar 2021 20:36:19 +0800
From:   Xie XiuQi <xiexiuqi@huawei.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH 0/2] soc/tegra: Fix build with Tegra234 configuration
Date:   Sat, 27 Mar 2021 20:37:55 +0800
Message-ID: <20210327123757.4568-1-xiexiuqi@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If only Tegra234 support is enabled, we got this build error:

 make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j128
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC      drivers/soc/tegra/fuse/fuse-tegra30.o
drivers/soc/tegra/fuse/fuse-tegra30.c:376:10: error: ‘tegra30_fuse_read’ undeclared here (not in a function); did you mean ‘tegra_fuse_readl’?
  .read = tegra30_fuse_read,
          ^~~~~~~~~~~~~~~~~
          tegra_fuse_readl
drivers/soc/tegra/fuse/fuse-tegra30.c:382:10: error: ‘tegra30_fuse_init’ undeclared here (not in a function); did you mean ‘tegra30_fuse_read’?
  .init = tegra30_fuse_init,
          ^~~~~~~~~~~~~~~~~
          tegra30_fuse_read
  CC      drivers/firmware/tegra/bpmp.o
  CHK     kernel/kheaders_data.tar.xz
drivers/firmware/tegra/bpmp.c:861:51: error: ‘tegra186_soc’ undeclared here (not in a function); did you mean ‘tegra_ivc’?
  { .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
                                                   ^~~~~~~~~~~~
                                                   tegra_ivc

Xie XiuQi (2):
  soc/tegra: fuse: Fix build with Tegra234 configuration
  firmware: tegra: Fix build with Tegra234 configuration

 drivers/firmware/tegra/Makefile       | 1 +
 drivers/firmware/tegra/bpmp-private.h | 3 ++-
 drivers/firmware/tegra/bpmp.c         | 3 ++-
 drivers/soc/tegra/fuse/fuse-tegra30.c | 3 ++-
 4 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.25.1

