Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F0EC433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42598610E7
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhJHUNq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhJHUNo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:13:44 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F32AC061570
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 13:11:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o20so32979542wro.3
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 13:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xphg3l2/2x/WeN6+HltLN1eWB+puBlk2ozbyExKcZFM=;
        b=GvEPVBLaebZAGU6y6wfl27wjhrQY674H03hcqjRc88nqrhF5ta/gF/slf+8Ggsi6Of
         p7W78gAE9BeKazhWrzH9fmtws5/okOIXOhYq27y+bbOeOd1KQ9VcrY6OnC2gAiLlzW+n
         VPADnC8ogRuR1wRiIifrQmyMJNr/fJKzsjf22p9eU9+oI/zrPQn+s/36AUlCW6obsuy9
         6QM4ruRGkSxyzNVDnkVkKlYfTjWUHSEVrvHme07h9uIP2iQ25s4yGI9z/O8C4HsvygzC
         YbCsqgS7m1NZ/LAzCAsPruBAZtDxf9ws3NpU1cJciA0UDViO/Awlox9tx7aNyQmQSM9l
         dRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xphg3l2/2x/WeN6+HltLN1eWB+puBlk2ozbyExKcZFM=;
        b=s94uqDSkzOWE+X0bbwn/4X3vlHppKtsWHOkRA45gwXf1oIu9g+vmn5OkLjMXKSiSXQ
         oMYzaU9i0jdSs/l927m0Go9KJZIw5gJpUZ3VMdzru/H61be9HfXBe7/ivpOALS4Xpw71
         ujwXxwzYSQWH8HU+Z/QYjLTTAYc1s7S9uBdZDJqRqKi/J9nsRgMRkVjnMVcJwItC9Acx
         eQLJ9/UxDVLGtAtaaG1TFylY5y5MPlVEy3S4fETpXfWJT91KrLhsq7puLq5WGcLu3BQd
         YJqX40atSmTPnXvpm7SPnxtXoRs+E/G43bOwfW/tIbok4xLB2LHb7/jabkE1LZGnlfIw
         MT6A==
X-Gm-Message-State: AOAM532e1EYp9AIhGuG8VJQZaNw2jkayQq1YJlu3s15EG4NmHFU8NkFC
        GkorwKCjgO2cYG2flDgJLu2aVrewZ8s=
X-Google-Smtp-Source: ABdhPJxxV0u2rfbBJgUD5YOEA79AfteLO1sL511IgyUcJ6P9M2z7Kk/6rwy8SstNn8rY7oCh8uLeYg==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr5911176wmd.20.1633723907149;
        Fri, 08 Oct 2021 13:11:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n66sm159972wmn.2.2021.10.08.13.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:11:32 +0200
Message-Id: <20211008201132.1678814-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-defconfig

for you to fetch changes up to 1e9b81616627643eb1a78c8fe98fc95eae74024d:

  arm64: defconfig: Enable few Tegra210 based AHUB drivers (2021-10-07 20:37:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.16-rc1

This enables drivers for the various audio processors found on Tegra210
and later.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: defconfig: Enable few Tegra210 based AHUB drivers

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)
