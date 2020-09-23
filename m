Return-Path: <SRS0=J1sk=DA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D362C4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 21:04:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 129A1214F1
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 21:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLNORlWr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgIWVEP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Sep 2020 17:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgIWVEP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Sep 2020 17:04:15 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DACDC0613CE;
        Wed, 23 Sep 2020 14:04:15 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id b13so754270qvl.2;
        Wed, 23 Sep 2020 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P1qwmBGYoZJBrt8GB20WX7dYQYlUGJS/kgfWhe9Hb0k=;
        b=QLNORlWr9PEMYQNJab2YtEoUfwJL/gtN37pNTX5uJFFzoYoV/qbtVovjZQ+5P9RQqH
         HU3sXhdtQk8tE1BwV8gD4ny8N1L+v/SJpaQqCHFam3wUXhJSDcyqGVLOn+SRveHIFV1+
         IkBPm2nde3bi+nH3n1IjMGFBh4qib8zAUUFEZGirlUAeyiDrlSAqEX4PSPzZ2F0dw0Sl
         P1pFi58Ylv66whFaQJ+A88+Bh4Py8czAIj2oqhFqsFIqKtev8hMX7D31gxLVM5GZPYA6
         X57txv0YIpf970hBsc2IigjBCsny2YZQ4s1ygtcC1g4uv/TUPrtZNaehxwvKElhVzj2y
         XPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P1qwmBGYoZJBrt8GB20WX7dYQYlUGJS/kgfWhe9Hb0k=;
        b=hnTt0RNmjLnfxP3faK0eArqd87ek/6L/PauetmoI34ITl/a42OhglZMjDALTDneYri
         gNnkkhrCu24xuZvKHIksJBmP8GCD0eqeXFaMq+N518buittexVocYXUVSBWZNFl4GWQX
         VTjtYmoSmSlkLBBe8qYsC1TtURCoe3PpwrOgiP9uVFAZDhJSEDwoWn4fJFDtxfe4FoW2
         XIik2KK4HWmg0drjrmiS5BHVWL1qPLsObQ4DjmOL8piopUw+aEFWaMOuHImmIunXVpVL
         qWU8a5PKbTcwReld8mur6bDJ/aJppeVLhMFNMEdMxw40cYjftZBQoqz0N1kbM6+sXWxh
         +mnA==
X-Gm-Message-State: AOAM532pMulXEiUW5zuJQKDwLpMCIkrCYlGeWxbo+Kp+R7psH8Xpmvvb
        T8b0UmBcDB2b0rLCKLPZ9B4=
X-Google-Smtp-Source: ABdhPJwMjCULOdF3RTxv8tgh85/a0qO+GE2/x6Gr0YiaTBbFSS1wmd0Nrp6rQ8GqHKFZru4Z4qRpeA==
X-Received: by 2002:a0c:b396:: with SMTP id t22mr2059650qve.13.1600895054463;
        Wed, 23 Sep 2020 14:04:14 -0700 (PDT)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id h18sm753419qkl.12.2020.09.23.14.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 14:04:13 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: Add vendor prefix for Ouya Inc.
Date:   Wed, 23 Sep 2020 21:03:51 +0000
Message-Id: <20200923210352.1176386-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200923210352.1176386-1-pgwipeout@gmail.com>
References: <20200923210352.1176386-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ouya is a defunct company from 2012 to 2015.
They produced a single device, the Ouya game console.
In 2015 they were purchased by Razer Inc. and the Ouya was discontinued.
All Ouya services were shuttered in 2019.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9a5ab7b94789..367dd79c95f6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -786,6 +786,8 @@ patternProperties:
     description: Ortus Technology Co., Ltd.
   "^osddisplays,.*":
     description: OSD Displays
+  "^ouya,.*":
+    description: Ouya Inc.
   "^overkiz,.*":
     description: Overkiz SAS
   "^ovti,.*":
-- 
2.25.1

