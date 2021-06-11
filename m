Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71A8C48BE5
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:44:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F089613D0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhFKQqX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:46:23 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:44850 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbhFKQqU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:46:20 -0400
Received: by mail-wm1-f47.google.com with SMTP id m41-20020a05600c3b29b02901b9e5d74f02so5829663wms.3
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1PGvWqmX79u2BDZddtKUNdJQ6hsV0VE7RF8nOBTNFPA=;
        b=QA5BVIhdRSLFSHl4Nt2kT2P14yFLZ/x9o/azS5r3wS6A3DFy5r2knf3shzwsymne/W
         TiACsvGeFHuftNHEQ+LeZ/mzkB2stV9I/xvCadQ4fk7M3IxVpvomQI+t5WoBWX2bwG7h
         QVpBJtR/56OTEQhnaWLquAokQvUmTFo7mZWp0H1BXTz0PHjfAmOk8xywHZ8+H06zGyq3
         q6oP9pp3VpqWpJxCp2met1k5d6zniIHx8Ehuv6d/bg+6umfQgi11EDv2fwrjw0OlH1Zv
         stZPAZ/m0lg+V51fWQZX8NLMQv5uRR20oYe7hgliN4hgBoD/5DKPmMwbOktJMxmiyFzP
         NEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1PGvWqmX79u2BDZddtKUNdJQ6hsV0VE7RF8nOBTNFPA=;
        b=jx6M1c8W6Mz5/2/gykduFtTQeHb5CmRXIT4xDcOaJ1oYd6U8kqmA3QiwmmAK29u48T
         MAcf8xe3kUuSD+ecxjvWjB4wbtXsla57NPalXDVIBrwgVQM7R07ShNaVh83j04cAEBXi
         DJO0camtCPN64DeOt9HZkaA0L3NExG5sD39EZKkh+lA0ieMVc5DdofCtXI+WT/qbXWlN
         GSaNfRpmJFNPHmvRGb5wtKE6mt8Rn6mmDtxrmWd2WUX6/B7HxvUP4UA3pKsAvZH1U1Mm
         V+DDQQOAHLaZaZAW827WdWq4riykwMVKwsaE3tUUVn7UCUXksxZstgvVAooa2xdJqkkv
         p+ug==
X-Gm-Message-State: AOAM531uQ2A5gExRPvx9SIlkIin1fpgyEFyMTUmaYDDVn+YOZ69InrG6
        lyKaH9+4cKSAX5q9ZTq4yYE=
X-Google-Smtp-Source: ABdhPJx2UkSalCYd1QzObIlllEjvyEnv67FhhSHetKO+GWfONxgJYkAlN+YEcB4wtkH8YeCbtfpIaA==
X-Received: by 2002:a1c:a516:: with SMTP id o22mr21577690wme.136.1623429785287;
        Fri, 11 Jun 2021 09:43:05 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l31sm6502345wms.31.2021.06.11.09.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:44:33 +0200
Message-Id: <20210611164437.3568059-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 380d2b2d5a0491e47dfa250b40e3d849a922871d:

  regulator: core: Add regulator_sync_voltage_rdev() (2021-06-01 12:13:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-soc

for you to fetch changes up to e2d0ee225e49a5553986f3138dd2803852a31fd5:

  soc/tegra: fuse: Fix Tegra234-only builds (2021-06-11 13:31:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.14-rc1

These changes implement the core power domain for the PMC, and fix a
couple of minor issues as well as add stubs to help some drivers be
compile tested more easily.

----------------------------------------------------------------
Dmitry Osipenko (7):
      soc/tegra: regulators: Bump voltages on system reboot
      soc/tegra: Add stub for soc_is_tegra()
      soc/tegra: Add devm_tegra_core_dev_init_opp_table()
      soc/tegra: fuse: Add stubs needed for compile-testing
      soc/tegra: pmc: Add core power domain
      soc/tegra: pmc: Add driver state syncing
      soc/tegra: regulators: Support core domain state syncing

Thierry Reding (2):
      Merge branch 'for-5.14/regulator' into for-5.14/soc
      soc/tegra: fuse: Fix Tegra234-only builds

Yang Yingliang (1):
      soc/tegra: fuse: Don't return -ENOMEM when allocate lookups failed

 drivers/soc/tegra/Kconfig              |   2 +
 drivers/soc/tegra/common.c             |  97 ++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra.c    |   6 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c  |   3 +-
 drivers/soc/tegra/pmc.c                | 144 +++++++++++++++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra20.c |  94 ++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c |  93 ++++++++++++++++++++-
 include/soc/tegra/common.h             |  31 +++++++
 include/soc/tegra/fuse.h               |  20 ++++-
 include/soc/tegra/pmc.h                |   7 ++
 10 files changed, 485 insertions(+), 12 deletions(-)
