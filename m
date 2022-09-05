Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1410AC6FA83
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 17:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238136AbiIERJH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 13:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237909AbiIERIl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 13:08:41 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B71E5E669;
        Mon,  5 Sep 2022 10:08:40 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id q21so4445493edc.9;
        Mon, 05 Sep 2022 10:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Z4NPH3VMOZhGzciAdUkGzboSEXiv1Tr3n/uskw1TaLc=;
        b=HtssaPqx0g/dBFfnT62VO14ARKa+MavTMD+vXVu8bojf38JW+7oMZQ6FC2b1O4Cn7+
         ANa1bm9arL1ODBssnKv0v1QZ2foCcZLwISc8vqGEEx859S6el9U3L55spM6H42+JUa4H
         hWWKnlNkDTZZRLPKklGGucJUC8hrF6LXmk7ExVE3X1YNyBdOqLTwCuCYyDM4FawOoFH1
         OksKreJsl8IH/zu9GwIpB0dofVgvbO7WFF9pl2PZ8RP+8VfCYrx0QOSLF/VIaRlt0WGH
         9ki1epJB7901I41mfJrm0fqBnMX+OfTykLCbhcrhrMsPrw9e1SfBQWNUI3vgbw+3feWq
         b+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Z4NPH3VMOZhGzciAdUkGzboSEXiv1Tr3n/uskw1TaLc=;
        b=FNRpA7L7anao7ell4//yTVH3Eod6kkNMGyt3ybBM+KhXQ7ig6EKuHVc0YBLsloVpOL
         X5rydoMk1t+qy65w4byiADRaZj3200nTXWOtvKnYSFBeeGy4T4l5AG6g36hQcTT+2coV
         ud0OqPmFwZcsrqa6zcYAQMFMeKWW+8NNEvdSjufmTy1WXwKByLtY9+kw0TZJjNL6QGp9
         t47c1nfE4/nk5X2jp86gEzIpHzgAi4yrXeOSNwGeLmUOao0W7BnD/gbg4BVFIJko5gZe
         Gl12GeFDKWNK/q4jX/RDW+qelKd1KfCluaVOuDul1IkzRyv7kuX/8cPBQ3PhE65jlfsP
         jstw==
X-Gm-Message-State: ACgBeo0eRAQmpuavyHmHptiBDYL1/PnPB9RhWx0TilGjhQq+n1ZfziN4
        SOHU3x41khrOB1pSPWjFP33lz1/w1mE=
X-Google-Smtp-Source: AA6agR4s46ks47YtBXe+JZtx/QYH+X1xg0JmwBdjA7c8NgvDIjKokhXf7CMf1PItkPO6PqCYhfsZSQ==
X-Received: by 2002:aa7:dcd2:0:b0:44e:69f3:edd1 with SMTP id w18-20020aa7dcd2000000b0044e69f3edd1mr6553227edu.244.1662397719116;
        Mon, 05 Sep 2022 10:08:39 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id vs22-20020a170907139600b00734a9503bcasm5266319ejb.135.2022.09.05.10.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:08:38 -0700 (PDT)
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
Subject: [PATCH v8 0/5] iommu: Support mappings/reservations in reserved-memory regions
Date:   Mon,  5 Sep 2022 19:08:28 +0200
Message-Id: <20220905170833.396892-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

This version has several fixes over the previous v6/v7, which can be
found here:

  https://lore.kernel.org/all/20220705125834.431711-1-thierry.reding@gmail.com/

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

 .../reserved-memory/reserved-memory.yaml      | 70 +++++++++++++++
 drivers/iommu/dma-iommu.c                     |  3 +
 drivers/iommu/of_iommu.c                      | 85 +++++++++++++++++++
 drivers/iommu/tegra-smmu.c                    | 85 +++++++++++++++----
 include/linux/of_iommu.h                      |  8 ++
 5 files changed, 234 insertions(+), 17 deletions(-)

-- 
2.37.2

