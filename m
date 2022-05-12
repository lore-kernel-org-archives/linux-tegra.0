Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ABEC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 12 May 2022 19:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357831AbiELTBG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 May 2022 15:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357835AbiELTBC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 May 2022 15:01:02 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E23C2A246;
        Thu, 12 May 2022 12:01:01 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h29so10753734lfj.2;
        Thu, 12 May 2022 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4lJ4Enq2o11SalNDto2ZU8PP4FnbpR5XNyoETsj0ZA=;
        b=WTtxEI5pHAJIaSw9ce+AVY1FP/v6kLnMrbDLka8DUuZdZB71BEEil19Arum8Evaapw
         AsuqjDqJsuT88SLViuC1TbTFrsQw4pCVCEdejKXfezx8t+DZ80+dDMK3vO2hYcUa94jr
         Ej1d5EBftqmb8WRSAKCFSbUPTJnYwD8Ohs0N3+icPvXIEYwdy1nCVGNZb2w2MKHXugR1
         J8s2Yga9M27yh/184k1aPrCXH2CiR6T/f20kJwlAVuqPJD/rbqIpgRSNAa1tdJ2404XD
         L3OD2KGps0ESYJyLQ1h0AuDVvxbOXxq8C0h+onHA+BJotyWa2rayU56Vfsq3gLC/ku8y
         dl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4lJ4Enq2o11SalNDto2ZU8PP4FnbpR5XNyoETsj0ZA=;
        b=QSsiAqr4KuxqqoHecs99G6bVmUquaXNL0fhNPkLk8EnJFvrEA/iJQWCXM6J9JHJxjo
         Osg2WkVLqPRa75PyXmks3wmeWigPUasI1rBgtlRxpPZ9B1FmzDIbCXc60KzTEuGz7Fsb
         w/NLOgxH6scxDatdG3DMh/tYZ28mmApbElKWRCkLPU5Th5xEnc7X+fY8YBsltxY0kbYj
         c1ahX2+9uZQm79BBD9x6uc31XNl73VU9zYHBeeNtAewZK0wBegwzybTu2uofRcoPYXda
         6DfcOrUK8U8V452Jw7a7SwoY/iPm1k9Od8zg6DLb5DKaA9Hp0ABGZnSMc173hhDMgE7q
         7znw==
X-Gm-Message-State: AOAM530bcFxlVybqUJo8cqxiSVgjm4d4QdSsGTxTmAc9ysrMHnrSURhI
        hyGyGsSvnrvSGivqhRxm+H2u3UA8Fi4=
X-Google-Smtp-Source: ABdhPJzMOhYHWrMZLXqZqjLrz/V48QTirRHrsfKrKHYw6Ozwd0JwtVFvqRgJazngSdLiKb47BP3V+w==
X-Received: by 2002:a05:6512:3042:b0:473:b1e0:5667 with SMTP id b2-20020a056512304200b00473b1e05667mr837783lfb.516.1652382059160;
        Thu, 12 May 2022 12:00:59 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 18-20020a2e0d12000000b0024f3d1daebesm43552ljn.70.2022.05.12.12.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:00:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 0/5] iommu: Support mappings/reservations in reserved-memory regions
Date:   Thu, 12 May 2022 21:00:47 +0200
Message-Id: <20220512190052.1152377-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this is another attempt at solving the problem of passing IOMMU
configuration via device tree. It has significantly evolved since the
last attempt, based on the discussion that followed. The discussion can
be found here:

  https://lore.kernel.org/all/20210423163234.3651547-1-thierry.reding@gmail.com/

Rather than using a memory-region specifier, this new version introduces
a new "iommu-addresses" property for the reserved-memory regions
themselves. These are used to describe either a static mapping or
reservation that should be created for a given device. If both "reg" and
"iommu-addresses" properties are given, a mapping will be created
(typically this would be an identity mapping) whereas if only an
"iommu-addresses" property is specified, a reservation for the specified
range will be installed.

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
 drivers/iommu/of_iommu.c                      | 90 +++++++++++++++++++
 drivers/iommu/tegra-smmu.c                    | 82 +++++++++++++----
 include/dt-bindings/reserved-memory.h         |  8 ++
 include/linux/of_iommu.h                      |  8 ++
 7 files changed, 235 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
 create mode 100644 include/dt-bindings/reserved-memory.h

-- 
2.36.1

