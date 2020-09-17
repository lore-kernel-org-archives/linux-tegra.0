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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E35C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F0E02087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHzBhL4X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgIQKIR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQKIQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:16 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C18C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:15 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l9so1430689wme.3
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qrn7b+MOmCjaswJwbEHikp8iIF5tP9q9Ey5OOh70nqo=;
        b=hHzBhL4XGERTFlv5l3QNe9GKr4RrsW7vwxN1E0NNOVOhrDpcKLPgGbw2NcY+mY6NrJ
         HDozqkJmBbjJS6UY+m/sn7PJRhnszJPzigHXwOQL90rTX1SIavpo51/Z7yHFtA1Q5RyY
         e2ZEJR6XgSi1IHv3CVJLt6Ll13gfULTkUCVg6FZvfyVYgk3fH/cRp83SejhDLpadWPCy
         khuyjebWnkCXwbyVb2ahd8j1mIwmw5IaR1+ao/Z6eAO3yYP0YKZzfqCahxpQnYkOuIkp
         XCoV3U/m8wOLGjChWptkahHoCWMZTyuM2nM5Hvrq6iU7m0neSKwe1nyMkKymDhsP9ske
         KZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qrn7b+MOmCjaswJwbEHikp8iIF5tP9q9Ey5OOh70nqo=;
        b=JPpY8vlAHyAnuLdt+Etc5KvC/q/VdfF5jMEDkvRKm13DsqeeJMiHQ2ZOFS+HNfeJva
         shAyjcIB9iQOvD3wC15vYx0aTQ54TjtVd8yl1ufeeH01kCMBq+mlHzQ/nvioxNfouR5i
         XTxS3qa4TZCrbqcPcRMgA8A+yiYmDPI8pfWhYzlgKNEi+/sLBMZVpQMvCRseKSN2SSX2
         YopSHIaDIt64+4RUWCt8O4TPhdZeXJyiv/0xFAFzLwGK848t5JTMFZDcGytKXGbJaSKf
         I29SUssMn1roSyO9ELkjHOou7dQXghy7gP0kur1ej9gqTABajEgqvOQ18ChoMqScVMW+
         /x7g==
X-Gm-Message-State: AOAM533HWsx+oztE9G8b2WRG2P8kOMPY2vswtqGwPR/GpUjq4BvyFpce
        DHWfsllMSsI+S49G9AZh/wc=
X-Google-Smtp-Source: ABdhPJzTQl3eijE4q6pS+i24cO7Y0sJpKv9y4o4TF25bRozye8lI7JVyBwKc3AyRAnKjItEsn7pSLA==
X-Received: by 2002:a05:600c:2183:: with SMTP id e3mr9712415wme.49.1600337294198;
        Thu, 17 Sep 2020 03:08:14 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o16sm35942420wrp.52.2020.09.17.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 06/14] dt-bindings: tegra: pmc: Add Tegra234 support
Date:   Thu, 17 Sep 2020 12:07:44 +0200
Message-Id: <20200917100752.3516153-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PMC found on Tegra234 is mostly similar to the one on Tegra194 but
supports slightly different I/O pads and wake events.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
index 2d89cdc39eb0..576462fae27f 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible: Should contain one of the following:
   - "nvidia,tegra186-pmc": for Tegra186
   - "nvidia,tegra194-pmc": for Tegra194
+  - "nvidia,tegra234-pmc": for Tegra234
 - reg: Must contain an (offset, length) pair of the register set for each
   entry in reg-names.
 - reg-names: Must include the following entries:
@@ -11,7 +12,7 @@ Required properties:
   - "wake"
   - "aotag"
   - "scratch"
-  - "misc" (Only for Tegra194)
+  - "misc" (Only for Tegra194 and later)
 
 Optional properties:
 - nvidia,invert-interrupt: If present, inverts the PMU interrupt signal.
-- 
2.28.0

