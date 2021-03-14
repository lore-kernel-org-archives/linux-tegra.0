Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EDDC43332
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AA7464EEB
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234218AbhCNPqC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbhCNPp2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:28 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D36C061574;
        Sun, 14 Mar 2021 08:45:27 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j7so4450026wrd.1;
        Sun, 14 Mar 2021 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RPbfN09KLR8+OBhXwBaCOg2Gccjzu39uZXtdRMFwFs=;
        b=neiMlt4aIX9NcGRwB/ENW/+akFv1X4d1TxYysbGr4NzZLk8oYx98BAFtcEYdaJCY9F
         sqRjDeHMpQGAHxLXOP7yc6UrkgZy4msdycmGA4XP0aPnNLgbd4FXRcJVEry6RXFuXaKk
         oAIPqJETL11VPZF2UBZ7cqcbr8dWbHrJb2kuXrD/ZKVYGI6FfsqP34B1X2ati2S3XLSr
         0Wtia/5TigctUVouMiPPNyLEPvX3pyJCYmcx256a/CpmNVWesjc3pxJJVDn1gDryaAPU
         TP9hH1wzCB0FD24SBIIyiJPCCN3SzmoiyTDLHF6ikb+9kzSGpD8CnUjI78v09z1TEK9v
         kzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RPbfN09KLR8+OBhXwBaCOg2Gccjzu39uZXtdRMFwFs=;
        b=ZU4Ysq62MKzZ9Qv6lbJ/wv9PIj4YxeuBCS31aBniMVwWmT5knNX+fgsP37fQDWSSDR
         k2REZGe3sbGpPZvFUiAmQZ5G/6GBL953nwb9oEtVdIF4LAZDxmMMCI0Qin2y4WpCcdOh
         IeNGOVpbr+gigbgX/tg4Mu8RmQzrgUY7h4p+3YVxJQEyB+85VemEuqlQrrp8/FsfF1oN
         NSODxrS26jQ9HmN4PFSRxnWdm1ZrCXSfHadWKlj5Qb+yJbnq+eGmE4UQkdPM9rtNHhJ2
         NgaqGiHtw0BH/n2PBNwPh6gOay7+DYwbkRw25m9mBthajkuuPpuAhY13wtsiWJAk7Dph
         lapA==
X-Gm-Message-State: AOAM5339pOeF5vqY45SrH+7ZC0TOJBzFKHdfgdQN6b/JayYheUUIdRgw
        FW0uuItPRwnMBH1+/wIIC8I=
X-Google-Smtp-Source: ABdhPJznbYoJP8rsmrWHGlDJ1JSSCuHBF0G1oJW1BSqcpXmNzWSGGJ5YBiDocMB3+D9Gtky4r6LvkQ==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr23119177wru.127.1615736726655;
        Sun, 14 Mar 2021 08:45:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:26 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/17] ASoC: tegra20: spdif: Correct driver removal order
Date:   Sun, 14 Mar 2021 18:44:48 +0300
Message-Id: <20210314154459.15375-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20 SPDIF driver has a wrong driver removal order, which should be
opposite to the registration order, but it's not. In particular the
runtime PM is disabled in a wrong order. Fix the order.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 5839833e23a0..e48d332506a0 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -329,13 +329,13 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 static int tegra20_spdif_platform_remove(struct platform_device *pdev)
 {
+	tegra_pcm_platform_unregister(&pdev->dev);
+	snd_soc_unregister_component(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra20_spdif_runtime_suspend(&pdev->dev);
 
-	tegra_pcm_platform_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-
 	return 0;
 }
 
-- 
2.30.2

