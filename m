Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CE2C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Dec 2021 16:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239073AbhLQQXK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:23:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239086AbhLQQXJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Dec 2021 11:23:09 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D21DC06173F
        for <linux-tegra@vger.kernel.org>; Fri, 17 Dec 2021 08:23:09 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id c4so5038005wrd.9
        for <linux-tegra@vger.kernel.org>; Fri, 17 Dec 2021 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WGEgqKeQ8cbqSnn0DjBjL7FshAIe0mQv76dnJcpHdI4=;
        b=OyYiXOO2s3kCAP0LhoeRLbGSY3/mzV7j0I+UdQ2Z7AuheHgdet7Z+q7N+ufg05hU11
         VN5/deDybqRc4z0qmatMJbZDAKB4CDckmXAFjgAfr+KMlTMoBzxr/m67qamqlF/5l6oc
         LGsc14oJGSZv1IWMl8n8sWtU5npFS7W91PXZhnByx2sgC9aVN1gfVMu40GqICA76k52W
         wcd0izPOlj3njW/mzjQRS/A7r1xpTJw6VqjqnPVNhpKZsBsgJ8/8plpitDJtHPfD//Ba
         G2GZ1VELqLHo2pKK88k/WUHxnOSKZqgazd043wzgGvE0XedkIWlOSdpxaowroiYihrSI
         QLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGEgqKeQ8cbqSnn0DjBjL7FshAIe0mQv76dnJcpHdI4=;
        b=GHtJjzNqWRDH/TeuMy5tdEgjU9SrfJpOHe8QHneSabzLZ3cp+XQ0uljoA+INRwVfW8
         zNkWoQ4V28jll+9pWjYDZ9mxhMeDgjl5awC14uB1Ce16wn3SZA26o/uWO3GD9WhBHI8p
         jREmM32U+/Y1ICDVCcc66P4DI3x7jzT26rKBvhuHbboF58Zd4Ue2T4UD0Lmd5HsxFyUF
         aWi8U2q9F7HeBk3exijUSHxGtOHn/VukBEeJyq1PGk/SCjfcCxfpZPUoNAUqSdZGtRim
         HgNjHBdM5GqLiA5l5IhygMKufIs1aLG+nzciel8Xl1nGaE3dy6kXtvYugOH9O0XrUCuV
         ZMyg==
X-Gm-Message-State: AOAM5337Hs0x4mL2BsBS+eNNfcz42lsMdo9nrgTOWkWw4BEJkwrHJ/uY
        APtdDAY+LxnRHdpdBWd3Z4Q=
X-Google-Smtp-Source: ABdhPJzUKFqMKerARbdeozSVPlNcrSwBYqllzI6iiAxtsYmgl6N92DBgcw9iyU0dghLUf1JzNZZOTA==
X-Received: by 2002:adf:d0c7:: with SMTP id z7mr3158709wrh.236.1639758187785;
        Fri, 17 Dec 2021 08:23:07 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id j2sm2016322wms.3.2021.12.17.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:23:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] ARM: tegra: Default configuration changes for v5.17-rc1
Date:   Fri, 17 Dec 2021 17:22:53 +0100
Message-Id: <20211217162253.1801077-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217162253.1801077-1-thierry.reding@gmail.com>
References: <20211217162253.1801077-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm-defconfig

for you to fetch changes up to 8ed567fbea94ad05298d060974d5fa59946cf689:

  ARM: config: multi v7: Enable NVIDIA Tegra20 APB DMA driver (2021-12-16 15:03:33 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.17-rc1

These patches enable various drivers used by new and existing boards in
both the Tegra default configuration and the multi-v7 configuration.

----------------------------------------------------------------
Dmitry Osipenko (5):
      ARM: tegra_defconfig: Enable drivers wanted by Acer Chromebooks and ASUS tablets
      ARM: config: multi v7: Enable display drivers used by Tegra devices
      ARM: tegra_defconfig: Enable S/PDIF driver
      ARM: config: multi v7: Enable NVIDIA Tegra20 S/PDIF driver
      ARM: config: multi v7: Enable NVIDIA Tegra20 APB DMA driver

 arch/arm/configs/multi_v7_defconfig |  7 +++++++
 arch/arm/configs/tegra_defconfig    | 13 +++++++++++++
 2 files changed, 20 insertions(+)
