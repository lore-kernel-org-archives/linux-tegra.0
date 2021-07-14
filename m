Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0138FC11F66
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF642613AA
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237658AbhGNCy3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 22:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237478AbhGNCy3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 22:54:29 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB82C0613DD;
        Tue, 13 Jul 2021 19:51:38 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u14so1189225ljh.0;
        Tue, 13 Jul 2021 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GU5IkjSWZSc034aSvbyq8E/AoQSf6LQe5DBUYT4jqHA=;
        b=SHnIGaKRjN1ATZUqHdYVda53Jx0LEh3Oz6sDBFAkH8HDW6uEU43tHQm+NIu9TDcVCc
         c41LbwpbuWrfzesSUBMeuv/dZTYfH4skMJMM7docCJMU4wi6mzRRhADYx0yVMieECcw4
         B3DCX0k4ARQVgb8MfuHtEi6AIQKLfYwNnTv2kqQ0LDLHzZufOL/ZBS3NEJMwP+cTwKno
         RxCOm7Zzuqmh9407iURrY3JNS8WhHS6WaH8UdebzLQhOgmdO68vNyS1cQoyUd7uthk6d
         2h28WnfUk5Km3KLoSDi5Gxvlv+POBX86ZfgjTW7j2ORZpyDF5diFNOO+TwAYcUssX0/G
         CVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GU5IkjSWZSc034aSvbyq8E/AoQSf6LQe5DBUYT4jqHA=;
        b=bdZPk/4p+FvX3OBrf+0eXOjsaHEw5a7D1SWrWF5FTJVRWQYfzmzfLfHFox6/YtHkxf
         JmXTeCQ8rz1jPSsTjZsOn3b4VPcTcmblifx9Le1aLrp7dL4hzNuoQ8Vbc+TkJNqKQnTl
         /Oyzt+VsUumALWYZTRi9uQ/cZU6sRJNjxbDSQMaXpxNvBzkcTsm2JFEmhUUbUmFVFCtS
         wxWyU54oS8IWZw7D3RwhZBk+pV60ufzy6mIM9DsP/ioswRy/WWq9NMLirEqBvSUp6Ewf
         FalcAm7T72/kaRytTvv2ipSTIel/3zsfZ7CNzXhd87ifTv4iD7FQE0+yhenUqn2wtFUf
         9KeQ==
X-Gm-Message-State: AOAM530rR4RvAQB4tkTNA0zLXQjD0UIU1FeIfF84n6lXAbUz57GK/MUF
        GfHSRWgmxD8qjudK/uwczZ8=
X-Google-Smtp-Source: ABdhPJyYcn/AxMUR0FkpfPkm11jSx6Ac2qKSh2x9GOKMY5pCizSN87mYC+UhvnRjc2SQDx0JrR0f/Q==
X-Received: by 2002:a2e:7f0c:: with SMTP id a12mr7038506ljd.378.1626231096529;
        Tue, 13 Jul 2021 19:51:36 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id a10sm50281lfb.93.2021.07.13.19.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:51:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] ARM: tegra_defconfig: Rebuild defconfig
Date:   Wed, 14 Jul 2021 05:51:25 +0300
Message-Id: <20210714025127.2411-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714025127.2411-1-digetx@gmail.com>
References: <20210714025127.2411-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Run "make tegra_defconfig; make savedefconfig" to rebuild tegra_defconfig.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 0bb0846265b5..0965ed0501dc 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -20,9 +20,6 @@ CONFIG_SLAB=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_SMP=y
 CONFIG_HIGHMEM=y
-CONFIG_SECCOMP=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
@@ -49,8 +46,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_INET_ESP=y
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 CONFIG_IPV6_ROUTER_PREF=y
 CONFIG_IPV6_OPTIMISTIC_DAD=y
@@ -86,7 +81,6 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEGRA_GMI=y
 CONFIG_MTD=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_AD525X_DPOT=y
@@ -116,8 +110,8 @@ CONFIG_INPUT_JOYDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_TEGRA=y
-CONFIG_KEYBOARD_CAP11XX=y
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_CAP11XX=y
 CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=y
@@ -159,10 +153,10 @@ CONFIG_POWER_RESET_AS3722=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_BATTERY_SBS=y
 CONFIG_BATTERY_BQ27XXX=y
-CONFIG_BATTERY_ACER_A500=y
 CONFIG_CHARGER_GPIO=y
 CONFIG_CHARGER_SMB347=y
 CONFIG_CHARGER_TPS65090=y
+CONFIG_BATTERY_ACER_A500=y
 CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_LM95245=y
 CONFIG_THERMAL=y
@@ -196,7 +190,6 @@ CONFIG_REGULATOR_TPS65090=y
 CONFIG_REGULATOR_TPS6586X=y
 CONFIG_REGULATOR_TPS65910=y
 CONFIG_MEDIA_SUPPORT=y
-CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=y
 CONFIG_USB_GSPCA=y
@@ -207,10 +200,9 @@ CONFIG_DRM_TEGRA_STAGING=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_LVDS_CODEC=y
-# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
-CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
@@ -248,18 +240,15 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_CHIPIDEA_TEGRA=y
 CONFIG_USB_GADGET=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_TEGRA=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
-CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_ACER_A500=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_ONESHOT=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
@@ -267,7 +256,6 @@ CONFIG_LEDS_TRIGGER_GPIO=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_TRANSIENT=y
 CONFIG_LEDS_TRIGGER_CAMERA=y
-CONFIG_LEDS_ACER_A500=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AS3722=y
 CONFIG_RTC_DRV_DS1307=y
@@ -296,9 +284,7 @@ CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
 CONFIG_ARCH_TEGRA_114_SOC=y
 CONFIG_ARCH_TEGRA_124_SOC=y
-CONFIG_PM_DEVFREQ=y
 CONFIG_ARM_TEGRA_DEVFREQ=y
-CONFIG_ARM_TEGRA20_DEVFREQ=y
 CONFIG_MEMORY=y
 CONFIG_IIO=y
 CONFIG_KXCJK1013=y
@@ -339,7 +325,6 @@ CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_TWOFISH=y
-CONFIG_CRC_CCITT=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
-- 
2.32.0

