Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A3EC54EE9
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Sep 2022 10:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbiIPKfu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Sep 2022 06:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbiIPKfU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Sep 2022 06:35:20 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C7AB69F5
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:41 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bj12so48281425ejb.13
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zXVmGPx3HuaA1w62HoEMMBADOP4NZsYNcKpT/aptRIM=;
        b=iBSJR94z95Qr5Y+UvdzpUYCaybL6YTZfKn6OEolPUo03dLY6ACeDI8by0vHcCf1jnP
         a5/yUCF1qVFrPHjznReQDxqQ4KUgAppQ0lT4FT+c5t8av/dwpQ9ulLATT7pWpDxby2Jh
         nvqNq3XhaSqrTSFBrNFwfejPIYs5IUXasrBBIOJ262SC9tBxNHxweQKsDE42+gLpAkuM
         EyQb58P0EgsJB6bLc7SCBLqCWEW3eMqhEc48/Bja6ARfbDaQk0y5IgFqZkjF0vwZJMU1
         ZW5DmznZSN5JHSxVtjnHoGJaZa+sEWn6BraDQDZj1okUTtlu4cjK+HP9yaT7UvK7YUYo
         V1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zXVmGPx3HuaA1w62HoEMMBADOP4NZsYNcKpT/aptRIM=;
        b=JAxr6I6bWFxramf23miazAwjSFMDQC+EDL0UTgGQKLOOY5ZdYD7PWOSq1KoICe0kxQ
         Lhc8S8qDuYsXABSHW7Cs/PZjtAV6u6OuN1IEy6Fgwft8W+olcW6rOzc5pPZhOXnnDFzF
         zFmnMv5f3mnDow04u8KvwY3DAuiyYDccuUiLPv+ZIl3t+jWOm4FZjfgERYpLN6s8OK+Y
         QpnZHDE5iaioAQMIk2PWJIbrqYrTc9caGKyhevGwHj9S0rwnRqL0ItV+lUzwGLcMD0Tu
         p+fZMixEi4ZNL5laGLmut/HgE4QTo8dFpTE3HXbYalHG7gYfVs2AGqXXhQaFFz0/bZcG
         Yg5A==
X-Gm-Message-State: ACrzQf1Oav0WrTPVGYfg81AosHWJsgwg3TI5mVUxwcEySS50NvFdculV
        upun1PyskBdYyFOrZuv7poA=
X-Google-Smtp-Source: AMsMyM6m0n0N2z8fFax/mVaavAXNfkEmN/ilbhMEEIJz5ewZ4pvud4xMYQ+OeJqmiR5w3VOG8Wrt5Q==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id fj2-20020a1709069c8200b006dfbaa29f75mr3176228ejc.762.1663323605123;
        Fri, 16 Sep 2022 03:20:05 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v5-20020aa7dbc5000000b00452878cba5bsm5676435edt.97.2022.09.16.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v6.1-rc1
Date:   Fri, 16 Sep 2022 12:19:54 +0200
Message-Id: <20220916101957.1635854-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-firmware

for you to fetch changes up to fa586abcfe4b43e170d72586b6f11bcc48f6766c:

  firmware: tegra: Switch over to memdup_user() (2022-09-15 12:45:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.1-rc1

A simple cleanup for user memory usage in the BPMP debugfs support.

----------------------------------------------------------------
Qing Wang (1):
      firmware: tegra: Switch over to memdup_user()

 drivers/firmware/tegra/bpmp-debugfs.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)
