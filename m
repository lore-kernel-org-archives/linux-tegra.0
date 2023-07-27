Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF17BC001DC
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 14:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbjG0OdG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 10:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbjG0Ocy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 10:32:54 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3DD30DD
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 07:32:51 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-992dcae74e0so135067866b.3
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468370; x=1691073170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0PIxTpKMJWAbGnUBIprLmE7vyufivnhYtR7ksqqkN8=;
        b=hCnbjDPIcCiVh8TUZlcvOQfQGVj1ymLhxatIMnFaHitM3KjFZoTgl4JwTCsM3JnDtS
         jZroyzKzBkfyz8f6BD5aYt8gKiryfDi6YqznidDnJ8+Xa32/c3tD3yg1rHZb7/q2UJdG
         Xe+sCiYBjDMpnxpe///fcOToM1+9qhSamNwdX0u3QcD/JitFEoAkyVAovjGzEPcCA3Pr
         2UimcOyjBzd5AGOKgscwU+DT4YEms348ufwqY42XKQIyFoNCr6ET2M0W9zIUi4Ht7z/c
         ANagKlH3Mq+D8zi++aMAT7DANBXKahlSLhQCMKOC6wEEli+GKv894NjWgGzOHnWsZZDy
         iWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468370; x=1691073170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0PIxTpKMJWAbGnUBIprLmE7vyufivnhYtR7ksqqkN8=;
        b=axX4RpO0Py3loz67+rqPjNyS6xE8adowrk0hftOlFK8S3I3HuSMtODFmJtPKpYhmBA
         moAfqKQerJz7Kl/DQNuyjCDyqECQeTBrYqkSfPcWMjNJqkJjDWxHXPKBfn9YmcmxpFiH
         B4JX1An9HfXPghBF8wle2ne+UYtUDnzHRLi7OHAhDhgmpLPhzDPOEmpAd6y5OEv5mXJC
         z+O9GjQqOjjavrYLZF65PIFHhzkcCdyV5od/u0xdHKGWzZ8KQvM2aKtGOjfBn2QC6Y69
         l6z1Qyi7tdmf6Ni+MXceESF9tYhhEWJQDYNF2RAKCfaD8i+IEYPd4a69ITwIDXrZuwIb
         qAmg==
X-Gm-Message-State: ABy/qLbBKaJcTrgxWTMW3zmhsNzj7z8O6IAszk2f7KYKozYkGVTOzKQ2
        BhlpgpDBpAn0FD/tlrFqVPqpZ4NTsb8=
X-Google-Smtp-Source: APBJJlF2qXbg1qikNI1v/m0Yis4MUYiG/8VPxzEXO30rojaD6bEPDBIG/MmJgx+fVs3rLww6DLOwIQ==
X-Received: by 2002:a17:906:20d5:b0:997:e79c:99dc with SMTP id c21-20020a17090620d500b00997e79c99dcmr2368668ejc.74.1690468369520;
        Thu, 27 Jul 2023 07:32:49 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f19-20020a170906495300b00992c4103cb5sm834611ejt.129.2023.07.27.07.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:32:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] soc/tegra: fuse: Sort includes alphabetically
Date:   Thu, 27 Jul 2023 16:32:46 +0200
Message-ID: <20230727143246.2749936-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The includes were slightly out of order, so sort them correctly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index eb0a1d924526..da970f3dbf35 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -4,13 +4,13 @@
  */
 
 #include <linux/export.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/io.h>
 
-#include <soc/tegra/fuse.h>
 #include <soc/tegra/common.h>
+#include <soc/tegra/fuse.h>
 
 #include "fuse.h"
 
-- 
2.41.0

