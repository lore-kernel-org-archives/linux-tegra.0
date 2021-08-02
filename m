Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BEFC4338F
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1207660F58
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhHBVUw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232922AbhHBVUv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:51 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E218C061760;
        Mon,  2 Aug 2021 14:20:41 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z2so36253090lft.1;
        Mon, 02 Aug 2021 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PNowlSwvcTS9bTIRnCm1vrvIMba1oVNTEUtUuES2GQQ=;
        b=sRCHZ0ArBXIoa3D8bAp9prTPHQdfZDWHgEHeALQfUvskkxkJJLEMh+MvhprHcK9es7
         sj4x2OyNTgW8BiN3wqSGQhiv4YEyaFxvXtsSgrb60nLveYrGdmY6Da4oTTX5DObj9hcb
         aEfPkXT3Tke98/RfY+bzJZn3Wv7L12wb3MG/RH64dXWarJaEDgdZHwGT8DREvzJ37tHq
         tYsxiac3qDw0TQ/rGrUMEjEe0YO9f2W15M/ZQJufy6dZC76KRAyZ7Q+XGr3h4YMTwXuy
         5qR0jLeWZOni8lAdVkcpEY9/FM/FROFOZeavgqLTzz6Mgz0NCnk25hViv02V2wyVaNCv
         WlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PNowlSwvcTS9bTIRnCm1vrvIMba1oVNTEUtUuES2GQQ=;
        b=kDDFdKevbPjLLJxOWtzZ3Z0IodAz9LzHTRZHZWHhalhoH+rbxC4pGsy0vgLr++FHWy
         6FggKyrm34AEFkR1teHbTmznbCeqmyWHJvYBb4pe/SDIzNWn3pEAYYw47xV07vis66p9
         N1W2hY6V1hdoi1tb7QeL7AA7JphDMmLphbr3csUOEzd85YoJtb92XFKv+7KILCljQoQ3
         o3Hb4rkYG/PEaKnmeemb1id0zPSs/yFfnz4TD80u93MUBLiKxt7NRf7tqIH5gyX27so4
         jyVNLs/KRMWPLicXzfmq+ZRp8Jqc3Bn7WUvqLrbi3CQ79d7M6HNQfwI6wDLLTilNxNU+
         AcTQ==
X-Gm-Message-State: AOAM531IjbIM9FoSzuWZZrG92q8TMPx3PXVIhm2KTbtttxqiYvSvdzZC
        7xWGP7kM39ggiz7Dpss3DQg=
X-Google-Smtp-Source: ABdhPJxl30iKXPG6CLeA3RpH+oWKOSEY8IiNqyoyuJhYBBwb8YJwpzde7cedt2IJcdP65qRk3HkBKg==
X-Received: by 2002:a05:6512:2102:: with SMTP id q2mr13297603lfr.174.1627939239555;
        Mon, 02 Aug 2021 14:20:39 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 06/15] ARM: tegra: nyan: Correct interrupt trigger type of temperature sensor
Date:   Tue,  3 Aug 2021 00:19:38 +0300
Message-Id: <20210802211947.19715-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The LM90 temperature sensor should use edge-triggered interrupt because
LM90 hardware doesn't deassert interrupt line until temperature is back
to normal state, which results in interrupt storm. Correct the interrupt
trigger type.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 5f71add38dfe..63a81270300a 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -91,7 +91,7 @@ temperature-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_EDGE_FALLING>;
 
 			#thermal-sensor-cells = <1>;
 		};
-- 
2.32.0

