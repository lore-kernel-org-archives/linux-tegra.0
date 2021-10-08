Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755DAC433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FD5D610E5
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhJHUNl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhJHUNk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:13:40 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082C2C061570
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 13:11:45 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t8so33251372wri.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 13:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaMkCDXAPf2zzbzPSS3SHKXSx5UyLXsAaofkvKwRahc=;
        b=qrHEyjZyO2e45qwd0XdaUIYhv+hUXOcwbsFQhJU9Wtcp8uP11nBRBOhSpCmpBZfQTg
         iy4stduEugSUQM83ajywaXEyFoD+anZYXAgDjs3ys8/ToCfJ3fXJ18LEMl6f1CURBMOo
         F17yA8CFqD/JEJHYWN2hODJy0Zoi5rllvoB2SaR7eWJdXppS0qNhUawk8hx72sgYlXZ4
         M1+u1gXp4eVsImi4xOh2z88q2j0nwIpmWtBpyUrjVupEX3iY5CcG5cDe3KkIQ2NxtzqO
         7feSky/t16fkRF9RDW/gPu863nRnY+rw6u65aPBgfR93ko9BUMywzqR9qV/2tGyOqobu
         DWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaMkCDXAPf2zzbzPSS3SHKXSx5UyLXsAaofkvKwRahc=;
        b=18BicUoM5B1mAh7SLm0CQJEhbAWpjMYYm/k/CJfByEWRkCKSuQSACYUExsCqNMXBYM
         /rF/lS4CMpuwpUSbS87PH5n0IcrixsP273RflJbkMTXINis9Zpk+Y9kJTd2olemaEnQo
         0mjiFiIRvVAgCXK+Naq9F+k4eZCM4PanmuDFBNV4mNWxAIL08yNJN51bfDwitGID1i9v
         XefMwELn1I2uKBjUTgb2/L6PlJpPb5ige0yB/ozhaa+GDnIVTh3kJrbVJdiRDioEU9xz
         ID5BslHA6N5ROEYvSLsrFHWXQ8BNom1eQagvzbDfNBs6Fn6xw2P+TFgyHfdwwCYOR2+X
         G6zA==
X-Gm-Message-State: AOAM530oh7Bi6A1OyzFAII3IIeihsJLazchmoW/4HYokP9e0PcgHCfzA
        BTefDIcL5M/KFZ1eNbjl87U=
X-Google-Smtp-Source: ABdhPJzUdsl+jyJQtzEmc3jeD02XVww5KUUKF1zqP1bw43gWE3PSySMJnKXFuahVkKblKjJhWQBl8w==
X-Received: by 2002:adf:a2d7:: with SMTP id t23mr6896509wra.156.1633723903685;
        Fri, 08 Oct 2021 13:11:43 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u24sm12018470wmj.48.2021.10.08.13.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Device tree changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:11:30 +0200
Message-Id: <20211008201132.1678814-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm-dt

for you to fetch changes up to 96f4adcd888d7ecb17ba5c88c141ed107cedf913:

  ARM: tegra: Remove useless usb-ehci compatible string (2021-10-07 20:59:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.16-rc1

This contains various cleanup patches to 32-bit ARM Tegra device trees
and enables USB OTG mode on the Nexus 7.

----------------------------------------------------------------
David Heidelberg (2):
      ARM: tegra: acer-a500: Correct compatible of ak8975 magnetometer
      ARM: tegra: Remove unused backlight-boot-off property

Dmitry Osipenko (3):
      ARM: tegra: Update Broadcom Bluetooth device-tree nodes
      ARM: tegra: Add new properties to USB PHY device-tree nodes
      ARM: tegra: nexus7: Enable USB OTG mode

Thierry Reding (1):
      ARM: tegra: Remove useless usb-ehci compatible string

 arch/arm/boot/dts/tegra114.dtsi                    |  8 ++++--
 arch/arm/boot/dts/tegra124.dtsi                    | 12 ++++++---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |  7 +++--
 arch/arm/boot/dts/tegra20-paz00.dts                |  2 --
 arch/arm/boot/dts/tegra20.dtsi                     | 13 +++++++---
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 30 +++++++++++++++++++---
 arch/arm/boot/dts/tegra30-ouya.dts                 |  5 +++-
 arch/arm/boot/dts/tegra30.dtsi                     | 12 ++++++---
 8 files changed, 69 insertions(+), 20 deletions(-)
