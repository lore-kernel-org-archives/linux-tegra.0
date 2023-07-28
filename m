Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3877DC04FDF
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Jul 2023 09:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbjG1Jli (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Jul 2023 05:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbjG1Jlh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Jul 2023 05:41:37 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E8D12C
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jul 2023 02:41:36 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-986d8332f50so265334066b.0
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jul 2023 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690537295; x=1691142095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Cw3X31p7xwohwKPSgl7qyRMBhhgQ8jBbnhgkogYtkU=;
        b=CxmCL2zjp5pfCKKvAlLDFJ+zF+o/gFr27DGJr3txPTEejzw0c6gDQFrRS+2mqjLa0H
         XD3os3+IcJo+KeNX7FP+WsgHxJhZ0ycUfvxWxioc7Xy2VPugFXMHJ4pcmPrLIGFntCjb
         kuSiKxi5OL2kjDT5CCcP0Hyksdcz6ARrh3Pn5Gir3V0MvaIxtuqqY3Yr2bq0fUyvJFR8
         mAdFHmLcd+8Lph/yr65863a6OYaGUV8/tyc4Sk8Jk/4vVKdCmkEBdCZdK2DYmMabG4NT
         +w9fWEwPfcubjNHDQo5xl5ILWQve53YARhR10Gcve5reij+tQUDeQIazJCYZ/oNtY89J
         Ujxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537295; x=1691142095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Cw3X31p7xwohwKPSgl7qyRMBhhgQ8jBbnhgkogYtkU=;
        b=LzS4wwcvP7eFXuyOElaEqxEYAqmqPC+JP/vqIIF98pGS5qOfO1kCtsgf/RxxNDnbuv
         3/gfT8P+O5ZKAqAms2KAxlPDy3M8XeciPBv9pu11q0CACUOThKrRXn7Fk5aTedCU0kbj
         yebRUxVK3/mpp5zgkJxHFA7aeUqWUaQosEqU9ZBFTtLkPiZ4vdmogF+QlS1WC624e2+D
         6iKic0+T5nfkubHVKjW1gJjJzYTY4/wy//hXkEuVGYKRBGUcS3HLfpberczH0RDcKclK
         lg/66YgyTfDcDMWstOZyHJHb6nwhVqlvJkhviU8XJyJi7zntS8o3STxd672Y88Kpjd1s
         qKoQ==
X-Gm-Message-State: ABy/qLYm3HkmI2nVzJnZCLNjdsd48gJdpt/vWIYlnuhow393PYEyH+6V
        ylA9UBpDq00EvQ0SLVrJUMU=
X-Google-Smtp-Source: APBJJlGHMcjlSyB3jSLWLcP/PXcMAo854eth9XZNWEik076oTphMXnqKi7PQkX18s6T5lHwxI99vTw==
X-Received: by 2002:a17:907:7618:b0:99b:c0da:5028 with SMTP id jx24-20020a170907761800b0099bc0da5028mr1388846ejc.62.1690537294774;
        Fri, 28 Jul 2023 02:41:34 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s13-20020a1709060c0d00b009930042510csm1823558ejf.222.2023.07.28.02.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:41:34 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] ARM: tegra: Device tree changes for v6.6-rc1
Date:   Fri, 28 Jul 2023 11:41:27 +0200
Message-ID: <20230728094129.3587109-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728094129.3587109-1-thierry.reding@gmail.com>
References: <20230728094129.3587109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-arm-dt

for you to fetch changes up to c9a706ab227ef59cc49923358513251ca4965563:

  ARM: tegra: Provide specific compatible string for Nexus 7 panel (2023-07-27 17:15:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.6-rc1

This contains various fixes for DT schema validation and the Pegatron
Chagall and Nexus 7 get specific compatible strings for the panels that
they use.

----------------------------------------------------------------
Thierry Reding (6):
      ARM: tegra: Remove dmas and dma-names for debug UART
      ARM: tegra: Remove reset-names for UART devices
      ARM: tegra: Add missing reset-names for Tegra HS UART
      ARM: tegra: Reuse I2C3 for NVEC
      ARM: tegra: Use Hannstar HSD101PWW2 on Pegatron Chagall
      ARM: tegra: Provide specific compatible string for Nexus 7 panel

 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts  |  2 ++
 arch/arm/boot/dts/nvidia/tegra114-dalmore.dts      |  2 ++
 arch/arm/boot/dts/nvidia/tegra114-roth.dts         |  2 ++
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts          |  2 ++
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |  4 ----
 arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts  |  2 ++
 .../boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts  |  2 ++
 arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi |  3 +++
 arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi      |  3 +++
 arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts   |  4 ++++
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi        |  2 ++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts      |  2 ++
 arch/arm/boot/dts/nvidia/tegra124.dtsi             |  4 ----
 .../boot/dts/nvidia/tegra20-acer-a500-picasso.dts  |  2 ++
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts    |  4 ++++
 .../boot/dts/nvidia/tegra20-colibri-eval-v3.dts    |  2 ++
 arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts  |  2 ++
 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi      |  2 ++
 arch/arm/boot/dts/nvidia/tegra20-harmony.dts       |  2 ++
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts         | 23 ++++++++++++----------
 arch/arm/boot/dts/nvidia/tegra20-seaboard.dts      |  2 ++
 arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi     |  2 ++
 arch/arm/boot/dts/nvidia/tegra20-trimslice.dts     |  2 ++
 arch/arm/boot/dts/nvidia/tegra20-ventana.dts       |  2 ++
 arch/arm/boot/dts/nvidia/tegra20.dtsi              |  5 -----
 arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts   |  2 ++
 .../boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts   |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi  |  3 +++
 arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi       |  3 +++
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 14 ++++++-------
 .../nvidia/tegra30-asus-transformer-common.dtsi    |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-beaver.dts        |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi       |  3 +++
 .../boot/dts/nvidia/tegra30-colibri-eval-v3.dts    |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi      |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-ouya.dts          |  3 +++
 .../boot/dts/nvidia/tegra30-pegatron-chagall.dts   |  4 +++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi              |  5 -----
 38 files changed, 94 insertions(+), 37 deletions(-)
