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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258E3C433E0
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 20:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E84E964EBE
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 20:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbhCNUkc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 16:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234457AbhCNUkX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 16:40:23 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0FBC061574;
        Sun, 14 Mar 2021 13:40:22 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p21so53647047lfu.11;
        Sun, 14 Mar 2021 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p3Ve5P7His6tFAFGdWedVz7byNJj6EBf6mlbKtAtnUI=;
        b=RrLK+pS4pCc6LbQFW58+72pzy5IPSj65N8WnfjKVcnez8UehQRWvyLnGarCmcPiryq
         CcwdtYl2MIjKB4/otAv755rLzEWjlO7i7Gv1yerFMCZOKpoz/Q1ZOCbuo2lua57+dkXn
         ZUD4/C/S9sFF5erqWNAvmoZcsMmzSe7SV1YJzOXkUjd4/uZ2IjxIBJnTDLEYzsPgq/m2
         ppR9riCmaXCuQYiIFhgCkSvresezgIG/KxAqxAOA5VJhJk8ZdMtzm0QaEutCXHONnhfS
         rDmedU4KMgOOLj491dIWBGrhEqUKF4mxnCbTx/NAKoDn9KVYYGbs+eDp2+67ow7SoH0R
         v7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p3Ve5P7His6tFAFGdWedVz7byNJj6EBf6mlbKtAtnUI=;
        b=FKfcDWZFDaHQhJoVIIT1f///xmnWAF8qjYMOJ1ZHYY8vmfoJd/2PJSd8O4a+eF6xCH
         +QFouhIQxEcKCx0WH07hXLG1B2B5Sh46sKQcOy08qYfcgO09+TPbfOzclUl1nnOh8mzt
         oobP1EWg7VU/OuHwuOQVEbicl5V5WaNVwJmtt5tHLuh/StBHcJ2g+g0k39mHO91Egd7G
         iURFXaAX9cH2McTC24wqbHQAPtd7N4MjrWhkLxElgN7VTV29AxMm8lOayfjDvMxzdirs
         aEHMsqXWRp+ocUonwwV2Of/UCajV14CHCEdZhJ++qPTAQ54r4heAG/QWyH08NJBWdovR
         kxJg==
X-Gm-Message-State: AOAM531Oyj+J23wCZJglQkbBC086qNf17tjSylk6O85YqmGzkuWBTw7c
        a/CRGWTNqIFCyBehGg/F/EY=
X-Google-Smtp-Source: ABdhPJxh5LbE4I61veSrydCBa++Isb9y5JkNPNV9Q6iuDDhvUcbS54lYlK3r9auTzxKU+DsIqwfB/A==
X-Received: by 2002:a05:6512:388f:: with SMTP id n15mr5998055lft.8.1615754421197;
        Sun, 14 Mar 2021 13:40:21 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id q16sm2438593lfm.35.2021.03.14.13.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 13:40:20 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] usb: chipidea: tegra: Silence deferred probe error
Date:   Sun, 14 Mar 2021 23:39:27 +0300
Message-Id: <20210314203927.2572-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Silence deferred probe error caused by the PHY driver which is probed
later than the ChipIdea driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 90f2a8b786be..60361141ac04 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -285,11 +285,9 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	}
 
 	usb->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
-	if (IS_ERR(usb->phy)) {
-		err = PTR_ERR(usb->phy);
-		dev_err(&pdev->dev, "failed to get PHY: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(usb->phy))
+		return dev_err_probe(&pdev->dev, PTR_ERR(usb->phy),
+				     "failed to get PHY\n");
 
 	usb->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(usb->clk)) {
-- 
2.30.2

