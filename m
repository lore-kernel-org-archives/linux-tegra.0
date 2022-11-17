Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5842DC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239889AbiKQSyf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234418AbiKQSyc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:54:32 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1989986A48;
        Thu, 17 Nov 2022 10:54:31 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id l11so3926679edb.4;
        Thu, 17 Nov 2022 10:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO8iu4sFpajmaNtnRDMO3L66IGHotZL//2Yoi5MNZGw=;
        b=jfmp3Gx/GKTarItOmR+s898YqSa1TWnozjilCF3nyBAeTxiV3LH8iKBFzoYON0T0f2
         yiTAa6XvKyptXOVm/UEwSbutWzcCxS5zv3Q6LlYljGhGMG0x0LwbnM6DjbZxdhupoAr8
         GrLvAQeAfkSLFp4OaULC8rF9XY2MRPYDWqnIEzvwQPsxMpu+P/nmjLSjAi2Ram2LKRxa
         VhbO6e6kxdjgKNCjUcl85RmGdhyJJzgHbR+mvUZGPSvez/nXnFDFLJrcgLcLCYv+RT8X
         EddTXBYTWfhXXUpXn37Jdz5A7CYAqSwwlfFtEiMQnKODHk4+R9swGYXrBBn/xr8yUEWu
         quLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO8iu4sFpajmaNtnRDMO3L66IGHotZL//2Yoi5MNZGw=;
        b=cJI89Yfnbmoj9hTgzGVIddcIb4lLqQ49rNYMKiadSOWpklA6mdwH8+gAAq48ry+iIW
         HAJgOS9rsiFVYxPlOL/7nH92Gl50vCWjh6/QPvqmqBz9CIaqDbhrgbeQ5WYYqroxILc/
         ucozxHXPK/WX0LT+SApiWfN5STeFkR6fbC0qWhhPMXlY31pJU/uDr/8udO2WFOB4If64
         5XknMX7bs43SnPucK5KrTMnN2Y2/sfDSevoFvd/wCVcAyOHKN3sMTqNlaus0U9yTLsVE
         jzLHQi9dXcjhadbttDLX1Htu7EKwsFaL+dU2FMYGxWMFtaxrY/Q1QACeOHwmZxsbyli5
         IRIw==
X-Gm-Message-State: ANoB5pmh+TPBG86Mrs2iIKwpRnPHJV52z4AU6aZ53VIwmB+2mq/vdMuy
        53eYU23BGeU7x94LDhM1/X4=
X-Google-Smtp-Source: AA0mqf7Kl6CgbcMgxqNwKtSmiN6Aj7E6wbC+SmSy5fRDZHYki3xdJx3CDIjnXq3RzE3SsmF8i8hk1w==
X-Received: by 2002:a05:6402:389:b0:459:2515:b27b with SMTP id o9-20020a056402038900b004592515b27bmr3351323edv.338.1668711269495;
        Thu, 17 Nov 2022 10:54:29 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n22-20020aa7c696000000b00457c85bd890sm874261edq.55.2022.11.17.10.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:54:28 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: [PATCH v12 0/4] iommu: Support mappings/reservations in reserved-memory regions
Date:   Thu, 17 Nov 2022 19:54:20 +0100
Message-Id: <20221117185424.2359687-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

This version is a minor update to the previous v11, which can be found
here:

  https://lore.kernel.org/all/20221111161806.630527-1-thierry.reding@gmail.com/

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
2.38.1

