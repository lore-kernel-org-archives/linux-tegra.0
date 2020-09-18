Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0ACC43463
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33C7C23719
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alldtaKT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgIRPDW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 11:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIRPDW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 11:03:22 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DEFC0613CE
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:22 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w5so5959780wrp.8
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8x42ORVfN12umzyeDu8vBphGH3dXJQcpJnyUm9sp/a4=;
        b=alldtaKTOphOBKbEqDTNjg/5LUqjRZ/fnnE4ZnWBzgneYQRZ0fhKp2Us8kutZt1uup
         7cN1jVH/JxI542Eo3bt8HoQ9fg1XYhGRj4FTIJoBqR32I6FTW8R0hpfvjo+lcpUXvIpy
         xaMuCIj009RioCME5ZBlBSB35KE39WzNZmvU/dW65HJ5mtmwHqI5ZlQQ6m66rh8a0e4i
         rHfdlprgFX3/Sy2yWAOOWP5WgmOBFS1sBWUWZX1RCGBPIpWb579shL7j/VnquXqYopme
         cFHfZ8Lhn7PCFyQQmD3115Cow8oNK3D4gT+39oOjBHPZS7xzuNc2BMY9hYS8w54bNO7d
         G/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8x42ORVfN12umzyeDu8vBphGH3dXJQcpJnyUm9sp/a4=;
        b=e2h0P0ycb+IWSLwjZycqhjSQy6zQWWEhnmKbfqhocOtLO3TXErazUP0p6BJzQbGqgn
         FWfX7i3Ro/T++c7n8FDAHHV2X36qTD2OLv3lZpXsTAS4l0JVQfJQ2I7yKBUHJTP/2huZ
         gn84X4dNGPVY5cNWm8Jcop+TyaUgGNUXJXTRfPdq9p4MTPTerWGx/Ck3YrOQvNE3MX6A
         6PSU6g4ZF3WWqtQ/VmPennJkc7jPCR7KxiRJXeqKtEPbEpeq0nHyVLQEvqCkRWbVaMx6
         tdABsFJbb46289tcdO2PNobp2P8d3jcr+iWSoYVZuEGoPdIPOBx5nx8KFJdCvQ5XJVxW
         27BA==
X-Gm-Message-State: AOAM5307eSOiPhwz9kj4KcZEg7NhH0SG6nm2s1UxWLz5OtAM2x/hDIkX
        R+s2lQkAxA9eMuB5BH7frQ8=
X-Google-Smtp-Source: ABdhPJyM8Nzvh+NOtPcv/I3nH5W1gh36ExESS7DjAnUbwazlJ1Ym0wAeW/XIvizMf5AjJeCgqYDXhw==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr41428693wro.249.1600441401153;
        Fri, 18 Sep 2020 08:03:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f12sm5332971wmf.26.2020.09.18.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 08:03:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] arm64: tegra: Changes for v5.10-rc1
Date:   Fri, 18 Sep 2020 17:03:02 +0200
Message-Id: <20200918150303.3938852-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918150303.3938852-1-thierry.reding@gmail.com>
References: <20200918150303.3938852-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-arm64-dt

for you to fetch changes up to 639448912ba17a9af9e759efbab37d36c6e29dea:

  arm64: tegra: Initial Tegra234 VDK support (2020-09-18 15:58:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v5.10-rc1

This set of changes fixes some minor issues in existing device trees and
adds ID EEPROMs on the Jetson Xavier NX. All ID EEPROMs are now labelled
to allow them to be detected by software.

It also adds support for the Tegra234 VDK board, which is a pre-silicon
platform for the upcoming Orin SoC.

----------------------------------------------------------------
Jon Hunter (2):
      arm64: tegra: Add label properties for EEPROMs
      arm64: tegra: Populate EEPROMs for Jetson Xavier NX

Sameer Pujar (2):
      arm64: tegra: Enable ACONNECT, ADMA and AGIC on Jetson Nano
      arm64: tegra: Add DT binding for AHUB components

Thierry Reding (8):
      arm64: tegra: Add ID EEPROMs on Jetson AGX Xavier
      arm64: tegra: Wire up pinctrl states for all DPAUX controllers
      arm64: tegra: Add VBUS supply for micro USB port on Jetson Nano
      arm64: tegra: Disable SD card write-protection on Jetson Nano
      arm64: tegra: Describe display controller outputs for Tegra210
      arm64: tegra: Use valid PWM period for VDD_GPU on Tegra210
      arm64: tegra: Properly size register regions for GPU on Tegra194
      arm64: tegra: Initial Tegra234 VDK support

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   1 +
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 217 +++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  16 ++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  14 ++
 .../dts/nvidia/tegra194-p3509-0000+p3668-0000.dts  |  14 ++
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |  16 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 247 ++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   3 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   1 +
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  29 ++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 150 ++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |  40 ++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 189 ++++++++++++++++
 drivers/soc/tegra/Kconfig                          |  10 +
 include/dt-bindings/clock/tegra234-clock.h         |  14 ++
 include/dt-bindings/reset/tegra234-reset.h         |  10 +
 18 files changed, 961 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
 create mode 100644 include/dt-bindings/clock/tegra234-clock.h
 create mode 100644 include/dt-bindings/reset/tegra234-reset.h
