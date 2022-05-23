Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4D3C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 23 May 2022 14:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237127AbiEWO0U (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 May 2022 10:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237137AbiEWO0S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 May 2022 10:26:18 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE134BC07;
        Mon, 23 May 2022 07:26:17 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id a23-20020a17090acb9700b001df4e9f4870so13886724pju.1;
        Mon, 23 May 2022 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dm4TT13KSiuL77Kurdzbxn3sj9oOXf/UIrA5coHXgag=;
        b=GaXl6eNDe8XGNmdTgpiGEZJ/TizJeO/k6QmaNcIbAa7uasdJZ+okio0BBCaKh6xvDE
         zfhQQe+1tuK0Tdk6Q1CVL7M5syyKZBdWS/iMXNFEvtYLv1gp1SsSCWGQPh0hAXPJ9pGo
         yap+LsSDvpd/PGJs54OJYqEU2UPH+8vnF0WsFQMIy/rbERBHM4vG5TPl3POptfqfgjOJ
         8lxP+NjUHoOnRdPqu8AealGxAqMBH0oCoOqh0q3uOLX29AktfMl/5H1B/8a7/NlApG+d
         al0xUIr87Zc/qXHkRdiKoHw96Xt5yDDDyaonR9dINE1bB3cHkE5VwEHA20NI8hU2jPNb
         epag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dm4TT13KSiuL77Kurdzbxn3sj9oOXf/UIrA5coHXgag=;
        b=MXMYi+ggU9BJhf+Mo3PqRwDifmSG/FUuXnNdEaR301ocrRXfJDIRKXLncXxAi0ofQJ
         Sx82/kOVIeUlGnvzHACNAmwP876QAfuYEBoDzT18j39M4sTBoJn/ppynCNS2RH5QqHU9
         0aaxxZPYK5nnrEva2rP8TJ1YoufEaFxa8vdoJwNeNIXbxQTIUKR7s4ShkdJDsK4fPuBe
         uOMDFrYao1/gOFzgJzdthPGWxdO9yggaktXHfaNVZsxnEMHyaR7EEemy6UJkFkYjcKp3
         +RNrrBwBTytV464J7DvHqQLsuooPs/+1oRv8WgQzDF9Cb5O0O4oHUfUBm6p4LfR6vvBe
         eh7w==
X-Gm-Message-State: AOAM532FRYuhk+PDaP1nR9rGAPGM1miTIlJqucaTc9uiqd0x0BNw5LlR
        O29YbjQeYVgwG1DdXLcujnnITJBkk4L5Ng==
X-Google-Smtp-Source: ABdhPJyk9R7HqnqlxT8Cl7Ehi0YFLbFT2OX5ASTMtbuRUAmxERv9h5wOwqK/TkMQjIdrXJSKrTl9pg==
X-Received: by 2002:a17:90b:1e0f:b0:1df:e6b4:1fa7 with SMTP id pg15-20020a17090b1e0f00b001dfe6b41fa7mr22360831pjb.29.1653315977392;
        Mon, 23 May 2022 07:26:17 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id u2-20020aa78382000000b0050dc762818asm7266438pfm.100.2022.05.23.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:26:17 -0700 (PDT)
From:   Miaoqian Lin <linmq006@gmail.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linmq006@gmail.com
Subject: [PATCH] clk: tegra: Fix refcount leak in tegra210_clock_init
Date:   Mon, 23 May 2022 18:26:08 +0400
Message-Id: <20220523142608.65074-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

of_find_matching_node() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 6b301a059eb2 ("clk: tegra: Add support for Tegra210 clocks")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/clk/tegra/clk-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index b9099012dc7b..499f999e91e1 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3748,6 +3748,7 @@ static void __init tegra210_clock_init(struct device_node *np)
 	}
 
 	pmc_base = of_iomap(node, 0);
+	of_node_put(node);
 	if (!pmc_base) {
 		pr_err("Can't map pmc registers\n");
 		WARN_ON(1);
-- 
2.25.1

