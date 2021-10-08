Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F36C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1A760F93
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhJHUNj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhJHUNh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:13:37 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B42C061755
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 13:11:41 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id m22so33181269wrb.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KNWLHFXqYdT2gh+x9edoWxDGJ0oKoVJDV2MDrZvoAMA=;
        b=ZGGG50RMsvaM0LmZv4TUd+MC7cLPHPMBm2857GtsESEqfpuTzJkSIfdJG/nhQQL2Ti
         HFmYLcVzIYd2MV2S8/vahu133dJgu4fgKCYd7dseaYgMUPwMurVdRd1t+t/zEAZ50Iip
         kksBJ3BLiQoAJpRUaSolDM3s5ztO16dwoEjTn0Fe4YbJsII7IDRjAQUGieIHH2AZlcMk
         Nt4oJmGtVAvulzUeIktBoxaJgjE+bNk+Aw9BP5590rjH3cGHUtGX3lmBgPxyd6d9GJKK
         f6gKTXdJw1ghIf/mSZiliL6DgUuglOBXxrICVgRbrgW6n6cR79YqvpZSKONWH3VLXFbB
         M3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNWLHFXqYdT2gh+x9edoWxDGJ0oKoVJDV2MDrZvoAMA=;
        b=Z2910K6MwCjLU67YSeXYpgzej83L/8x3tZRk8uQitRJqtbPuIzWXB2npQ/zvDNePU7
         2FOHZCaGvUBPk6X1ZgpH+Krdz6/CBhVQbm1gVf3p8rus20wHACB+x4G+NClrPvqUaSv8
         RkQH5KjYr5hiHvsFYLoGmBr+LN48OiIvDilVAOe+jdUa5qHkCdBC35i3/Ix5XButDBUt
         vGUuNMJgHmgyGGdqES6Hd1IsyXj2/GT7BC5jG1R4QRbFVX0iYLnbMhcxm2oLGKa6mTxm
         IkKCpFq+UMPhXrTYrhz9tWGuI7QWui2Doq5zLN/c9Pvxu0bwtLNbbi6LnJrmpwCuPcNO
         zPCg==
X-Gm-Message-State: AOAM532/9xuf5V0H5Xfspv8UNJqKW4u6mqDReIOKkhPKGMNq1QTgopbe
        WJxlR/NKY+LtsyHP9KKbIrk=
X-Google-Smtp-Source: ABdhPJyZqAhm8yNPkHyUdVV334CDf1LNzNHzLHaAeINNVw8lzonUpGBlNJwkIMmre4Oytgd+MRbBdA==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr6593758wrd.24.1633723900124;
        Fri, 08 Oct 2021 13:11:40 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f16sm286418wrr.53.2021.10.08.13.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] soc/tegra: Changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:11:28 +0200
Message-Id: <20211008201132.1678814-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-soc

for you to fetch changes up to 76d89474310e05d9c592a8beed2aefe4d3396d2d:

  soc/tegra: pmc: Use devm_platform_ioremap_resource() (2021-10-08 21:42:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.16-rc1

This set consists of stub additions to enable compile testing for more
drivers, exposes the PMC's USB regmap on all SoC generations, removes a
state synchronization workaround that is no longer needed and adds an
error reporting driver that can help troubleshoot crashes.

To top it all off, an error handling path in the powergating code is
fixed and the devm_platform_ioremap_resource() function is used to
remove some boilerplate code.

----------------------------------------------------------------
Cai Huoqing (1):
      soc/tegra: pmc: Use devm_platform_ioremap_resource()

Christophe JAILLET (1):
      soc/tegra: Fix an error handling path in tegra_powergate_power_up()

Dmitry Osipenko (5):
      soc/tegra: fuse: Add stubs needed for compile testing
      soc/tegra: irq: Add stubs needed for compile testing
      soc/tegra: pm: Make stubs usable for compile testing
      soc/tegra: pmc: Disable PMC state syncing
      soc/tegra: pmc: Expose USB regmap to all SoCs

Mikko Perttunen (1):
      soc/tegra: Add Tegra186 ARI driver

 drivers/soc/tegra/Makefile       |  1 +
 drivers/soc/tegra/ari-tegra186.c | 80 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/tegra/pmc.c          | 28 +++++++++++---
 include/soc/tegra/fuse.h         | 31 +++++++++++++---
 include/soc/tegra/irq.h          |  9 ++++-
 include/soc/tegra/pm.h           |  2 +-
 6 files changed, 138 insertions(+), 13 deletions(-)
 create mode 100644 drivers/soc/tegra/ari-tegra186.c
