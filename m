Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A584BC54EE9
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Sep 2022 10:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbiIPKf7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Sep 2022 06:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbiIPKfb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Sep 2022 06:35:31 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A41BB6D71
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:39 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id e18so30836228edj.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9D6Cy0qk8oSMPdVYps0zgDOs5+iKxwodqerE+wzvy+Q=;
        b=agcyp26HZ9Qbsu2kOoNg8/h3Gv90yvlZO5aSXi3fUS0Ik1tWcN2paSadnkCzNXGCH+
         gF/h7+513AF3O5AGEBg6JcZRdyD498C0XtccIgVu4wolaOuVh5VMOXZd6ffDqclafhI9
         55TPnnuFDARzp8GGaafPA84j5aV1li8okTa+K2RAGz+H/Fu1oyvzMpw3+YBtdObCFxmc
         KNOWc2K83PfxZjghUfojo+udKe4R+sZibdIjNgRNPDaraOZNYT4M3BPrF7aMSRfdI2si
         FHNI+rA6ZqzYFtv2tNamoB0QHfRV5FViHByCgmk/fmq398u9R5bFH2bFV8zfseQDSdUI
         lb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9D6Cy0qk8oSMPdVYps0zgDOs5+iKxwodqerE+wzvy+Q=;
        b=2j5P2SR492xLfpJmhgEqAmUkrtV1HBuIXXAfndkKjXHPSzuSY6v1/NorDZxboO7yOV
         awtY6HcEV0TtDq15iFKkKK3EfeEI294OZTzUE0i3ny9a7tYD/cjM2Q/3PMTcidAcpqIl
         FgS2S2bDrwk/e5njboKmG9nXAVLFBNcRycTi1o5z1fAVWEwzRplEvZMulflyLQpKbuSZ
         kDG03jRzSH6qy02ipXJqySQLE37OLn53ybnokQtj1sXfgr3rsmfufhlLUssa4TBLabud
         cX77m1i0wzlCiLEWWY078blRNrRb7jh1bFhSIYvBZzH/hRRU5wz0k6FArsN2tkAuLDLr
         ukyg==
X-Gm-Message-State: ACrzQf1JyQKXmFZiIn1V5v8oAbZrwtvotyVOpm69lG+Y5msFUp/sGjB7
        0o/m9HcHRwNCuZ78dupgFi5iS3Y3rfg=
X-Google-Smtp-Source: AMsMyM6DPyiX7amS2zxG2EkNS1kJRE3hY2uqJbWM0G5gI83sURx9mUKkGob+QWDckHp2/QtxIZ82pw==
X-Received: by 2002:a05:6402:5110:b0:450:c196:d7b1 with SMTP id m16-20020a056402511000b00450c196d7b1mr3363248edd.117.1663323603422;
        Fri, 16 Sep 2022 03:20:03 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709061dcb00b0078034812bc7sm3478790ejh.200.2022.09.16.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: cbb: Changes for v6.1-rc1
Date:   Fri, 16 Sep 2022 12:19:53 +0200
Message-Id: <20220916101957.1635854-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-cbb

for you to fetch changes up to 53283105cab6f408968b7546826303ad329e9983:

  soc/tegra: cbb: Add support for Tegra241 (Grace) (2022-09-15 12:41:36 +0200)

I've split this out separately for now because after the discussion
last release cycle there wasn't quite consensus about where this should
go. The EDAC maintainers said that they didn't think it'd be a good fit
so I'm including it again for ARM SoC here, but it being on a separate
branch it won't block any of the other patches from going in if this is
still a contentious topic.

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: cbb: Changes for v6.1-rc1

This introduces the CBB driver that is used to provide (a lot of)
information about SErrors when things go wrong, instead of the kernel
just crashing or hanging.

----------------------------------------------------------------
Sumit Gupta (4):
      soc/tegra: Set ERD bit to mask inband errors
      soc/tegra: cbb: Add CBB 1.0 driver for Tegra194
      soc/tegra: cbb: Add driver for Tegra234 CBB 2.0
      soc/tegra: cbb: Add support for Tegra241 (Grace)

 drivers/soc/tegra/Kconfig              |    9 +
 drivers/soc/tegra/Makefile             |    1 +
 drivers/soc/tegra/cbb/Makefile         |    9 +
 drivers/soc/tegra/cbb/tegra-cbb.c      |  190 +++
 drivers/soc/tegra/cbb/tegra194-cbb.c   | 2364 ++++++++++++++++++++++++++++++++
 drivers/soc/tegra/cbb/tegra234-cbb.c   | 1113 +++++++++++++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c |   29 +-
 include/soc/tegra/fuse.h               |    6 +
 include/soc/tegra/tegra-cbb.h          |   47 +
 9 files changed, 3766 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/tegra/cbb/Makefile
 create mode 100644 drivers/soc/tegra/cbb/tegra-cbb.c
 create mode 100644 drivers/soc/tegra/cbb/tegra194-cbb.c
 create mode 100644 drivers/soc/tegra/cbb/tegra234-cbb.c
 create mode 100644 include/soc/tegra/tegra-cbb.h
