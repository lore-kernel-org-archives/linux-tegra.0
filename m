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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFB0C47083
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52F8F61975
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhFBQee (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:34:34 -0400
Received: from mail-ej1-f41.google.com ([209.85.218.41]:38493 "EHLO
        mail-ej1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFBQed (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:34:33 -0400
Received: by mail-ej1-f41.google.com with SMTP id e18so4773586eje.5
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xNf9ir9072qhefvj+BE6SK9cCIekf4nldhoj468YdIU=;
        b=qBCVDfDlDKcSFVatNeIe2J9mM4iw0wawdTnlaxDnW13CSgrWOwx7UNnUyLioGr1A2c
         RH9/RCUkK12Ck/rDicxjXkHr/LobGyJlibBSyLxJxHlQIo9hYzQEYkP3j/2PoljrQObB
         vjWdRSa/GF1Ny+7VSOuCbPk6T6m22g8cUApwSl1dLO7Us8EYt3RulBRj9Ic/1WQ2HXPv
         oTHdB4/db0+J08SGf1Oi+uWYWJanQiwKTG+uqxr0f2LL0eHyzfbs3CaPa/+HIt2paLIB
         RMQPkV8FE/uP4RgNl6zr1Oh2opE4XOph+Ryspi+msET7aZxKm5YY6+Lxogn35G9YJyE0
         fHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xNf9ir9072qhefvj+BE6SK9cCIekf4nldhoj468YdIU=;
        b=XLvxizo9EAAgfwvdJD4LM9a3eyKgXXtkw/rU17gkVJ2TzWpKA6WHM6+To75071yY8R
         PzHUIs2AnimRiMEO82hbxBsFme/WWz5BXjdPkuIkRRwt6uTff39A/JZlVoY372Lxp4qS
         I3DshScY2MMs6Yc40egMdK/13jvd3upqHov3lgXOm9cn76V+regdYFG2pTYNbRUdavPy
         tBE/f6BJj1a29Cq7Jt0iqxePadArHuTh3O3gZMnqFwwPR7c7VOFy/c6SUALyt4K4+YtN
         zELQBsYH6qQ8L0kVpMJYDwkL2CEqojsv8FIp92fFL2STOuw8z9j6xGjUL0aXFcVTkO70
         Tuvg==
X-Gm-Message-State: AOAM533ElCjuvsstm3rlH7YKyxljuRZ2ffs5gMyOVukBul70msPx7SnW
        24yV5njd3/COxVaS0GXWJng=
X-Google-Smtp-Source: ABdhPJzO3RMCB+KL0FPO5yzqln+jN74fVjYV5ErSR50MC6sCCzL5wE4S5JIuNuuUqhTi0QGajbJ8rQ==
X-Received: by 2002:a17:906:158c:: with SMTP id k12mr34862051ejd.274.1622651510096;
        Wed, 02 Jun 2021 09:31:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id br21sm243388ejb.124.2021.06.02.09.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 09/12] memory: tegra: Only initialize reset controller if available
Date:   Wed,  2 Jun 2021 18:32:59 +0200
Message-Id: <20210602163302.120041-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The memory controller hot resets are implemented in the BPMP on Tegra186
and later, so there's no need to provide an implementation via the
memory controller driver. Conditionally register the reset controller
only if needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/mc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 68c6797f2707..4aa17bdd6392 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -768,10 +768,11 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	err = tegra_mc_reset_setup(mc);
-	if (err < 0)
-		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
-			err);
+	if (mc->soc->reset_ops) {
+		err = tegra_mc_reset_setup(mc);
+		if (err < 0)
+			dev_err(&pdev->dev, "failed to register reset controller: %d\n", err);
+	}
 
 	err = tegra_mc_interconnect_setup(mc);
 	if (err < 0)
-- 
2.31.1

