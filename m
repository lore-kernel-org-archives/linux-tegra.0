Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_NONE,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3FDC433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7936A61139
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhEJU3M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 16:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbhEJU3L (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 16:29:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D843C061574;
        Mon, 10 May 2021 13:28:05 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m11so8871010lfg.3;
        Mon, 10 May 2021 13:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bVy+Wng+Or641wG/f1scEbi4eyzqkPKBYfA0bhNiIlc=;
        b=YCDIF2wHH8+u+RFFjreIB0KnUxzOpT1HTdCRGtoLKu7iFxn9lma47Chv+hTTnv/nsB
         Owxp6uV5257ui0GVA0kl98NZYhwVFO0CAYF7tqsWVQAtdsZWNdnqPxmQwRqdmKGOmcST
         fYWWtuaRZmUzsQXzFmjnWSc5E3u15MeIoCSfdba7/sHJOLA5Xd00jD4MWyuSnCp4AhoI
         uU3IX6vBVHQOaO539xAmuWZXnuEXtWnxpgeSZCDuLLndayYcSEpQAV7QFFxMFsWss3Sj
         3QDw343/z5d7+tn63s66193WwIPIJq69vjLdNu5FpBIq12W0XYLW0/KwIY/iD5dmVecH
         Q5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bVy+Wng+Or641wG/f1scEbi4eyzqkPKBYfA0bhNiIlc=;
        b=sruhLPe9f/HwKUn2sn0mm3MHFjX6sYrJRkNLagOs85eCWnH5RB9lB7qplUsl2VXFVh
         krGuMZFEWc2Akqe62PwqYQ9VXPlPrVuABG7/XMUdoY5PWO5dtO7fSoCc+Boi2WBHVgKH
         /JNMGw/0UOdWGHpuuALVRZCIeoRit1HUiKIv5X68q+5yQ9qrzeZrEEriitRYFM8Z/4K6
         7mka0uIM3XONnbzB3iezI8y/8COIuOSzsJRESjGPp/L2SODSRxMLPOB9xMY0n9uu+LIy
         o/NoQzY289shoz13+NQrX0bj/QzV8pIaIF75jaCvVNtDRos2Oh79Kj7dXCl0hSwfvKBg
         hKLg==
X-Gm-Message-State: AOAM531+newXbJxqgOlU/rux2tiMJBwkYyCJwm/vN8vQamCW1zaHJXIy
        cfL57r2L/fk5T7A5HnQTCY37o/T6TPA=
X-Google-Smtp-Source: ABdhPJwuU9a0Q6Y/bHeMhjPj1COzXDLl4Nq7+dtHMC4vR9tVCYy6Vnd9d0Z8o9G8jt0vUCxcY0+DeQ==
X-Received: by 2002:ac2:5979:: with SMTP id h25mr18144406lfp.297.1620678483931;
        Mon, 10 May 2021 13:28:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id z23sm2360662lfq.241.2021.05.10.13.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:28:03 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/10] NVIDIA Tegra ARM32 device-tree improvements for 5.14
Date:   Mon, 10 May 2021 23:25:50 +0300
Message-Id: <20210510202600.12156-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series brings couple corrections and improvements to the device-trees
of Acer A500, AC100 and Nexus 7 devices. It also corrects polarity of
headphones-detection GPIO in all Tegra device-trees that use WM8903 audio
codec.

Dmitry Osipenko (10):
  ARM: tegra: acer-a500: Improve microphone detection
  ARM: tegra: acer-a500: Specify proper voltage for WiFi SDIO bus
  ARM: tegra: acer-a500: Bump thermal trips by 10C
  ARM: tegra: Add reg property to Tegra20 EMC table device-tree nodes
  ARM: tegra: wm8903: Fix polarity of headphones-detection GPIO in
    device-trees
  ARM: tegra: paz00: Add CPU thermal zone
  ARM: tegra: nexus7: Add i2c-thermtrip node
  ARM: tegra: nexus7: Improve thermal zones
  ARM: tegra: nexus7: Remove monitored-battery property
  ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant

 .../boot/dts/tegra20-acer-a500-picasso.dts    | 21 ++++++---
 arch/arm/boot/dts/tegra20-harmony.dts         |  2 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts     |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts           | 43 ++++++++++++++++++-
 arch/arm/boot/dts/tegra20-plutux.dts          |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts        |  2 +-
 arch/arm/boot/dts/tegra20-tec.dts             |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts         |  2 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 12 +-----
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  9 ++++
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  | 11 ++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |  2 +-
 12 files changed, 83 insertions(+), 27 deletions(-)

-- 
2.30.2

