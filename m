Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEFEC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 11:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE65821655
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 11:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXKakrSK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgIQLsI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 07:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbgIQLfX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 07:35:23 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64305C06174A;
        Thu, 17 Sep 2020 04:35:23 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id j34so1195817pgi.7;
        Thu, 17 Sep 2020 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GvmM/Nssdueta9CrhTB+xKzv+MVW+fGaedO25VPM3wI=;
        b=eXKakrSKUeMzAXKyJsDOzKwVoFULgNSRkUcOz/zGh23WFcBhzUv6ZqH1ZHaFSE97XW
         J/iDAG+4eNrdDsrsdwbusHLauALH/pPxywUoq3Qca25K6gkCpgpcQSI7TWwuZZjKS0VZ
         wdw6lyIpMRiSM1TBsFV4pkoKI/yvLKEIzpuveTTlP5ktNqvIW5MbnadhUsPm7qjFkAB0
         OiombkC5GdfchY0x5JaKwGR9NjhR+khRelj/IEgIJRXR9BeEFdCb780xm4Eq2yg6++Sp
         ouqV4QrEo2bh3lRq1VemVidYAiXbEmlozjhaDpeNnQKePsAlGUThCK1AyClDwG1xgu+/
         dw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GvmM/Nssdueta9CrhTB+xKzv+MVW+fGaedO25VPM3wI=;
        b=Zz3Ds+5buMUWGcVy4H/OR3wWHVgpidbkInZvxxfrIPNOF5yqaYQzi0PDrBrbwr+XHB
         G+i0b6+cs4xIJrYTBPeBM6SMfmUJViKGNCV0NcSUGkVBFDtEN8WHaqzUi/0vSgyNcxHc
         bNxyDgPKcvDLH2XGrlPiwsOcgC0tcYCzIvqh+3o8Y7ULQiSE7Xnpvatv2344Td0RsJBk
         uUQYWtU6xRIBeE8aEAlRcdWffx+jjzbt2b7SWW2fBYMEs1NoTO1Gb3cbl3tzT4D+YqVB
         Iq9XTdAZubQf97wzEMcW4KhuI7vbnVWOV/BF8osUu9JnZAiLQ2y2oOM5g3DmEMI37DMQ
         iHcg==
X-Gm-Message-State: AOAM533iynS2DcgxOfM8BmkdwgyoL7SRWjPO0cQbTWe+25ZMQ3nOXKPQ
        GpOuwqMDTeedEe0/Gxd65Ow=
X-Google-Smtp-Source: ABdhPJynw2LhC50rKek/46CFwADUp7ZQhyDvwiGFvl/E2XFVwla9P5bdDg13UZedoG9QVBThxEbYpA==
X-Received: by 2002:aa7:96e1:0:b029:13e:d13d:a138 with SMTP id i1-20020aa796e10000b029013ed13da138mr26450620pfq.32.1600342521100;
        Thu, 17 Sep 2020 04:35:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a138sm21128382pfd.19.2020.09.17.04.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:35:20 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     krzk@kernel.org, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com, thierry.reding@gmail.com
Subject: [RESEND][PATCH 0/2] iommu/tegra-smmu: Fix TLB line for Tegra210
Date:   Thu, 17 Sep 2020 04:31:53 -0700
Message-Id: <20200917113155.13438-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

These two patches fix ACTIVE_TLB_LINES field setting in tegra-smmu
driver for Tegra210 platforms.

This resend in series groups two previous seperate changes that're
corelated, being pointed out by Thierry. Also adding his Acked-by.

Nicolin Chen (2):
  iommu/tegra-smmu: Fix tlb_mask
  memory: tegra: Correct num_tlb_lines for tegra210

 drivers/iommu/tegra-smmu.c      | 2 +-
 drivers/memory/tegra/tegra210.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

