Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0140BC433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 13:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiKCNjJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbiKCNjH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 09:39:07 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638ADE21;
        Thu,  3 Nov 2022 06:39:06 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id n12so5229814eja.11;
        Thu, 03 Nov 2022 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z10ie4YimZPTB5alKBTkQ5yy8IFqW2xEzKQg8IUrI5Q=;
        b=pgr5Gx3bBX3g/9j+1rndCGqX8oJwyStHDPVna9E2jr1olHBAOL65lY9sGZ6C0dHKRZ
         s1TGcsfld0juH7eqdNCaQV1RW/OlCIaRyeK1JRqNjRErKEkKLKDbxMCSaLVW1Svvc3s7
         cuFoP3jF06NJ2GcQEsqf8J5ZFmvPii8SNmm/f1dQnv2l1x2ZSDTPomqMw7v19lelSmgX
         xhF1hrXsEymIQ5xZxdJk6iH+lqrislUIHJxTtHZ0nmEkXQp+ao63XwV50SsZeIDizGie
         vXA+plFEoeXOspjFxWN7rJXbcM4+adZ14ONPJh+A0VDmSVPTnM9GF904xdWvCtGantsv
         ZkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z10ie4YimZPTB5alKBTkQ5yy8IFqW2xEzKQg8IUrI5Q=;
        b=BzeZvQjv4a3XCD+Jq4ldHSiYqEk1FE4OjxgsTEazste6tc1puivEogQl8uBc1SDdJo
         dsEhVrCO2bCyXD1qqybNu8asj8iBjTXcq2/09XfDhIRgfslxmc+Q6hPLrzAzhZ5QpJsI
         kyieEECx4pbq67TPCbxN6SIRSoPbbhKypWUzFRGZsaDQSAP2FG7TLw6uBxCObROsyPQt
         cM6lxc4M09kfdTEEACX3LjkXcnJdfdIerb3mu0pQc0fMb1tV4Iyjsqxte1D0qJYFmo15
         eRpJqzgFMGI233g2SkxxGcO4+3tfLJ5loGeEg0Hmpvc72eGK0SolSsdd5JfB6oB+09a4
         9MYw==
X-Gm-Message-State: ACrzQf0ko8UuLMF3NGwvukAa0bFTQZgvJ02Jy3W9dNu75SKWFhoyHSN/
        1EO6bHzDf+jRvg+mYTpRYiw=
X-Google-Smtp-Source: AMsMyM6UxqoEJfmd6WlvwItfcqSFLkxUnSH8wF8LywPjgOn86RkLU8h80fxh0vildnlRCzP/vfWbpg==
X-Received: by 2002:a17:907:80d:b0:73d:a576:dfbd with SMTP id wv13-20020a170907080d00b0073da576dfbdmr28805551ejb.402.1667482744700;
        Thu, 03 Nov 2022 06:39:04 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qp18-20020a170907207200b007ad86f86b4fsm517328ejb.69.2022.11.03.06.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:39:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: [PATCH v10 0/5] iommu: Support mappings/reservations in reserved-memory regions
Date:   Thu,  3 Nov 2022 14:38:55 +0100
Message-Id: <20221103133900.1473855-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

This version has several fixes over the previous v9, which can be found
here:

  https://lore.kernel.org/all/20220923123557.866972-1-thierry.reding@gmail.com/

Most notably this addresses an issue with DMA address translations
failing across bus boundaries with mismatching #address-cells (2 vs. 1)
properties. The proposed fix is to treat DMA parents as creating a DMA
bus that is separate from the control bus, and therefore stop address
translation for DMA at the last DMA parent.

Other than that this includes minor fixups to the DT bindings as well as
some rework to the OF/IOMMU core code to be more easily extensible in
the future.

I've also dropped the tegra-smmu patches for now since they have
accumulated some bitrot and probably need more revision and testing.

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

Thierry Reding (5):
  of: Introduce of_translate_dma_region()
  of: Stop DMA translation at last DMA parent
  dt-bindings: reserved-memory: Document iommu-addresses
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()

 .../reserved-memory/reserved-memory.yaml      | 73 ++++++++++++++
 drivers/iommu/dma-iommu.c                     |  3 +
 drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
 drivers/of/address.c                          | 58 +++++++++++-
 include/linux/of_address.h                    |  2 +
 include/linux/of_iommu.h                      |  8 ++
 6 files changed, 235 insertions(+), 3 deletions(-)

-- 
2.38.1

