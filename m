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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E7BC43616
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C28B61480
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhEJU3S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 16:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbhEJU3R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 16:29:17 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFF3C06175F;
        Mon, 10 May 2021 13:28:11 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s25so22428029lji.0;
        Mon, 10 May 2021 13:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gWYgsFPOkk0K+2Nq3gcnHzT4dJuPmMb5gXo5UDkYFdo=;
        b=PQbkyk0ELYuLXZqOqb+VuwULM784Fn5PdC0Ty/rTTqks6dNraYmQO941sExSD8xmVm
         Bh3AM1S7ehtbaK8exIO6sJti7Km59h7I4JsSYAq1xHsalaNorCNFsYtdtgM15todkEbJ
         C3hlrqHw8tUIWuPB0GhOT0Bvg4ErpWxjQ+I+bdnnxD31W1HGrOuqAshBgUFZ38lLUbUU
         YZFlr0nGPioQUDRUEhTphe0RD+Eq00guRNQpmKmjLkwRJru4227MROEJ3qXhS8b2aVvo
         aHvXGXS444T7VCtmBcBojjE17c0LbFUsPMmiX0pp3oaflsG2B3J5ZV0ooqSEq11GIrJY
         yWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWYgsFPOkk0K+2Nq3gcnHzT4dJuPmMb5gXo5UDkYFdo=;
        b=TAxbZiie/24V655adiVkbVXG8syQgbhI/mXetZ7zIsSnSIRRHcu7iv5O3N6qi+JdCZ
         TtA+yY81WqjKadrG9y1/EvRFGcZg2AvPpDi/KC7/bipU+NSAgN1BtfbYTh+7kJ3T31di
         vsfK/lhoSCVVhySVhno9wn8cMxJDij2tv+yMSfEmJJ29fI9hUsSyjijRGKof2VZPO1T0
         yXY9kpak7ygIMJ5J85DU0RjkiBjT9txAVdxRm3ss21doTYdbh/3jTOfJSav9NH+dNm8J
         3ztNL2h37D4QA4ppHPn5QFZ/BH2DhYyHxYWiR+tXxlBw6XPCGDZe0LDjbtTGv6w9APPL
         ubWA==
X-Gm-Message-State: AOAM532m8bGQCTDZ2RSvIA7iTozkVKZFSSSAYRSeZJvpXDwDI3DAjJHP
        16qNzNZzbAr8iQohD7SEcLk=
X-Google-Smtp-Source: ABdhPJz2OayCM5ONyqUhoCRDlwMJ5/4mvLr0mADvXZJx8YxybSttlshpPH0AwjCZFpptn0jIsoLpLQ==
X-Received: by 2002:a2e:bf09:: with SMTP id c9mr21265961ljr.419.1620678489810;
        Mon, 10 May 2021 13:28:09 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id z23sm2360662lfq.241.2021.05.10.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:28:09 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/10] ARM: tegra: nexus7: Remove monitored-battery property
Date:   Mon, 10 May 2021 23:25:59 +0300
Message-Id: <20210510202600.12156-10-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510202600.12156-1-digetx@gmail.com>
References: <20210510202600.12156-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The bq27541 Linux kernel driver will try to reprogram controller based
on the values from monitored-battery node, but it fails to do so because
controller was locked by manufacturer. Still this is a very undesirable
behaviour, hence let's remove the optional battery node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 3376d06facbb..c6264738f593 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -927,7 +927,6 @@ fuel-gauge@55 {
 			compatible = "ti,bq27541";
 			reg = <0x55>;
 			power-supplies = <&power_supply>;
-			monitored-battery = <&battery_cell>;
 		};
 
 		power_supply: charger@6a {
-- 
2.30.2

