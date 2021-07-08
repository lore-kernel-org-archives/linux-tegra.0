Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6882C07E96
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 10:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99A0861467
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 10:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhGHKer (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jul 2021 06:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbhGHKer (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jul 2021 06:34:47 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B201C061574;
        Thu,  8 Jul 2021 03:32:05 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id v5so6903726wrt.3;
        Thu, 08 Jul 2021 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjPqlc8azA5xqd54PpZaulfxwSTSSBIfxBmm684SVJA=;
        b=KEJZIkI6N6oHcxvOD+FGT3/QrZ3C1O9uOLa0KzTvSu1dwYoBN+Gc2UxNwXuIuULPeL
         /dD2XJXjbPyDY8Fj2fxiOMiqeghdqFWboqN99Gg1yhGPqV32A+pOsMIn0FMxM8q17hf0
         Cdd3rk2B2sqeGIDmM0Nf71tNfG13bP/AZFoo5z0Q0z4ypIRLWR5T32+y5goTUaZO+lhj
         NvpJp/+K2pn6WPqgCGoWs6/H2g+MsFMA3r/LjUm2c6GsMKwUi7SxyBlrXhqOgabcwpIj
         B/9wHAMlMODnbeapEbUhbey2dAhxfwXqTRquP/pA215TNK8xDvF4GP/A5Nk+4pFw8P1g
         R5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjPqlc8azA5xqd54PpZaulfxwSTSSBIfxBmm684SVJA=;
        b=Um/tffODB0t0YFKptFopI58hjoJ88O+AP/jpJxQwDllMIk6EWVPM7sexSL3jgCKqR4
         8CShyiP0ZpDk9+JpvarEEoATIwi2/fB4Hhkbq2YBLjOSNRzQHGx1mks8eZL/orZPIW07
         m2XK0JfGseHRmW0wmiyzkuQOXgRMp7FJ18AAYj0Q17x8SusUCMbLYNQoBVPSvBsvpBtd
         3YpqA1pwvykbVEexfDDh64yXbCA/pWeDprVkZdQqgYNAhwe+sag+/JCdGyShxZ9Y4/Vx
         HdLryo65/ZgfIaADj4+Ec1LCmLtpj8PRuf/dDvExusqGeWEGAgloMjP5r3Hnt26/fy9Z
         RAzQ==
X-Gm-Message-State: AOAM530RL6B70kXcnGv62eFWzjrcyizPpjMtjiDHayH2J9t0JXRFE360
        1Jcfa7y54/v5ogconEg7kjY=
X-Google-Smtp-Source: ABdhPJyhDiFpfc+O30tADU7f8YCrKYj7g4WvNZ68l3UgE2IHMftMEQd9YIMP58nJka/aV9c555OhUg==
X-Received: by 2002:adf:ef87:: with SMTP id d7mr33803739wro.204.1625740324114;
        Thu, 08 Jul 2021 03:32:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f9sm1851897wrm.48.2021.07.08.03.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 03:32:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date:   Thu,  8 Jul 2021 12:34:30 +0200
Message-Id: <20210708103432.1690385-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This small series addresses a minor issue with how IOMMU support is
wired up on various Tegra generations. Currently the virtual "card"
device is used to allocate DMA memory for, but since that device does
not actually exist, the path to memory cannot be correctly described.

To address this, this series moves to using the ADMAIF as the DMA device
for audio. This is a real device that can have a proper DMA mask set and
with which a stream ID can be associated with in the SMMU. The memory
accesses technically originate from the ADMA controller (that the ADMAIF
uses), but DMA channel are dynamically allocated at runtime while DMA
memory is allocated at driver load time, drivers won't have access to
the ADMA device yet.

Further patches will be required to correct this issue on Tegra186 and
Tegra210, but I wanted to get feedback on this approach first.

Changes in v2:
- add backwards-compatibility fallback

Thierry

Thierry Reding (2):
  ASoC: tegra: Use ADMAIF component for DMA allocations
  arm64: tegra: Enable audio IOMMU support on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  4 ++++
 sound/soc/tegra/tegra_pcm.c              | 30 ++++++++++++++----------
 2 files changed, 22 insertions(+), 12 deletions(-)

-- 
2.32.0

