Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB352C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FEE461027
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbhKLMi5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbhKLMi4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:38:56 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9727BC061766;
        Fri, 12 Nov 2021 04:36:05 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i12so6745298wmq.4;
        Fri, 12 Nov 2021 04:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0IZQ6Ong5axo8LYjco9I1jtetv/Ogvwwz2EHhCIpJ7c=;
        b=K14OEV1R7qrH1exmW16cs6HtRYxK0IhcYLxL4MOJ4BHpgqdq2JYs/hJcRWkeb3Ar2C
         rgvyo8K98/uV8DSec8PRo1Z8ZYuA+gmEhj9/6UQYQgN3dpa13ZZpBQdJ5Lqw8NbcTcOM
         oGZNvzE1+F2HBTcVo/Upn39hw0ueYICXkCtvN2e5kJAXm2XFDjy93KLOEvmJPDQMlKEv
         5WCbOeYOfAmSXMg+zOooAMCE5jIskQYOlk3OIi3CRweJ4xfY2/PMzY7asA/Mqtl+3dmF
         MKKxy6gi5oAI4zDu1y6SvvOLrfaunQVX4aV1eKxmaTsum/XKT0/L+s7IhiDICAvG2IJn
         Y8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0IZQ6Ong5axo8LYjco9I1jtetv/Ogvwwz2EHhCIpJ7c=;
        b=XWjBUqGnI1ycmN1dYDKS6p2R9xpk7BRYSHbfuiLv8/JsBNI4pMoG+uGgCTMD1K8Dow
         4LQxU4iAs5+8uZprVjXTVHp2vKk+LPZ81uazMR3Erqe24iOmBepC3EJYL7w4ztMjKT+5
         BqBOudZ+k5+EGa6jnL8t+FXNLEnNJNVU0QMloSbtgl6dz1gBPRfchPyC914H8avyDH8N
         4pdc/JT6CHrAgG74M93GFrE2GsIOKuuDIo7rXMSrkf9OzVYYrp9Z38vUS7e9S18hFZOg
         ig8mMpP9eQTnom2bDOO+5sX6/3rhGGQzEChXMCj1QCblk/plLIrnRYSiFGqnIKDGH1PW
         vKfQ==
X-Gm-Message-State: AOAM531mptSwvYRP7hQmDrH6vyxQtosK/wX7CPqM8Bm0qb0Ho/GPROLh
        bz8MD/t7V8/evYdrqGwSLCE=
X-Google-Smtp-Source: ABdhPJwuM4D9xDWdW/Br1GKBZTGHwfBCbwISS31YwjIenT1zwtH5dylQgS+3wFhYDiufuIFYKliZuw==
X-Received: by 2002:a1c:1d48:: with SMTP id d69mr16406813wmd.143.1636720564179;
        Fri, 12 Nov 2021 04:36:04 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o12sm7774003wrc.85.2021.11.12.04.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:36:03 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/11] misc: sram: Add compatible string for Tegra234 SYSRAM
Date:   Fri, 12 Nov 2021 13:35:36 +0100
Message-Id: <20211112123542.3680629-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

We want to use the same behavior as on Tegra186 and Tegra194, so add
this the compatible string for Tegra234 SYSRAM to the list.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/misc/sram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 4c26b19f5154..f0e7f02605eb 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -371,6 +371,7 @@ static const struct of_device_id sram_dt_ids[] = {
 	{ .compatible = "atmel,sama5d2-securam", .data = &atmel_securam_config },
 	{ .compatible = "nvidia,tegra186-sysram", .data = &tegra_sysram_config },
 	{ .compatible = "nvidia,tegra194-sysram", .data = &tegra_sysram_config },
+	{ .compatible = "nvidia,tegra234-sysram", .data = &tegra_sysram_config },
 	{}
 };
 
-- 
2.33.1

