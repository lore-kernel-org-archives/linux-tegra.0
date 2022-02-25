Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E9EC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Feb 2022 16:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239133AbiBYQs2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Feb 2022 11:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239760AbiBYQs0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Feb 2022 11:48:26 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7E9151C55
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:47:52 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id d14-20020a05600c34ce00b0037bf4d14dc7so2035382wmq.3
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hD6FBWW8TGRI8bjBMq/DwmPzCMaP/5KqoNaN3Rmzc0Y=;
        b=jCmpHJkDeIl4puqOnr5hqJxhlhlNFaWx6qnqfi24+aD3EtRJUE9iWGzKchTfXvq9Qi
         Jw4mPnhkKmrIryrnCgsFyN+94gXB4GtClp5UQ4XL/k7TKPE6715AJfg/QLeNKa3h0ggI
         fBTIAeG25i18M+nufmN++VTYenugmAWgfg98a2LWqCACenzY04H3yI340Bd6DJHmn0U9
         aiACJxEvWi86/lBs+flIiWLNmdMTshRLeb1+vZDnuxXOgQTz+vNdbV2A3mC9CrTB41Sq
         h9y6w4NtUW5tk0woyQmNea0aPpavwSNRUR9xn8OnLSMO4lp4YAfeLETbHO90BTH3N+tc
         Sxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hD6FBWW8TGRI8bjBMq/DwmPzCMaP/5KqoNaN3Rmzc0Y=;
        b=IEyszJK1DL3aKDbdgs4IXOPqxlmzX0CRr1n5/OTUiLL5+FTEtFvyhTGvOAcfV4w01I
         mNooR3ZXeqN+CCujNtHef0LEOJECYjuw6TMiB9EgBR46DNOQAPdvswD9V9t/0HyI7lYZ
         fV0RFYl4nYMVqTGqXUJVbdw/LE+PimgUkyksw+dCsptc/BQev5K35pbC1h6NaQR8gI2N
         2H0gFtb3chzhq3MBzqGZdJ+CKODFAXlY94J0Gc4OzMNLUTAowsrWVWvmVZlmlBvcxwm3
         8fmo8GkqMLx5GOoa+8nM/OU5aW1htvUYVyo6WXAblU/41vXOcIDpVhorzT8OXglrabFv
         S5pg==
X-Gm-Message-State: AOAM531LVnv2nOwe9f60OvRVpABxTGkjVKVoeHyOkXIsUaoxa6GxasX+
        wxIKZO48GNUQRbuR+bvae6k=
X-Google-Smtp-Source: ABdhPJyq9w7VYOXIV9r07iuX+c4nUNhw0Aeaeu0MikSM9rcLfa/L9+DiMsbIZEu367xMdWs+c0waeA==
X-Received: by 2002:a05:600c:6c5:b0:380:dda2:d562 with SMTP id b5-20020a05600c06c500b00380dda2d562mr3550075wmn.138.1645807670826;
        Fri, 25 Feb 2022 08:47:50 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c154a00b0037bbbc15ca7sm11923928wmg.36.2022.02.25.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:49 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] ARM: tegra: Device tree changes for v5.18-rc1
Date:   Fri, 25 Feb 2022 17:47:39 +0100
Message-Id: <20220225164741.1064416-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-arm-dt

for you to fetch changes up to 0092c25b541a5422d7e71892a13c55ee91abc34b:

  ARM: tegra: tamonten: Fix I2C3 pad setting (2022-02-25 14:45:43 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.18-rc1

The changes in this set are cleanups and fixes for 32-bit Tegra device
tree files. With these, some json-schema validation errors are fixed.

----------------------------------------------------------------
Dmitry Osipenko (3):
      ARM: tegra: asus-tf101: Enable S/PDIF and HDMI audio
      ARM: tegra: tf700t: Rename DSI node
      ARM: tegra: paz00: Add MMC aliases

Julius Werner (1):
      ARM: tegra: Update jedec,lpddr2 revision-id binding

Oleksij Rempel (1):
      ARM: tegra: Fix ethernet node names

Richard Leitner (1):
      ARM: tegra: tamonten: Fix I2C3 pad setting

Svyatoslav Ryhel (1):
      ARM: tegra: transformer: Drop reg-shift for Tegra HS UART

 arch/arm/boot/dts/tegra20-asus-tf101.dts               | 12 +++++++++++-
 arch/arm/boot/dts/tegra20-colibri.dtsi                 |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                    |  6 ++++--
 arch/arm/boot/dts/tegra20-tamonten.dtsi                |  6 +++---
 arch/arm/boot/dts/tegra30-asus-tf700t.dts              |  2 +-
 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi |  2 ++
 arch/arm/boot/dts/tegra30-colibri.dtsi                 |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                     |  2 +-
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts         |  2 ++
 9 files changed, 26 insertions(+), 10 deletions(-)
