Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43772C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352088AbhKXWJ5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351864AbhKXWJw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:52 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF84C061756;
        Wed, 24 Nov 2021 14:06:41 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id t11so8394732ljh.6;
        Wed, 24 Nov 2021 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
        b=nJAo4iPfwBFY1ROe3048h1ybqQlX//p3YjSX7Pe0idWjl7D5Xl7cOhLCOiOdeHEVtw
         i1TsPOsnewcD5UwgabPKGc1V8ufc2Zd+FJV0+A0q6BgfW74cgH0ysttiHo0JEuKO06Rf
         oSinD/HXvoSsQPpiGhkH5NiAnlXw69WbXOkSEmz5iXw1DnlDdAz0TEcgI6GlEiPRdKb/
         o069dFlaoy5lyEDSGze4gA+OToJs1MdOl69LwnbHH6fpJD3OU8yGdMtR7rBHQx5ehabg
         p1FSHjplifcYroZVsJCoW1Pl7SCG52FqXEMBlrRcXhVCQLxFhlKVMSxxPb7NXXuUNqPG
         2orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
        b=tTok49h57+Udq8SGRJKPyRO7J2K4X8UdUr2YQdmvMKg1HdK13RKNI7UWQHwLP5kH9D
         B1cmLcrLRtFXCDFR9aIzrMsPnL6AVQ8FC+Epc777u0xX2axkmF38sZ78pLHrg6xI63fi
         PcLWyz47J1btgaLUnZrY6TwC70AUVTnxQnrchDakTmvaukkFdqEKK4EUJcjIMt5fOCln
         go40cMQNSG1YP5Xk1I8hvznJiOkcweVw8WpYDH6O6uQTHt0SGw5zwbZW2J46BIudt1QC
         qLt3zN6j2NERdi9MvCZYXNbxB5zH7YEBMJgn+5SNEZEqTjRvjLzALM6ugsjwSvwgGsl+
         eH3A==
X-Gm-Message-State: AOAM532eQ8JLGybM+V4UViwAIRf3mjUzoP2/dvr7LtVv+iX01wTObvA4
        NKpKnPLytHqO8otAqEh5hhw=
X-Google-Smtp-Source: ABdhPJz7K2sn4O/88yaV122GJMihQ39VL0qbxsHYUBy+2XB+hcfq/s90uDVNIgFsxMF0NuDwPmYVYw==
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr19708991ljn.354.1637791599934;
        Wed, 24 Nov 2021 14:06:39 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:39 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 11/20] ASoC: tegra20: spdif: Support system suspend
Date:   Thu, 25 Nov 2021 01:00:48 +0300
Message-Id: <20211124220057.15763-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support system suspend by enforcing runtime PM suspend/resume.
Now there is no doubt that h/w is indeed stopped during suspend
and that h/w state will be properly restored after resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 8b9bac30d5cd..89f7fc5c8aad 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -345,6 +345,8 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra20_spdif_runtime_suspend,
 			   tegra20_spdif_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra20_spdif_of_match[] = {
-- 
2.33.1

