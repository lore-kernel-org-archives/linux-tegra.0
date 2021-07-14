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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D570DC07E96
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C063461374
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237685AbhGNCyb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 22:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237671AbhGNCya (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 22:54:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A87C0613EF;
        Tue, 13 Jul 2021 19:51:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i5so949770lfe.2;
        Tue, 13 Jul 2021 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U0LYQuSmkCfRswWkP5cpCqxrlnDpTD9Qby2KGfuc2Z8=;
        b=ilPCsauI8Wyp97zo+/+ZUU6J8v+IJkTpKjZFqXGb+hIF7+RjE009vpDpV1xngbJ7rH
         VSjbtEBRkENG0sJAeSBEw/Xkb8VPnk+yk/wsBrjhFpIB37kwbbGsv6DvW08xU4maA/BU
         PRdafXnyfpNRzZD2e+SfDK1JUYF+NIx4WQ1xgEwThlfSUYIGIFeV+YQaAe2NSEl18u0j
         MnZn6Gvb9GcJBLFOywHxIQrTwbPyqWXMjTpABQdg3CpgxAZFLI7fochIFBVEPulNp0ll
         CyqmAgQVO7RfJHecT714gYt0Ir0dzJAGrAxjl67PHF1MbcF+c/Vs5xlVlSeH9OsU2GI0
         3XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0LYQuSmkCfRswWkP5cpCqxrlnDpTD9Qby2KGfuc2Z8=;
        b=gmwEq2jnb2qj/ITKbzzzZVc7PgBUiV4itw5SRCAKli2BbUye+HotSwMdRPzJufjw6x
         EfOuVRG0Ed2jLMMILpWm+bDbtKILrt0Fbto3HgMqrKSQIuuli/EPhXjxUZ731f3ivUE/
         Fu31nyBZEeIdqLkm+hB/dtMqmUSjQeDvsihLoFXMo8CearOtfzjcPMj8DlEK0BCpLcAo
         6gzqn6mlfL1vnXLcHDq0BY5rbE3Tvp/9se8oXItMbmOmZ3IdJSeUyAJvAyWzfDu9d4mU
         fs/SZhfAV8BRdhUY9RJmYL/IPx3bR0PIeEHNjbcfKnCIQLiNMAJ8hH4Mxd1IQ4/2nnKG
         Hiwg==
X-Gm-Message-State: AOAM531o1pj+/gWwA6MAEAftiCSp4YsPYzeXOXTQ6yc2laHvVFCXQMx9
        TQuh2/hvu/mOlnPoJTqNImU=
X-Google-Smtp-Source: ABdhPJxmWgviwUA9HEmPc2skkmaUJKbfRBgnmoMaVLrEtE9iRnBCzlLF7FQuOhou6anG8+5UtFYVrQ==
X-Received: by 2002:a05:6512:2314:: with SMTP id o20mr5845534lfu.531.1626231097159;
        Tue, 13 Jul 2021 19:51:37 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id a10sm50281lfb.93.2021.07.13.19.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:51:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/7] ARM: multi_v7_defconfig: Enable Acer A500 drivers
Date:   Wed, 14 Jul 2021 05:51:26 +0300
Message-Id: <20210714025127.2411-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714025127.2411-1-digetx@gmail.com>
References: <20210714025127.2411-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable EC controller drivers of the Acer A500 tablet.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 8d5ec5986b42..65d1fede3825 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -493,6 +493,7 @@ CONFIG_BATTERY_ACT8945A=y
 CONFIG_BATTERY_CPCAP=m
 CONFIG_BATTERY_SBS=y
 CONFIG_BATTERY_BQ27XXX=m
+CONFIG_BATTERY_ACER_A500=m
 CONFIG_AXP20X_POWER=m
 CONFIG_BATTERY_MAX17040=m
 CONFIG_BATTERY_MAX17042=m
@@ -551,6 +552,7 @@ CONFIG_BCM7038_WDT=m
 CONFIG_BCMA_HOST_SOC=y
 CONFIG_BCMA_DRIVER_GMAC_CMN=y
 CONFIG_BCMA_DRIVER_GPIO=y
+CONFIG_MFD_ACER_A500_EC=m
 CONFIG_MFD_ACT8945A=y
 CONFIG_MFD_AS3711=y
 CONFIG_MFD_AS3722=y
@@ -896,6 +898,7 @@ CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_MAX77693=m
 CONFIG_LEDS_MAX8997=m
+CONFIG_LEDS_ACER_A500=m
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_ONESHOT=y
-- 
2.32.0

