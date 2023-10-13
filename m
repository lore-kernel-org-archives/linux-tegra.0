Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D4DCDB47E
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbjJMPhf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 11:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbjJMPhf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 11:37:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E98CE
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53da72739c3so3914178a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211451; x=1697816251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNAgka3FvOAsw8o3RYXySdSDUfmIIBBX4anYSnIwdp0=;
        b=FMF6ivXptmWJeiIdykKSpkZy+IPovBbq1APykAaOvW0orpHRqdrf90oogPWzDFm2DX
         W573NrPoWmaVCbnkF4KcnQXsXRACD43nfseTkBXmnXLzI4aeUan/m0hp0bPN0Xiobf+k
         oVYokPgrQ5Tjg2K6KP3epcE3nN7PLuQbPodd/yeI/d4IG/zfs7DMurfOusaxd9vB5Qyr
         El8LU7eeNcdOQIImQhOHQXBuW4D+AI+V/MVdbG72jmVgyxMWSnZiCY/TgNPGYXg7Z1HF
         7ERt7X7sI0ZoyRvDoVyoLxVumIyGb4+Hm2kdKzV49U7ueQKjd3ZltcVt/ZmItrKPezi0
         YmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211451; x=1697816251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNAgka3FvOAsw8o3RYXySdSDUfmIIBBX4anYSnIwdp0=;
        b=wNOy3Ozhzv7wAFDoyoFguc1D2VBKMUPLEKOiU//7Kh46MPwamf+bqJY7f/CHOcirmr
         +qU5JoRk9dAa/s/WvTz2LjzQIBBBZIxUMdyXEM1kxaeFW9QplYOE9iKs66ew36yqIrZd
         IMquZ8cbbH54DVSDWx3Mci64ACIUlzOEBACM2f7auEKz/yt8F57iESXdYOHJG4pMTmUh
         ANHPMGBIyjvgTKqr8WbkXkMJZuTKfoY1CKSULriOaTiDGJqrSZRGTTcqw2ob9L86dBQB
         6Ntac99x/KjT5OgsoZ4ZVdTC2mz2W1fYFLAs3NR5rtDjjqG2Gag2lLErqEyJbzfiWmia
         9xAQ==
X-Gm-Message-State: AOJu0Yzi2FNM3jj6cdwB8j3OPQlUgUdSvOXHHbrkdweDTV6LP+d8wzKW
        8pfTuo+bQrPOC77cHBHZb/w=
X-Google-Smtp-Source: AGHT+IH8I+K28mrFHIIHCAnqmELBv3ZkkWnfIipzfeY38HXq0bgTnkvoJtmdtdo2llbVApAGXvhvqQ==
X-Received: by 2002:a05:6402:b58:b0:53d:d4a0:3154 with SMTP id bx24-20020a0564020b5800b0053dd4a03154mr6293896edb.31.1697211451101;
        Fri, 13 Oct 2023 08:37:31 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s9-20020a05640217c900b0053d9a862e2csm4809094edy.56.2023.10.13.08.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Device tree changes for v6.7-rc1
Date:   Fri, 13 Oct 2023 17:37:22 +0200
Message-ID: <20231013153723.1729109-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-arm64-dt

for you to fetch changes up to c0b80988eb78d6423249ab530bfbc6b238790a26:

  arm64: tegra: Use correct interrupts for Tegra234 TKE (2023-10-13 14:43:05 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.7-rc1

This contains some fixes for Tegra234 boards as well as some cleanups
that will help with json-schema validation.

For older devices, there's now support for display on Smaug (a.k.a.
Pixel C) and the IOMMU for host1x is enabled on Tegra132, which should
help with large memory allocations for display and multimedia.

----------------------------------------------------------------
Brad Griffis (2):
      arm64: tegra: Fix P3767 card detect polarity
      arm64: tegra: Fix P3767 QSPI speed

Diogo Ivo (3):
      arm64: tegra: Add DSI/CSI regulator on Smaug
      arm64: tegra: Add backlight node on Smaug
      arm64: tegra: Add display panel node on Smaug

Jon Hunter (1):
      arm64: tegra: Add power-sensors for Tegra234 boards

Rayyan Ansari (1):
      arm64: tegra: Enable IOMMU for host1x on Tegra132

Thierry Reding (6):
      arm64: tegra: Add missing current-speed for SBSA UART
      arm64: tegra: Remove duplicate nodes on Jetson Orin NX
      arm64: tegra: Use correct format for clocks property
      arm64: tegra: Add dmas and dma-names for Tegra234 UARTE
      arm64: tegra: Mark Tegra234 SPI as compatible with Tegra114
      arm64: tegra: Use correct interrupts for Tegra234 TKE

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 66 ++++++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi | 33 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     | 53 +++++++++++++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     | 33 ++++++++++-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 13 -----
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi |  1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 52 +++++++++--------
 9 files changed, 214 insertions(+), 40 deletions(-)
