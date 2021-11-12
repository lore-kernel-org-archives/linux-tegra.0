Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E351C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5763660F14
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhKLNP1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhKLNP0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:15:26 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91C5C061766;
        Fri, 12 Nov 2021 05:12:35 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id c4so15410094wrd.9;
        Fri, 12 Nov 2021 05:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOXgQ6ktc8t7YW2KaSJg/CD93KvU0bXVPXTF0jzPmMs=;
        b=NvxzqCUeCZ5iPoTGUrMVjh7VAATIcw3u8jGFAEbIaHD7LjT5zbJrXUiQUP9shDauJb
         DBHOI0Jsj9c7ZJllTMYN+mqeAMD/GCUGe/EbaTM2GTBoDxz6NOAj63zf21X8hAaHdPIv
         PhJBchPhEJYsKCBLp+s95bc5AlVAHK+5c89TtTBqpCe9KqqcYvaY39J0pR8l4GCYfkaB
         eKutFnUBhem+njgeg+vbpm201kGb0mU02i6fJjs55c0F8pXG8/HVALIEO1EvY88ijhBG
         6Wwh3c89nIK8Efl9DA1/vBgGfExILB6bYDay5Nx4CaiZdvI5ojzLSwGXJSZyErdofSJG
         LNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOXgQ6ktc8t7YW2KaSJg/CD93KvU0bXVPXTF0jzPmMs=;
        b=F8W82HVcSDw7/4TjzDXJUtIu+vCZ/GCY9SGkg9qYsOoPdhEgs1KeYj/iS/bvmvKLTh
         omQmXhHYjcQ48uATjqNGX7XO+n+2k6UIs5MhJWVPSFDhsD3TaIWNIwycuxprItTDdadq
         03+yHsVB9d8snRKQSA5QvVADVl+jufX0L43+Ea0AKzQql1chTUTLuurS5piRy14T4c8I
         EnTvjPfAcimCpV5Cc0JbZOGilwy2cm1ab8DaqBpo6gSWDPDI87Bi1iMRgVELBPdYy72C
         F85PMeqacpSB7FtmALWr4LFzhT095ObwgeT8kbXUFhqjWBjuVFu0hicJYQzcrRJSqGlt
         32rw==
X-Gm-Message-State: AOAM532WwTi0hymJm6gE72JxrZIF8pwxvxwKPUgxtw9pOCktEtp0YaDB
        2jgUb8SzV5DohtO12J9u+Xw=
X-Google-Smtp-Source: ABdhPJxEbMw5IZlLgUPFVnT64GbiW/9O2P51nkpn3Nvbl3xrpdCPT7WjQQYNaJzV8+d1p4kefJ24UA==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr7832761wrq.71.1636722754530;
        Fri, 12 Nov 2021 05:12:34 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id c17sm6040514wmk.23.2021.11.12.05.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:12:33 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] iommu/arm-smmu: Support Tegra234 SMMU
Date:   Fri, 12 Nov 2021 14:12:27 +0100
Message-Id: <20211112131231.3683098-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this series of patches adds and enables support for the ARM SMMU
instances found on the new Tegra234 SoC. This is mostly similar to what
can be found on Tegra194 except that there are a few more instances to
meet increased bandwidth needs.

In addition to adding support for the new Tegra234 compatible string,
this also adds a missing description for the nvidia,memory-controller
property to the ARM SMMU device tree binding.

I plan on picking up patch 4 into the Tegra tree because it has a
dependency (for the stream ID definitions) on a separate patch series
for the memory controller that I sent out earlier.

Thanks,
Thierry

Thierry Reding (4):
  dt-bindings: arm-smmu: Document nvidia,memory-controller property
  dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
  iommu/arm-smmu: Support Tegra234 SMMU
  arm64: tegra: Add Tegra234 IOMMUs

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  13 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 426 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   3 +-
 3 files changed, 440 insertions(+), 2 deletions(-)

-- 
2.33.1

