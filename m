Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBFEC433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 12:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236359AbhLGNAS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 08:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbhLGNAR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 08:00:17 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7F4C061574;
        Tue,  7 Dec 2021 04:56:47 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so2169245wms.3;
        Tue, 07 Dec 2021 04:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9rOcjGde/KWZTwQaV5kkIYXKq8iKi5wvGnMXIJC9BmY=;
        b=gKXl3jtmK9PAW3g+l/f23cqipT04ctuh1p9+Ctxo3MKut5fRKjyk5uuy0UxKeLiwYf
         jQsVTtq6Kaa6qQMXjEBvWWogCiHSCX44S4psHcncMC0QClUxOwUk/qYelfqepvbXRjR+
         82eJIr+jdaJRygnJTe/IJIAIecz/5d+XiJ22v3mgKCrzDrPNv/vRr2sxRPnZ5b0f7ktN
         o5xA4lEP657wE+DcBPgVksW6LzuHanHnirWE83OpUMqrlwZzD5JmsdXrfTkbJ0dYXnab
         IvoXs2PlI7bvFBPnKPK9crMCETR9hFdXtBhzOkbWfTO7FvDVoOPwLyC4C3aS6hDym4xt
         q8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9rOcjGde/KWZTwQaV5kkIYXKq8iKi5wvGnMXIJC9BmY=;
        b=J/1MuzopF1kWrGkOm7bIKTNITrYdau909aHZex68Na+6IyCnn4Euxcdn3zeihyysDf
         pOlHUYL/QDwIRnfk+1+bsXz9jqaH9MxWO/FfI70V4m3l2Ti3PM37wVWQcfK3d6vQSa6J
         upoEC/nylVmKfIIL/9sb/z2VciarxaE6V6DXMD11fJcl/tUT1noNyy77oRJMlozTp2kJ
         pmS6BPH+lMlMFbhfCm7cr5WZgRrlbbhMtkVh4kpqAHPEBCoRBiwHWg50xF/DR0Syei2g
         efI8ExPwNnQ7MCkDtWWyqzktHeeeDkiqcOE8+rEZb/QfZHV1HBpSwUlbCwzyG7WhwG3D
         f/Sg==
X-Gm-Message-State: AOAM531eO8iVUmA4b5iWT2x+8zp2t3cIdeeVeEIdnDMTtSEQ6a9Yc0d9
        CTy3pofHhu1lY68YLe1imda5Z6bH6h/yxA==
X-Google-Smtp-Source: ABdhPJywW1ADwejKnwk8LQyR/oXFaJVF6S9ZfE2i9/4YMeVwRRfL98gwKQaDdJCGFwPoFukc3xxQWQ==
X-Received: by 2002:a1c:9d13:: with SMTP id g19mr6788144wme.41.1638881806164;
        Tue, 07 Dec 2021 04:56:46 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p27sm2467605wmi.28.2021.12.07.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:56:45 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] ARM: tegra: Add compatible string for built-in ASIX on Colibri boards
Date:   Tue,  7 Dec 2021 13:56:43 +0100
Message-Id: <20211207125643.400976-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Marcel, Philippe, I've used the USB vendor and device IDs from the ASIX
driver match entry for the AX88772B module, but do you have a quick way
of verifying that that's indeed the ID that the device reports in those
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
2.33.1

