Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEDDC38A2D
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Oct 2022 15:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbiJYPiI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Oct 2022 11:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbiJYPiH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Oct 2022 11:38:07 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E7A16EA02;
        Tue, 25 Oct 2022 08:38:04 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3AD6760084A4;
        Tue, 25 Oct 2022 16:38:02 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id mb273FCce3on; Tue, 25 Oct 2022 16:37:56 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2CBFC6005C43;
        Tue, 25 Oct 2022 16:37:56 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1666712276;
        bh=6w2vIhViot6VMNZb6ve0kGhjpU+91FBSC/fU19DFHkM=;
        h=From:To:Cc:Subject:Date;
        b=wCVIr7d4x608A82tcS0YK68SOb79mWNFho0eJshsGf/ax83yI0en54ObeGKyodGP0
         N4d0b1L54jZ3x0gGaZC9+YUnjVgvhXxbNzM+wJ+E/odWEEQhXSObR7RqODqVyJxiUA
         t1yyF/VeajZ3zNcwXOy4suLeyrKnGYLKn7ThRS6A=
Received: from localhost.localdomain (unknown [89.207.171.77])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B276D36007E;
        Tue, 25 Oct 2022 16:37:39 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/4] Add JDI LPM102A188A display panel support 
Date:   Tue, 25 Oct 2022 16:37:43 +0100
Message-Id: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

These patches add support for the JDI LPM102A188A display panel,
found in the Google Pixel C.

Patch 1 adds the DT bindings for the panel.

Patch 2 adds a register clear to the Tegra DSI driver, needed for the
panel initialization commands to be properly sent.

Patch 3 adds the panel driver, which is based on the downstream
kernel driver published by Google and developed by Sean Paul.

Patch 4 adds the DT node for the Google Pixel C. 

The first version of this patch series can be found at:
https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt/

Changes in v2:
 - Patch 1: remove touchscreen reset gpio property
 - Patch 2: clear register based on its value rather than a DT property
 - Patch 3: tune backlight delay values
 - Patch 4: add generic node names, remove underscores 

Thank you.

Diogo Ivo (4):

  dt-bindings: display: Add bindings for JDI LPM102A188A
  drm/tegra: dsi: Clear enable register if powered by bootloader
  drm/panel: Add driver for JDI LPM102A188A
  arm64: dts: smaug: Add display panel node

 .../display/panel/jdi,lpm102a188a.yaml        |  94 ++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  70 +++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 509 ++++++++++++++++++
 drivers/gpu/drm/tegra/dsi.c                   |   9 +
 6 files changed, 694 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c

-- 
2.38.1

