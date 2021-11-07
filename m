Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530DEC4332F
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Nov 2021 23:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 177FC613D3
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Nov 2021 23:08:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235861AbhKGXLN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 7 Nov 2021 18:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235375AbhKGXLM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Nov 2021 18:11:12 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEB9C061714;
        Sun,  7 Nov 2021 15:08:28 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id d11so4725431ljg.8;
        Sun, 07 Nov 2021 15:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9v5NLsd56QrV5nZJkQ+d7hO2Yd8PMU4HBZ61bzljSys=;
        b=f4839dAeeTsiZ8mj63AV5j5utFMeJpPEnDERo1l0hCv1MW8oGkf8ONuBsSPkuqxYNK
         E335rYXB8bC9uffWBpf5yKOqcRj33o9Ffruv6Gcbp6Afkl6ZzMBzKMX+zxTP3T+a6cqn
         FmMouQVK2kGAci5Kx2+bWF6KKyLnTN4iMgtlMVxONaMLyu1OgvC64Na4PVHDXLHVsOCe
         XhtS0qXxZXfIi6Yh80VDaO32de7dzSD5+AkQu0/Ry5FS6I1rXz0DT2lDdwSkhk/3TR02
         cElQ+InWWLrLJzeJ7soPDG28VGWWcbFYS0xcrUiKf+8MgK+y1xkxBdPZy+wOWd2UraMO
         zEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9v5NLsd56QrV5nZJkQ+d7hO2Yd8PMU4HBZ61bzljSys=;
        b=0wskY4AGlu+2Lb95J+UfwCE09da7Zothrgig+gflw/31HLQ2vIO3Esipy6mwsSr4Es
         t6IhNxxlMahvjkApya7M+ojhGo0y2CXc48s3dr4KYo3urP8V7TfRNxYCfx6/bNgV7mEi
         AbgCbS1kERY9YgrsbKSiZ9f/kmbnZ8YyKoaOE/zvNu6Bg+YR0fx20a3E4XL52yIoKxbx
         tZ+j/BF94rDSJzdUwc1jHljptUGwLLjiM6QdvZvIUUlxt8M8H0qPyKaZ40kue90SsFRt
         LuOCbS3JMFs3VPlLBQKuVjLyx9YxK8h8tmMIYFvM4TS4wjQHEejKazOIJLW5TXfib83S
         aWJw==
X-Gm-Message-State: AOAM531tOqTMycM9nVuw4B9d+lLu5DfWCTWnWFQ5QheUbQrpDeSsLyuA
        pQT2abhuvg8CLVox7VoXVhU=
X-Google-Smtp-Source: ABdhPJwYMReUcW/m+iND89XbkH7e/3YwLyLnc+Op38AjupihC25kL8XmQ80YSeO1/5ALAPUOmI9uHw==
X-Received: by 2002:a2e:4e1a:: with SMTP id c26mr76325410ljb.27.1636326506483;
        Sun, 07 Nov 2021 15:08:26 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.gmail.com with ESMTPSA id l13sm1785694lfh.270.2021.11.07.15.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 15:08:26 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev() helpers
Date:   Mon,  8 Nov 2021 02:08:21 +0300
Message-Id: <20211107230821.13511-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211107230821.13511-1-digetx@gmail.com>
References: <20211107230821.13511-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use drm_dp_aux_register_ddc/chardev() helpers that allow to register I2C
adapter separately from the character device. This fixes broken display
panel driver of Acer Chromebook CB5-311 that fails to probe starting with
v5.13 kernel when DP AUX registration order was changed. Tegra SOR driver
is never probed now using the new registration order because tegra-output
always fails with -EPROBE_DEFER due to missing display panel that requires
DP AUX DDC to be registered first. The offending commit made DDC to be
registered after SOR's output, which can't ever happen. Use new helpers
to restore the registration order and revive display panel.

Cc: <stable@vger.kernel.org> # 5.13+
Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
Reported-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..e0d675c7c2e5 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -532,7 +532,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	dpaux->aux.transfer = tegra_dpaux_transfer;
 	dpaux->aux.dev = &pdev->dev;
 
-	drm_dp_aux_init(&dpaux->aux);
+	err = drm_dp_aux_register_ddc(&dpaux->aux);
+	if (err < 0)
+		return err;
 
 	/*
 	 * Assume that by default the DPAUX/I2C pads will be used for HDMI,
@@ -585,6 +587,8 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
+	drm_dp_aux_unregister_ddc(&dpaux->aux);
+
 	mutex_lock(&dpaux_lock);
 	list_del(&dpaux->list);
 	mutex_unlock(&dpaux_lock);
@@ -718,7 +722,7 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
 	int err;
 
 	aux->drm_dev = output->connector.dev;
-	err = drm_dp_aux_register(aux);
+	err = drm_dp_aux_register_chardev(aux);
 	if (err < 0)
 		return err;
 
@@ -759,7 +763,7 @@ int drm_dp_aux_detach(struct drm_dp_aux *aux)
 	unsigned long timeout;
 	int err;
 
-	drm_dp_aux_unregister(aux);
+	drm_dp_aux_unregister_chardev(aux);
 	disable_irq(dpaux->irq);
 
 	if (dpaux->output->panel) {
-- 
2.33.1

