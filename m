Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BA7C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 18:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FA9020809
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 18:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uZNYEkNt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgIPS4U (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727475AbgIPR5x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:57:53 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D728C0A3BD9;
        Wed, 16 Sep 2020 05:23:26 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id t138so7920359qka.0;
        Wed, 16 Sep 2020 05:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JieSo008ZNimyPnuDfNFMyZ7RxemHvUntR3W1emOGic=;
        b=uZNYEkNtTH2A8HbslJhgbZ6lrEgn1KMlUg/Txi4oF+nuoV4FqQscbgHSNbfZVIq3ca
         zhBn0wCfbfUTr2OpkrMukImx7ELJnn1s5vW+acxI7hGd7f3WPDahL0A1RB8POAWQbUdV
         x/9KvY1+kpV79j6JtCg+2vZ6wZARYtqgoaEyZKxT8IX+cP+W8TpyCDHgNanDAwQOJp7L
         G2THOQi42Yaoj26qnJmParUHlZ/CtdaCx7Bqzk7G1Ew1ZDS1oeldqRaw75nPgj6Yb1fs
         TM9s8aZ1APVPSYBCPVmWcBvh/XPrCLQYCwgMztmFrEbU7xqUWUzlBZ8gFM09YC96IoiB
         FBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JieSo008ZNimyPnuDfNFMyZ7RxemHvUntR3W1emOGic=;
        b=jFqeKNo9r6m5BYvWEncWdaJouSSw81LFcWwHFOtmmuVQT+f3fMGlw6AzV/SyaTYUM8
         V+SAnAx39PrzAjn7XpfLQNk66uceIIdeeW7s5NHP10fKSjgFgORBtURM4cm+YPsAvPmn
         2/FM2/o/G/segmnVS4yAEy2Zmn4LUbtjuEYVAU5jeEKepxgzvcy9ChuHHwkoUlmeAwmy
         DwQ5JvTEUl31rMxhi6YbnroK9oTsQWw4Ozj3GhYy7ygNmTJmLSO2n4NN8lkvctpBp3hs
         zHve/YJYJ7pFyVNIe7ChvsGd1jm8Y1DtEBUrSftRDF9upfS7THYbWzX10TPRJwkOSi0S
         WQtw==
X-Gm-Message-State: AOAM531XEIJrESGDv7si1qxA9sNhN9mYSoe/fRNQpV+vZsuoJSFy3eq1
        Gxw5bynxxAQy7TKiBpgbCMY=
X-Google-Smtp-Source: ABdhPJyDv6r98uWEtqhKVo+kvF+rZ67t8Cmc1HoO9PgLfCiIllotkGiizgUUt2wLHvl3jl8V8g8B+g==
X-Received: by 2002:a05:620a:55d:: with SMTP id o29mr22976049qko.12.1600259003957;
        Wed, 16 Sep 2020 05:23:23 -0700 (PDT)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id v30sm19916177qtj.52.2020.09.16.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:23:23 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 2/3] dt-bindings: Add vendor prefix for Ouya Inc.
Date:   Wed, 16 Sep 2020 12:22:46 +0000
Message-Id: <20200916122247.534374-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916122247.534374-1-pgwipeout@gmail.com>
References: <20200916122247.534374-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ouya is a defunct company from 2012 to 2015.
They produced a single device, the Ouya game console.
In 2015 they were purchased by Razer Inc. and the Ouya was discontinued.
All Ouya services were shuttered in 2019.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
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

