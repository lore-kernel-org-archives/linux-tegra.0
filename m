Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D642CC47082
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8B3A613F4
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFCQsD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:48:03 -0400
Received: from mail-ej1-f54.google.com ([209.85.218.54]:36854 "EHLO
        mail-ej1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhFCQsC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:48:02 -0400
Received: by mail-ej1-f54.google.com with SMTP id a11so9513895ejf.3
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3H7kBWayn0qcK+eEtFN4Gu4RL12HhriWydsuWv48WfA=;
        b=o4IqvhKmUTIACSLrHJkEOSt7oTgtqvG/5HrLn07ZKa/OaEDSkMZG1avPxUQIqkmSR2
         bMekXpKSxwLV5vBgVHXMMKfqKts0nYqKYr6++YN2Uu3RZhoGLAszF1n8GPSEp0+xw/rR
         YrUh7rAsahyaI4EXC0sg+2A41hl6TO48aoKc9kF8BmKyNe2N2fxXeg/DQ3Ropb+hs57x
         vhxlhNZGTtGWACKXALSHj6RaxA+EVVXU/V8Pgd1cGfdxegdLKhOE52tu8sgK5+ugRWvu
         JB9rmXdWgOLD5XhTYEviQ6wycyLOK+4NSMZzAddhIBGFI6j97mOg06v9cEgWvmLC2CRl
         JmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3H7kBWayn0qcK+eEtFN4Gu4RL12HhriWydsuWv48WfA=;
        b=gAUN8t6Pq0exsBsXFXBvQr3RawsgXQCMiLMTWfcuvtn6uc80vF1fUQL0E3NxvNxdjH
         Vw/V2Y9Z+IFbyFswCb8P3IEaXt6qq8sVDjchn41E5J+MJokKi7wqiEzqQ80Wl6qBzskC
         oV+NX0XygG2U8XxyMTWLqjGENXzN9EHIfOvbs8eBCYtTc28OdBuR9SFvC4s4cPj5k8QD
         gyCGX8t2OIvJQG7Bior+UKHk0jubAo+r+D15cC6MLlRN2QoOMIffzxS8PRaj9Vd49MsJ
         BLlLaXp1zy6l04H92qtwMoiALsDDn0iLEmifmpI550tnoxE7KN708onDY0UUSp1rqO63
         qp0w==
X-Gm-Message-State: AOAM532c/CbOnuU5xX3boaamVvyTEN1rHf8gTOCGzsaCT3c14Sq25H7U
        8QI5g4LIRWxKVzHSgtRHzOs=
X-Google-Smtp-Source: ABdhPJxJfBtQcyTw2ggGblUJb62+CJQ05s0vQk3KGuzRkVGKlycyNp8C3hL1VzrU2RP4pgDypiWnYA==
X-Received: by 2002:a17:906:27d3:: with SMTP id k19mr274262ejc.368.1622738716690;
        Thu, 03 Jun 2021 09:45:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bh3sm1741560ejb.19.2021.06.03.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 8/9] arm64: tegra: Hook up memory controller to SMMU on Tegra186
Date:   Thu,  3 Jun 2021 18:46:31 +0200
Message-Id: <20210603164632.1000458-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Tegra186 and later, the memory controller needs to be programmed in
coordination with any of the ARM SMMU instances to configure the stream
ID used for each memory client.

To support this, add a phandle reference to the memory controller to the
SMMU device tree node.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index a173f40256ae..d02f6bf3e2ca 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1152,6 +1152,8 @@ smmu: iommu@12000000 {
 		stream-match-mask = <0x7f80>;
 		#global-interrupts = <1>;
 		#iommu-cells = <1>;
+
+		nvidia,memory-controller = <&mc>;
 	};
 
 	host1x@13e00000 {
-- 
2.31.1

