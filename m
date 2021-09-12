Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9BEC433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 16:52:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86E4E61076
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 16:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhILQxu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Sep 2021 12:53:50 -0400
Received: from ixit.cz ([94.230.151.217]:54866 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230158AbhILQxu (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Sep 2021 12:53:50 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 3600F23B26;
        Sun, 12 Sep 2021 18:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1631465553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yC0D9CrqiJDjXzrYXSzEu64en0t0j58CW742XHzjffM=;
        b=0AeqGYeL+Bc/2dlR5wM7YZmnsC/N7AVWUb/+kcwf++HDOwcE3FozJZswvUELL6442sh1HE
        4lDeoXW+OEWYC+j2S9aFpNrb5Bz/LqQ5B2qU8a8cF2+ceVX7/fD5VaFu5+PG1E77HeI2Qj
        a+AbMZ5SaoMcbNrISFJzMf46j80rj2U=
From:   David Heidelberg <david@ixit.cz>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] dt-bindings: arm: Fix Toradex compatible typo
Date:   Sun, 12 Sep 2021 18:51:20 +0200
Message-Id: <20210912165120.188490-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes: f4d1577e9bc6 ("dt-bindings: arm: Convert Tegra board/soc bindings to json-schema")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index b9f75e20fef5..b2a645740ffe 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -54,7 +54,7 @@ properties:
           - const: toradex,apalis_t30
           - const: nvidia,tegra30
       - items:
-          - const: toradex,apalis_t30-eval-v1.1
+          - const: toradex,apalis_t30-v1.1-eval
           - const: toradex,apalis_t30-eval
           - const: toradex,apalis_t30-v1.1
           - const: toradex,apalis_t30
-- 
2.33.0

