Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316C7C05027
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjATRm6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:42:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjATRm5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:42:57 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC9251C73;
        Fri, 20 Jan 2023 09:42:54 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z11so7672239ede.1;
        Fri, 20 Jan 2023 09:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jv2xNNfg2JI/YZYLARlEdzQhCcrkMeljoZ4XEzAy+o=;
        b=O1D7ZUXD5naJU5OsSiSRzJPXNd8vdwMn8Ov+uT0KWCNndHf5u/KMg9OfFV060MHwW2
         IAzjaV7juSmL22dmbu6FsdKVeT2jrSBeyDXYxPZYpAQ9LYYDwJoLJFBEkY9dbeKr/hsR
         RYrzx4EfbB3CE/LO1nciWwgIrqAAWD7fP++JSe9KeHE4p6cW/H5ojgqKdRq9IHpvB3Ic
         1KQsiOUm3kmgy722JUblt1w3+B8ww0y8HbqW9kAa575m2VTsbxy5pbN36ed97ICqO7/P
         TdRZxYEujGGQIsbaZMM0YSG9N4TXePIbFko+nyxXDG+/VbxZ0pcRwM6XpZIVsTrlKOxu
         /gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Jv2xNNfg2JI/YZYLARlEdzQhCcrkMeljoZ4XEzAy+o=;
        b=CvV5bzKQnAZ/Jv6RlXYoIq4N6+mPeGzY3ySM1hC7bomQyEWInDz8I1zRcYV0jbzYJ/
         Af4bjyxRV5iIe+MoRmJkQycjxdnG9sNUvOE0BWbiyWEgzUwxz6+vONglCUCdLnqCiwrZ
         9x/TeAD6KE//Xk2S7DtbwsvPAqyVqmwztOn6HI/LXwgE5w+c7OGZ+YhCq9+4Lt0ECw90
         zOQHNq2aKkNGyNbq0a9rU4xfUaCTCFnQaLQ91lGvtfXZMNTu51uv9Rmd9Ml+rqyqiQOI
         eVfhXubH5faSx2PvzBSYdTYJBqb4YtwvJyex7cDM9qQ4KmKTV3Ac1HCAEowx/V2uRH7D
         5LxA==
X-Gm-Message-State: AFqh2krMfBkDIO1YwpE4B0V3XwgbeQDolZrmV2nlMaR8Ojmd/unVFlfK
        OCstxnJOsxfPU4VlQU2hDxY=
X-Google-Smtp-Source: AMrXdXsHel/Xy/wtjhpOEygWZ5jwK4v+1aubBP57iaiuqfYIc2nHmKsI+q7W5/w02IoLn28WM02Qug==
X-Received: by 2002:a50:ee05:0:b0:49e:986f:c715 with SMTP id g5-20020a50ee05000000b0049e986fc715mr5737266eds.9.1674236572506;
        Fri, 20 Jan 2023 09:42:52 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i23-20020a50fc17000000b0047c6f3eccb2sm17638031edr.50.2023.01.20.09.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:42:52 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: [PATCH v13 0/4] iommu: Support mappings/reservations in reserved-memory regions
Date:   Fri, 20 Jan 2023 18:42:47 +0100
Message-Id: <20230120174251.4004100-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

This version is a rebase on top of v6.2-rc4 to resolve a minor conflict.
Version 12 can be found here:

  https://lore.kernel.org/all/20221117185424.2359687-1-thierry.reding@gmail.com/

The only change here is that the #dma-{address,size}-cells is dropped.
It turns out to be much simpler to just update #{address,size}-cells to
what they should be rather than add extra complexity for the DMA work-
around. There's a minor update to the DT binding so that it can now
properly validate cases where we have both reg and iommu-addresses
properties.

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

I've also been able to make use of this binding and the IOMMU code in
conjunction with the simple-framebuffer driver to hand over a display
configuration set up by UEFI to the Linux kernel.

Janne has confirmed[0] this to be suitable for indirect mappings as
well, though these patches don't implement that feature yet. Potential
extensions to this have been discussed but are not yet included at this
time to not further complicate things.

Thierry

[0]: https://lore.kernel.org/all/20220909144504.GA4024@jannau.net/

Thierry Reding (4):
  of: Introduce of_translate_dma_region()
  dt-bindings: reserved-memory: Document iommu-addresses
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()

 .../reserved-memory/reserved-memory.yaml      | 89 +++++++++++++++++-
 drivers/iommu/dma-iommu.c                     |  3 +
 drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
 drivers/of/address.c                          | 41 ++++++++
 include/linux/of_address.h                    |  2 +
 include/linux/of_iommu.h                      |  8 ++
 6 files changed, 233 insertions(+), 4 deletions(-)

-- 
2.39.0

