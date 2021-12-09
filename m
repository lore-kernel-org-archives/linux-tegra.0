Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DE8C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243090AbhLIRiU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRiT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:19 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23969C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:46 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i12so4812971wmq.4
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KA0aNiZDtD8+nEJ3litA8i8LKRhvklnjqwdsKqdPomw=;
        b=XsPNkPMPb4Y7Iw1PZyW7kdo/w5ZfXkrDOiMoEPFtn8t3dGDU1340bPM5XX7Ne9o/3h
         c4NyGQYV+P/+IaUT5Mnj1+ohqjYw47NEMeWYidLcYR1Uc2uOntbFGacwp99jNAwezrx5
         4e+6lgLxxDdv6ZHJDKxJ0eleinYH+Ey6IVH+63RYgpyLyiUAg+FZ8Q68rkGouwkXgFGz
         O0eGrZ3bFJVkjgFb8I0mnTcuberKlkwhNp7oJe+Rv+s6SSCGqw80FkpU2oVqTKOwlcQ+
         dLLT2T1iYscoKlfObEmrwTLYxjYSr7Am7ptJPS8M5+0k/GbcI6Ou6NowydgREXcGvguR
         M69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KA0aNiZDtD8+nEJ3litA8i8LKRhvklnjqwdsKqdPomw=;
        b=4HSsHETOYBIiFgsce8qW/YNWUX5JD3dxZ9F1TOIzBzra9kgfuGL/6KpiVT1emogdQz
         DJV4Wc66yndsHIXWdMYybkXV6PLBX7kt78vhQPIlk5naT2T1dqLxAZWtM/VhuqHXGFoW
         z3esb0+V8K/kJ1B/+v4URk6s+JzMwYAkQcGyfIXgP85LGHHku0INVH9dgZaK6rICwTx7
         REikjmnqF1OXtnao0WSSVsbS2liwnOOS9zj4qaGC7An8qCB+N+qWBQ8/FDSgdjzlF3Vd
         vpiAyrWihrTncyxd1YxfYfzEw6Tmp6rByNMVOAEwouQRY6OCHcKXjApQlRIXTJY9wWfr
         wjpg==
X-Gm-Message-State: AOAM532RDspUJLKHSvbyMYzqfG3SwxVBTWj0qW6xQasiiRG/I3wQgCtL
        /BKyJi+/jI6yiTP5qIyrKFnWnN0OHAecBQ==
X-Google-Smtp-Source: ABdhPJyhGjF02iOLJU1jt8O6P9kAxRqeZRL1AEqZjGhD6qMw4SCRmwrNVG3mOqbBZXk+STO3GwnZtg==
X-Received: by 2002:a05:600c:202:: with SMTP id 2mr8746445wmi.167.1639071284620;
        Thu, 09 Dec 2021 09:34:44 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id az4sm9644762wmb.20.2021.12.09.09.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:44 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 17/25] ARM: tegra: Add compatible string for built-in ASIX on Colibri boards
Date:   Thu,  9 Dec 2021 18:33:48 +0100
Message-Id: <20211209173356.618460-18-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The device tree node for the built-in ASIX Ethernet device on Colibri
boards needs a compatible string in order to pass DT schema validation.
Add the USB VID,PID compatible string as required by the DT schema for
USB devices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Marcel, I've taken the USB vendor and device IDs from the ASIX driver
match entry for the AX88772B module, but do you have a quick way of
verifying that that's indeed the ID that the device reports in those
systems?

Rob, I do get a checkpatch.pl warning for this new compatible string,
but I'm not sure there's anything easy that could be done about this,
other than perhaps making checkpatch.pl aware of the special USB (and
potentially PCI) compatible strings as well.
---
 arch/arm/boot/dts/tegra20-colibri.dtsi | 1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 2350fda3be6a..c5c401edd0bf 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -689,6 +689,7 @@ usb@c5004000 {
 		#size-cells = <0>;
 
 		asix@1 {
+			compatible = "usbb95,772b";
 			reg = <1>;
 			local-mac-address = [00 00 00 00 00 00];
 		};
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index e89b4e5a238d..4361b93d0934 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -950,6 +950,7 @@ usb@7d004000 {
 		#size-cells = <0>;
 
 		asix@1 {
+			compatible = "usbb95,772b";
 			reg = <1>;
 			local-mac-address = [00 00 00 00 00 00];
 		};
-- 
2.34.1

