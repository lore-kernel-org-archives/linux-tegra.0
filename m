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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4900C2BBD1
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E33E2083B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7s6VX7x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgIQKIK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgIQKII (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:08 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A399BC061756
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:07 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q9so1391246wmj.2
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yzDyavo/0wiA7VQrCMlOltEtuSoQo9iwyahPJsjM92k=;
        b=m7s6VX7xOas41kCUouVjr3Jdn/xj0WF/hKRRfyCWiUMICpFiJJa+8ijnSB+4kEKloy
         8SWUHylrmSRp5SgSMY8/XJ0BozUYpAURXBudEle64gb0Ta27rCsUAdCm0X/dGnS9hfU7
         TQCWHd1mwPZkO1sVghd+JE0QKkRV0IBxxvNXlVitccALv6sHrA/xLOBnbmtdDEaDi6VJ
         lb2IW8zuxFIxzYreyeM4a34v5AcwEFEU3d0xxLg/Ou6g+9CGGnztkwx1nh/wuviJjzki
         Kg9+ygOgQneWKyrznLcfLVX8PsQrTtl3l0Zmmt4/A3JPiuc6a3g9qAtuR2HmbVYi9+dP
         U2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yzDyavo/0wiA7VQrCMlOltEtuSoQo9iwyahPJsjM92k=;
        b=Ez/A0Mcg6XUI+W3lsni98otKiFE749FvHB/NQdPw9OoaUNAlkjPbrQcR3RWQEyLfdX
         VD1TLleUcqZyRY9Pgtmh6Mc3SIpTL15mWsIYa0kOCOIfnr/85e7FMcBcrqY5PoHn3SYQ
         xqcpsB9npt9nLcprLMY14N52tQZm/hPKYeIKSDRPJibnEIU3u31tC96vutbFKc9pGLTF
         Hf9vTnU9HWZ84Vd9aU09ZJiye3cU325wL0HorXMGeWNs5pSY98WkH7hPjEL3FivGqpEm
         8L5jyTqdcDzlbFu7XJ543gItSo68r/aJ/1FBmm/q3HwNo6s9f0PxJARm43CZQIIBT6+r
         rhqQ==
X-Gm-Message-State: AOAM5310NPVkayKJb6FH7ZazQyBR24vT7tO3dvY8nJlKb+xbuDIayasA
        B+Wrmvnxw9bas02aEvL7iCU=
X-Google-Smtp-Source: ABdhPJxIPhicBdr+i37QjporTqES3j0nrKfVtYBEXn8glNNlpDpOM4mfFrfljFgacQsDSyEk1cN4GA==
X-Received: by 2002:a7b:c44b:: with SMTP id l11mr9012514wmi.52.1600337286341;
        Thu, 17 Sep 2020 03:08:06 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c16sm8826084wrx.31.2020.09.17.03.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/14] dt-bindings: misc: tegra186-misc: Add Tegra234 support
Date:   Thu, 17 Sep 2020 12:07:41 +0200
Message-Id: <20200917100752.3516153-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The MISC block found on Tegra234 is mostly similar to the one on
Tegra194 but supports slightly different register sets that make
it incompatible.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
index 111dfac70ea7..43d777ed8316 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
@@ -7,6 +7,7 @@ Required properties:
 - compatible: Must be:
   - Tegra186: "nvidia,tegra186-misc"
   - Tegra194: "nvidia,tegra194-misc"
+  - Tegra234: "nvidia,tegra234-misc"
 - reg: Should contain 2 entries: The first entry gives the physical address
        and length of the register region which contains revision and debug
        features. The second entry specifies the physical address and length
-- 
2.28.0

