Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B3BC433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Nov 2022 17:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiKUROb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Nov 2022 12:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbiKURNz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Nov 2022 12:13:55 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703F1CFA59
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:50 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id v8so6162606edi.3
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUQHKz1alORL7sfDMVM2m4TT1Si68UWSxELASufCTEg=;
        b=jDe0GlBQCqXx48AQfvwf5q26h5NtpNsCBzzLcKRCGgHSljK6wAadeFKUazmRlJKbRB
         Shat/awnyFmPGGEUGwU22UqT/hyhF5N1LxMcLUxhQCeUpydoj1MIoFUcdmDFBb5tbvuY
         +ihDIit3AHshnKfXaschAvnK8WHyIa6ppatFWNqpAqVKPC7mUn4mMwNzVac6k+T6XXrp
         DPJWk4xgISVgeNVhkPDto3ULhjcjpguuzTfb5F3W/QBtX77RwKyiOGqpVHfx+kha9cez
         FvBYpjuozwWkWkw3cFGNYHZNESllugMWI3UmRQjsmnVoJLtRDHMW0PkF1O+ALPMbnXVv
         FoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUQHKz1alORL7sfDMVM2m4TT1Si68UWSxELASufCTEg=;
        b=kzER1LDHLaCIY7WnkVcbuiZ6mcHULEnFRW18wsg75SpB+Ziu8hz4Y4hi+NjNr+vaJP
         PrT3lOHV4/xCaHw+wDtCUtoSz8s8lgw7H8dxIM/qVL0Sb8A1z0hVl2tp3go3HY457BKN
         aCeWeNZkRAbq0YU2KFvUp+y8gJcvp83yMioVNmZgKuf5PSr5ccPrB81yE4Ir4+0i0Wes
         EX5O65vjL4I8zU4bQ5jRvGGdlUbWVUxZt9gBoZvEAAcNzXSL/ZQLptkCAa1JvJNb1ZGA
         Wa4fMq1hGd2nk5/rF5Y8iHloVvgY8hNoAvaUTWo+sTBMVkFG4I/frRqW0OXhSd5Lz0Mk
         praw==
X-Gm-Message-State: ANoB5pmefqGbD43zck96zi8els6UOesx1neKBzzVdqePDDG3A9k3W7GD
        1/nxSmyZhmqihth3QxtnQZU=
X-Google-Smtp-Source: AA0mqf6agvnlQmh/JfbkQRR6OpngWpcxkMJOi45gpkORNvqtqg88JDel89/jxP/SmIqURSV1irDGCg==
X-Received: by 2002:a05:6402:60b:b0:461:9193:7278 with SMTP id n11-20020a056402060b00b0046191937278mr17563799edv.220.1669050768911;
        Mon, 21 Nov 2022 09:12:48 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906648a00b007adade0e9easm5152202ejm.85.2022.11.21.09.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 6/7] ARM: tegra: Device tree changes for v6.2-rc1
Date:   Mon, 21 Nov 2022 18:12:38 +0100
Message-Id: <20221121171239.2041835-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121171239.2041835-1-thierry.reding@gmail.com>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-arm-dt-v2

for you to fetch changes up to e4185804e191bdaeb10ebe00b1b4aa9e2f147a56:

  ARM: tegra: Remove duplicate pin entry in pinmux (2022-11-18 00:22:02 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.2-rc1

This fixes various minor issues in device trees that are flagged by the
DT validation tools.

----------------------------------------------------------------
Thierry Reding (6):
      ARM: tegra: Use correct compatible string for ASUS TF101 panel
      ARM: tegra: Fixup pinmux node names
      ARM: tegra: Add missing power-supply for panels
      ARM: tegra: Fix nvidia,io-reset properties
      ARM: tegra: Remove unused interrupt-parent properties
      ARM: tegra: Remove duplicate pin entry in pinmux

 arch/arm/boot/dts/tegra114-asus-tf701t.dts         | 24 +++++++++++-----------
 arch/arm/boot/dts/tegra124-nyan-big.dts            |  3 ++-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts          |  3 ++-
 arch/arm/boot/dts/tegra124-venice2.dts             |  3 ++-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |  6 +++---
 arch/arm/boot/dts/tegra20-asus-tf101.dts           |  8 ++++----
 arch/arm/boot/dts/tegra20-seaboard.dts             |  6 +++---
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |  6 +++---
 arch/arm/boot/dts/tegra20-ventana.dts              |  6 +++---
 .../boot/dts/tegra30-asus-transformer-common.dtsi  | 10 ++++-----
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     | 11 ++++------
 11 files changed, 42 insertions(+), 44 deletions(-)
