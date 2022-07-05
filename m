Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784C1C43334
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiGENhg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jul 2022 09:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232398AbiGENhM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jul 2022 09:37:12 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E4D7435C;
        Tue,  5 Jul 2022 05:58:41 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r6so3746728edd.7;
        Tue, 05 Jul 2022 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ThRFRFG6dG3lyoRkGG2bLT7jC0J7ce9MxZGKEc+OGhY=;
        b=d1HUG8b79zydnFytdZoLA6Fg2PL77XJOEn42q0DWcc/QO7tprXWkJ9NIMNHr0CUCjJ
         r5/ce5Ar6MdbAz5VcH7McUweQgk6zYMTDJVNiMsacEVTwI1HXGPoklPCkctasJgKe+yY
         EIazCPHMcc2mNNuEETADN6hupB3/9wPtw778kO4Wdf/07xLVGhWg581czgMfSeGot0WK
         oT1pTQLXJvb/cklMhFDitswQ+BAekd1nyhENGHBH6ok0DxXLQ1eXE8Ad/TrmHNLVBvQr
         kHvm2Rqzmgka7nirKvwEIx626ost0xLE+4NfUhSGiYmRrcdiNrzMgZ0hjptzk4TyWtVo
         cPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ThRFRFG6dG3lyoRkGG2bLT7jC0J7ce9MxZGKEc+OGhY=;
        b=mkAALbl+yj9QSI/6GCBaST0wgCe96z80e2/kpSDRGfVRtCYzaEGuxc5ZY5Y5FJd999
         GWgYqPbD4NhOhjtP1XEYEdvY7qgEybOXLiu2MN44YoPmI3oDfJ+gwKH7ohR+v5qqUlMX
         iNCqRepRevzn/+KAwVh82dlRj/M7/CkvyTnKcQ+b/HVvPhmq2gWtFF2+XKIe9ZMaUIfc
         QLJ2G4GH+AZ+ESU2mYrNeo2V15iq5g2/6XBGezBxbGGCWAjMy1YNScGd3KdWDeKpYze4
         eJhcr2QufhqyZwqgAPJ200Iwn3H3vFIEq3LuKrNemzXvMVlY2tVVVHiECrr4EPfmOmkV
         +TBw==
X-Gm-Message-State: AJIora/X7dbgCQdCLT2dP+HKu5dulF+K6Dlh/Byc5nMTVxE67DWsGfNp
        p/29xlCzG+YT9GjhbYaiUZM=
X-Google-Smtp-Source: AGRyM1uCPRUNy3Pz9Rug5PKlHut5lD1SCgKIZXG+KjGfjNf8Occi/0aEXuBzQyuExMRc1OA8B9eImg==
X-Received: by 2002:a05:6402:b26:b0:43a:6c93:f4e3 with SMTP id bo6-20020a0564020b2600b0043a6c93f4e3mr11031442edb.327.1657025919660;
        Tue, 05 Jul 2022 05:58:39 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p26-20020a17090635da00b007105a157706sm15809586ejb.82.2022.07.05.05.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:58:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: [PATCH v6 0/5] iommu: Support mappings/reservations in reserved-memory regions
Date:   Tue,  5 Jul 2022 14:58:29 +0200
Message-Id: <20220705125834.431711-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

This version has several fixes over the previous v5, which can be found
here:

  https://lore.kernel.org/all/20220512190052.1152377-1-thierry.reding@gmail.com/

An example is included in the DT bindings, but here is an extract of
what I've used to test this:

        reserved-memory {
                #address-cells = <2>;
                #size-cells = <2>;
                ranges;

                /*
                 * Creates an identity mapping for the framebuffer that
                 * the firmware has setup to scan out a bootsplash from.
                 */
                fb: framebuffer@92cb2000 {
                        reg = <0x0 0x92cb2000 0x0 0x00800000>;
                        iommu-addresses = <&dc0 0x0 0x92cb2000 0x0 0x00800000>;
                };

                /*
                 * Creates a reservation in the IOVA space to prevent
                 * any buffers from being mapped to that region. Note
                 * that on Tegra the range is actually quite different
                 * from this, but it would conflict with the display
                 * driver that I tested this against, so this is just
                 * a dummy region for testing.
                 */
                adsp: reservation-adsp {
                        iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00010000>;
                };
        };

        host1x@50000000 {
                dc@54200000 {
                        memory-region = <&fb>, <&adsp>;
                };
        };

This is abbreviated a little to focus on the essentials. Note also that
the ADSP reservation is not actually used on this device and the driver
for this doesn't exist yet, but I wanted to include this variant for
testing, because we'll want to use these bindings for the reservation
use-case as well at some point.

Adding Alyssa and Janne who have in the past tried to make these
bindings work on Apple M1. Also adding Sameer from the Tegra audio team
to look at the ADSP reservation and double-check that this is suitable
for our needs.

Thierry

Navneet Kumar (1):
  iommu/tegra-smmu: Support managed domains

Thierry Reding (4):
  dt-bindings: reserved-memory: Document iommu-addresses
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()
  iommu/tegra-smmu: Add support for reserved regions

 .../reserved-memory/reserved-memory.txt       |  1 -
 .../reserved-memory/reserved-memory.yaml      | 62 +++++++++++++
 drivers/iommu/dma-iommu.c                     |  3 +
 drivers/iommu/of_iommu.c                      | 88 +++++++++++++++++++
 drivers/iommu/tegra-smmu.c                    | 82 +++++++++++++----
 include/linux/of_iommu.h                      |  8 ++
 6 files changed, 225 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

-- 
2.36.1

