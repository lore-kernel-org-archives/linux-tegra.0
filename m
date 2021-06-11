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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D3EC48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24D6D613BC
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhFKQpR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhFKQpQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:45:16 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98455C061574
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:43:11 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so8924872wmq.5
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/DDhEhmd/WWK/nmogtTO3okii3O3flMjdbqXxBBxu0U=;
        b=lz6oU35YVQA5fAK7pA7HTI+BEiNXOMWV4Sh11Ysgg6MZU84SMNZDk/grXDOHr2dpmK
         5JreUnXQrC+mc7KEujTHacVBcaRczS4HWp72t+JVoh+LCRDabWbTlAbk24gfhQKrZzMI
         /+OtA/ZuuZiU5z1FRd90YnILbA1eIg4qXDiz5rpCp3plalERRqeEal9Et3PhFbRqJRqV
         QbHwFy5H+aU8zi0kZsNo4xPcxwfhLtXx+fSSQZhIVvKLBuD0HoyhrCUmey2/Yz+X1MLi
         x7SQXSmbr5C60h8W1xCwB2inVpMARJmhvjkBR8bo8ZyKJ8KLtixZ4/Ir+n9a4pfvY28p
         ZpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/DDhEhmd/WWK/nmogtTO3okii3O3flMjdbqXxBBxu0U=;
        b=SEyWdb3HT42WDuoa+KHSk9792POgv4InIuQaCYkQUw3lGph+zD+tmCDiI/ozQM4ASU
         5jnICkPl6+7YnAIG6jfiPI17ZkSGgdQBEZIIuNaULmpspqBhTICuq44J/125XgwcVTAV
         CJ7ULNGcbObfAs+TbWzqAbyLwPuIc4yX9uhL21zOMmHWOpNnAJr9hoIksqfoCTv1Ghy3
         VqUVt5DDiXsn8w8TNBOti8bxIdtoeiWy4a0jbqew7mWrcremmH5KDWz4LJA5FrULLas9
         zXO3Hs43WWiKLvVXdxr1fjcnNor7ptpvTXewngr8M/5SMw2C+3EpI9YsaOBSYKz6/1Re
         dFng==
X-Gm-Message-State: AOAM533So4g+gOxu8Ryoa5xIKZxLb92FQhGXOUH2c34okz4boZj1Bw2J
        K0ODumZtmOCuFv5+r1ZdROE=
X-Google-Smtp-Source: ABdhPJxmSVTeUcIzERg8Pc4lCkUbFiPFHCflpAJq+LBSKHgIism1xc/jsLbY+QNRNkUHMKA5P+jErw==
X-Received: by 2002:a05:600c:4fc5:: with SMTP id o5mr4925670wmq.148.1623429790181;
        Fri, 11 Jun 2021 09:43:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x10sm7604589wrt.26.2021.06.11.09.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:44:35 +0200
Message-Id: <20210611164437.3568059-4-thierry.reding@gmail.com>
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

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm-dt

for you to fetch changes up to 4c101a4466983abe7798493ef17279cc3f8eb028:

  ARM: tegra: ouya: Enable memory frequency thermal throttling using ACTMON (2021-05-31 11:40:29 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.14-rc1

This contains various improvements (such as microphone detection and
thermal zones) for some older Tegra devices (such as the Nexus 7 or
the Acer A500).

----------------------------------------------------------------
Dmitry Osipenko (13):
      ARM: tegra: acer-a500: Improve microphone detection
      ARM: tegra: acer-a500: Specify proper voltage for WiFi SDIO bus
      ARM: tegra: acer-a500: Bump thermal trips by 10C
      ARM: tegra: Add reg property to Tegra20 EMC table device-tree nodes
      ARM: tegra: wm8903: Fix polarity of headphones-detection GPIO in device-trees
      ARM: tegra: paz00: Add CPU thermal zone
      ARM: tegra: nexus7: Add i2c-thermtrip node
      ARM: tegra: nexus7: Improve thermal zones
      ARM: tegra: nexus7: Remove monitored-battery property
      ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant
      ARM: tegra: Add cooling cells to ACTMON device-tree node
      ARM: tegra: nexus7: Enable memory frequency thermal throttling using ACTMON
      ARM: tegra: ouya: Enable memory frequency thermal throttling using ACTMON

 arch/arm/boot/dts/tegra124.dtsi                    |  3 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 21 +++++++----
 arch/arm/boot/dts/tegra20-harmony.dts              |  2 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts          |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                | 43 +++++++++++++++++++++-
 arch/arm/boot/dts/tegra20-plutux.dts               |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |  2 +-
 arch/arm/boot/dts/tegra20-tec.dts                  |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |  2 +-
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 16 +++-----
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |  9 +++++
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   | 11 +++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 |  4 +-
 arch/arm/boot/dts/tegra30.dtsi                     |  3 +-
 15 files changed, 93 insertions(+), 31 deletions(-)
