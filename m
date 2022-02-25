Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C31FC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Feb 2022 16:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234509AbiBYQsc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Feb 2022 11:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241433AbiBYQsb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Feb 2022 11:48:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D6F17AEE9
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:47:58 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id d14-20020a05600c34ce00b0037bf4d14dc7so2035514wmq.3
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uduFXioM9Jvok6vQql7ATzaeIk0YlwdJ3rm+JrUutIk=;
        b=CUeh2x2ibtoEGB9+JkPliPBiG6KCjSIFu1b+hIzdFO9VFPzrvLuDUKe7/u5Ht9lhE/
         qvhKVQU4UshisQGY/v5oJPMl6yAS1X5SOi4znZkBv2lPRFE1AaUah5pvoyGEQdpGomrW
         RsDUxH1NJC/n8t8QACqTig3Jykm7SNdyVGHI0x+fbHAM8LigFJJquF4jIRcpiuKLyxbi
         6DAZInV8DWpDTafxQ29lacP8ECcG+k6pumGaQ7oidEoy0vbIBOKaUU4cg+4WUjMEQHMP
         cDmMdcGEfNJukgNrXp7OuZ4XmQZXA95dsvdFMQKroyWZsZmg1l34Blr2hgqjVrimzJew
         kXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uduFXioM9Jvok6vQql7ATzaeIk0YlwdJ3rm+JrUutIk=;
        b=m2PRP5dTNtCuHO+ZFdD/GNR74Nxy/duYAp8lPfAqgpICDLGhWZu+2P13j/PI3BapeH
         Y2UzIcpuaHIKzVLDgtxpjOPEblBLEG45qAnVe0YVJ+q4Qlm91cPCeeG6REa2zU17fyRJ
         uDLEA62aWCG/2S4estBJ9t6ggRevREzvoSZRNeVUQEhW8bJ5DLHt+SfYHDCk7qhzBRGt
         l5bynna8K2XGxaJ6npwRMRZegXUFO72VD9mfbKjSKrV+hdkR/svxryoPWY+8ZslRZ1WK
         ntkGZH9ZXRwo+BVC4MVgYnwLfwzv6vGbdrNjws5cmkwQyen4ccxdwQNGnT8Qgp9nDVme
         0/uw==
X-Gm-Message-State: AOAM531nS9yi7FKm3rqJ0mqGjaCbWas+2vr2fozJGELKu9cskzP0UW9t
        sCxOg0kOFmfO9yU7kANPOBM=
X-Google-Smtp-Source: ABdhPJxHHk4kBdDLIrF4rNAB7zvJbnqmqDjyf9p+H8aYiM81qW7zaw5UNfvr72envSUT/YbmN6glOg==
X-Received: by 2002:a05:600c:3c8b:b0:37f:1546:40c9 with SMTP id bg11-20020a05600c3c8b00b0037f154640c9mr3501308wmb.161.1645807676564;
        Fri, 25 Feb 2022 08:47:56 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a8-20020a056000100800b001e30ef6f9basm3905853wrx.18.2022.02.25.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:55 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Default configuration updates for v5.18-rc1
Date:   Fri, 25 Feb 2022 17:47:41 +0100
Message-Id: <20220225164741.1064416-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225164741.1064416-1-thierry.reding@gmail.com>
References: <20220225164741.1064416-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-arm64-defconfig

for you to fetch changes up to 753b2280e154aad4522d20a3fbd04fa1736a809e:

  arm64: defconfig: tegra: Enable GPCDMA (2022-02-16 16:32:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v5.18-rc1

Enables the GPCDMA driver that was recently introduced for Tegra186 and
later generation Tegra SoCs.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: tegra: Enable GPCDMA

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
