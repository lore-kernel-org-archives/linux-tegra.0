Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E00C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD3A361100
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhJHUNm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhJHUNm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:13:42 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FF1C061570
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 13:11:46 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m22so33181894wrb.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJBkgInhT6PLCmAU8FT+r7FUkf+LpzjWJN55V3vRhsM=;
        b=jNAIOVRVou5pRLaLljnHnuuDcM+O8yh7ViN38/lGI4LU8NdL4usiHkE/sSjz1iahDL
         dZhz8MHiLg0dk33XZ0lh9z2FmjgAW7NUMSH4Dvgoarka10VUwCOBakAzmod++EacZuqi
         L6M6DImyN4aMlzbNN10s/PM5ZEjN96TqqJ0P0IyJA8UKBi6u/3iZ2kcjcmfSirYlDfig
         gacwMgq3XurCP7LxsfBOobR0sksyMpjT0FB6SD9HxtzLGf96VkGn21/qDnbrpkjL7JGA
         BB98ZPBSPlNTboITjzsiamrIGKkWLYwpd9dlyLWnbsydlPYed0TUS/v7QV1vWNbYZQSO
         twQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJBkgInhT6PLCmAU8FT+r7FUkf+LpzjWJN55V3vRhsM=;
        b=3zviLDxSzbcGWSAZLNQLljy656uOVe0ONrQxsIid0oMm43JsoxBvUV21kR8ZsF6Pfr
         qv+U8sAW9W6we0b7o8bR9YQpnrRgoQhT9of1lzLsc8D0IzbWNleHCrp84Fqt1OdOUdyH
         WnU6dMdkyCAvFOsMHYZxwQfY6wiEA11Z1tlIGODL3tRvhzvslv3hxyMtTQ4KZAKA/edt
         PN2NxyC9KmQ3B1YZkiQcX58pdBbIG8Fml3c8XFHFqZL0HWdQ/BW2PaQ1K7+g+VQ3DFy0
         +7fQ2OOCfYrSxXl9Zc1O77nHwDmM+t4Ey+iJEAlaMSxdAxUuRzmK0ZX047FTW9xFvtnU
         ao/g==
X-Gm-Message-State: AOAM530EtAX8/iqXnO3Ae50nmR4wcIN+Cl5bpex9ko1b3upugAjwJ+p5
        9WiZnpLZLwBIS3uV1Oj4Ttw=
X-Google-Smtp-Source: ABdhPJyCi6SYxdSoPHScuvGYOUYb3kBIEa8OHcQM2/3o2YR/dtdUGf7iinL4/1CLgqhr0PiwSX6cCA==
X-Received: by 2002:a7b:c8d1:: with SMTP id f17mr5776836wml.35.1633723905379;
        Fri, 08 Oct 2021 13:11:45 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s14sm281313wro.76.2021.10.08.13.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:44 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:11:31 +0200
Message-Id: <20211008201132.1678814-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-dt

for you to fetch changes up to b9e2404c8bb280e0b7cbf1c2e9b491baab107137:

  arm64: tegra: Fix pcie-ep DT nodes (2021-10-07 21:23:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.16-rc1

This enables additional interrupts on the Tegra194 GPIO controller for
better load balancing and/or virtualization, adds audio support on
Jetson TX2 NX, enables the NVDEC video decoder on Tegra186 and later and
enables more audio processors that are found on Tegra210 and later.

Various cleanups across the board top things off.

----------------------------------------------------------------
David Heidelberg (1):
      arm64: tegra: Remove unused backlight-boot-off property

Dmitry Osipenko (1):
      arm64: tegra: Add new USB PHY properties on Tegra132

Mauro Carvalho Chehab (1):
      arm64: tegra: Fix pcie-ep DT nodes

Mikko Perttunen (1):
      arm64: tegra: Add NVDEC to Tegra186/194 device trees

Sameer Pujar (4):
      arm64: tegra: Audio graph sound card for Jetson TX2 NX
      arm64: tegra: Update HDA card name on Jetson TX2 NX
      arm64: tegra: Add few AHUB devices for Tegra210 and later
      arm64: tegra: Extend APE audio support on Jetson platforms

Thierry Reding (1):
      arm64: tegra: Remove useless usb-ehci compatible string

pshete (1):
      arm64: tegra: Add additional GPIO interrupt entries on Tegra194

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    2 -
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   12 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1244 +++++++++++++++++++
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  506 +++++++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  136 +++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1243 ++++++++++++++++++-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 1246 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  209 +++-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  876 ++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  876 ++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   81 +-
 11 files changed, 6416 insertions(+), 15 deletions(-)
