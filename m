Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88342C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 18:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27FF920936
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 18:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrD16+4Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgIPSyh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbgIPR6D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:58:03 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D081DC02526F;
        Wed, 16 Sep 2020 05:23:21 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e7so5866441qtj.11;
        Wed, 16 Sep 2020 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4wPfQmQhf0NljYX+V0pyWs88eqATG0x9CyI9/ZzQY0=;
        b=UrD16+4ZGVjqAOCUEP3SztgNMTfkfYV48g797TFORwMqRQKhFfL7bvC0TujD+q1bHi
         QmGFHcsHtuVsQq+P8Q3+caTRG5sovVxjxqjx+QwZ59hJeAZGYmi76/VUf7af8kkisLBK
         Yv2zDs+toOhfEDtL789wOoFSR8hYkEMjBbSvJwqq8xV2Qv8WdYWRy+UbMiTgXdZVzoPz
         t8d9bw8y1O6lixH4fdwgqz+l4itVoeM6fBgC8h5tyEQjmHxQIDle2VWyfxcxsr7fxHrV
         0pNflCzHF1XlLb4Z5RpzXLAuXjxz6DbXtKWjAvfmYjCwggVb6XQASYYvso+Y/ST3QfcC
         kP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4wPfQmQhf0NljYX+V0pyWs88eqATG0x9CyI9/ZzQY0=;
        b=Lw8ANrW6kZS+1+wVBy+52Vv+Qdt3p3aP+OMuXppaNHARaUrjaJ/GvLlrWAfAbM/EGz
         GsKJYNwfnRyVYAPUeOIIrH0i6Ib9DdBxK0yhAo3N7pVKGek5YpJ/0/oR3M0x8PPAy+nx
         3Wc4FQojPiIoV7lwurbZXHrMIrKcvtMDV5KHNuJV+/Qr0g3gS9F2xkiAVLlSDhBPmOuD
         kDvos5w5pTQhlKxlS/8rxFUyKLB58hvWr/ds7C/HEd46crvTmFhpvBWCq9bxoKrfVEQ2
         hCJeHA/jKMfuR00F7sWF6Dd84hZTiSyfbQUbrg3iDbazd03grE0RHoK2GiwLcllSsccB
         mF1A==
X-Gm-Message-State: AOAM531vGDCLZaA8rLEmuvGiXTvuvQL+QASwR93mfT0OjDiP1JWd2E8S
        zAGW04zQTcxlrU0A4o1w5X8=
X-Google-Smtp-Source: ABdhPJyYFHM98y3t4bvelmErVTC+bzmtmK5S7QI0UYB/iUZVijInyy/6WwWg0jYRBUl0iwYVRGFrhQ==
X-Received: by 2002:ac8:6e84:: with SMTP id c4mr10320947qtv.118.1600259000895;
        Wed, 16 Sep 2020 05:23:20 -0700 (PDT)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id v30sm19916177qtj.52.2020.09.16.05.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:23:20 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 0/3] Support NVIDIA Tegra-based Ouya game console
Date:   Wed, 16 Sep 2020 12:22:44 +0000
Message-Id: <20200916122247.534374-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Good Day,

This series introduces upstream kernel support for the Ouya game console device. Please review and apply. Thank you in advance.

Peter Geis (3):
  ARM: tegra: Add device-tree for Ouya
  dt-bindings: Add vendor prefix for Ouya Inc.
  dt-bindings: ARM: tegra: Add Ouya game console

 .../devicetree/bindings/arm/tegra.yaml        |    3 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm/boot/dts/Makefile                    |    3 +-
 arch/arm/boot/dts/tegra30-ouya.dts            | 4498 +++++++++++++++++
 4 files changed, 4505 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts

-- 
2.25.1

