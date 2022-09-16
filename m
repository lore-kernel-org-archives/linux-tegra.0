Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54102C54EE9
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Sep 2022 10:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbiIPKg1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Sep 2022 06:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbiIPKfv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Sep 2022 06:35:51 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3CAB7768
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:58 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id m3so10969894eda.12
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5K/jTI7fjuDW4G/VqPOVZ9ue0kSth/V/PzuxFr/qC+g=;
        b=S/JMXXmH9Zy6To5nOJq6ZR0ij3lS+NVTUJHgFx8rxpgsJacw+FJwEadgrLfb+JZ3a0
         qhjwPba5hJ+8TRI3Xt8vOM+3dAg5rjNys6UeND+ot+F5hpgvJhCmLiPido+IsEdiEcdQ
         OHYhqReTuFavRANuj5Phwt7Pxl7zRHNpREsldyW0r6J3vjIsWM20DbJKnJ3CTw82iWab
         ZqR8q1PGl/9umXYyo5J/GWac0jA6IU5TPjWAGK9n0Ez0kE+caBGKQ6QbEvVFIr7/bP/+
         kJLrgHB9XKzymQ5wIueIXjEUbsbzpMgUf7VY6bZTJ7GFoRbrdcFSA2KmiuoTnjdtEpCq
         EZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5K/jTI7fjuDW4G/VqPOVZ9ue0kSth/V/PzuxFr/qC+g=;
        b=WR5BP9PEiTPhtU77V75tTNbEZz3coMa1oxrVprbW4pbkarFuxrMmb3nuXdSCOaMZUf
         lLchNsiq7y6eOlxez67XXcFyc0/6H1NNqGeNzEWX+v51uZyWinVNDwczGlQi1/w2hzKz
         zKb5/Z5cZ0eMtPXjFcYBeOZyFTTDbdvvi5WRwvcfKvTMaIdjhituvwl0tnYTQdllb+FU
         /gj8cU+F5jupT2s+arOJPta0xWCFsAcIY+od76H0RwzYU/0VBqUXNmrxH9K5GAqgXOD4
         ON/SZ7wH6nNUkT/fyWpcAQfN6I/JAEyFmTDm9tR4fpluC5NsVFVJV26XQdW2KCtp9Xyk
         E6Cw==
X-Gm-Message-State: ACrzQf2+K4AYbVMyfvj1DX6qw/9Ajgk2atv9gDy/Ox7nnoj5Us4nNc9+
        4Gu3f7NgrigVTIGt9NXSCXE=
X-Google-Smtp-Source: AMsMyM75Nl7uONh5kfRDrG/I0m+0hj63axO4VVaXJFU3ADb+1LWIXuXeElQImsAj0uP8Ea48HWS8bg==
X-Received: by 2002:a05:6402:448b:b0:43b:5ec6:8863 with SMTP id er11-20020a056402448b00b0043b5ec68863mr3296514edb.377.1663323610676;
        Fri, 16 Sep 2022 03:20:10 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s1-20020a05640217c100b0044ec76521a1sm13230860edy.55.2022.09.16.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration changes for v6.1-rc1
Date:   Fri, 16 Sep 2022 12:19:57 +0200
Message-Id: <20220916101957.1635854-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-arm64-defconfig

for you to fetch changes up to 747c39f0ebfaee9cf699dd3c35ac6462db847667:

  arm64: defconfig: Make TEGRA186_GPC_DMA built-in (2022-09-15 15:51:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v6.1-rc1

Enables the new MGBE driver, as well as the existing SPI and QSPI
drivers on 64-bit ARM. The GPC DMA driver is now also built into the
kernel by default to avoid needless probe deferrals that would slow
down the boot process significantly.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: Make TEGRA186_GPC_DMA built-in

Bhadram Varka (1):
      arm64: defconfig: Enable Tegra MGBE driver

Krishna Yarlagadda (1):
      arm64: tegra: Enable Tegra SPI & QSPI in deconfig

 arch/arm64/configs/defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
