Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD21C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7AB3208DB
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUJMp2HS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgIQKIK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgIQKIF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:05 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D59DC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:05 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a9so1435466wmm.2
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9SOnLXMYGWEmAszlwx/dtkJXl4pCAVxRgqI/JLE79jA=;
        b=TUJMp2HS7DtqZquSsbfNOAHKSzEun1xe/4YD9QtVdaaZuUhMiTMf+Fm4XXFpQO7eNP
         3sXQ9AAh6KuSQKR4RRLpVgH/EUuK/vMviOST9qAsOC97MlASg6PslJ0gnp7Ps1Nbkzp9
         KeyyMLH3Ra+L9IoacqD+8ingp54Vb17iFawnPvMfrFTD0iscUhphiVHYOkPfpDZIfwgu
         Coq8bia065UPTssxtPd4K2P/KeoQVi04LqsxwqV54rivR/9lOVLDTgCwrUed+8/8OY4c
         LgMcIpjYs3Cg4eEJK2MPA5ZTFvv6yZ3YvRqjCT4Pdd6o2Yi3gMYsA8cUSV6VVae4SbeS
         YLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9SOnLXMYGWEmAszlwx/dtkJXl4pCAVxRgqI/JLE79jA=;
        b=ZgNtIUcDQponJ6QDvD9G5BliLJYNpMABKr918HqP3wVQFeQ832exPUrxXbJsRVXPpW
         a09ktv8kY0+Xm50KWYRzMmQ6M++T3JnVLNI9ywC6TN5Ae06lcmOI6N0XQ1v3lBnDDeK4
         FMJKNcTAzginQbpQH1+L2/nq/qQS4RJqcftxt4NwaKpdUxqvYv3/Ipcbtt6fzbVoM1tF
         SwND5UNoT16UowPV/MmNtAvOdY5ov/hjLyw3ptyIdMQB4i15Ujw4RWFjP8S6qDQrWloY
         D0Fmeo1pvGK2OYBesvTUK17R+Ulo0aQjqxPlyM4tNMei22RQnmZIOOKbfiKHeAPX06rh
         u6tg==
X-Gm-Message-State: AOAM5322NZoM1CFSZUZ1hSqt0Of8NxrrH/mdHk7f8jGEDvhXJ1/SRgpY
        PGzARSbqAnfF9RdopJx9tRk=
X-Google-Smtp-Source: ABdhPJwd2UMu5CUafGzYRdftZI00s1wk7UBAsiZxoMhny5MfOqhZMx+gIgCM6Hy0ju/P7JHDLVMK3Q==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr7158586wmc.144.1600337283771;
        Thu, 17 Sep 2020 03:08:03 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k22sm38824704wrd.29.2020.09.17.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/14] dt-bindings: misc: tegra186-misc: Add missing compatible string
Date:   Thu, 17 Sep 2020 12:07:40 +0200
Message-Id: <20200917100752.3516153-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the missing compatible string for the Tegra194 MISC block.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/misc/nvidia,tegra186-misc.txt      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
index 892ba4384abc..111dfac70ea7 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
@@ -1,11 +1,12 @@
-NVIDIA Tegra186 MISC register block
+NVIDIA Tegra186 (and later) MISC register block
 
-The MISC register block found on Tegra186 SoCs contains registers that can be
-used to identify a given chip and various strapping options.
+The MISC register block found on Tegra186 and later SoCs contains registers
+that can be used to identify a given chip and various strapping options.
 
 Required properties:
 - compatible: Must be:
   - Tegra186: "nvidia,tegra186-misc"
+  - Tegra194: "nvidia,tegra194-misc"
 - reg: Should contain 2 entries: The first entry gives the physical address
        and length of the register region which contains revision and debug
        features. The second entry specifies the physical address and length
-- 
2.28.0

