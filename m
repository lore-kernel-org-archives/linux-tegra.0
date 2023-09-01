Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBBFCA0FE9
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Sep 2023 10:17:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjIAKRy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Sep 2023 06:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238128AbjIAKRx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Sep 2023 06:17:53 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B435E1BF
        for <linux-tegra@vger.kernel.org>; Fri,  1 Sep 2023 03:17:50 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so372619066b.0
        for <linux-tegra@vger.kernel.org>; Fri, 01 Sep 2023 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693563469; x=1694168269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEUJ9dGTWHYlfawb2VxJeWDhFCdnxgU0Kgh1CdlV0lo=;
        b=SNqU8fup9sdDZnamyPoiKFbQTn/xdGooqHtnae6k+8XJMC5Q3t+lD0k+D/odS6SKST
         is+XNRp4btvRd6Pq0Nj5mo5/lyrWRmRCA/tswpPFpLq4nQT04iQxYZq2ofTXOrmWL2nB
         h8s/OsltEBRnZcTkgH7/oFm3vyNUMmH2G7sXOyH/XX5YCI+IWoSEcTv6peiZIjhJTUKI
         YVHVkfidXT4rVdHJtcK5LYgLeZnChcv4hrRbUuO85SqdUTj2D4KeiLVXMtJG8rfxIrSP
         hz4UHu/uC4KykJ7aqwmkB0PRyQXQ3BWJLTKGNQapTZT4m2rWohxNMSOIXIxYxCMKILjT
         08UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693563469; x=1694168269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEUJ9dGTWHYlfawb2VxJeWDhFCdnxgU0Kgh1CdlV0lo=;
        b=gbT/D/7SSQj1iXprDrnCmfm7nbdsKP40n31T0YRcrI78VPNPViW74Fs3RYC1qW0Pd/
         FqxFOMlq7oAbwA7VdPSiWIWZ/ARf9LHRKrWfviy5EUcFSz4RGwg1+YSLQV3cx/Wf8ghS
         GpR8+6rpmBQ499qhcj37bzoIfISrZs8K8fGVzU8ghTzfZvfkg9Q3afenLq/QeDXdVvO9
         vKPpZayUZLQ1SjPR/U6oHbU7mk8vnsAoLoJW4dbMjDYH5GPa+SqKZmjcWUJMobvnBeJ9
         6H4fbNDbrP/ijVfHtGxVFbY6QLHwteHB0mhtI+zJYDGgcbz45da6zZWY08g1C6ox5GhC
         Pc2Q==
X-Gm-Message-State: AOJu0YxBqlGBQ2CiHPtwrBICb/raOYS3mA8M6yC2UnJHbCdrBEHhChMo
        WNKsj2Wru0O8dF+JCMHgUm1KdLzAv0c=
X-Google-Smtp-Source: AGHT+IHEpjnCKl2scwsxKg6+R3OIwiUl7xKK7TbtKEI80NY66k3gP9vC5Eu9FxriU6AISgnz/dfKeg==
X-Received: by 2002:a17:906:749c:b0:993:eee4:e704 with SMTP id e28-20020a170906749c00b00993eee4e704mr2693077ejl.38.1693563468969;
        Fri, 01 Sep 2023 03:17:48 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g24-20020a170906395800b00992e265495csm1803299eje.212.2023.09.01.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 03:17:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 2/2] arm64: tegra: Device tree changes for v6.6-rc1
Date:   Fri,  1 Sep 2023 12:17:41 +0200
Message-ID: <20230901101742.1871434-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901101742.1871434-1-thierry.reding@gmail.com>
References: <20230901101742.1871434-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit d7fb6468ec9f18db52ef3c84eb44a9025021c830:

  arm64: tegra: Add blank lines for better readability (2023-07-27 16:48:25 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-arm64-dt-v2

for you to fetch changes up to 112aead4e3d08b455723fa49c17119fbbb4f6e6d:

  arm64: tegra: Mark Tegra234 SPI as compatible with Tegra114 (2023-08-18 17:24:51 +0200)

As discussed previously, here are some late updates for the Tegra tree.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.6-rc1

Contains a bunch of improvements for DT validation as well as some fixes
for P3767. This also contains the addition of display support for Smaug
and enablement of the IOMMU for host1x on Tegra132 (Nexus 9).

----------------------------------------------------------------
Brad Griffis (2):
      arm64: tegra: Fix P3767 card detect polarity
      arm64: tegra: Fix P3767 QSPI speed

Diogo Ivo (3):
      arm64: tegra: Add DSI/CSI regulator on Smaug
      arm64: tegra: Add backlight node on Smaug
      arm64: tegra: Add display panel node on Smaug

Rayyan Ansari (1):
      arm64: tegra: Enable IOMMU for host1x on Tegra132

Thierry Reding (5):
      arm64: tegra: Add missing current-speed for SBSA UART
      arm64: tegra: Remove duplicate nodes on Jetson Orin NX
      arm64: tegra: Use correct format for clocks property
      arm64: tegra: Add dmas and dma-names for Tegra234 UARTE
      arm64: tegra: Mark Tegra234 SPI as compatible with Tegra114

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 66 ++++++++++++++++++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |  4 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 13 -----
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi |  1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 40 ++++++-------
 7 files changed, 93 insertions(+), 34 deletions(-)
