Return-Path: <SRS0=Zq/d=DL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62E2C4363C
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C820206B5
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5qRpCho"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgJDWpF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Oct 2020 18:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgJDWpF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 18:45:05 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7506EC0613CE;
        Sun,  4 Oct 2020 15:45:05 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so4475900pjd.3;
        Sun, 04 Oct 2020 15:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=h8phoMKaggEIEEEPxyHYutFcrvSMoeO2oUCwixn9XkQ=;
        b=H5qRpChowrqUrPNO9jerKTlh7wLcjgNFxw5NlFbza1sCA8YOkPIj8YTh9ZeEO9qPjJ
         NH4j0QgEZJImfsA+AZWGs0NEK0oOFNYP9BIbGpTjmrvz42fgtD/1mRIzC/AR+4rc5itO
         OI0OPAyLLTX5t+nl8Zj5PU+H6qYLWbSjvv+Hqlvu2NXsujbyLOdntWg0vJYCNH8ppn/S
         sfMoBtH6KNqAB5MHzOJc5O+Md+1JKRRJLF2vkbMIxpBgWuIuh2Baqkyo8C8mMnjGVPp4
         Nagr6URDVOxGNkCXsxZI6MMRnKlTDn7engf+bez3TYUyqmXC+kdVgXlp0hKL0MeqZY5+
         ql5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=h8phoMKaggEIEEEPxyHYutFcrvSMoeO2oUCwixn9XkQ=;
        b=pY2+mcz3sBrwGNq6RY1/Wyo5osm5QR16+g8YvF2Wrp4MWqVG7OXapm6F7G3JSaqlmc
         17wGJNoonLfGqTQC7V+8vuZ5elEX4AOqTIX+Iqp6oQSJoQQHj5WarVT3kYmVqcSb5yGM
         BLvYGzRM6NfsGpeZF+mlJ9QrOQYb0cBQihn0GdGqERk7gRbBwLanW6lv35nO58wxMftL
         s6zZz9Zpiqkv5mFju1my/yi1XVj2l7ZxpZyWawke6x131k5hhpzwwKYoFU9VAC0V4tmB
         jfIjtyqNmJfbwhOmY1F4dC9wta+1eiDtQeGtc89WSS5hCJ4r/yu4tnvKoveAufi6ZfpY
         ueKQ==
X-Gm-Message-State: AOAM533/zIgZZ2GnQUzjWrZD/pYBrJN9+D/rTTkmXdV8MQRrDK5a+9Hd
        y4EOqNx53mjfgpudbH0c3ggNgvm87nE=
X-Google-Smtp-Source: ABdhPJwK2bJj/NFx8BvpkbmtQ4HQox+iyd40MIX6HZNd4DRlHyxZ5vfScAKJiaDThxCgKhL2C6PA7Q==
X-Received: by 2002:a17:90a:1ce:: with SMTP id 14mr13439887pjd.209.1601851504816;
        Sun, 04 Oct 2020 15:45:04 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d129sm9073236pfc.161.2020.10.04.15.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 15:45:04 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] iommu/tegra-smmu: Add PCI support
Date:   Sun,  4 Oct 2020 15:38:34 -0700
Message-Id: <20201004223837.15303-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series is to add PCI support in tegra-smmu driver.

Changelog (Detail in each patch)
v5->v6
 * Dropped a NULL check, per Dmitry's comments
 * Added Dmitry's Reviewed-by and Tested-by
v4->v5
 * PATCH-1 Cleaned two variables inits
 * PATCH-2 Fixed put() in ->of_xlate() and Updated commit message
 * PATCH-3 Added Dmitry's Reviewed-by
v3->v4
 * Dropped helper function, per Thierry's comments
 * Found another way to get smmu pointer
v2->v3
 * Replaced with devm_tegra_get_memory_controller
 * Updated changes by following Dmitry's comments
v1->v2
 * Added PATCH-1 suggested by Dmitry
 * Reworked PATCH-2 to unify certain code

Nicolin Chen (3):
  iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
  iommu/tegra-smmu: Rework tegra_smmu_probe_device()
  iommu/tegra-smmu: Add PCI support

 drivers/iommu/tegra-smmu.c | 180 ++++++++++++-------------------------
 1 file changed, 56 insertions(+), 124 deletions(-)

-- 
2.17.1

