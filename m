Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1D8C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 01:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5477023110
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 01:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbhATBYw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 20:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbhATBYv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 20:24:51 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37DBC061575;
        Tue, 19 Jan 2021 17:24:10 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id v67so31899063lfa.0;
        Tue, 19 Jan 2021 17:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SqXy5aAwO2rzTfIM1Q2kL1twoVRiUAFWQBCsKbtJUR4=;
        b=i7NUxwefIFwJpjK8ajZXDW0HjSZ5QDjUmLG0F99hEYrbXSofPmAX6ZsciiFmjRlXZy
         4dMN5zCNU+rsCXMod1GY3EErGNE6BvAr3tN6AAMBAL82qtmAVt3P9L3DkrYjqfurrQW7
         JRB0Z8jCJ1sx1vWAfJbOiQu1s1pSO4qlrt98MpBH8ca2u9N9Tq75MM0Z7JRBuSxk38Ky
         zr9bThVaoqPgX9glOnywr1nWDWmOBzHXbNUGhlLI+R9jZizoPPqwgAoaCBCmgLm8ZeEe
         1rXEkGxj8duuZ8a8omNrsTrdR4wagmaneYJWHY4rUhCSjAnba/z19TDg8iKPxlAnZ+ZB
         TiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SqXy5aAwO2rzTfIM1Q2kL1twoVRiUAFWQBCsKbtJUR4=;
        b=UaOkobRtPKurO3dmrYdvifDRoCw1TTydln9MC5Wh65T7lqal7VddUAv2x6I0BcFZ3a
         Jip8IGqWZMmhucHESXATeu2VgA8bDP+TT4WdaB9haVoXbKSjhNvDuULj+NKl5pQuLWyz
         QcCtuB9MnycQseLsC95dY42m/d67t/aLTEKLuvvIQGPOxhPP0xd79uQMMgpQFBI0Cm0/
         CqVr9s9L6xZOJDqJYjFZnGIu5BrXhQJCoIhe8z4AfO434Hfhx1s3aFZa+IZ9fIkQVHpi
         p1rSsi3ThUdN1gAJ2DDFDy1oGKuGQ6TL5USJ72jgWSdXXDb9nY4hYgrVVSstjeMpqGnx
         btiA==
X-Gm-Message-State: AOAM532X1B0K20lvM7rBvidLGVkhwW7pPpLYA7xWz9whBwa/m8u+xQe4
        qKybJI6HQF1gHBxfCMmNuD4=
X-Google-Smtp-Source: ABdhPJzmzFx5B7IioVgSc3gLGXi1iWGjYzrIudDlGknzXByhsQ0q9+dVSPqSMCSnrpgc6MBCrclBdw==
X-Received: by 2002:a19:804a:: with SMTP id b71mr2914610lfd.504.1611105849515;
        Tue, 19 Jan 2021 17:24:09 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c8sm28416lja.80.2021.01.19.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:24:08 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Tegra PMC driver fixes and improvements
Date:   Wed, 20 Jan 2021 04:23:52 +0300
Message-Id: <20210120012357.11038-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This is a continuation of [1]. I decided to factor out PMC patches into a
separate series to ease reviewing and applying of the patches. This series
is a prerequisite for enabling dynamic power management by Tegra drivers
that are using PMC domain.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=221130

Changelog:

v3: - Added new patch "pmc: Fix completion of power-gate toggling",
      which fixes toggling power state of PMC domains.

Dmitry Osipenko (5):
  soc/tegra: pmc: Fix imbalanced clock disabling in error code path
  soc/tegra: pmc: Fix completion of power-gate toggling
  soc/tegra: pmc: Ensure that clock rates aren't too high
  soc/tegra: pmc: Print out domain name when reset fails to acquire
  soc/tegra: pmc: Link power domains to the parent Core domain

 drivers/soc/tegra/pmc.c | 181 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 173 insertions(+), 8 deletions(-)

-- 
2.29.2

