Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9796C07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A162960FE6
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhGKXrW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhGKXrW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:22 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4785C0613DD;
        Sun, 11 Jul 2021 16:44:34 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id a6so16240242qka.4;
        Sun, 11 Jul 2021 16:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dT2rznG8+FNKAzNmailx5hWz/y69Nu1aZdBmqBWLa+8=;
        b=uDVO3NRG80yF6HB1qsls7uukms/Tg4hA/pbbUNAVxvSh66dWbZi9dX83Q+UGVxVFsD
         6YdNP1OHMMxFXtRjrrvLtc2zTKR7+SGfsPf1T+uO5CEkLOlIdTXwNVmpzuOH6DTLatM4
         D7J8K8WYEByTKCbp5OpjJbMNSD4KqIZJzl1v2HdwQoLAV6meBnshfUvFu09cDBbzW9cW
         Hj0CTZS9iPJGDhfa2S7Z+okJB67l74dbbRjN0foF6H8sWxYI/IcebiNQ+JEOtpRiwOjO
         ALA9vfzve+wutpv0CSRG2uUDFgtcRyhnVuuxfwExdxnrlvLlLGjO/8GC1rahZSspS6/8
         +vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dT2rznG8+FNKAzNmailx5hWz/y69Nu1aZdBmqBWLa+8=;
        b=A9e+KX8QI3fjqnNloAYpW5srsLNVW+b+mv8V0DmHkJxdzyjv24SHDKlPDGQnXCzhPg
         PfWM16IwFNuPTsSEdcutzHZNb2C/C2FlBDDczWU4c/ZKXiesKoMDCnIUIbmuKcewNJhQ
         ZSmB0XzOcWFrurlRukFnQamnHcNxZv1PHwmHadxaKoTIRpsDJoudJD7im3Q3yFznuKJO
         ywwi08cqiZnaDp4CD1Brs0IMrF1KY2AnaGyeGhtfpUMB//gg2wr+FVoEfuNd9V8shF6i
         k4eXymcCdRonwYmKF9IjPPRAlu4eMbLcHUKDJwznj8U+tCYDWLdqOHAbT0PKuTWLB3Sv
         LETw==
X-Gm-Message-State: AOAM530MPQicn29bgnwNyNXXEsz5NSTQlhkNIT97712INRLADTDaE49j
        l1tjPOkOsOdzOZrA9/o9Avc=
X-Google-Smtp-Source: ABdhPJyK8kSt1AYgWtmz003nSG3PBEgZ2QlEj3nEV/+Yf0KihD7Q93gFt4WlXm6OorhXNJZtshYOuQ==
X-Received: by 2002:a37:58b:: with SMTP id 133mr8772140qkf.125.1626047072595;
        Sun, 11 Jul 2021 16:44:32 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 00/13] Tegra ARM32 device-tree improvements for 5.15
Date:   Mon, 12 Jul 2021 02:43:50 +0300
Message-Id: <20210711234403.24691-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series:

  - adds SoC thermal sensor node
  - adds interrupt for LM90 to Ouya, AC100, Nexus 7 and A500 devices
  - fixes interrupt of LM90 sensor for all boards
  - removes bogus VBUS regulators from A500 device-tree
  - improves thermal zones of Nexus 7 and A500 devices based on previous
    discussion with Daniel Lezcano [1]

[1] https://lore.kernel.org/lkml/1abadc69-1dd1-5939-c089-37a84be4781b@linaro.org/

Dmitry Osipenko (13):
  ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
  ARM: tegra: ouya: Add interrupt to temperature sensor node
  ARM: tegra: paz00: Add interrupt to temperature sensor node
  ARM: tegra: nexus7: Add interrupt to temperature sensor node
  ARM: tegra: acer-a500: Add interrupt to temperature sensor node
  ARM: tegra: nyan: Correct interrupt trigger type of temperature sensor
  ARM: tegra: apalis: Correct interrupt trigger type of temperature
    sensor
  ARM: tegra: cardhu: Correct interrupt trigger type of temperature
    sensor
  ARM: tegra: dalmore: Correct interrupt trigger type of temperature
    sensor
  ARM: tegra: jetson-tk1: Correct interrupt trigger type of temperature
    sensor
  ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
  ARM: tegra: acer-a500: Improve thermal zones
  ARM: tegra: nexus7: Improve thermal zones

 arch/arm/boot/dts/tegra114-dalmore.dts        |  2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi   |  2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi        |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     |  2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi          |  2 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 84 +++++++++++-------
 arch/arm/boot/dts/tegra20-paz00.dts           |  4 +
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 60 ++++++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts            | 13 ++-
 arch/arm/boot/dts/tegra30.dtsi                | 87 ++++++++++++++++++-
 11 files changed, 206 insertions(+), 54 deletions(-)

-- 
2.32.0

