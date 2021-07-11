Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF9EC07E9C
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B8D761057
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhGKX6F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbhGKX6E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:58:04 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F057AC0613E5;
        Sun, 11 Jul 2021 16:55:16 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d15so1292278qte.13;
        Sun, 11 Jul 2021 16:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wx8pDvbbu5dTXlPECC46V6TUte+9Hhh+Y0wI3IGyQc0=;
        b=jkRr0DNqfGM8p4ZuzzTFVI5s7OUk97Ct4Vv0gCKoMCQuv5TGv6TOhQSuZp/BTqsDJb
         uM84YyU2lKoYCnPywBeArUoKvkalWk+ocfkG+rU/OeOPWpJQoXj5O7zMk9f4WqhltFwy
         pcnPAgMLG7hc53AeAw3aYwncrvgFaZ5xi3SyQ73R0cYBYrCzNYTdtYwZ2SAlAfCjlHr8
         4BdJvKxmRI9+T0lNERN0hWBwuM5E6l0PRT+Pgq/+5MQkTJq1mzXczuTWy4xy9sqVBJax
         mD1EH8VQsg+kdtIKzjAMK3eK7GJCWU6ceyW3YQS3Qt9LCZiRBMQMKBHRE/BvMZrin1pA
         Jb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wx8pDvbbu5dTXlPECC46V6TUte+9Hhh+Y0wI3IGyQc0=;
        b=QhVzsbOAjQpJPzx151PhPNF/2nNQbz0DsYwnnyykZUDkZTO+pkZPuQ5OhwIPD6uw2I
         bwoXcoUHX3rzinLoUz+/mfkM5VaXfOQ9jU96/kevg8/ZwZTOEr8lisTVVAMwxhz5rp4L
         0dhaGvrcvgkFD9ZCDVHEHd+zwyKmK7z7MCcB6HGgsyY5rvk6axPr3E+wv871vyH2Ndtx
         VY+FXJZvuBsJ6dFwimSRXsc+Fk5PpOKGnW87nrmN/hrLNcHB4CteDlocbr1CpFx6JZtg
         aG80aojNufRQgaTOmT6PaTxp8ZP0UtZvAZT2SHybH2nqNWAL1HRUm4iv1HttrUbBdyeb
         DY2Q==
X-Gm-Message-State: AOAM530RShTAPw5Wze0g174S3l0cgMuzoEGGMU9izgQHE9QRHnIjAlHZ
        KASmMkNWtgSeqFNFZJHWkkI=
X-Google-Smtp-Source: ABdhPJytKk7dI7Wh5FJz+B2A1p+FSQKbtbFOC+mJY3rpWa8usixhL6UilH+7n2MgFJmKS86q4rslcg==
X-Received: by 2002:ac8:4513:: with SMTP id q19mr33045687qtn.79.1626047716247;
        Sun, 11 Jul 2021 16:55:16 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id h10sm4963133qta.74.2021.07.11.16.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:55:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 5/5] ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR
Date:   Mon, 12 Jul 2021 02:54:35 +0300
Message-Id: <20210711235435.31165-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711235435.31165-1-digetx@gmail.com>
References: <20210711235435.31165-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable NVIDIA Tegra30 SoC thermal sensor driver in multi_v7_defconfig.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 65d1fede3825..739417c2acf8 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -525,6 +525,7 @@ CONFIG_BRCMSTB_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_ST_THERMAL_MEMMAP=y
 CONFIG_TEGRA_SOCTHERM=m
+CONFIG_TEGRA30_TSENSOR=m
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_DA9063_WATCHDOG=m
 CONFIG_XILINX_WATCHDOG=y
-- 
2.32.0

