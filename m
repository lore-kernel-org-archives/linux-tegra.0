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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2262C43460
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A89161482
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbhEJU3O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 16:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhEJU3M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 16:29:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52C0C061760;
        Mon, 10 May 2021 13:28:06 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z9so25279375lfu.8;
        Mon, 10 May 2021 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzSDSsYVLWx4cGGNYAhBY9AP+8XYtLc+owqpUZsYqN8=;
        b=C7/ddeYTBjUVzdQd/5oKcpt/4+T0QwpcMc49V1xEnOxnBG6EiJLyysN1dWBu1bLfR3
         fzg//NLmkEdPPVXSsmwg9BQ3X+3cqgUbMk0gByizf2DmfYH+9AW2vbcSw6gpZwDvcVtJ
         QAnawIgcKMy7Mla4HjaZQLd2whbSX9049sfFg3jFT1CsvdMdjxt5Vvmk76pED2Ykqk/6
         /5I8yWWEAtEB/xH9kuJqlk9nA7gaqbQwfUY3KP8fQQvoSwXtpMWsc8D0OrQjHFtcNinu
         LOk8bSDITw+vkCmm3kZC3uZHUNmhVA8CmerrkRrDSE68yMn/I3p/JTl2NzjjMdjo9qFw
         eekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzSDSsYVLWx4cGGNYAhBY9AP+8XYtLc+owqpUZsYqN8=;
        b=d30MVuO0ctkzdZq9HR0aR2ytNxrFavYgiJ3hrREtbvUbypHrIUohRCmgrcAcs+r9D+
         kS9waePR28VmOF2VLvFQYyDXe/1VePAIRO9hm54Ypxxvie2VXWqnDJ6vjbmwILQThmxu
         xlvngU27Wc3LOcjmWn0/v/6ulzOaU3LuxgEpA96uBw43AMfudf4poqw3XPb/5DXcKXn3
         qRjAFpx4L78lYOwO/7io4pyCxI/GMvXStSLIERw1+zSIR4yLwjN5TWcr+zWQyYep+6a5
         DoaoLJ0Rqd63WFDPkbkE54Rd+02zBGdzodWLXbDQxcHESzhYmCiAYAP+G/mWwCqqyjPV
         pfkA==
X-Gm-Message-State: AOAM533QylonVFVv5UAvGaNi2FZtzq4nKqAO4R0uQJGirt4UZ4Aqusmh
        14z+lfn2E+sURrw0/Xa5dAs=
X-Google-Smtp-Source: ABdhPJxbl0aRe+Z0RRQUrWK1K+uobWYX1Rp4Uiw6Wz9L8m+wGCJ1g62ZyiT3A94JkoJni2/MyJ0acQ==
X-Received: by 2002:ac2:5d4c:: with SMTP id w12mr8802665lfd.494.1620678485362;
        Mon, 10 May 2021 13:28:05 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id z23sm2360662lfq.241.2021.05.10.13.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:28:05 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/10] ARM: tegra: acer-a500: Specify proper voltage for WiFi SDIO bus
Date:   Mon, 10 May 2021 23:25:52 +0300
Message-Id: <20210510202600.12156-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510202600.12156-1-digetx@gmail.com>
References: <20210510202600.12156-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20 has v2.00 SDMMC controller which doesn't support voltage
switching and the WiFi SDIO bus voltage is fixed to 1.8v in accordance
to the board's schematics, while MMC core confusingly saying that it's
3.3v because of the v2.00. Let's correct the voltage in the device-tree
just for consistency. This is a minor improvement which doesn't fix any
problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index d7d97b7e4794..eff9bfb2d442 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -762,7 +762,7 @@ sdmmc1: mmc@c8000000 {
 
 		mmc-pwrseq = <&brcm_wifi_pwrseq>;
 		vmmc-supply = <&vdd_3v3_sys>;
-		vqmmc-supply = <&vdd_3v3_sys>;
+		vqmmc-supply = <&vdd_1v8_sys>;
 
 		/* Azurewave AW-NH611 BCM4329 */
 		wifi@1 {
-- 
2.30.2

