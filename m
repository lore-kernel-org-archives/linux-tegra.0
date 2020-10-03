Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73B9C4363D
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 07:05:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B04E206B8
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 07:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyB0pDpp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJCHF7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 03:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJCHF6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 03:05:58 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4ADC0613D0;
        Sat,  3 Oct 2020 00:05:58 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g18so263957pgd.5;
        Sat, 03 Oct 2020 00:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GKKFXutVq6JBEK8XjRJaqT5wjVrg16/0GsaLUpb8/ig=;
        b=UyB0pDppZuQygRa+/u02Y+YAu6ZQwnMMjnCIjVjZePLFuomQDp0ZEb8cIUvhuHP4ke
         qQJOxYhY5Rhc8/EPjXmP0zXixURSkXyHeHhZ2094zCvaw4dZx6DY6IqPF4WdziB3PA9V
         FmzOaugAvFQeOHyTh2DH+DrK1xgnzqUTq6nkfklmCdCbjncww5BZFCIJlCX/dPys/hMe
         flG61XM+YygIZfxgSDOKeE2xf0vC7QvsKGiBoVlrNg3I2Mf5V/tqmx00FwTVOpyFhIXM
         lsUi9JFVW2OOLPxysZJVWNwsvuOpANw4cVihDYt6vNs1nOfbS+ddtQVlv1xBqGA/tNIP
         3rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GKKFXutVq6JBEK8XjRJaqT5wjVrg16/0GsaLUpb8/ig=;
        b=Ed0MHUiNb3++Za/SnVACUES7df0GTVLfdC3R0SPYqkWjSZNEa5NggJ3XRHNHDpse9F
         fkquOiYoEptd0IXNeCS/SwTd9bA0T9peVZ5yrFn+DaUZkN4PLUK2VyFBzVoPi3jNLdcM
         XJlSn7d78cNP5oIY1b81+/2ytEBVJ4iNBPNH1Qf1ky0AXIP/AH9Y9saAPMQ9qzOTqpOj
         RX3UWlBFm/D3z/R++nXbxqL55QElqx+TAM1L38bLF8MXDKiD5IFq7feelAnQoqW2+BCV
         h2UXDeTIpnSUl2vTyKWSj63e93TSybU/pTM6ebiRex5oZ9JCY01frwn6yX+tNRN72rxo
         6DrQ==
X-Gm-Message-State: AOAM533kNcX3ZBAo2OnpZWXkQl9L4RTI+CktIsopfNQr57BPENR/8Yxj
        jMKAVBxPEjD8yl45Xdog0bFsKb7Oghg=
X-Google-Smtp-Source: ABdhPJwWzCXCHgBMr3ABCAvMnsMEPZC0oefI+R/nGRotFLhuEtUwjYo0LbgwizMaVm/tkfxCQT64HA==
X-Received: by 2002:a63:4451:: with SMTP id t17mr5707137pgk.32.1601708758277;
        Sat, 03 Oct 2020 00:05:58 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d25sm3854498pgl.23.2020.10.03.00.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 00:05:57 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] iommu/tegra-smmu: Add PCI support
Date:   Fri,  2 Oct 2020 23:59:44 -0700
Message-Id: <20201003065947.18671-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series is to add PCI support in tegra-smmu driver.

Changelog (Detail in each patch)
v4->v5
 * PATCH-1 Cleaned two variables inits
 * PATCH-2 Fixed put() in ->of_xlate() and Updated commit message
 * PATCH-3 Added Dmitry's Reviewed-by
v3->v4
 * Dropped helper function
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

 drivers/iommu/tegra-smmu.c | 183 ++++++++++++-------------------------
 1 file changed, 59 insertions(+), 124 deletions(-)

-- 
2.17.1

