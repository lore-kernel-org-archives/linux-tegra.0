Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4199BC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 02:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE0F02250E
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 02:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbhATC2L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 21:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbhATBZO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 20:25:14 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D56C0613D6;
        Tue, 19 Jan 2021 17:24:14 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m25so31847594lfc.11;
        Tue, 19 Jan 2021 17:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IeBFJJDe4VVelYzs6REAIbkz4wri3N29ZGU+KneB1Xc=;
        b=ESX4j9gI2nLxK46A9naHobZGuKbDQ5OgI8vz2xzSPdkL68xQW3w5642CUchzJevAbI
         JsSpXyq2BeAuOQM283OXACmBWSv0OM9BOdfbhELE1CLcWbIYn97nx/ZTUtlJKnbTs8hP
         yJeMqOgUL+jLFP3/OzNuPM1/gz+CUmcTK//BSRFKH7Lz/JxNuQxo5pttsCsBaGC1U7C3
         Z4XC1PAO4ykhD7XW9zsFsvMP3GFn5D2hyxZnlgnfJK7sk05gVDEVDN+lEhziN/5s08nS
         FoJbnNi8Y+cu6wj9d+kRaG5dxdNRzoMkhVd/m1dSiY0N5k2P4edUMdwYYd7GpqQ0EGL5
         xW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IeBFJJDe4VVelYzs6REAIbkz4wri3N29ZGU+KneB1Xc=;
        b=J8+PJXTZVnB+WrbQM3F9xoeKR6FgPcveBncYjH52sxK8oKi5dH78LnLOPuohyLywZd
         7w/3WPXN40grxXSzKaOhvaacxpmTA7aQjgI7g+pptVp0wnOeJ/1HbeTUk3ajb1uKd0MG
         oAIg/Z9N+ldw4/8RMYdSrMTCo3Ju/YYmDoMEQWWWWqXO0rj8knzmBWMHNDVerqFw8Xjd
         4MRyAfSymBLNhIhCpX2nQiXf9J4p/srF7PpcR6SdJzekck7m33FJ0MraWyIaJptCYD//
         j7/AOElT1M4KWCSGQg1BFnQpH2kvaajFGK4TljlOcJMOaL42z5iyYlS+ciDr2czI43zL
         FAzA==
X-Gm-Message-State: AOAM530snVjNxyxOE9+h24zMft08XaqeAqefmIwxcZDmtVY8Bmc1D/gL
        TJgh3+xP9m1Pv+zaXS5h+Gw=
X-Google-Smtp-Source: ABdhPJxnbQDG0JUGI3IE6Lvzxbrmp+MbulTddr0Z2K/Ifu+puMZWHVhee91No3GdlvKYK7wAMNciZg==
X-Received: by 2002:a19:ac2:: with SMTP id 185mr543710lfk.99.1611105853456;
        Tue, 19 Jan 2021 17:24:13 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c8sm28416lja.80.2021.01.19.17.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:24:13 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] soc/tegra: pmc: Link power domains to the parent Core domain
Date:   Wed, 20 Jan 2021 04:23:57 +0300
Message-Id: <20210120012357.11038-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120012357.11038-1-digetx@gmail.com>
References: <20210120012357.11038-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Core domain is a parent of PMC power domains, hence PMC domains
should be set up as a sub-domains of the parent (Core) domain if
"power-domains" phandle presents in a device-tree node of PMC domain.

This allows to propagate GENPD performance changes to the parent Core
domain if performance change is applied to PMC domain.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
[this patch was also boot-tested on some other T20/30/114 devices]
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index bf29ea22480a..de66092c3d61 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1283,6 +1283,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 static int tegra_powergate_init(struct tegra_pmc *pmc,
 				struct device_node *parent)
 {
+	struct of_phandle_args child_args, parent_args;
 	struct device_node *np, *child;
 	int err = 0;
 
@@ -1296,6 +1297,21 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 			of_node_put(child);
 			break;
 		}
+
+		if (of_parse_phandle_with_args(child, "power-domains",
+					       "#power-domain-cells",
+					       0, &parent_args))
+			continue;
+
+		child_args.np = child;
+		child_args.args_count = 0;
+
+		err = of_genpd_add_subdomain(&parent_args, &child_args);
+		of_node_put(parent_args.np);
+		if (err) {
+			of_node_put(child);
+			break;
+		}
 	}
 
 	of_node_put(np);
-- 
2.29.2

