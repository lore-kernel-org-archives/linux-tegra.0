Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5495C433E1
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FEC5221E3
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6SO5z7N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbgHFR0E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbgHFRC7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:02:59 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03492C002150
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:54:08 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id bs17so16762985edb.1
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O+ufeIly26hH0HVmgJKBo9pM+PAzFRO+Yv7COUuQIJo=;
        b=R6SO5z7N72KtfknpWpSlCKTbeB/0zDuyBWmEmGrL/iBpFU2SRozwszNFSBCuGR8ZMf
         XdTFXpawMMuAuNV/6/EDPgAJVxePs27K7gYczFkiMWA6plwzAoLcrWHQAMzVaBJzfVtQ
         zMsr5F9GOrBNwGm3zMRmIOswiuzaebXIQnOcIaa6FWX0oVWN6FQIY2+5Qudu2eyLV16t
         WEdasvBvmfLPXI40zDN2OYfMsV/TABIXiXPSVVid5Z5n7hmprxD63WkG8wGjMttmJCuq
         nuQxMp1bBWW9eKWsaw8TGjWyEyB+hJaT5e4UdyV9RRz30iInDqb55QpUcHTgfOO302/T
         ClmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O+ufeIly26hH0HVmgJKBo9pM+PAzFRO+Yv7COUuQIJo=;
        b=ggdbOEirMTatP70BCTCRgDNwhRubduunFPTfVS/wdZ+cLOmQ1nFDagbPMAKCAxge3p
         a29kLHVH0ZzeQsi6GmX7PocJgKZOHWOg3hcZhTwUm9YZvpHuH6HQ3vM25XwewpkzE6ww
         FXUscK3AB6fYloEM+kiEM7yW49283Q9e33YVobH4XFhrfy1HBwL4xJWjqX2Kspo0uQFp
         nq5JghRwdnwl/m4nDyPdDfVb0W39ipaZ3DDdpoM9FxrEr55O4LzmybORLCysJmqr4CmU
         mKQr2n04YZt3m40eTpqeWNymIU1kI/qwyAh0/n7EZ5gJNgs7znjAaisXjw0kRz1XWi0V
         n05Q==
X-Gm-Message-State: AOAM5333gO4pf/ZmitbX2jQ6KATND/jfmPwiiZseCfu9YpWoVJe0KOp2
        4CDHmRVqS8cEMhpiSfr5aH3zXcFx
X-Google-Smtp-Source: ABdhPJyPwZ6Q04MNu67pZ1O1nuhWiXIm8oC4MsQ55Qogir4NVqKRn01KwQylpRo9pqoFSDhTqVkaJg==
X-Received: by 2002:a05:6402:33a:: with SMTP id q26mr4973328edw.8.1596729246587;
        Thu, 06 Aug 2020 08:54:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b16sm3741696edy.73.2020.08.06.08.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:54:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH 0/3] iommu/tegra-smmu: Reference count fixes
Date:   Thu,  6 Aug 2020 17:54:01 +0200
Message-Id: <20200806155404.3936074-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

I was running into some use-after-free conditions after recent changes
to the host1x driver cause the child devices to be destroyed upon driver
unloading. This in turn caused the IOMMU groups associated with the
child devices to also get released and that uncovered a subtle reference
count unbalance.

This contains two fixes for these issues and also includes a patch that
sets the IOMMU group name for "static" groups to help with debugging.

Thierry

Thierry Reding (3):
  iommu/tegra-smmu: Set IOMMU group name
  iommu/tegra-smmu: Balance IOMMU group reference count
  iommu/tegra-smmu: Prune IOMMU group when it is released

 drivers/iommu/tegra-smmu.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
2.27.0

