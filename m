Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A82C433E1
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:59:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A37672086A
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGsRgXCg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgHFQ7V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 12:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728846AbgHFQkm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 12:40:42 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543E4C002164;
        Thu,  6 Aug 2020 09:04:26 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c15so25873139edj.3;
        Thu, 06 Aug 2020 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qCmIX3SPfcMY/8KgQ36Zj8ELVJJ7yBBvUBKlCJXwvCc=;
        b=HGsRgXCg/m7TRIiAro1v+PhtaXEr1T2LI8B3dpBxOw6Ziu463cmElIgYv0AWs+rWBm
         mcRz8ITNHfCMVkowiFsuY7YrFOMB/LWreAe+uDnzty6qCSL9YkPLrzDXcLhPxc0WP6pw
         zR+jSNurDmGoZCsZn4QZs6uHrmJg4WXwnVTr96UP2ZW+eJFQ7AFe249clJQbGVty2gnJ
         ocdqMVF/PpEXmTFs2NkQeob9OZDg44EsA/mUVjl7XORQjton4HCt48y6BK9/+NwUiSbQ
         0YyjMiV6GKIWmBmaQA/vjYHy3payuc7en/8gJBl2UzFezLFbi1up6eQ47yRHyozmcnP0
         p/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCmIX3SPfcMY/8KgQ36Zj8ELVJJ7yBBvUBKlCJXwvCc=;
        b=RH8CvFx5RS+vXYHjRm8hOlsmmeD5MqJe88ENHzdikZnE6frMHMw/zY1VfD3YvZPz1r
         NaDdsqqoxA35cClu/4grtYQNwlS0fFrHOWOc6tt9m9NOUK+oYvovWJx0UsADphe6XC7u
         jdwuKqXMaHW0cntw9R4B7oeTjHnb23nHgLMLlkSYPrTHAHv6zFLK60Ri6vkqgbU/B0SI
         dPCUnFvVxiLAAJryCrKymo64i0MSzHz30y5W1WPS3pWPgOdQV554hEcgsED0ZI7HT4o7
         ULDME8LaKyuU9iZQZpZJvf+I3JdltCTIS8ccg3K3c8fl6d6ykk6SJvgiHoXQVGb90yRD
         pr2w==
X-Gm-Message-State: AOAM532Kuoc3p4v6jm04MlaNQubbd/VAN7wzIPLqQX3ItAjC/aH3RyG3
        p9C2OWuGpSk/v09P6KC2NOM=
X-Google-Smtp-Source: ABdhPJxsWPXfofA+P/l31ulcPcRyvAWGFVgZby5LKhZRTkaZJJjrmRaQ1XvhtqmXiSW7LDNb9LIAzA==
X-Received: by 2002:a50:ccd0:: with SMTP id b16mr4716994edj.148.1596729865067;
        Thu, 06 Aug 2020 09:04:25 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u18sm3694198edt.31.2020.08.06.09.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 09:04:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] usb: gadget: tegra-xudc: Do not print errors on probe deferral
Date:   Thu,  6 Aug 2020 18:04:17 +0200
Message-Id: <20200806160417.3937056-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806160417.3937056-1-thierry.reding@gmail.com>
References: <20200806160417.3937056-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Probe deferral is an expected condition and can happen multiple times
during boot. Make sure not to output an error message in that case
because they are not useful.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 838863ede1df..8b773f5d536e 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3781,7 +3781,9 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 
 	err = devm_clk_bulk_get(&pdev->dev, xudc->soc->num_clks, xudc->clks);
 	if (err) {
-		dev_err(xudc->dev, "failed to request clocks: %d\n", err);
+		if (err != -EPROBE_DEFER)
+			dev_err(xudc->dev, "failed to request clocks: %d\n", err);
+
 		return err;
 	}
 
@@ -3796,7 +3798,9 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	err = devm_regulator_bulk_get(&pdev->dev, xudc->soc->num_supplies,
 				      xudc->supplies);
 	if (err) {
-		dev_err(xudc->dev, "failed to request regulators: %d\n", err);
+		if (err != -EPROBE_DEFER)
+			dev_err(xudc->dev, "failed to request regulators: %d\n", err);
+
 		return err;
 	}
 
-- 
2.27.0

