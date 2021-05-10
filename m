Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D57C43460
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C45A86147E
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhEJWI0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhEJWIZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:08:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BAEC061574;
        Mon, 10 May 2021 15:07:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2so25654981lft.4;
        Mon, 10 May 2021 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=riPLl2PxUhpaelDy778XK4i4b7qK7Ca6M4MJpEkEvss=;
        b=KlqIQJbk98hxKcUqdfYD78c3b5+3y79oVxYgIaM7gjQE8ldBAeq8PE7jzgSdjB9I0h
         eywUzKutLBkLfmUBuffdkwLkBvcTOnote0mRhijPXAhUVhxieiBbBSpoY6zfmE8JGsEO
         pNBVAAY9fTatEyWm0kpzryOkqKWyFiRdudNwhOXk+RT+0keol3rqYxxIaNoqjQTgle4a
         XcRvbD3rSA55qDIZQz/qnBX7mQWAT6Vp0h99iIMzlF6J3QZxFOHqkhwl5TRi8WBR4oeK
         zTRb6FQjyY/6YEK5ZU/ZwDSEd0BlmDl/kG3wmfJZrq/4ppUeXZ0dUyyvRsU/yqZTz7V1
         eR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=riPLl2PxUhpaelDy778XK4i4b7qK7Ca6M4MJpEkEvss=;
        b=rCsT4rhACJBJrT3RPJHU8lzBw8dfhs0eZ5zhrNyG1ZTvufQQW1DZ327UdHXENh7JV+
         KMppzJkatFk2th9OND2SlBItTqUWMTFPCls0b9RFYfAsdoq67+Re+d6bnukNVIGx6IW1
         zIg1dS+56SwkNGPOcIR9bDyaPtHSXgHr4nOHnN5DITr4LqTgQ/MiuwFoX8BbVkVbk79S
         2+f15YXqQI8psBOvUcN/ygcerBf2OACLR4Np5g6UMvngN5smW8PkHMDR2N0pLq8jiCle
         6ePQT4HRpesB/gaSZRmuCA6gb5VUincv/1QolFEnXPiCE5p8hNTN+qr+/c/ld0rPsjiD
         SBTg==
X-Gm-Message-State: AOAM533Kh4GOeCq54WhfogWGD4CIhzLEQ6JZgCwJAtxijJID7gNJmsAY
        O4266DYz+U655JpjdObHfcY=
X-Google-Smtp-Source: ABdhPJxoA5KBDitthMNGegKHdf9OueHQGKymM96wWblof/2e2VwN8k/FyUGqHTBl39DkAkFxQa4S1Q==
X-Received: by 2002:a19:ad4a:: with SMTP id s10mr19728968lfd.345.1620684436772;
        Mon, 10 May 2021 15:07:16 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id v14sm2390850lfb.201.2021.05.10.15.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:07:16 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?q?Nikola=20Milosavljevi=C4=87?= <mnidza@outlook.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/2] Restore voltages before rebooting of NVIDIA Tegra SoCs
Date:   Tue, 11 May 2021 01:05:24 +0300
Message-Id: <20210510220526.11113-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

Nikola Milosavljević reported that rebooting wasn't working properly on
Asus Transformer TF101, which is Tegra20-based tablet device.  We found
that TF101 and some other devices have bootloader which doesn't re-initialize
voltages properly on a reboot.  The problem is resolved by ensuring that
SoC voltages are at a levels that are suitable for the rebooting of the
SoC before reboot happens. This series adds reboot handler to the Tegra
regulator couplers, it bumps voltages on the reboot event.

Dmitry Osipenko (2):
  regulator: core: Add regulator_sync_voltage_rdev()
  soc/tegra: regulators: Bump voltages on system reboot

 drivers/regulator/core.c               | 23 ++++++++
 drivers/soc/tegra/regulators-tegra20.c | 77 ++++++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c | 80 +++++++++++++++++++++++++-
 include/linux/regulator/driver.h       |  1 +
 4 files changed, 177 insertions(+), 4 deletions(-)

-- 
2.30.2

