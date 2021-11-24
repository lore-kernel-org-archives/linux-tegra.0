Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824B4C43219
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351959AbhKXWKH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:10:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352139AbhKXWJ6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:58 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97CFC0613DD;
        Wed, 24 Nov 2021 14:06:47 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bi37so10959013lfb.5;
        Wed, 24 Nov 2021 14:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
        b=HOHh27+H2jtaXVi+1wHU1itSTfNFFWN+qdR8CcjckuXtJWHLt/NplZ5GAdnAH7BJId
         fI+Dwhmyo81WnvPtsdfSqGNOJOfmy8o72YdcMFkQCqSxcf7Q2aAm7QGGUwpAD9cds28x
         uv6I4YN5rtQFr/VApnqDY14AwJ408it87uIMgAAnRjX1E2NZV28I+kc7aI39PKKJQ+eh
         GdXXJ26g31PW5sOwYPAviPnJe6TLKhty6Snep3IldzHGKeUHSb3qo4OwEqnaF9HRseVP
         PtFb22WftdH13Yst/Ud3U+ojlNVvQtcHyVp4KS6jrE32NZl5AfVFUSwkIp5d0HGVbolW
         yFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
        b=I8ePy+mKS8cHOKYoFHyh8BRvi8FoVp4Cll7ttmgCghRNo0amZi2jdBW5xQ2pjD3XOt
         xZ7Iy1qaz6XLK9Npk8rT0bD//PNaSGHro6fSHoHLMMm5AEPdK7kc229hg9IuxXFF9nyY
         ZFletdhoe4NkcVjKI/nO3l2D/Jadp2j/JTKPMhkX200Wj0OzWNEO53Gcblw9QNG4EKg7
         iuxC94VR8MR+fUWwB3w6VFAM7vTiKvffWV2u6Wde+nc7Sz8YoNrWqz1bW5kE3YfEvbHl
         KRn0SMG+ghEFKdC8ipJx/geCkPb4bNkWa+qIZfJqNqO0ow961f6r/1//Sd9eMHMGcyUb
         zOgg==
X-Gm-Message-State: AOAM532HZAhUG+7VIh1rWasZbapNXm+rz/+mNkapWj2J5WOiBP9ELwnZ
        uhMwyb9wASQ2cTFL+m/td90=
X-Google-Smtp-Source: ABdhPJzmz2JI+oXafYYQHLzUOXd2AKTrSiYF3p2dJHvQqPMl1kXR7yDugyNVJd0nfhS7swYv1UQ6kw==
X-Received: by 2002:a19:dc51:: with SMTP id f17mr19510257lfj.555.1637791606149;
        Wed, 24 Nov 2021 14:06:46 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:45 -0800 (PST)
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
Subject: [PATCH v1 19/20] ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
Date:   Thu, 25 Nov 2021 01:00:56 +0300
Message-Id: <20211124220057.15763-20-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable S/PDIF controller to enable HDMI audio support on Acer A500.
Use nvidia,fixed-parent-rate property that prevents audio rate conflict
between S/PDIF and I2S.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index db388ddd062f..f47b946627c3 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -376,8 +376,16 @@ pta {
 		};
 	};
 
+	tegra_spdif: spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		status = "okay";
+
+		nvidia,fixed-parent-rate;
 	};
 
 	uartb: serial@70006040 {
-- 
2.33.1

