Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FA0C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 14:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442223AbiEFOeI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 10:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442202AbiEFOdz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 10:33:55 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D75A68F93
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 07:30:11 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e24so10275546wrc.9
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aQb6q3Qhc7TawpXFz11bbETIKo6ryfU6AXp8dhF5Rgg=;
        b=GRQLL9711f6FIy3dhpp0e5+ua2CsBcVHf7VlgfAu7znBi/Rrcw36mU+GiYNULKwp7p
         VKOME+IQ+mdBdlONnT7HItI0RboHKHddY5D7i+IJI4Z1F9klbkimxexxsqlFkhTnQax0
         CakCWlrO0SIPWRIKp9uFNfqpEm8Q5tc73KKRnnMCuyQLQj5oCBrI8yp7Ayv8CZzwYjbl
         4IUqzLzBi3tKei1kJNCIkKV0/zKo0HMAdI8YhmpPYeUC3Ul4llgluvGeokJafZC2du3b
         p9feCnkyLaLBZQA7/2ynl4EGH7pOVtlp7jFH1f3y4xGgz4wZRRdd6ea7tSorxE0+OJUv
         5WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aQb6q3Qhc7TawpXFz11bbETIKo6ryfU6AXp8dhF5Rgg=;
        b=lcwfQzZ1aCiKR1I0Ycfu9q5AldIjySMjV0W3IfxhndKYBJ1eNkfSMdcd78+Mc5QbM0
         afhrnK4RR56YIJx2LdnvWZ0CatOAMRL2ah5GIvy/XtXFW/+JmSRCW8Bm5O77RtVajGeY
         e36Wokhd0qnwkVvLb60aBsW4S+VNcXfFaYTGsMbVFPSMmhZNZUtgJmMKild8O2Y5Ubx8
         CRHR8GZPxcGqy7CWtHqPN0sbiZRVK/NxfMQxvNbocaaWJKNRXbhLJFwhjupoIEwJ/8St
         ztGmESYmR3ldbyJE2IXApgBP3C1ZvEdwz5OFXt9+6mIyDMIsyLAPr9T9WWB+YD5Ux7HI
         Mp8A==
X-Gm-Message-State: AOAM530ZZuMH71gjx35gYyWoREfQeBU4SpAp2lvHZcf21pA23x65O8ej
        pp+pbr+4/Ob2w1fVEfLwJfs=
X-Google-Smtp-Source: ABdhPJxdvPALns7toTxtoaOjGVFh/2dhjEXKbiAkLNhgLxBvXvEyyUhyd7p6fTYCe05SQa2mVHujbg==
X-Received: by 2002:a5d:6489:0:b0:20c:6c3b:d49e with SMTP id o9-20020a5d6489000000b0020c6c3bd49emr3024054wri.75.1651847410056;
        Fri, 06 May 2022 07:30:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a7-20020a05600c348700b003942a244ed7sm4143558wmq.28.2022.05.06.07.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v5.19-rc1
Date:   Fri,  6 May 2022 16:30:01 +0200
Message-Id: <20220506143005.3916655-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-soc

for you to fetch changes up to d3a20dcbca4880ada8974b2d0167df99161bbfaf:

  soc/tegra: pmc: Document core domain fields (2022-05-06 10:53:19 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.19-rc1

This set of changes adds nvmem cell lookup entries for Tegra194 that are
used to read calibration data from the SoC fuses, and updates the reset
sources for Tegra234.

Other than that, included is a minor build fix for a missing dependency
that can be encountered very rarely in random config builds. Lastly some
kerneldoc comments are added to avoid build warnings.

----------------------------------------------------------------
Sagar Kamble (1):
      soc/tegra: fuse: Add nvmem cell lookup entries for Tegra194

Sandipan Patra (1):
      soc/tegra: pmc: Update Tegra234 reset sources

Thierry Reding (2):
      soc/tegra: pmc: Select REGMAP
      soc/tegra: pmc: Document core domain fields

 drivers/soc/tegra/Kconfig             |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c   |  8 ++++----
 drivers/soc/tegra/fuse/fuse-tegra30.c | 17 ++++++++++++++++-
 drivers/soc/tegra/pmc.c               | 35 +++++++++++++++++++++++++++--------
 4 files changed, 48 insertions(+), 13 deletions(-)
