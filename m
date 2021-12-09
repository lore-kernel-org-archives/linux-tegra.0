Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbhLIRhy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhLIRhy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:54 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C411BC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:20 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d9so10995033wrw.4
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hVeyJX2yZfE0ZBSDjhPDkH4eqciRvH9IHtHiL4iC9fs=;
        b=bOXwBFRQU/otK29sWhcOGmYXR2V/mS4O6xNIPApMh2HgUbE/TqV8/B5sdrL9pJFD6Y
         ymVb8tZtP5+taxEMYpn4n6MpLhp8aS9smNRbYG4PYfTDSHi/kaWKVq0rAgY5/KJUd2CC
         foKq6zQxK5zydLePsyRqCvIhjuf5lWB00JIUPkCPtvwp7Fd7Pg6DSNnt13+snlqE8332
         xOQyV4RgFwgjq2PaEeuRKFP936jw/T5VkA5ob0yhzZTPWtj8xu/6XALNYAaLukAqM1Ap
         CYhLWEkUJyPVVyghYxM0fe+HxPEvHkpa9OLxi1bt93z9LZnI6UI/C5xn1QY/4zh7V+1+
         hLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hVeyJX2yZfE0ZBSDjhPDkH4eqciRvH9IHtHiL4iC9fs=;
        b=BEdAUAYJSqGdkA2LUzP+Jzlywgmd3E1HAzzZ7orzQd5+VGfIu5BIWcmE8L/6gBEw/Z
         ehNrCylxeUxK9/5+yfH2xatlXjTJYcYRW+D4KK8DI/kqsDersqLMz0qb9M3XAidmDEvh
         iaOpaomOyhLk1CCIZR87Fim37oq69sg/u0rUEt12x0/GLYbLOiFUeOur6oK0Rz7XSlPe
         k0xGmO/1ka4IdSxCNXAacEOnIayhvTcbPcgloAdJQ2lwESwPY52qW8CGM7pHoPw5M9lw
         Xe/eWK3GqBCkOCald8AGOAXWk9iEkkSC/cnJBNXHf60p+BQym3dDyLii0Bh5woQarkFm
         h8Fw==
X-Gm-Message-State: AOAM530v59k15vIx6bGJaJDXTFoLDP2wZ7L42BuZfsQCz7l+9pBZsPly
        Pk0SUO7VGQ3PYL9USQXYP70=
X-Google-Smtp-Source: ABdhPJwlptc8JsPjtoS3MnS/2hneal8uAci34acSvCwEWNKd8VmCf7jEgG923f7iJZ4itK91yw4OFw==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr7959095wrs.46.1639071259375;
        Thu, 09 Dec 2021 09:34:19 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w7sm295902wru.51.2021.12.09.09.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:18 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 07/25] ARM: tegra: Add #reset-cells for Tegra114 MC
Date:   Thu,  9 Dec 2021 18:33:38 +0100
Message-Id: <20211209173356.618460-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra memory controller provides reset controls for hotflush reset,
so the #reset-cells property must be specified.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 328425dba023..ce7410ee08b8 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -542,6 +542,7 @@ mc: memory-controller@70019000 {
 
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 
+		#reset-cells = <1>;
 		#iommu-cells = <1>;
 	};
 
-- 
2.34.1

