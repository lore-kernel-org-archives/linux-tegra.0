Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D203C77B74
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 12:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237913AbjDFMsw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237929AbjDFMsM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 08:48:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0CA180
        for <linux-tegra@vger.kernel.org>; Thu,  6 Apr 2023 05:48:11 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id g18so1088889ejj.5
        for <linux-tegra@vger.kernel.org>; Thu, 06 Apr 2023 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxq0QVszcWzQGr+mlJGzrQK87kAzN66KkM34tspS03A=;
        b=i2LrRVcr304+limMVbLFtRzB4FuzIscIKPjGTrbc1DUP0m4Cy7DOwmoIJiVL/qi9Pz
         uooDXycGUQ9n006IIbtxF6nDSKcgamHByxTHUxvqzBUozS2w5GyaeQS6WZc+NNwUuXYT
         Jb7bHDxnJOW2CeGPtBBdnTD3dulzrZ1UGrG+9u0WuT8XBHBGiJK32x1ds0TP+lXdhGPx
         zDHkDA1zBCsRCWZWkT5zldzn9ERljhhxp9es/6qL4tkTcujIhiu/wZFbS/D/B0+NXnP2
         oUxU6F+YhfoECO0YAHXSxutQ5nmzX04m3xZHVtqrFLB/+IG3olxXP0XlwwucRpLeFDvd
         U7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxq0QVszcWzQGr+mlJGzrQK87kAzN66KkM34tspS03A=;
        b=bNyU8OiQ2rUjdRno9RhcjG1avzgZlDHr2zRXEiQuSxHi3zbUi+yDcJvSbk94YGqV2I
         hWyARAlVRblXtjsf87LP5tNFhXzcEXmxdxj7OVXmJZQvegTshMVmXd4Q8dXtrfd21t5Y
         BaTtTqaApwjpN7OwBFwcur8MwiNgcfwZX/REJSCub5qZWVP81ZnAIBzgC2vIYNdcA7V5
         5fvYAWzxsGGt32RpQ0zpM1ZsHMnqBoZ9CAO5NHfnCVSqGQmfELuSYiFP6MAWlCIR9mLC
         irynDZscY43+VYs1bHN7hRkD1cRRIvw1L7nmuF8MWeQkEV0r28LTH5B6NJDT8rS75BYr
         er5Q==
X-Gm-Message-State: AAQBX9dspW0RlXz7CDu6mpKVSLVa0NbKQ+mLHydHLhHsJbmDx4KXtZic
        wNlHCVXoHOWRTxOmFJeNXoY=
X-Google-Smtp-Source: AKy350b3+pwRy5SLkcdE6g4Fvlt1JesJ3pso+DCq1u2N7jCJR0h6/HCqjLoZHfO+G1myZxIUGWRrTA==
X-Received: by 2002:a17:906:d152:b0:930:27c2:6d8d with SMTP id br18-20020a170906d15200b0093027c26d8dmr7254615ejb.61.1680785289434;
        Thu, 06 Apr 2023 05:48:09 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906278600b0093e39b921c8sm758717ejc.164.2023.04.06.05.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v6.4-rc1
Date:   Thu,  6 Apr 2023 14:48:03 +0200
Message-Id: <20230406124804.970394-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406124804.970394-1-thierry.reding@gmail.com>
References: <20230406124804.970394-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-arm64-dt

for you to fetch changes up to 5c0ddb4e715d89e4ea94821cd85bcac220bd7ea4:

  arm64: tegra: Add vccmq on Jetson TX2 (2023-04-05 14:44:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.4-rc1

This adds support for the Jetson Orin NX and includes updates for Jetson
AGX Orin (audio codec, USB Type-C support).

----------------------------------------------------------------
Ben Dooks (1):
      arm64: tegra: Add vccmq on Jetson TX2

Jon Hunter (2):
      arm64: tegra: Add DSU PMUs for Tegra234
      arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin

Krzysztof Kozlowski (1):
      arm64: tegra: Drop serial clock-names and reset-names

Sameer Pujar (1):
      arm64: tegra: Audio codec support on Jetson AGX Orin

Thierry Reding (4):
      dt-bindings: tegra: Document Jetson Orin NX
      dt-bindings: tegra: Document Jetson Orin NX reference platform
      arm64: tegra: Support Jetson Orin NX
      arm64: tegra: Support Jetson Orin NX reference platform

 Documentation/devicetree/bindings/arm/tegra.yaml   |   9 +
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   8 -
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   2 -
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   4 -
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   8 -
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 123 ++++++++++-
 .../arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi |  14 ++
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     | 172 +++++++++++++++
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 134 +++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi | 245 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  20 +-
 13 files changed, 717 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
