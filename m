Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EA7C43334
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239325AbiGHS4Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 14:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239323AbiGHS4X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 14:56:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608FE18376
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 11:56:22 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id m16so12407201edb.11
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uHrfk7LI7wY2eWl6J0xRT5eHLHw4uNlNuRzQ0IvUbyE=;
        b=K/+cHWyPKOwWnCgUBDrCKtOfztKwmz6zr5+8qhRQdrDTMTviQUnmXih9VGJzS9O4vp
         qGzx4Tz93t5CiCqIV+dCviH05TTkNr4QVfYTKCIIMNIE64wLHKLp7/UX/iXNUYZSnq1+
         NQz0t0ncHT0Z/Cs2Or56Qwd2bGqXb1zOesMMpqrRV5xsNya1aq0oT2iKAL2I/2PAEdl/
         YbzQvstxbZ/bJ1RIZDMsE1fbVuq7xab3W6mwJJjpqX7O3Zc0T91cNHnqPw+EjOrybWjN
         eUHmx4YNyVWjYRIM+LsD5eb0VhRKH2rFFUbqsGGYNQeWIo7kA3hvyi3r5fM+M9vTqXOl
         7qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uHrfk7LI7wY2eWl6J0xRT5eHLHw4uNlNuRzQ0IvUbyE=;
        b=b516rh3Rh3qyY+q3OO9V4ECEf6ro0Z37CbuQcjDk3JDLh9WP3io4C6Sc4MVCrhX5QI
         t4GZvaZYos44BGRfjasX48eUxpP6h7tgYaYL+x0lgYeAjcaSZ/XSY2xYfWRWKA28+i2n
         vYMuhaU26FW/AQcTmo8YygoJKfTPkdBhNcgmmbnUqnroZHgFCKk0e3uB31A4fqSgjBH4
         nAsA4F6DQCLM6HMeA3/hWLeZC0Lda0Rcsj6kZRRnKu8F05RrGpihLTGTkhznGjfpGIbF
         B/56BdijzWcQ+mNkMS0BBGhVMZxK40XhYnta9a5RdCbBGIxXeKah30PzUIrozD1aoGgu
         lY7w==
X-Gm-Message-State: AJIora+16iNv+q+ZvzUgLcT+IACHCSiRYs9BSIq7NPWntUiTJ3hlhLU3
        cuUlzR0J7YEKD3CooQviK0w=
X-Google-Smtp-Source: AGRyM1sjwLRosHhGfK5wYDGLNPyZvUj6pzH6TVgnH7fYGeh1AN0vwiwCZ8qJyeAB/u6zkz8MM0cfWA==
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id fe7-20020a056402390700b00431677664e7mr6798242edb.0.1657306580905;
        Fri, 08 Jul 2022 11:56:20 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v17-20020aa7dbd1000000b0043586bee560sm29912939edt.68.2022.07.08.11.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Device tree changes for v5.20-rc1
Date:   Fri,  8 Jul 2022 20:56:06 +0200
Message-Id: <20220708185608.676474-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-arm-dt

for you to fetch changes up to 799270e9b8be0846d418ed6c3f61408aef8059a1:

  ARM: tegra: Align gpio-keys node names with dtschema (2022-06-24 18:15:53 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.20-rc1

Two minor fixes to help reduce the noise from the DT validation tooling.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: tegra: Adjust whitespace around '='
      ARM: tegra: Align gpio-keys node names with dtschema

 arch/arm/boot/dts/tegra114-asus-tf701t.dts                |  8 ++++----
 arch/arm/boot/dts/tegra114-dalmore.dts                    |  8 ++++----
 arch/arm/boot/dts/tegra114-roth.dts                       |  6 +++---
 arch/arm/boot/dts/tegra114-tn7.dts                        |  6 +++---
 arch/arm/boot/dts/tegra124-apalis-eval.dts                |  2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts           |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts                 |  2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi                      |  4 ++--
 arch/arm/boot/dts/tegra124-venice2.dts                    |  2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 10 +++++-----
 arch/arm/boot/dts/tegra20-asus-tf101.dts                  | 10 +++++-----
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts             |  2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts                |  2 +-
 arch/arm/boot/dts/tegra20-harmony.dts                     |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                       |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts                    |  4 ++--
 arch/arm/boot/dts/tegra20-trimslice.dts                   |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts                     |  2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts                 |  2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts            |  2 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 14 +++++++-------
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi        |  2 +-
 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi    | 10 +++++-----
 arch/arm/boot/dts/tegra30-cardhu.dtsi                     |  6 +++---
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts             |  2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi                    |  6 +++---
 arch/arm/boot/dts/tegra30-ouya.dts                        |  2 +-
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts            | 10 +++++-----
 28 files changed, 66 insertions(+), 66 deletions(-)
