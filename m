Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2401C2BA1E
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73E2A6023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441830AbhCCDbp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242631AbhCBNBb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 08:01:31 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563C6C06121E;
        Tue,  2 Mar 2021 04:25:13 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id q14so23668623ljp.4;
        Tue, 02 Mar 2021 04:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nnScvCZI6cAu2ypGFQUT8MjO5y66eSGlKO06JBJkuno=;
        b=pnsSHUx172+8tj6P8OAvqX3eFoZvdUQdb8uwGvkxVg19e2wQ8EMSxu+oyIgvpc1OM4
         8mcUMcUm1O+/R4pU1a4Rqjh3V7yYjqx9H2tDNoGV0sk7H+9/v7BpIWXaunl5ioDgtyVE
         JGk/Aa6UAttn8ZvXYsiAnKks75Hmtxga+lvfxOWXOKRxwdS3cuWAO+ILsvrfssTds+JC
         ONsr4BJMXmWo/auxQZJQLMDXoqQTFiHjsoN/0HcxSUDPzKP0Ey+PklNCKSzxWmQdURua
         0YVX6aBpJfRSo0nUONvV5RGoIxyO8o2iaWxqPYNwMpmmrRqedoDuqHayzb9WZOZ9A9Cm
         3uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nnScvCZI6cAu2ypGFQUT8MjO5y66eSGlKO06JBJkuno=;
        b=NQDLssaSwezM+CIorPaVomvaKI82huDoWW1t0zRlSYTN80SKpxgSkFCZyzlTgoIJiL
         oLnUBMEEsvWPVdlEevyHxpDKBb5R9UtylvaIUoNDyj4+s81zepPIYcErqeKxDIDU2fEq
         UI3Shu1bvAVf7G7EIZ2Dsr3jvaXXReALmK436uMtdwe1N7F8SjW4OC8lnywAH8Ah8eDq
         VxTjO9gfJEAjE+pzqnLDkc5VKJ8HdG34WQVLkySdSGnZEESnW3JVgfpj1QrggTcrb3Dq
         IA2iti/ZZ34ZTZr0MZ0m0u9xFCI/zN8rjIgoahzbuctXeimIGrUHgjBSxJZGLIbzwesW
         P9FA==
X-Gm-Message-State: AOAM5326ZE+lp7hXva0yR8Z9D8ZsWmyqfKU1UspODkIeFEdH36zmCt92
        oPcAdkVu4ILncZ8Rl84VyKM=
X-Google-Smtp-Source: ABdhPJxJjdLQuvoRy2t+5XQEfbwzHPRlXPyTTw4lTci1Dn8sGAbEILcUB9yKPJG+nRjW074FwWfL1w==
X-Received: by 2002:a05:651c:548:: with SMTP id q8mr11901278ljp.256.1614687911795;
        Tue, 02 Mar 2021 04:25:11 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id u4sm2602126lfs.61.2021.03.02.04.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:25:11 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Tegra PMC driver fixes and improvements
Date:   Tue,  2 Mar 2021 15:24:57 +0300
Message-Id: <20210302122502.20874-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This is a continuation of [1]. I decided to factor out PMC patches into a
separate series to ease reviewing and applying of the patches. This series
is a prerequisite for enabling dynamic power management by Tegra drivers
that are using PMC domain.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=221130

Changelog:

v4: - Dropped "Link power domains to the parent Core domain" patch,
      moving it to the series which adds driver for the Core domain.

    - Added new minor patch "Rate-limit error message about failed to
      acquire of reset".

v3: - Added new patch "pmc: Fix completion of power-gate toggling",
      which fixes toggling power state of PMC domains.

Dmitry Osipenko (5):
  soc/tegra: pmc: Fix imbalanced clock disabling in error code path
  soc/tegra: pmc: Fix completion of power-gate toggling
  soc/tegra: pmc: Ensure that clock rates aren't too high
  soc/tegra: pmc: Print out domain name when reset fails to acquire
  soc/tegra: pmc: Rate-limit error message about failed to acquire of
    reset

 drivers/soc/tegra/pmc.c | 165 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 157 insertions(+), 8 deletions(-)

-- 
2.29.2

