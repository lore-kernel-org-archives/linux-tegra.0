Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9E6C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C891761139
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhEJU3M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 16:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhEJU3L (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 16:29:11 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C17FC06175F;
        Mon, 10 May 2021 13:28:06 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s25so22427726lji.0;
        Mon, 10 May 2021 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvCKDuoh7Ut5LViCmioeh1xP+tKlLaTTAz7jCis1p0k=;
        b=fGfhgg45MW7Qf5/0gjCOwEnfIW9xhHj+iADjp17D8RoiXdGtnammMqBccDHPFe8qZf
         Q9nME9uEBATKiJANk/K4/+VLb/aMBItVaZGRoHLasrHMFUsgTYVhsTfNqcMzTkry+bdX
         3DRPhWDiY8uNPXOGzUF4H0qATD4duMKpzoH9PTL7GJ8iyGlK3NRoz1E0BjLo18TAEiqH
         tvAScgt/7QIjK7+YazF/sKfpucnr4KgX88HxlyZRuwP36cfmU5AYO1tIZVZhghWrC6h/
         9brpP/xmqMbsduBmGqe48De/TDRNziVPDbU/X7rtc+L5WmsBF5aSKgZHQuNweSajTGNj
         /i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvCKDuoh7Ut5LViCmioeh1xP+tKlLaTTAz7jCis1p0k=;
        b=Lpn6YvD59Y/wqM3s7mhzq1VmjnCIW8n/IAI6jTYmGa5ORqHMF8lITSCSkqmtGaOZ37
         t2hEF+4b77pgc9scCkXZxlSmeyFmA7iFsQKdIFAQGZX52ekuqQ/yUeyVjA//OfQfYux/
         lIxe+dU5iHlfNOzioP4r+X4Uj1rjPhl9KW+ARqCLofIBN/pBYlLg1KJc+cAUMQ9FfcoT
         MBdzdQM4DySUh91cp42AkobQ+CRIotynCsLzShj+/tZ1xgURd3l6R1kB2bjHMSN09Ao9
         1KI3deKDa1LwoLWcXNoMV3pTcEkL3jwozArRCqROjqsJa5U4bA4F5AJjSy1EsQqb2juZ
         PQVg==
X-Gm-Message-State: AOAM530QVQ1amr1+cPoPlJ3+vrRQ0aCIA9y2sv9KCQowb1TWWOwrlZuL
        HY685RykyyYP9oUiS0FyC83cEpUdzME=
X-Google-Smtp-Source: ABdhPJxe8Qy8kEhv6DdjklUPIMT4qRI23gQWg9Yh4x4nNPQD4bQ5ca9joFAAddUM4notE/59TiUR+w==
X-Received: by 2002:a2e:8015:: with SMTP id j21mr21678749ljg.425.1620678484759;
        Mon, 10 May 2021 13:28:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id z23sm2360662lfq.241.2021.05.10.13.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:28:04 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/10] ARM: tegra: acer-a500: Improve microphone detection
Date:   Mon, 10 May 2021 23:25:51 +0300
Message-Id: <20210510202600.12156-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510202600.12156-1-digetx@gmail.com>
References: <20210510202600.12156-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use edge-triggered interrupt and set delay to 100ms for microphone hook
detection. This doesn't fix any known problems, but there is a smaller
chance to miss insertion of the microphone now, which previously happened
rarely.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 2298fc034183..d7d97b7e4794 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -420,11 +420,14 @@ wm8903: audio-codec@1a {
 			reg = <0x1a>;
 
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_EDGE_BOTH>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
 
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+
 			gpio-cfg = <
 				0x0000 /* MIC_LR_OUT#    GPIO, output, low */
 				0x0000 /* FM2018-enable  GPIO, output, low */
-- 
2.30.2

