Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6102C6FD1D
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 11:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234459AbjDDL6Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 07:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbjDDL6V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 07:58:21 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440C630FC
        for <linux-tegra@vger.kernel.org>; Tue,  4 Apr 2023 04:58:20 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ek18so129561937edb.6
        for <linux-tegra@vger.kernel.org>; Tue, 04 Apr 2023 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680609499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qUaOa2uX1gKDWpiZadVZORgyny6GtQJAOnTp2fBPDE=;
        b=clVFHpwrwDMHPqPS9Wddw/GxlJyM4PUazm0Fmj/TVQVELl/cUjgKgg8ZGdwwDpIsYz
         tZbPk9VTciPOsM3jsEUdCxhbN233xzE8vxov6EBAwRKM0ZCKHQWB1+ylP2Hehu/upFlh
         VMn2jfZM75Fgi3p1Ss9vq3zPZu6jZuNlKl9HoD1sClJkc6Y+CE+Jm/D4bkOIDo64/b1K
         r7ryHbwU8EIZIAm5KInudcClM3JM2xjDqu+5IERx5JMUQ/+K5K6cuTgAI9BbPtyOJTtp
         aNS0wkqsAZ0xXeHXXnKcmAT5drAksNYwoPKIT6e+XaCidMmxoUDTlnGiH3yXG8vUBpEG
         hxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680609499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qUaOa2uX1gKDWpiZadVZORgyny6GtQJAOnTp2fBPDE=;
        b=RIPcfnIpOGLi9Aszh6/l50D1TN+KwYPU7LbOJipQKKDTfQtZsMdNxH0Xrn6YRWR0a9
         /13JxnTTfFyfdyMCMMAcTvneRJit/zXGWPBrh/7bBYmpIhd1z+haIhCknavy+MwbGkEA
         7EkdcwG9ks3QhpfIhNQBjmCEUanBr/ZKtIKlkwsFBSRDguZJiSc7bT7sFC/bUp8EhkRV
         jcSdc4uVMXYSD1TfhMQe6FiuCHPcGUs6/xVLjW+brVWYvyvI17+s9y+TvkjdexE44YdS
         HgVmhOEb+Ee2EPxx4Qz26pTNYsoovpl5emZm/cVL1OvQdqO0ehmYooIsj7VI2FvrAu1P
         oi/Q==
X-Gm-Message-State: AAQBX9cujTHzTivIrkrxA+SQVF6ePK2kMRyS1j4XM5REiw+XUomlU144
        aoEJq5M0t+muU4A5SOEFvz0=
X-Google-Smtp-Source: AKy350Y9toub7VBZMdCkxwbC6TjPoCY4ZkUxKfXrPohSqWAz06kxohADFXZsOAqT5dahuy8ImUP7wQ==
X-Received: by 2002:aa7:c259:0:b0:501:d43e:d1e5 with SMTP id y25-20020aa7c259000000b00501d43ed1e5mr2353060edo.2.1680609498594;
        Tue, 04 Apr 2023 04:58:18 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s17-20020a50ab11000000b004af7191fe35sm5818223edc.22.2023.04.04.04.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 04:58:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add Mikko as backup maintainer for Tegra DRM
Date:   Tue,  4 Apr 2023 13:58:15 +0200
Message-Id: <20230404115815.2052620-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Mikko has been involved as the primary author of the host1x driver and
has volunteered to help out with maintenance.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bfa5228d1ea..0a517baef16e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7047,6 +7047,7 @@ F:	drivers/phy/mediatek/phy-mtk-mipi*
 
 DRM DRIVERS FOR NVIDIA TEGRA
 M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Mikko Perttunen <mperttunen@nvidia.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-tegra@vger.kernel.org
 S:	Supported
-- 
2.40.0

