Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24910C43463
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 07:42:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3F2E2076A
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595576555;
	bh=FgOxaXut3KMNgsxRSkJGLlmDOsLTEuccL9YQdrk1EKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=095thw3Hh1x/6tkBJS7pR55ljWQRJ4zmpAwk5aym+M16Qs/OYwm0HXBlYO7nqTQZ6
	 57qrEO7Q1nw8e5K9mB2X3Y0Dwo30X5Da/nV2uyd6j0cMw7Ui6ytyUF+JO/rEH/wtEx
	 OddpB3+89jiTek2HTyWa38Zpfp+KEFgn/K9jeYEc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgGXHme (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 03:42:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:36338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgGXHme (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 03:42:34 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 370242074F;
        Fri, 24 Jul 2020 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576553;
        bh=FgOxaXut3KMNgsxRSkJGLlmDOsLTEuccL9YQdrk1EKs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jfXZfekvKtnfezKe0L5biigo+3u1XLWKCF0LFLhzaROG3Lj6dIEEQ7Noe6GgTFMVa
         HKPWZYqlOnNHqk6D092qoQQMckyQ8OCvtuN+gqAY8YtiZPpGPoKyTYCDnHGMLc0eg4
         QW0R43G5pmqygVqFxOKeliX4OYNwfcyRYdL36AaU=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 17/29] memory: brcmstb_dpfe: Constify the contents of string
Date:   Fri, 24 Jul 2020 09:40:26 +0200
Message-Id: <20200724074038.5597-18-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The string itself can be made const for safety.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Markus Mayer <mmayer@broadcom.com>
---
 drivers/memory/brcmstb_dpfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index 82b415be18d1..5942380f343b 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -188,7 +188,7 @@ struct brcmstb_dpfe_priv {
 	struct mutex lock;
 };
 
-static const char *error_text[] = {
+static const char * const error_text[] = {
 	"Success", "Header code incorrect", "Unknown command or argument",
 	"Incorrect checksum", "Malformed command", "Timed out",
 };
-- 
2.17.1

