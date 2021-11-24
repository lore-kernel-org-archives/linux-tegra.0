Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8868C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351024AbhKXWKS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346229AbhKXWKC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:10:02 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E2DC0613F4;
        Wed, 24 Nov 2021 14:06:48 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id f18so10965777lfv.6;
        Wed, 24 Nov 2021 14:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
        b=RLjzrUjM8S5jsmnXNKx086PozjojEBgI97mJK6oNkLYNvq5zuxlJFBR2ySrncrjDNl
         4fxT/3GbaHGiMRVauMHpM4xrS7BHKf335Xrt6kY3wHT9kXIsGvQC/dRY10guNJZDSYIe
         Sx9KJEqojbSiq7Aj2iwRmWtyZV6F4eVf8Cm6grpDZxrA6qVSDkhC8sWYz9hSKYVHX+Xd
         lknPSpO3sBMUZ+hGRcHV2ACFC43qjFCQGgx5Ov68+pHr8LRe6wkpriZ8zKdZZjmOk4nh
         5Zo37iV313OGLMG6DhkuZ6Yw1YPkSKKs05Tqr2seqt6jFoPf0QXLZnfFAfuitDlvsrhE
         B9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
        b=lE7/lG4sGASU4bEW2IrOh1ZHaaGubPk3ckwZDp0gYDGkE/BYzoGp/nscBi3adE+mIe
         PavFYIWvFehTK22Y2LsjBpE0Gd1lOJcaL087KG4P1yJU7DNQgpehGljrXz+WRw5Ildu4
         LiDxTtjHj3nNhHC16iLpKqRvudgZPXL5PNsG9Smh3o4itEBH//G94FuePQPyv9bd3JcC
         Zh9qnMANll+9FMdjXZCbcjItZmj/zvCgAUjqzvK+7+I65Shb+Lrb4GK0fcS0A5k6p4Ow
         7qbCT4Bs5UeIOrRfBepKK88EpjE5LZjuH1Pu/Pol6Fbq5Eu1ixsR3zfCR9tJzg+WbWT0
         I23Q==
X-Gm-Message-State: AOAM533UC/SdktaeAQV0mqf1ExZc3E4gNsLAEtLOynfo4C3yw3ixg06O
        9uBhVSoeziNnudPqpDSp3DThQ8ai17U=
X-Google-Smtp-Source: ABdhPJyIUhRHjHnojCL+ENORXllGnFFyQb8ITUY4N//P9DJOrpX//870vLxvAdYWiBUcVX7wb14qhQ==
X-Received: by 2002:ac2:4e89:: with SMTP id o9mr18872451lfr.384.1637791606935;
        Wed, 24 Nov 2021 14:06:46 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:46 -0800 (PST)
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
Subject: [PATCH v1 20/20] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date:   Thu, 25 Nov 2021 01:00:57 +0300
Message-Id: <20211124220057.15763-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
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

