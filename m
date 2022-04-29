Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF657C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Apr 2022 08:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345884AbiD2I0L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Apr 2022 04:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239744AbiD2I0J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 04:26:09 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2584C12D7
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 01:22:50 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id h29so5465624lfj.2
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 01:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iCFkCyEcOqWKXRRSrd/3ESfgFDMgLLc/mGBuaHleFcY=;
        b=o7jzS3fg3u4pUZmH8e08tKDj3+jI6J2C3t+cXJdesQhCs3maGLuFrru/5tMpOG2OzY
         qB1Xf/yr6HNX0LsmWzeXTuvGGmQ+2sO/2Za/gBbGHUeLnywO2wu1tG9Rb3mJiDFLIqy0
         Cc/aFavc/PnTcs6ySDWMdxBBag+nilWjduXoTGXgsOB7ATlS1Rxi6MZXup9SgRkE8zrL
         vwIe4D6qWM0vi7GNhV98MjwG2Yfy9TIfM9p2soqf2aD6G3MMwwffXj5boFh7WsH3ayuR
         Dw6PC+JFwrM5KJZF1T5cXAhlgDbPC4cywBVdfvOrZfCEkB5FKDiPZVWSia7TC1gMjAG6
         LkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iCFkCyEcOqWKXRRSrd/3ESfgFDMgLLc/mGBuaHleFcY=;
        b=eWsImS9D/kcGXO4QdHO10DKnt7N1DRk+cVghernFVuRmXdmiGkZl0rI04ixIcuw9FW
         x6uugBmXNrK6qcobEoqgGXIoj1shOggeinrPuMS+DjwlOHd4pXbTxtki6C37DSVohIok
         c3PSJ4t0cz7FzNhtZJMmUO87sTqv7x67uBjv3oU9G/ljkKvWKybsU2OHWipDJeZIKFJ5
         wo9Yws7J8f6uUYJp8NqZjrMqdqJgFEVgQchCR9nynhtmsYGwspswFpYtlo8dVlthqouQ
         GEijYp6LGkcfXwTH4ouVJnjxU+Scb2dDmKVKHv9Ai9qKAmSMUMhMEVJ6tIvET7TR5liA
         xIGA==
X-Gm-Message-State: AOAM531Hb/i5ViYE+LTosfx/fnf2okdpoas3aQc8I3EaxKVfUT4lg83H
        ynUPCLB3H5fU+vjs+EZ5Fc+1y+k3Ras=
X-Google-Smtp-Source: ABdhPJwabBILjEU3P3BhFWL8z7wXXQkSEBEEw4ZkK2FUU1ZAiNtbaBBSbXPfsDUyzdjdb9app0bIMQ==
X-Received: by 2002:a05:6512:151c:b0:45c:6b70:c892 with SMTP id bq28-20020a056512151c00b0045c6b70c892mr26188114lfb.124.1651220568837;
        Fri, 29 Apr 2022 01:22:48 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id e25-20020a2e8ed9000000b0024f3d1daf02sm207613ljl.138.2022.04.29.01.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 01:22:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] iommu/arm-smmu: Support Tegra234 SMMU
Date:   Fri, 29 Apr 2022 10:22:40 +0200
Message-Id: <20220429082243.496000-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Joerg,

this is essentially a resend of v2 with a Acked-by:s from Robin and Will
added. These have been on the list for quite a while now, but apparently
there was a misunderstanding, so neither you nor Will picked this up.

Since Will acked these, I think it's probably best for you to pick these
up directly. If not, let me know and I'll work with Will to merge via
the ARM SMMU tree.

Thanks,
Thierry

Thierry Reding (3):
  dt-bindings: arm-smmu: Document nvidia,memory-controller property
  dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
  iommu/arm-smmu: Support Tegra234 SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 23 +++++++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |  3 ++-
 2 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.35.1

