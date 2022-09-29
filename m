Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE6C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 17:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbiI2RFK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 13:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235147AbiI2RFI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 13:05:08 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D01E4361B;
        Thu, 29 Sep 2022 10:05:01 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 51236600879F;
        Thu, 29 Sep 2022 18:04:58 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id l2l_SUiehblj; Thu, 29 Sep 2022 18:04:55 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D1294600EAE6;
        Thu, 29 Sep 2022 18:04:55 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1664471095;
        bh=qNenn2KoN9zsjzwvPudq5tWXFGJfOVtrVSY36thZMz0=;
        h=From:To:Cc:Subject:Date;
        b=OpO/4NDjuz87aKNYsZvEOxeQ52dTnhKpraERjSySCyK5tuhWXGGMXYWPAxKWu/QRe
         mUbgaItpqNijEHI7Mdcdxm8PkDSdGE0lqYK8HBjAnkPoEt91UjuIovpQLhrWg6ckzj
         jiyBePpLy8UOjqS4Yiu6HiCn7+TpSfiY3R1BylNk=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id D072F360086;
        Thu, 29 Sep 2022 18:04:53 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 0/4] Add JDI LPM102A188A display panel support 
Date:   Thu, 29 Sep 2022 18:04:58 +0100
Message-Id: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello!

These patches add support for the JDI LPM102A188A display panel,
found in the Google Pixel C.

Patch 1 adds the DT bindings for the panel.

Patch 2 adds an optional register clear to the Tegra DSI driver.

Patch 3 adds the panel driver, which is based on the downstream
kernel driver published by Google and developed by Sean Paul.

Patch 4 adds the DT node for the Google Pixel C. 

There is one point in this series on which I would like to ask for
some advice:

Since the device's bootloader leaves the display on and in patch 3 I
have assumed that the panel must be reset when probing, I was forced
to add patch 2, discovered by poking at the DSI module's registers until
the panel initialization sequence succeeded. However, if it is okay to
keep the panel on from the bootloader then it would be possible to
forego this second patch. Any comments on this would be highly appreciated.

Thank you!

Diogo Ivo (4):
  dt-bindings: display: Add bindings for JDI LPM102A188A
  drm/tegra: dsi: Clear enable register if powered by bootloader
  drm/panel: Add driver for JDI LPM102A188A
  arm64: dts: smaug: Add display panel node

 .../display/panel/jdi,lpm102a188a.yaml        | 100 ++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  72 +++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 511 ++++++++++++++++++
 drivers/gpu/drm/tegra/dsi.c                   |  29 +
 6 files changed, 724 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c

-- 
2.37.3

