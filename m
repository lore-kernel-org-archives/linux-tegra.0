Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0991AC433B4
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD62C61177
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhEPQOa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhEPQOa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:14:30 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4B2C061573;
        Sun, 16 May 2021 09:13:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a2so5205932lfc.9;
        Sun, 16 May 2021 09:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pWep6XUk/Htmx+rnveDkd22peEfK9wvjv1AZWbCkH+M=;
        b=kCK7YH686pYuZum++8eix84r6KtRQ98Z0FBVDbN726azCmqsaaSnlzoUSTneoLrWvs
         YQajR8rtLX+Vb9RdHmxA6KWVNKR2e13+L1C0c7NkFS0wFlrnYa/CooXTM+WytZTLfwvR
         OsHJfd8dEhcerJ7IQ5y/z+yJ0YaFQr3bSFmX6r57i0UEZ3G8UPJ4jDer7Rnd0SbIqqAw
         Ayo0if8PDb5pn2GrlnSxDi684p92i8JBKmGt+Vd9Bu6qUrBR/NSk0WjCZ4btM4n5FbE/
         l7r2KotdzAkvjENjlkTQq5vpq92kzU+wg3MXdCUs5vjiB+FGSLtznpeJTC6ia6XCw5UP
         VcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pWep6XUk/Htmx+rnveDkd22peEfK9wvjv1AZWbCkH+M=;
        b=juh9P5ghr11CNctWlIbqi7SrKyrYGmJiX/ir/ZDMrsAQLhE5IG24hhnkxXeNXjnVJF
         UPjx490jod5olreuzw83b2xzP8J5beaExtGk6KhjR5ebx7Eil+Mt+Skr0MB0nIulxWrG
         viBtIepOZnnauoWSmYmpWhOp+xQCrwIYJQNG7UzzDrxUG4bu9Af30L1PhDM8mM6JJPEI
         7iv4V26/OZXHMchRLWrDTKkRWEBtqOLU4dyUzc78Uv0zBqwwGfR/YSzw4yKo5VK/zXqy
         21IQRBsZ8KQTwhylHZBmzX7/YzXpNQ50JpAKEuQNvNlKu1FGktaWWtpImxeawbke/eW4
         IyWQ==
X-Gm-Message-State: AOAM533MZSTlerY5You0HPVS8kL9yr4ESa158OcL1IJXCObKHMHfCx1p
        QBL1HAe+ETcBuFHU6zmTS9rGVuI4qz8=
X-Google-Smtp-Source: ABdhPJz1G5vvYZiKX51lLpNn7oKqqYtcLScTYwJptzC39703VKV+MlHaxiMfZ/v1CzdI1kmaMenBMA==
X-Received: by 2002:a05:6512:1031:: with SMTP id r17mr38621304lfr.583.1621181593394;
        Sun, 16 May 2021 09:13:13 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id d27sm1712547lfq.290.2021.05.16.09.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:13:13 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 0/4] Enable compile-testing of Tegra memory drivers
Date:   Sun, 16 May 2021 19:12:10 +0300
Message-Id: <20210516161214.4693-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series enables compile-testing for all of NVIDIA Tegra memory
drivers.

Changelog:

v2: - Added patch which should fix compilation warning of tegra124-emc driver
      on 64bit platforms that was reported by kernel build robot. Thanks
      to Nathan Chancellor for the suggested fix.

        memory: tegra124: Fix compilation warnings on 64bit platforms

    - Added missing stubs to the tegra-clk header in another new patch. This
      was also reported by kernel build robot for v1.

        clk: tegra: Add stubs needed for compile-testing

    - The memory/tegra/Kconfig now uses `if TEGRA_MC`, which was suggested
      by Krzysztof Kozlowski to v1. This makes Tegra Kconfig to look consistent
      with the Exynos Kconfig.

Dmitry Osipenko (4):
  soc/tegra: fuse: Add missing stubs
  clk: tegra: Add stubs needed for compile-testing
  memory: tegra124-emc: Fix compilation warnings on 64bit platforms
  memory: tegra: Enable compile testing for all drivers

 drivers/memory/tegra/Kconfig        | 16 ++++++++++------
 drivers/memory/tegra/tegra124-emc.c |  4 ++--
 include/linux/clk/tegra.h           | 28 ++++++++++++++++++++++++----
 include/soc/tegra/fuse.h            | 20 +++++++++++++++++---
 4 files changed, 53 insertions(+), 15 deletions(-)

-- 
2.30.2

