Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6363C4332F
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Nov 2022 01:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbiKSBsY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 20:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231947AbiKSBsF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 20:48:05 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D4717E2F
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:32 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id x2so9427227edd.2
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NefUSVzURATnbl/MU1ae3//R/0lpATSVBKvZxN+jiNc=;
        b=NS1DMYNYU1mhU7HIXYnO4KkhIHMNY4vvuAdqH9uKOpl89VMr2bbDbQn+Y/VktjsdVJ
         9wPVIDJHvZpi5IsYO/o+7HecLgbtCFPcIWnYd4rg7i/ISAkE3ie+kcvrZ1fbsUOf4cuc
         yqAQTqmabjggbE3OShfr8snbsP58KHQdSWtp9BLeyN782egKRkTu3iC3FHywsbmd9wr8
         TseCO/1b6wlg+vxjEYkMspXys/2g2ra7eKgWCwftzK4Og++NCev0Yk5ikfBvOa2rhx7G
         2I6Tj4RLumsSRf1mcqUNjjQExc6AcvaNlIc2u9X0ir3X4VuG92m4O4S5tkOOBvUgXSBT
         KGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NefUSVzURATnbl/MU1ae3//R/0lpATSVBKvZxN+jiNc=;
        b=UBoMri4EegGIgWXh4TRQY+Q/XagI+F4aU2tfs8GOoISzFQviDlizGUm6XUe6EZGDLz
         rYyihEdg7vMf1j7uUZJ85e+xLpEvOBbrEeBxsELpYg03WA42TqZdzW0oYMOMA9T8uyEQ
         W6Z8Bd7ZnMxnWlFvVBqfS8qqaVdo7ROgoRYUEJq18F6FF+yrPQCIRBc3WyLsijP1tW1P
         RJ++NA8EqFPX2WEQ88NxOUihoa3ibNXPXwd78zxgKYgGcPXok3DfAEzFmMSzhRcGAq4d
         ialgz5vkAi9MS5UD4ZCOtvBz2XZV4wKbHjjxqcymCSaV3tVPH6LzdgZirvS+rfj1+GoC
         a8Dw==
X-Gm-Message-State: ANoB5pnMJ+00FxACPu+SA5PszkrCbjqSTjH2uMcE/xvdblv39EIdwKs7
        xxygORrd4KsvaIozKNfg+XBiZy2VFpM=
X-Google-Smtp-Source: AA0mqf6zyqlJjSA2s/fiAhGqpUOr2hhLpRwrkN3yauTqSInERE8rV4hu7+PrymVD4lDc9vAm7nE7ug==
X-Received: by 2002:aa7:c9cd:0:b0:461:891a:8162 with SMTP id i13-20020aa7c9cd000000b00461891a8162mr8092370edt.398.1668820831342;
        Fri, 18 Nov 2022 17:20:31 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ek19-20020a056402371300b00458824aee80sm2408019edb.38.2022.11.18.17.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v6.2-rc1
Date:   Sat, 19 Nov 2022 02:20:23 +0100
Message-Id: <20221119012025.3968358-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-arm-dt

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
