Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163C7C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378598AbhKZQlD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378603AbhKZQjC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:39:02 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17CBC061D79;
        Fri, 26 Nov 2021 08:20:02 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u22so19728677lju.7;
        Fri, 26 Nov 2021 08:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
        b=oTcerw3jboBSgaI5lBASiQ0+yvoxajfozbWkKUsSmofKDE934IXHDdxNhB8W9inQH8
         Deth1OvQaNwgcuyT1EYOl7z37XeRTOtofk3rfAARsYrFqOpJrZaMP2yWgRj3wWz8rhOS
         c9Dce6wjkImXLFLe+QdB7nP22gzehsMpGLBEEMDo0XSy8AW6kq9BhVWDy3FC77Jlsbrv
         NXnqGvMr1srJooL0mlDZs8j2QAzGmCQDiJde7E6dgpDRF550dE9c1UQxnnqLqUJtU5t6
         jyg7JecYzESPBU3YZ5QeRjpyQX3JKtntQB7xj3ORrmWmqbKeewF4FQ6LCWyGzgfuLizK
         K0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
        b=c+EAppiS65X0fc8XT8Gp/Ek9tkLOj201YnULLo/2ubmWmPJErbxtPfjaERTzBwDY3/
         8TnjrtKx+YiSb21aQeHL55JYRG8hnKFweksnQlPfmDxrBiA5zVNoNp6ZuT4d9hRTIBtu
         QmKpytVaNzXz6a2V38XAwMe+bG3oq+vLHRxySomiUYmkMKfByoyk7G+5feWWCTTfQUll
         WcoyOkyeWoJ+FFrTOrblU2l6ME7i6gn+F5jqKoeOUA9QMsPbkDUBDZ6LlNRaOvJNza5O
         opb3hI4HxJ+vrT0EkE+8GOb9tfMiCqrgQpC4IY6YgtsHtlmpC6p9bseid8Qs45h97J3g
         m57g==
X-Gm-Message-State: AOAM532jcRO1nHf2xLURy0YX+EWyhGxjsdJqf5QsN3LDM268Uj130ePp
        oK9FTewxbtMebh1WhZxlXN8=
X-Google-Smtp-Source: ABdhPJzz5wBDSCE4Eo1QRQj2umu9yNSwj9Kxjmg73qAOgEls3WYa2Hilna7xfBmiFLf2MVj1rIyQ9w==
X-Received: by 2002:a2e:a792:: with SMTP id c18mr32236469ljf.443.1637943601285;
        Fri, 26 Nov 2021 08:20:01 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:20:00 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 20/20] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date:   Fri, 26 Nov 2021 19:18:07 +0300
Message-Id: <20211126161807.15776-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable S/PDIF controller to enable HDMI audio support on Toshiba AC100.
Use nvidia,fixed-parent-rate property that prevents audio rate conflict
between S/PDIF and I2S.

Tested-by: Agneli <poczt@protonmail.ch>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 5b2260f61f05..921a811632a1 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -264,8 +264,16 @@ conf_ld17_0 {
 		};
 	};
 
+	spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
 	i2s@70002800 {
 		status = "okay";
+
+		nvidia,fixed-parent-rate;
 	};
 
 	serial@70006000 {
-- 
2.33.1

