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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647A5C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BD6323B01
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731049AbhAVUaG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730998AbhAVU2e (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:34 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401CAC061A2E;
        Fri, 22 Jan 2021 12:25:16 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b26so9277053lff.9;
        Fri, 22 Jan 2021 12:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YaUct1vLa7CUCMQj1vBwX5+PDe09kdgx2eO2LPTaVhg=;
        b=Yrj8eepBTkvQ+ORQ5EHBMlqX78YLVGByjffzMy7c5E6ONKwUZ1V57GkQrIc44KlOux
         nPA3VnkZiFiEa/IXfnF2GLKN4QryBr/7o8HIMX96bP/EjQ0Hk7MZOxtZKXbYyIQH4vDM
         pQ2htyuXz4U/LizU/tyVu6gim6uMsyXNpz4pT+bMdh+3ht9f66Eq9DzYzZyiBEjpA910
         6Lo+OuhG6SCVjWUPkyI0T5GdCEBXgkUZ5zFkKOU0/lumozSE9OE7uXUkCeFs79zIBdw/
         StuHp0gZp7LtAo5VbXOKchtUHML/Bx52iHzTecLz3za+EUdvcFpOr5UkWO+Qs+02M9zy
         vGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YaUct1vLa7CUCMQj1vBwX5+PDe09kdgx2eO2LPTaVhg=;
        b=KQwvHWyLShLHz+8mKO/24w5YzhhOA6OU+YChUJMbpYPxUvqPoMXF7rZ7K70vRYWNsT
         H2jC4gAIeGJ6hVTJET1AgCUuYFlDi0noM4/7PUgY82N+RQuOK5VUpYquRly0IXai+nOQ
         1GuDCq+yiKaccJMDuxzppo7QypqyZhQAJPO0ETxkgQsQok0LAqhP0kHHK90DCcp6cMjF
         vum2RAz6XQkfRzQDmeh1E4zcLvEE73oD42BFYA3p6ExIyvO3k+aBTOELTKEWTw5xq1TP
         42pqc5ubWnXDiLPBw1YpCSM97TWvskWi7btQsfF0dMcIsqAg9cDYQKmYMtn2wdlQei42
         ANsw==
X-Gm-Message-State: AOAM532jToxV9E81kraY4GEMPGRCeIu+oz83aimUM5EeiYAJMnA8OG+c
        DiEw+H0Zy/rwtwpeC67dXR8=
X-Google-Smtp-Source: ABdhPJx9aa/QHYafeLsqG+hjKanmiN14MxCG9Zs4qBitxZjsOUkfeqUM2Pi/0OCKcRUENef7HiDBKQ==
X-Received: by 2002:ac2:4852:: with SMTP id 18mr28889lfy.230.1611347114858;
        Fri, 22 Jan 2021 12:25:14 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:14 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] ARM: tegra: acer-a500: Rename avdd to vdda of touchscreen node
Date:   Fri, 22 Jan 2021 23:24:53 +0300
Message-Id: <20210122202457.13326-10-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Rename avdd supply to vdda of the touchscreen node. The old supply name
was incorrect.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 4dcec18b677b..2c6cb7de57f7 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -448,7 +448,7 @@ touchscreen@4c {
 
 			reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
 
-			avdd-supply = <&vdd_3v3_sys>;
+			vdda-supply = <&vdd_3v3_sys>;
 			vdd-supply  = <&vdd_3v3_sys>;
 		};
 
-- 
2.29.2

