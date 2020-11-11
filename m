Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F66CC56201
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 222AF2076E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhkHVHjI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgKLBbA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 20:31:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgKKWma (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 17:42:30 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00647C061A4E;
        Wed, 11 Nov 2020 14:34:42 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id i7so2435092pgh.6;
        Wed, 11 Nov 2020 14:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cuZKalXwEVA3pcPeo63NU6Thuz7moWllpwq60etHaxg=;
        b=hhkHVHjIgEHs18DPdbHWDlcMPi/y7Baje+dH/qZ011g/UVcLjyMlfBf+5g7K0/PyzW
         ofMV4kdwvPDK4LSCV+GiGQBvYfe4okuL3sxwKOjYhCgajiTkr5EBuWphqyJPLgFakwId
         hhUSiI92+rtLkdBgE3E4G5WyJZINImObasRhY+TrZVZNE+g776/3srMm11jC+nLCsgpE
         38Dy4cErsFi8cxVGaAVBJnEqQ+SToi3jNKy5Y26Y8fXvCYCIxtVoMkIjcsX2jSXWJUuv
         UKHX3mdCKaWm6Rda/iIgkMUHZRB+lj7pl7GqZmh6ghUls+CAB3Gng5gY6WNEWLSPe5zg
         70sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cuZKalXwEVA3pcPeo63NU6Thuz7moWllpwq60etHaxg=;
        b=Nj75sjeXFIqPU/2WQXvD0M4upBimNdrGbrjqqE0+Q430xZ2DUsFPSU0KY4nXD4GZ4e
         +0W6GvQqrDhUEq1sJloeLAowGRqn7nc5hGzkrHq6SV6sEggx2NbWaw0vpGBOvOOaQFWG
         mtux4WmI4lsRv1y0f2TpiNarkdUHnKIzfMDnH2B6Pii8ddAtCoIKh/SKJVyK62OYmB2p
         wnoIDtqb7aDtvAhFDXn4yZSBVGyvr6ohZv20tV0Fo5EwvRt0iL0yjgk1HcNfEazFT+95
         awVmDmX5jqAfbHf6/lEAZ9IhJOoNWST/rilHyIQFuIMvXH4U2eGTKz1pJcUMUH4OzKEP
         rvuA==
X-Gm-Message-State: AOAM532APD+mG8W7kIgvvcFe5IO+z1/HHiNnYMtHsBDmUnRkprqHiE/y
        Pq8VwFHqhS/GxtVs3RmYcYBUAcQAXb63jA==
X-Google-Smtp-Source: ABdhPJznXmXA2BGQCR2EjZAQvuohnoaFEGtA7gjXHo/FYBtU8gu6erlpcPJ69H+q5vmKqTZ6v/Rd9w==
X-Received: by 2002:aa7:92c3:0:b029:163:d2d6:8db1 with SMTP id k3-20020aa792c30000b0290163d2d68db1mr25303121pfa.17.1605134082430;
        Wed, 11 Nov 2020 14:34:42 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a20sm3605096pff.118.2020.11.11.14.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:34:41 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com
Subject: [PATCH RESEND 0/5] iommu/tegra-smmu: Some pending reviewed changes
Date:   Wed, 11 Nov 2020 14:21:24 -0800
Message-Id: <20201111222129.15736-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is a merged set of resend for previously two series of patches
that were reviewed/acked a month ago yet have not got applied.

Series-1: https://lkml.org/lkml/2020/9/29/73
"[PATCH v4 0/2] iommu/tegra-smmu: Two followup changes"

Series-2: https://lkml.org/lkml/2020/10/9/808
"[PATCH v7 0/3] iommu/tegra-smmu: Add PCI support"

Nicolin Chen (5):
  iommu/tegra-smmu: Unwrap tegra_smmu_group_get
  iommu/tegra-smmu: Expand mutex protection range
  iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
  iommu/tegra-smmu: Rework tegra_smmu_probe_device()
  iommu/tegra-smmu: Add PCI support

 drivers/iommu/tegra-smmu.c | 240 ++++++++++++++-----------------------
 1 file changed, 88 insertions(+), 152 deletions(-)

-- 
2.17.1

