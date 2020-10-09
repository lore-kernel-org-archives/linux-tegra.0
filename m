Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879B9C433E7
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 16:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 433C422276
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 16:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fj2z75zD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389144AbgJIQ0w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 12:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgJIQ0w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 12:26:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B7BC0613D2;
        Fri,  9 Oct 2020 09:26:52 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b26so7304614pff.3;
        Fri, 09 Oct 2020 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FA0/JRQWBmowCExEqFY++1Bu3iAIWMgGDVt4Foa40XE=;
        b=fj2z75zDP7uH9u6yWI8HPvMSK8We2AyjvvoQ+3ukk9wM8AC1MCTP415+Iaw9+6C3Si
         08MjIYSaDHba+W1stkSGMOcRfCN4I1ni089iS2gAVb8wgiLbPxsN7XOzL442nAcFfWFN
         BjBwxVoSREgpIO2D7MyFo9tp7IHF89zh6pREFqOSQTd6QS7OjLGka2Zs3aSe7AlXtT8z
         eLmTVslMxZJ2uTKOIgsOqCwwy5WYR24HLhy/wHlAw2f7PlEvMtbCBC7vZBum012kkmu0
         wGvocCzbRivI3tEOZZbeT3bzHxONaG3kx+zkd2QMaoJoIZd4/MHQrMPR7jPZVeFc1DSK
         h+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FA0/JRQWBmowCExEqFY++1Bu3iAIWMgGDVt4Foa40XE=;
        b=uiONZLnXSgImRtrLgYEUwhw9DzWXi98vllLDa4Ysl9h9L8Ae8gtpU73oYhIfGeBkMs
         wrg5nNpP7yVYIvVUxioc6gK65n/6U9UWQz7XxFRmNpkWF5xHNkGKfoHJL4lZC2VcuwWC
         62nFa3zLJnx1sWRJ6S4y9UcA9kZgEjsALepVH56gm+WVK0iI9qwW9mbQ4B2p3nth5sVy
         ShGxaesJ4cEPjmfiZqDKZtT8DYRBJKu7F8xIXMWtj+P8XVtFbMC9Cb2opPGBg/pzykaH
         PTzFBfXBfT6vPAcevQ/sksk33UfE8zSNce95yuUkmubcbmYnCwPl9rwHriz9okBIP+DC
         IY9A==
X-Gm-Message-State: AOAM531FT4IQEo1X7XuagokR93pp4TEElUIWgx+DHC8Ske/TjgAAKFrw
        nv7TD4RXx3WT4h3oaTF3oRQ=
X-Google-Smtp-Source: ABdhPJx5yClDpScDvtHP/agSL+c+p6kXovmCoBzq1O3u/I4qImi4LCIfDR/iGkEB3MTz8KzkA2hl1g==
X-Received: by 2002:a63:7702:: with SMTP id s2mr3985330pgc.240.1602260812129;
        Fri, 09 Oct 2020 09:26:52 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id q24sm9591229pgb.12.2020.10.09.09.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 09:26:51 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] iommu/tegra-smmu: Add PCI support
Date:   Fri,  9 Oct 2020 09:19:33 -0700
Message-Id: <20201009161936.23122-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series is to add PCI support in tegra-smmu driver.

Changelog (Detail in each patch)
v6->v7
 * Added comments for put_device in PATCH-2
 * Renamed goto labels in PATCH-3
 * Kept Dmitry's Reviewed-by and Tested-by as no function change
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

 drivers/iommu/tegra-smmu.c | 187 +++++++++++++------------------------
 1 file changed, 63 insertions(+), 124 deletions(-)

-- 
2.17.1

