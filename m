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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB8AC48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 11:17:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E99DC613D6
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 11:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhFRLTP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 07:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhFRLTO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 07:19:14 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A34C061574
        for <linux-tegra@vger.kernel.org>; Fri, 18 Jun 2021 04:17:02 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id t7so8127693edd.5
        for <linux-tegra@vger.kernel.org>; Fri, 18 Jun 2021 04:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQUBzR6lGD3okKDgLwYUAev+NeRoRqEjDpIc/uXjg7M=;
        b=UkKqw6F7li7S4mJyoeRKLEBtlH2BkOvBGWpaIKpUHc8+kDqYmfXHntDASEpuclOE8K
         QIZK6ISSsl7GGtO7qejv0VWvusJHphXsburM/sFXJSHtwqgFb4TP0aZUwu0LH1jmIzm2
         rJel/2CwL0XQVLr4RuSz6jip4ogqgDdnZOBgnXDNgVujHfH/7TvEAtz/GGhDwqDkslXp
         aKq70whV+3ypVEW1QIwpwSTo1OXuinZ+l0VgMS07gs7ELybp76kKanWz7bGbV3icU6dc
         Tsr9yH4OucwKn86kOrka4gSQzidoMM0AXDi35bQwy6/AqTu2TBSiB7AlNW1egSyfATSZ
         0D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQUBzR6lGD3okKDgLwYUAev+NeRoRqEjDpIc/uXjg7M=;
        b=cDtcQ/tTfeG+cfsvvxEycNRsRDAMaI00Iy+lrqI1hSRC+vxye+p2cS2GseiUHzhpMA
         XDhMicdG4wrZ2DQl6SmjNVMKyPGCE9zRbAJ4PqFlUqRisfhDKp4L0uA+CxkmjvUhViXs
         bVSGaZBO/9lJMnpkk6yOUUki23Pc5SwAayh+BYCJpQS5fZoSDkT5Xd3XwOQZkMEgdCWj
         /EZGILUMjOqa78LAkamV316WHRcnoZzTWkyVNR13BMP0J8JPNSGEeyFOOcqln1ZAkZWC
         Z2zBv+YVVLbFyIRYWGspzaAW0AxA/mB1JI4nnrfa3xm31Xm33TV0Yo3Y/9tAGU4/pktd
         fvTA==
X-Gm-Message-State: AOAM53290Ftk3hG/aeHyusK4ZhJGvjuhupzrHLSHT+RZbO6vfq4NgqSo
        GDxWz+D25t21YH9K3zgkFCI=
X-Google-Smtp-Source: ABdhPJwh0Ik+ZdRM2jQVmiR0mg5Ik1vH/J9I83CiYKCmbAPpwyh8+T6IC6tLb+lXAWt6JS0WH45UZA==
X-Received: by 2002:aa7:df85:: with SMTP id b5mr4354111edy.90.1624015021367;
        Fri, 18 Jun 2021 04:17:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id ot30sm911807ejb.61.2021.06.18.04.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 04:17:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-kernel@lists.infradead.org, arm@kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] memory: tegra: Add compile-test stub for tegra_mc_probe_device()
Date:   Fri, 18 Jun 2021 13:18:46 +0200
Message-Id: <20210618111846.1286166-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The tegra_mc_probe_device() symbol is only available when the TEGRA_MC
Kconfig option is enabled. Provide a stub if that's not the case so that
the driver can be compile-tested.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/soc/tegra/mc.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index e19c2504a14b..1066b1194a5a 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -237,14 +237,19 @@ unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
 
 #ifdef CONFIG_TEGRA_MC
 struct tegra_mc *devm_tegra_memory_controller_get(struct device *dev);
+int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev);
 #else
 static inline struct tegra_mc *
 devm_tegra_memory_controller_get(struct device *dev)
 {
 	return ERR_PTR(-ENODEV);
 }
-#endif
 
-int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev);
+static inline int
+tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev)
+{
+	return -ENODEV;
+}
+#endif
 
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.32.0

