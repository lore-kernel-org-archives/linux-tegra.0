Return-Path: <SRS0=Zq/d=DL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A720C4363C
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 13:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B4842067C
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 13:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1b5oPyW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgJDNb3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Oct 2020 09:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgJDNb3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 09:31:29 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F992C0613CE;
        Sun,  4 Oct 2020 06:31:29 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id g3so6969647qtq.10;
        Sun, 04 Oct 2020 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=76X2wOUe1++tZdLKSuX2TROPe7EjCfnrV/klaIqdHQw=;
        b=e1b5oPyWndeeMcgIXjg2PHNzK3BldkWXd++8+luAmxtfryNEQzwtytdjPXWTjo+Aow
         VfvoKfqd/B1E0ojIYbgttVYUETLfZ8wDjM8qVs9NWj9z81YOZAzFJTYaNLVA9nty7L4H
         ot/EFwFMYm7z9z+z7SqflJH3iPRYB/co/tcQvirdKRI0x/MeBHx6+fjaSUns6CNPlES4
         RhDPRZXaytJSDKGchkV2ax5h04xz/1VZQ5jYWmV6fNBwwx6BhjJ4g/R9RDBRe9Tr2eyt
         fwrsg6p+o2Sw2WsXfhPdUj/HPoiDR7RFnzU/BbV9sZvuB/qficmaCI+HToH3EGApR89L
         HxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=76X2wOUe1++tZdLKSuX2TROPe7EjCfnrV/klaIqdHQw=;
        b=gm5BLrhCgW4QFj0EYoe2+CvngK09M7ISEpPmJ+/u2815vy7vgdhSc3Sh1FEji9VNXk
         VGFzOJxUoyxo53xmAHVzQ4H1goiczXeaT4UzdSF6dAS2CLBnDqon3D/DISFPfBX6g4Dx
         QVQJnmsEHpX0AW/WCN0HkFqXMPK/w4KUyzW/A6ZCLGL80yrVH5sdRUgUmuUau6CmTGwS
         gJftChcZaiJJxvFzbxasyY+Pn7tLzA58TA4k83a1B4FlJwCLpCzHDxPqNo7ID3A+MeYS
         mAL6YhCOEvSP1B6zQ372Mm/IrN1znChADciqgVwt08oDVkOOEEwZhL2IlSomAtWGC4jD
         92RA==
X-Gm-Message-State: AOAM530NTeoJpqNrNF8tBzzfk7JbbydjItKCS/zBat0rhjzrIDGfpYr7
        uYgV3dPYIgHv3agfIZpqlu8=
X-Google-Smtp-Source: ABdhPJzn+cEdvbCZZYDxsJM7oU3f0O9LgW79jrWaHFqm51OsDyskgmMja0sDJZjWSxx9sMSvOmtwow==
X-Received: by 2002:ac8:4245:: with SMTP id r5mr10109777qtm.52.1601818288479;
        Sun, 04 Oct 2020 06:31:28 -0700 (PDT)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id b9sm5539369qta.39.2020.10.04.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 06:31:27 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
Date:   Sun,  4 Oct 2020 13:31:11 +0000
Message-Id: <20201004133114.845230-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Good Day,

This series introduces upstream kernel support for the Ouya game console device. Please review and apply. Thank you in advance.

Changelog:
v3: - Reorder aliases per Dmitry Osipenko's review.
    - Add sdio clocks per Dmitry Osipenko's review.
    - Add missing ti sleep bits per Dmitry Osipenko's review.
    - Enable lp1 sleep mode.
    - Fix bluetooth comment and add missing power supplies.

v2: - Update pmic and clock handles per Rob Herring's review.
    - Add acks from Rob Herring to patch 2 and 3.

Peter Geis (3):
  ARM: tegra: Add device-tree for Ouya
  dt-bindings: Add vendor prefix for Ouya Inc.
  dt-bindings: ARM: tegra: Add Ouya game console

 .../devicetree/bindings/arm/tegra.yaml        |    3 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm/boot/dts/Makefile                    |    3 +-
 arch/arm/boot/dts/tegra30-ouya.dts            | 4511 +++++++++++++++++
 4 files changed, 4518 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts

-- 
2.25.1

