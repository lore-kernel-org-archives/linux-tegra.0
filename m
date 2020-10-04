Return-Path: <SRS0=Zq/d=DL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9C7C4741F
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 13:35:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 979BE20759
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 13:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/iwb7th"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgJDNff (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Oct 2020 09:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgJDNff (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 09:35:35 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7897BC0613CF;
        Sun,  4 Oct 2020 06:35:34 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id d20so8704994qka.5;
        Sun, 04 Oct 2020 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P1qwmBGYoZJBrt8GB20WX7dYQYlUGJS/kgfWhe9Hb0k=;
        b=B/iwb7th41XUZbFp9C/QBF59CVdSHb405YdmlcDw45dcFRrH6sKVTyu4AqmdVGT0I3
         TlwifzF9l7mnw48r2LcLKhQAtSNq3ZIskPu0YjLiON615uWhUFTeIPhHwVavSSbpj8gp
         //jP/zZhCFgE3desJZlsfY4BTcrpK/EV6kj+9SUUW34AjsiQaQPHIKY9LdU1I8pnQgWS
         PUJUNy47LHWJiIhZlcPWg2bEFT6xLDn7tsBpmu8KpWAr2q8uV3pMORjY94rMHa2Y13Xn
         uSfflhOZVySYsWiW0gdF3pegZlvpoZJQlgBh8hK/1g3+Nv3vwnMD2Bqdn/rc5nVmzGHu
         qAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P1qwmBGYoZJBrt8GB20WX7dYQYlUGJS/kgfWhe9Hb0k=;
        b=f5SEX1UYiFFO/f8XEGwW28KakWN8irzKfbQSyIVK5wtdcJ53b/vkY1fY35AvBS5q2M
         IaUupgeHK1L/nNv3yvVB14KcEQNB0f0c1eRsMs4Ue5chNjNQ6m5LyTZFRwOVHU5ym1fI
         DO2EmA9JyhK7Or4PLr347gUt5CuVPClEtDQDVIcQjJ/2QZJ68G4xOO+BQruEbnoLAPe3
         DbmRLr0KdZTo1g6PT2jXNQt2yZicgb8sIjrLFch8Il1ClL4FWIMyqrpJCKZvQWO8PeRO
         aez2eNqgLkalLdw3yTTZSroUpShFM2/sf7wBNJrZ63wVQxZdnXYcG+xWCA7WBtQ23AG0
         R2uA==
X-Gm-Message-State: AOAM533KqGpGKySR9fLkOFZmo8AWR7NuoxLtlkCooVnSw+dfUG8h/i1O
        x0cywexmCD1XnNx6y3un6EA=
X-Google-Smtp-Source: ABdhPJwsjrgcS3JdaATE6xaYHSUMGXBGgUtMZNxV+n4nfXmcTbgPKk84Kq+xqF/rffT5ZOYUjUef5g==
X-Received: by 2002:a37:9b42:: with SMTP id d63mr771778qke.49.1601818533398;
        Sun, 04 Oct 2020 06:35:33 -0700 (PDT)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id b9sm5539369qta.39.2020.10.04.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 06:35:32 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: Add vendor prefix for Ouya Inc.
Date:   Sun,  4 Oct 2020 13:31:13 +0000
Message-Id: <20201004133114.845230-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201004133114.845230-1-pgwipeout@gmail.com>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
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

