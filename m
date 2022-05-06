Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04987C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 14:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442220AbiEFOeI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 10:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242403AbiEFOdw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 10:33:52 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7886A68F93
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 07:30:09 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id r1-20020a1c2b01000000b00394398c5d51so4484281wmr.2
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfFGbXtx8Ki2IjiN7Vk3A6jVBg+1ReA160NvfdgTTd8=;
        b=mvgmBJZ7C9mMbaPWvrP1UdwUpXFu73rh6NdL0dx1CPzgy8VdrCQdodiWy9Hi3FBTP+
         qMHMwYWBWs3qtPhUZeGeJWGyhJbE97oyNOrlBBm1GatzaY1IiQVmv0EgEMlAGM12HOOS
         7MHmZo+1ERgUWZOymxUm/H66xLqvRCW7nmc3cTUFgivl93Ba2v65rGMqxI4wpiT8vyqL
         iK1xnieIugwM+szmCfP5WYUE/65PhLZgRE80WgsWPKVRjQL+4wR8tGk9nzmYrwOFRImA
         ZOR3kX/1SOmb+mFWz+dVh/Gnrj19orDSJF2RtaNMYVLBVi+R82ndgkYRv/8P+jiGqlbY
         MEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfFGbXtx8Ki2IjiN7Vk3A6jVBg+1ReA160NvfdgTTd8=;
        b=hmnm8H7XW00qrAwur7j7SKPW8Xt5pSOI1KdNvkB2GX+Je5+V+pzSRUQS9qYq93WoDk
         obdb5FKpjGF6YBj+vJtw5FkcUnRajN/68s9R8LDGoT1cV9Y+5Y/tdNvrS2y58+apXqpH
         KktpF0e64FzpWNwkO70lfdkvzinhs+S2AZG+8RDIqQBhIEfrNloVn2HULHKP7Bd4vhNb
         fGxjhofNYwklqLN70Xtk1fHfr9cCuR12rBRfN4VJ3BFmf0Qpgu/hqPch0PbLcdXwuhNz
         LRSRo95DxV6cK+d7oh4HGS3PKrmwu4fkppiOmsTlzCQ2XVR94vWKuazV0gJDCTfA0i6q
         9F6A==
X-Gm-Message-State: AOAM530GE5HAU8lEsLacecrObmmCBl9WPHwa4haux7BJRwY9GXkex6R9
        sbWH9SMCdQgHYKLAoVZtmDQ=
X-Google-Smtp-Source: ABdhPJzRVLvTpSH9Hlb0gTRiLfi2J2Od/21ypwhu2x944HI4J+fMouNTl3zvtcmwjcogC5w/hhWomg==
X-Received: by 2002:a05:600c:2552:b0:394:65f:fbf1 with SMTP id e18-20020a05600c255200b00394065ffbf1mr3709426wma.55.1651847407991;
        Fri, 06 May 2022 07:30:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r190-20020a1c2bc7000000b003942a244f51sm8838909wmr.42.2022.05.06.07.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] ARM: tegra: Core changes for v5.19-rc1
Date:   Fri,  6 May 2022 16:30:00 +0200
Message-Id: <20220506143005.3916655-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-arm-core

for you to fetch changes up to d5becc32308c31c6c88bfdf55c1ec8c537a8cdd1:

  ARM: tegra: Fix typos in comments (2022-04-06 15:33:14 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.19-rc1

A single fix for a typo in one of the comments in the SMP code.

----------------------------------------------------------------
Julia Lawall (1):
      ARM: tegra: Fix typos in comments

 arch/arm/mach-tegra/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
