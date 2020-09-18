Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92211C43463
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48B2F2311D
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u77fyfBc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgIRPDS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 11:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIRPDR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 11:03:17 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872FAC0613CE
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:17 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e17so5653165wme.0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eRAaG1Mgh2jmfC212SCxdZAHu4KWm9h0NWThIuXfRCY=;
        b=u77fyfBcJlnawBeuXx9MddkW3RYV3Recv4SIRxpxW18yVKezoTcWSrqsN7zbPoEqj1
         Zg9RgtUMrwJ+d86CiJOKN4iBJs1aIqbvxZGzioCugkQUFyiYT5tDmp3Mw57hwjot4QN1
         gQZB7/qbnHn/Pi2BP9+Ft4QvHcbsZKj2SibiwdGiFf306zDMeK1uBAIPiNfhr7P5jmNh
         ypxxBTjE4226O1XcBKK1fH22ro20siKh8M0tKo1rag89FJEkmRoiDsUu3Upoe4MLjrVs
         /TsxVviQXZwJ6GRXR1dXvsr2iL25RYEMmwem/t2cEM5J+x8A2CGGgEBPXXm8NH5EngJ2
         eoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eRAaG1Mgh2jmfC212SCxdZAHu4KWm9h0NWThIuXfRCY=;
        b=jV73VazjsMnIvO5wsP+aGLMTFPiMpqaeg1kY9Yl0UadE59AC/09CYN+c8/HyAg+x3t
         y7o/dZz9Q3ck7BAvVI5wN2e+wCE/8MK/D6lAhJW8Jo1HOdCSCc3KlU86OqxjzUpTAWE5
         PQyC3Bn4Qfa+28Mpqp+VlldBLyU6Y2XIUniDGqbRb1Q0Py2Wp1dg0hAErnGlP4NQ29Bo
         NEEsWV2h2x7ybxwCi/adgVTkY1Zt/iwOZ9XTGY82+pPE8CsDcapvQAW8rJ92pEhCTpbg
         Sh6rby076vWzCNv5mOU7BHXs7TkknM9IbX81u9vySDCnXXy3/HGOIlaMX3dv1QRSznAw
         YT/w==
X-Gm-Message-State: AOAM5319CgFIwMwE5YP2605TSBEzQsj2rdMHmqI3Mo2M5FhF2WK6SU4m
        oL2W78oNXrThQQFJt9/HyRg=
X-Google-Smtp-Source: ABdhPJwry+IZ6bUZYEuxWUmoLirKJ2bkZrhz/DjUOHWavPi0Qrq/Gqm9J2Hbv6VjPU/ahsG0zqBQEA==
X-Received: by 2002:a1c:5602:: with SMTP id k2mr15501101wmb.25.1600441396226;
        Fri, 18 Sep 2020 08:03:16 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 97sm5578861wrm.15.2020.09.18.08.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 08:03:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v5.10-rc1
Date:   Fri, 18 Sep 2020 17:03:00 +0200
Message-Id: <20200918150303.3938852-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918150303.3938852-1-thierry.reding@gmail.com>
References: <20200918150303.3938852-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-firmware

for you to fetch changes up to 0ebdf11699d0491c0a1eee5bb5d920f4f36810ba:

  firmware: tegra: Enable BPMP support on Tegra234 (2020-09-18 15:57:04 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.10-rc1

This is a minor change that implements a BPMP workaround for pre-silicon
platforms and is needed to enable support for BPMP on Tegra234.

----------------------------------------------------------------
Thierry Reding (4):
      soc/tegra: fuse: Extract tegra_get_platform()
      soc/tegra: fuse: Implement tegra_is_silicon()
      Merge branch 'for-5.10/soc' into for-5.10/firmware
      firmware: tegra: Enable BPMP support on Tegra234

 drivers/firmware/tegra/bpmp.c          |  3 ++-
 drivers/mailbox/tegra-hsp.c            |  9 ++++++++-
 drivers/soc/tegra/fuse/fuse-tegra.c    |  2 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 24 ++++++++++++++++++++++++
 include/soc/tegra/fuse.h               |  2 ++
 5 files changed, 37 insertions(+), 3 deletions(-)
