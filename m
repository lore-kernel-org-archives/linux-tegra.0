Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB47C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242878AbhLIR26 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242896AbhLIR2z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:28:55 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E16C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:22 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso7109684wms.3
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=30Wkjiv7hi0QMKF3Sk+crW/FAw21BP8yvQUN4NXV1W8=;
        b=LmidNwLqdef9oCqSmlszxBOyHY5A+YD0dSElJLlED69wH44Viu5+YRTnn51SxmOlVb
         sQaqTPQOtEx1UfTTQMxrBzn3nD7Ma/TOEZT5l7vsSIkCUYA/idSDPBbvRCb+4vec5B2o
         Y/jyp6IicWMo6kcvoZQWf90jm+GV0XuEGRlFA0h8dGjxZc1WL4lfX8pFmWt00jXSBNLI
         KaLoaYPjLKVTBY2W+VB6fHB1hRwudhTBt5q+BGmEjlFF11gvjW4k+Qgj2ZIP5E51thYh
         oG2rIDV54G+9SkR3TgCsrJjubdH3ZfthvdXEvU9/3z0RzAy09Ng+D5UImuxqF+3TVdZB
         jvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=30Wkjiv7hi0QMKF3Sk+crW/FAw21BP8yvQUN4NXV1W8=;
        b=whM5wE8ww304NVxdfv/4t7EtvxD1rPzbhbXcvobmNK3aVD+pwwUHMZN6khaZOrgGzM
         7520ue5Xf4kxfS6dJkh/GjnTm4AshTqMnvkVBUD9kg6qo+Y+Tus5wHQFClzhC/de3jnf
         4vw05v0yuytlsHfgGE1IVv1K99db7LrXOMcYKiz+qxwBxu5vCe7ZHc9NR+GGYQYzGvbO
         ofrHlu84kYMXRMYpIvrxpjxLD6w8c+EOnsoCLPvtEE5KWzZtpmDdfmsk5h1s6OpS2jF/
         Z2DvFLf/7/nHEpAy8bEBXafBpS8sWmmksZp5/3QxlCLLWLs3XBx9/QHgLkjr5trgaHCH
         75MA==
X-Gm-Message-State: AOAM533ysiXqX8pWxdbcerH+7+v5Mkdia+xh/KVvZuAn+u3hNHLW7Oxk
        HRbb2f421sRmtLq1TCPu+GJJXikPtUlV9Q==
X-Google-Smtp-Source: ABdhPJwKWlbsiQBw59JwZTrYYYvBQJIKa2jH+LvwmoJmWEygw4GeMSPre0P7hIEJ1UH5D7/QehlNFw==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr9161607wml.94.1639070720785;
        Thu, 09 Dec 2021 09:25:20 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h204sm444400wmh.33.2021.12.09.09.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:20 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 06/30] arm64: tegra: Fix compatible string for Tegra132 timer
Date:   Thu,  9 Dec 2021 18:24:39 +0100
Message-Id: <20211209172503.617716-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The TKE (time-keeping engine) found on Tegra132 is not backwards
compatible with the version found on Tegra20, so update the compatible
string list accordingly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 63aa3129d8fc..95bdcc8f31c9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -210,7 +210,7 @@ lic: interrupt-controller@60004000 {
 	};
 
 	timer@60005000 {
-		compatible = "nvidia,tegra124-timer", "nvidia,tegra20-timer";
+		compatible = "nvidia,tegra124-timer", "nvidia,tegra30-timer";
 		reg = <0x0 0x60005000 0x0 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1

