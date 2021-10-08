Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB315C433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EB15610E5
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhJHUNj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhJHUNj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:13:39 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD06C061762
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 13:11:43 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id k7so32922854wrd.13
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 13:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q6coWZ7sMS8/cnYc4yrmrrCkk64EbPdSf+pzLA8E51A=;
        b=IqPhVpTHqsTU+BKEpiOq4SqR7eH28X0HUfiFkPXDXgwQc/rBHq4AUxlI7zJwfEb9Km
         4/F6vSgIa6f1U00Iz8KLxcC9T3c+wD6BMzUpwfID29Vd0Mj3I3kgceoTlBmy/3QyJ4YG
         pO2p+9+CFeGIqXWd7LGDZl6GHQzT2d12iUROXXZCmwA0btugMBgIeoSLtaoYh5jFfwZ8
         jVXHhXUY9Yq5+jfoJLk9hyaiEROo0iXUPQk8niUX43lqz/enp8qnGCybIwhVLBjPBv35
         /60OGetlDcO7Txg5yiCNmUsFd25JqjdDwDOfEF1wlAtDXAb7onBi1LNSZAe01KL9NbW7
         WRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6coWZ7sMS8/cnYc4yrmrrCkk64EbPdSf+pzLA8E51A=;
        b=wsNrH9b4YbL7s74hqTjIwiBTIKwGjYmTSeTnlrJ+EkDcbKKuYns7ua8PmrswxTrxqU
         sfbG/stm1MUHuypgnN6whdf/WV+9bxrf8CwFBKhuuVqddAXOrsueoFDxqbxPM2MzH9Lw
         MCU+REHQGSOum6ab7v1O5togrypfV7RBvvuAr9yUbyPU1vnrH3fPVnZW/F2oRcsvkLEW
         JzFx7IhwZMsV7CL7xUIcim6tIPwFNBi3Q2TOQIyGzVuj0pFcp7/Tq8laIcxWTAgrCwKg
         sDmahZPqH1pSjRV9+BH7cKGaNoutpTDHjD/iolWUAQJR+Q2KYCH1sE/+YVqQHPK2bEQc
         AZqA==
X-Gm-Message-State: AOAM532+dXnUyC3qSlPsGzt/5VU4LqvC+P+CoNigvo4hykhyBpGWQHRe
        SgrzHJ6qmhyj4Dg2gtw8EJI=
X-Google-Smtp-Source: ABdhPJzVbW3ng2xhAjX1HA9rXvPa/cMP6LypEzqShOYN23bF47ZPoQO9I9yNR6Zau8N7dS/b+z2lyQ==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr6623943wrc.231.1633723901801;
        Fri, 08 Oct 2021 13:11:41 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x17sm301964wrc.51.2021.10.08.13.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:41 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] cpuidle: tegra: Changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:11:29 +0200
Message-Id: <20211008201132.1678814-5-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-cpuidle

for you to fetch changes up to bdb1ffdad3b73e4d0538098fc02e2ea87a6b27cd:

  cpuidle: tegra: Check whether PMC is ready (2021-10-05 19:11:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
cpuidle: tegra: Changes for v5.16-rc1

This pulls in the for-5.16/clk and for-5.16/soc branches and uses the
stubs added in them to enable compile testing of the cpuidle driver.
While at it, this also fixes a potential driver probe order race
condition between the PMC and the cpuidle driver.

----------------------------------------------------------------
Dmitry Osipenko (5):
      soc/tegra: fuse: Add stubs needed for compile testing
      soc/tegra: irq: Add stubs needed for compile testing
      soc/tegra: pm: Make stubs usable for compile testing
      cpuidle: tegra: Enable compile testing
      cpuidle: tegra: Check whether PMC is ready

Thierry Reding (3):
      clk: tegra: Add stubs needed for compile testing
      Merge branch 'for-5.16/clk' into for-5.16/cpuidle
      Merge branch 'for-5.16/soc' into for-5.16/cpuidle

 drivers/cpuidle/Kconfig.arm     |  2 +-
 drivers/cpuidle/cpuidle-tegra.c |  3 +++
 include/linux/clk/tegra.h       | 24 +++++++++++++++++++++++-
 include/soc/tegra/fuse.h        | 31 ++++++++++++++++++++++++++-----
 include/soc/tegra/irq.h         |  9 ++++++++-
 include/soc/tegra/pm.h          |  2 +-
 6 files changed, 62 insertions(+), 9 deletions(-)
