Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854BBC6FA82
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Sep 2022 12:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiIWMgH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiIWMgG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Sep 2022 08:36:06 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4F5127CB6;
        Fri, 23 Sep 2022 05:36:04 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 30so34841edw.5;
        Fri, 23 Sep 2022 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Wdk1JgkEf6+e3NqnmCSJjMireXUCrz29umVj4QoVxEQ=;
        b=ChqPvxFq/AcMG/qDW+/Fw3x+ZudpgRYRus11vdPTwos+X10x7h2Ik5duzINe4rsYlb
         TxyKjzVRrqSSOrBwFulI7K53Uec+V5Mi4j8axInmSYDETm+geTA2SmAebnxe+qD/5lsK
         AdqSQLf3UxgCW3mLYN8RCHBAS7FphwsMSI1sOOIhnsc1+OSf6iN5rN5BlNXJazHclJ7H
         XJaU1tiRq2cRGysHAD9sajjtM+0D0i/8kRDG2HpYuthYJzr6cwcZCgMd3U02iPADlGv+
         pzYHVYWSHwOPWmgo/NRTPjXvFhcU5FP2xfJKQFN48Z3l4SWh8/2dKejsfIQHxFtR25Pr
         B58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Wdk1JgkEf6+e3NqnmCSJjMireXUCrz29umVj4QoVxEQ=;
        b=1rzv8GASz5o3OCSGwdhbTduuf7rKrwPAtTt5Y+nNc7bh8CoIcdFqv+hQP4bOlX7wXB
         yEGR1QRa0h9gocsdjjbWQDlOuLkmcswem/Dra1GwkNHHfMOnPusAbvZu3+GqRMCQ4XLf
         9UgyyfCwpSRUflj/0wXCaENxWjQT/tarNyj5YqaQZWAFgEw7+xIUMRyIP4SEeAJlZ5pC
         4v3hpPbsqb34GJZ2L+1CtLjEfNxoRHKf/9rFb1UTJyRi3GIlcA4O62UOn5AHjhjtdeXW
         9FvLCLKRE8OY6QP+WMvIG1Ajta0BOzlIWvrtWeRvTOMJyqAu6EWT0wce0OJgzCZHnpya
         Q/TQ==
X-Gm-Message-State: ACrzQf3tj5Cs+P6noxa50C/z/GYd0qjgt7bbHqBxHjBRlEwlmpCA6tkP
        hfUXdtWcT4f4/u3hP95Zkts=
X-Google-Smtp-Source: AMsMyM59QO1OTdqYxp9OIcu2jWVMwK9ihTGFuFUIlSPywwi6lEZVHdKeKo8DaT/ITFgqglkRLY1VQg==
X-Received: by 2002:a50:fa99:0:b0:44e:9e71:4899 with SMTP id w25-20020a50fa99000000b0044e9e714899mr8237380edr.197.1663936562857;
        Fri, 23 Sep 2022 05:36:02 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e2-20020a056402104200b00445f9faf13csm5459208edu.72.2022.09.23.05.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 05:36:01 -0700 (PDT)
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
Subject: [PATCH v9 0/5] iommu: Support mappings/reservations in reserved-memory regions
Date:   Fri, 23 Sep 2022 14:35:52 +0200
Message-Id: <20220923123557.866972-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

This version has several fixes over the previous v8, which can be found
here:

  https://lore.kernel.org/all/20220905170833.396892-1-thierry.reding@gmail.com/

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

Navneet Kumar (1):
  iommu/tegra-smmu: Support managed domains

Thierry Reding (4):
  dt-bindings: reserved-memory: Document iommu-addresses
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()
  iommu/tegra-smmu: Add support for reserved regions

 .../reserved-memory/reserved-memory.yaml      |  70 ++++++++++++
 drivers/iommu/dma-iommu.c                     |   3 +
 drivers/iommu/of_iommu.c                      | 104 ++++++++++++++++++
 drivers/iommu/tegra-smmu.c                    |  86 ++++++++++++---
 include/linux/of_iommu.h                      |   8 ++
 5 files changed, 254 insertions(+), 17 deletions(-)

-- 
2.37.3

