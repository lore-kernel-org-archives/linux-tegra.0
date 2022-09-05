Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19738C6FA8B
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 16:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236123AbiIEQdY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbiIEQdV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 12:33:21 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBA05C96D;
        Mon,  5 Sep 2022 09:33:17 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id lx1so18050775ejb.12;
        Mon, 05 Sep 2022 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=R/yzLKhstrQ0xuNqdI7CQxffVFlTJqRQoTH/xpLP5OU=;
        b=HDUsN9A3LfTPf3YIRADcz2R0FithZkh3c41sWO7FC9dkLdUOH+ieYkK6U96fbkzQtW
         D+zsGdXNM/YcdTCyx1Bo5ComQeLzLAgEa7B9uZHR/qLJZx34wOipzJSWxfDKKeucEGSp
         M+Tkb93JL4QbVjIQR+KtQNeK3MXyJwEivUiTPXQU7roBJR4fkKbyfTk1VT/D63yl1pF4
         6B0Barl6ZVHJaZmDk33Ne344y31J6t57Q7bMphWvn5u9qOb3/81Oia63CV+o+57rljx6
         pihUEfecNDlNJbQvuOVsnQuFprgjw0S6aNirRzFbrRYxh0C4vhTAMo8Cq//uGsXQzzde
         vSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=R/yzLKhstrQ0xuNqdI7CQxffVFlTJqRQoTH/xpLP5OU=;
        b=6Ang0ItpN9Ks/wRNyYNirLLtL6jKwuiT0Fkq9U6Hrw7HncC73L72rIc4A70IErKKFZ
         ijkpy6IuOHpJ/2vjP+6U3GLZ6iW60629O5qundqJ5T6lcNmKlogeN+xkgnTwoorgMykE
         QgIAEkJUPcbptESDUtLquwVyzgAMPll3/PBUDbM8botlOkcBqVewvmb/ai/dyFfY4tav
         7XEEoQN7Fe5EYRyvaZSzI8PxTdTZYRmo+P0utw42KLQ4Mmkf+xXWK7MxP1jscMRVOgnV
         BbmUz4nvd++4o1RFqZoXc9F2ZjXHoQ5p36VOvR8FeYuHOVwGp4OtWDhalFWzlGwjdXi5
         4E7g==
X-Gm-Message-State: ACgBeo0GoiaXVuxWdrjsWaE7dR0UBoXdNXrgvAP/ye3p0dfZ+dfe9J+u
        4F7WmMZMwUrfNNXSJ03VS1M=
X-Google-Smtp-Source: AA6agR5BBZuXs7pXLimDyLExSj1si+XQzJdO7LmmaCvaRyKgfPjpIyndggLcnlfhtm/jHZRjYtcEhw==
X-Received: by 2002:a17:907:980f:b0:73d:8e27:7779 with SMTP id ji15-20020a170907980f00b0073d8e277779mr37852958ejc.205.1662395596077;
        Mon, 05 Sep 2022 09:33:16 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id er20-20020a056402449400b0044d6c6a5b5fsm4263709edb.89.2022.09.05.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 09:33:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/6] drm/simpledrm: Support the AB24 format
Date:   Mon,  5 Sep 2022 18:32:59 +0200
Message-Id: <20220905163300.391692-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add AB24 to the list of supported formats. The format helpers support
conversion to that format and it is documented in the simple-framebuffer
device tree bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 16377b39f012..7829a12ba3dd 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -563,6 +563,7 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 static const uint32_t simpledrm_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB565,
 	//DRM_FORMAT_XRGB1555,
 	//DRM_FORMAT_ARGB1555,
-- 
2.37.2

