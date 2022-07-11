Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939A4C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbiGKPkk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiGKPkj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:40:39 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D961D357C5
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jul 2022 08:40:36 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id y22-20020a7bcd96000000b003a2e2725e89so2959275wmj.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jul 2022 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5BZPQuxil+Dv7iLgZiJ6GR0BqJ50yPaoAlBNq1INefc=;
        b=ha2P2Cf45SSEFybH5OyAI/ZPan3MCa/+mVMpnR+ZnyVsjP0ShQEzqP6Rmcofec1+9t
         901eNL6X8JJ5hChWdCKGqFHPcTn4756okeztA/1UaENFTghpKwFmskEhdo2iPqdkIStY
         z5RD9df/246NObqQY4z93q0Xo27WVFDB1xr6t1UnByCFj1StoE3F/JnUeMVhO1mKbRo6
         48TwD7gXr7eA+4dFkBMScMw7b/lBlYghpvDk2rEnNs6eO/CxaXqEF0utCs30YdygLZYW
         cJ1rDOIdw5wiZQMuaDLCxs8wb487pyQXmlD9I5iLF7Oy2lzY+Xp+xSxLeLg+D2j7OV9X
         D6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5BZPQuxil+Dv7iLgZiJ6GR0BqJ50yPaoAlBNq1INefc=;
        b=SJ7LSDAqYWnkQoANC7x+x0ah3f/PvHvP3+QaTRKJG+xJeufit3eWmAvxs6ZuNvdzfP
         DirUe+R2NHUz8iCXL75IqRkOiU/K3iDc/SmjCQ0CJWb/k80Z6Kzg8JiRQg2FQHpdqMwz
         CCL7tjug7u5/aB+BQZuleW3UZf5wq9/AplQ0xsJ3csLbk139e7AMvA6Fq6yHAiMb4uvH
         kyAFRLaxo/sOk4VtfaRk7fY/zMqI8w459CA3LVRSA/debhRhuxEJqqlXdsW4oWImjsIx
         27FenKtfALIDLL7kdnpNhGxOIynHbQSh2WF63hgjptdClFimjEvgyYEO44Q79Sbvq0R3
         ixKQ==
X-Gm-Message-State: AJIora/2nMQF/kfgCjDW+u/nw5DDVt+fZYSWWvZiPEomPXm8fPmaHXJJ
        DJa0K905Rykba0jTBS9vv4o=
X-Google-Smtp-Source: AGRyM1sFaRV+x7i0ZCpNH4X6Npn5J6bXisr6Xlq2orwc4LzvrdStvLAnE9wHaKfj8L+pVLwTfbDq6w==
X-Received: by 2002:a05:600c:4fc8:b0:3a1:99cf:7fe with SMTP id o8-20020a05600c4fc800b003a199cf07femr16358692wmq.142.1657554035321;
        Mon, 11 Jul 2022 08:40:35 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d5906000000b0021b970a68f9sm6020435wrd.26.2022.07.11.08.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:40:34 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Marc Zyngier <maz@kernel.org>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] soc/tegra: pmc: Remove leading space
Date:   Mon, 11 Jul 2022 17:40:29 +0200
Message-Id: <20220711154031.689715-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Remove a leading space from a line that is otherwise indented by tabs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6a4b8f7e7948..0e87fdb90a4a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2274,7 +2274,7 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 
 			/* GPIO hierarchies stop at the PMC level */
 			if (!err && domain->parent)
- 				err = irq_domain_disconnect_hierarchy(domain->parent,
+				err = irq_domain_disconnect_hierarchy(domain->parent,
 								      virq);
 			break;
 		}
-- 
2.36.1

