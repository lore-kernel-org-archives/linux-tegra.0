Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB41C433E9
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 18:15:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2EDE22DFA
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 18:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405169AbhALSPf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 13:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406713AbhALSPe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 13:15:34 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE968C061575
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 10:14:53 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b26so4756983lff.9
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 10:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=msnFgTIvhBhJ/63vki9LgWjLm9F05aUy7cZgdK84yvM=;
        b=s9eohj9LLXJ388upYnETYopHeoP6jkpD7tpGsDWcPe7X45I9JjcFNzQuaImJRSOird
         atbeyd8cIQFWmEDNSrHPFOLDAdE9ozyBvdB5rWYQ1hdryS4idjdqjVZ2IiM7pNxIm+EQ
         w9euvLM/I4pBFyXyeh/3WLoT/Z3nKklcjsf9fxJDhLUGIebaqpPmos85/StATf0VPMDU
         gsgm66NSUdSSr6qs+nYS9fG/maI0CtrYqtTRIi0PbGSRBBZu4gK8k/YHTLWZ4WRoyT1S
         9b6Ex+LclRNwTq1paKD/k0HMmYdfOIwzkTMpMGj4s05sd4FhyxOzw95zdtKl4VUp6PBT
         J1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=msnFgTIvhBhJ/63vki9LgWjLm9F05aUy7cZgdK84yvM=;
        b=KsLtIngMae6h4cWTOhB6WLSKa48dMKUxF/96gNYKqcpA8zy6BLLdYev5KObafAX9FB
         ZlDqwAuiZNJ7T7lfRdjEhhfB7CyQRedsUh35AZT/0m5hB6Kt8az6Qhn6/s7Pia35vxuI
         986rTjOkbjIUfzERZTJmbCRNk5mIdb3rz8UOV2cHrm1i8Y65Q4Y0eiCPzC9NFaaPHSOw
         moUZU9hCi/KooyMCsnq7fHdlx/5ls6lvJqbqQ1GPqyRsM1WhtJSTs6dVtxSxs7fbdNzj
         MskNb2ysWeT8+XyFhxln9+FRVqtNeRR/NgU5DkH9SepNGbgGmJvdj50gels0IejHTyet
         fKCQ==
X-Gm-Message-State: AOAM533rlEQCU4ov0YTSdsTE3JNcqR6jhhOK0H15PkoUzC5VULGaUxzI
        w8MndN2vFIJ8iYtC9hqnH+G0lwKUMi8=
X-Google-Smtp-Source: ABdhPJwhiKXJCkbclv5OM1o5nyJwcIx7TRfjiuG6ec10XAs1n/7v4CYEEXjaHxagqXQV7+Abkxmegg==
X-Received: by 2002:a19:385e:: with SMTP id d30mr75450lfj.187.1610475292261;
        Tue, 12 Jan 2021 10:14:52 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id r8sm417420ljd.140.2021.01.12.10.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 10:14:51 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] drm/tegra: gr2d: Correct swapped device-tree compatibles
Date:   Tue, 12 Jan 2021 21:14:20 +0300
Message-Id: <20210112181421.21293-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112181421.21293-1-digetx@gmail.com>
References: <20210112181421.21293-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The device-tree compatibles are swapped in the code, correct them.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 1a0d3ba6e525..f30aa86e4c9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -162,8 +162,8 @@ static const struct gr2d_soc tegra30_gr2d_soc = {
 };
 
 static const struct of_device_id gr2d_match[] = {
-	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra20_gr2d_soc },
-	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra20_gr2d_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, gr2d_match);
-- 
2.29.2

