Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C6DC48BE0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:44:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4AE9613F9
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhFKQqK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:46:10 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:34509 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbhFKQqH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:46:07 -0400
Received: by mail-wr1-f42.google.com with SMTP id q5so6759887wrm.1
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G2y1nNc7K+FotKmCLrE2xc9UwhEMOudxdp6Ua/dpxnA=;
        b=QVccNFWGssWk4k4ucBpwS+8fhjUb3TMNJNMl3t5FLIgQYgTmYAo8plKz5H+4I6bdxw
         IavtWULG8FSlydKvTlF5wDV05v+xD0zIIEBNiwTirCs61LpCuoDGUEAOsWTujt2xjzww
         co+cynmZegs1M4ZfA7dNcr7OVbDGxnXydXTbh5mbwDftvvdz9V8nqw1D+uLY7GJE+WmB
         tguux8FWnY87SAfKaKtLIfMIt5RD9JxTuX48qUDwRZDQqY1BZxKNIm06y9SrP5CABZzd
         3ScdNJe4dzNRoKCxM/IKKmcgvyDmbxxOWjd8lnwDWytgSCRcC5+yjQA1jvZ7W8Ngcg3E
         nS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G2y1nNc7K+FotKmCLrE2xc9UwhEMOudxdp6Ua/dpxnA=;
        b=SM8tbgLy/hV++8I2TMuPScXxQg5viJhrFWNA+XlfLwVv7qXo/dpf1UPVmtIR5hjTv2
         gqlF8DajOPSl88gLs8bbZbOcY/uvj2SIB4GPLziraP9qs/kR4/IK0mzLxeSY7BN6wYBp
         71hGWgbKGLJFZaoTMYnyLaqO61noNyxjRpDPt84RUsBF04hnmNPF/Vf6tei3a4x344vA
         9Ial+kaCgbSsI+JecvcEsfVJziiczfeaDLkzXh5FgiOASopwaje1H17PXEXCv3IfBgr/
         zhTPQt0TYLwUoWGjxubjxG+U7CvtcEc6ht/PAyTw/r7dB7I8LU6YT11/EhApLFLFFidf
         eUFA==
X-Gm-Message-State: AOAM5335RqLecLscyZqQV4j1WDKRq2DzfcBiL98e+XdKcRm7sTZUMldP
        9TAU8Nf4VmZHYvNitiQjzOY=
X-Google-Smtp-Source: ABdhPJxbh57z+wnedcBu6pjDDzsjRrMwjs2/RmVYmEKbEpOZMiesm6jZOqpG7ISItY/7hqRhGOo4mg==
X-Received: by 2002:adf:a195:: with SMTP id u21mr4993145wru.367.1623429788401;
        Fri, 11 Jun 2021 09:43:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k8sm7725414wrp.3.2021.06.11.09.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:44:34 +0200
Message-Id: <20210611164437.3568059-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-firmware

for you to fetch changes up to bd778b893963d67d7eb01f49d84ffcd3eaf229dd:

  firmware: tegra: bpmp: Fix Tegra234-only builds (2021-06-11 13:31:51 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.14-rc1

These changes contain two minor fixes for the Tegra BPMP driver.

----------------------------------------------------------------
Thierry Reding (1):
      firmware: tegra: bpmp: Fix Tegra234-only builds

Zhen Lei (1):
      firmware: tegra: Fix error return code in tegra210_bpmp_init()

 drivers/firmware/tegra/Makefile        | 1 +
 drivers/firmware/tegra/bpmp-private.h  | 3 ++-
 drivers/firmware/tegra/bpmp-tegra210.c | 2 +-
 drivers/firmware/tegra/bpmp.c          | 3 ++-
 4 files changed, 6 insertions(+), 3 deletions(-)
