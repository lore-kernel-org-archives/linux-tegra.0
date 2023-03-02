Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB21C678D4
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Mar 2023 09:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbjCBJmj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Mar 2023 04:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjCBJma (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Mar 2023 04:42:30 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9FA410B8
        for <linux-tegra@vger.kernel.org>; Thu,  2 Mar 2023 01:42:16 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id cw28so15949387edb.5
        for <linux-tegra@vger.kernel.org>; Thu, 02 Mar 2023 01:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677750135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUKFBQwbI35+6QIiUGpOXYPYS1+8YomYb5Pups8YD7k=;
        b=KoECfQB1+QnD+tqwt6GnvSuCZVPYSrE9MNDRGpn1+g2ENCsqYCSmzJ26NgGqs29JyN
         b9FJXKKFuQApz+DXPS/esR/UmBLgi8mWhtqjABwKCNQkQMK77gPmcJpUIj0se2B0G+qB
         zfwCLaOzryKzADAvbTVnUjOf8C+V42KMOfZIyMzyd1vF5xJB4NGyf1evppArr3ODLKss
         +4O07YlE5MathjSfz80+z6Ahc3XUTMsPhL8MmMJ55010PbXokLxX76x4PF/07Y0zh8WB
         CsxMQFmxaGWqlrI5yIUZbZrLmDr9+OLKVpUq2MeOoBOv+vSo6hTjZVpKdH6JZrnWYKwK
         tm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUKFBQwbI35+6QIiUGpOXYPYS1+8YomYb5Pups8YD7k=;
        b=KgEtzbOkiwuiqh/HTZ6XzsoUGMiG5sTnTS6ep7nSWv2B0hDBD0epwrEyJ2iHIJhebd
         KZ0g3Toqy5m9HZ5GIzwLq8DTzim6ROI5JJKUE/c0P9mz14EMSec/eXflTFXA9mmx9pCz
         NW7l40dZiQ4md2/iRwqVoDmM2UJ4LMvQ94ve0/hhPVHxVsRwvDKLCBH5LZ3uIG/fwAP1
         S5BycZiYMdKFqxJk1iwZ19GJsumXxs9/HJSQxHeVtkbYy+Lcm5dxE782YQHyMqPq0moY
         K+hpFG7KuwyZwTY2xEphCElQUbSC4c8vWTPbU/cCid2HK+7dLsxmue3BY9z8lK6aNHkn
         zmbg==
X-Gm-Message-State: AO0yUKUXhhk1NtU6KH0f7tDcsDf0sDAvEUZF+9YBQnPmMy4HhKwrKdEc
        peURCMHAtEglB6ajps7mpos=
X-Google-Smtp-Source: AK7set9011Q5GjOA4Lg+Mrnet09JcKmYXPYVDCnUgkSD1xSDRpj75bo1Z5TKkwXMwvXN/d/kNiy2xA==
X-Received: by 2002:aa7:c903:0:b0:4bc:403f:a7b3 with SMTP id b3-20020aa7c903000000b004bc403fa7b3mr1378979edt.3.1677750134750;
        Thu, 02 Mar 2023 01:42:14 -0800 (PST)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m3-20020a50d7c3000000b004accf3a63cbsm6609698edj.68.2023.03.02.01.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:42:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.3-rc1
Date:   Thu,  2 Mar 2023 10:42:13 +0100
Message-Id: <20230302094213.3874449-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 682e1c498ae793ad90587171c93c1f7ec87aa208:

  arm64: tegra: Drop I2C iommus and dma-coherent properties (2023-01-27 17:08:58 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.3-arm64-dt-fixes

for you to fetch changes up to 4bb54c2ce48ffb3a06133ac0fb4086f7b48d9109:

  arm64: tegra: Bump CBB ranges property on Tegra194 and Tegra234 (2023-03-02 10:35:11 +0100)

This single fix is also available in patchwork if you prefer to pick
this up as a standalone patch:

	http://patchwork.ozlabs.org/project/linux-tegra/patch/20230214140549.3340395-1-thierry.reding@gmail.com/

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v6.3-rc1

This contains a fix for the CBB bus' ranges property on Tegra194 and
Tegra234 that restores proper translation of PCI addresses.

----------------------------------------------------------------
Thierry Reding (1):
      arm64: tegra: Bump CBB ranges property on Tegra194 and Tegra234

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
