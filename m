Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1466CC04A94
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Aug 2023 13:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjHGNeR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Aug 2023 09:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbjHGNeK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Aug 2023 09:34:10 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298411992;
        Mon,  7 Aug 2023 06:33:54 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 8D8BA6001426;
        Mon,  7 Aug 2023 14:33:23 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id STvPeWNl-IzL; Mon,  7 Aug 2023 14:33:20 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id B8182600142A;
        Mon,  7 Aug 2023 14:33:20 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1691415200;
        bh=ooWXrncGNgQ0pd99/KFiATYuY4KmdIUl5YVhzHGeVfE=;
        h=From:To:Cc:Subject:Date;
        b=qwGuGDNQ1Tu4jm7HjeaGm4sjEAimurq3v0ih345hiAXZecYt23/d2UefErvLKSzrr
         +vHvUSgyzt8difQc/t23ibKCo/CWHBXuRUmct8kEQF1VJMv5GOzP4UGXC7r15pTPUV
         isDC+FCBpoh/bJJs+IqfnD0NjpAMwTVkUHuN855g=
Received: from diogo-gram.Home (unknown [IPv6:2001:8a0:fbe7:6700:e50a:b22:79be:5827])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 55DE0360077;
        Mon,  7 Aug 2023 14:33:19 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 0/5] Add JDI LPM102A188A display panel support
Date:   Mon,  7 Aug 2023 14:33:00 +0100
Message-ID: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

These patches add support for the JDI LPM102A188A display panel,
found in the Google Pixel C.

Patch 1 adds the DT bindings for the panel.

Patch 2 adds the panel driver, which is based on the downstream
kernel driver published by Google and developed by Sean Paul.

Patches 3-5 add DT nodes for the regulator, backlight controller and
display panel. 

The first version of this patch series can be found at:
https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt/

The first submission of v2 can be found at:
https://lore.kernel.org/all/20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt/

Changes in v2:
 - Patch 1: remove touchscreen reset gpio property
 - Patch 2: clear register based on its value rather than a DT property
 - Patch 3: tune backlight delay values
 - Patch 4: add generic node names, remove underscores

Changes in v3:
 - Patch 1: add Reviewed-by
 - Patch 2: fix error handling, remove enabled/prepared booleans, add
   dc/dc setting
 - Patches 3-5: Split previous patch 3 into three different patches,
   each adding a separate node 
 - removed previous patch 2 pertaining to Tegra DSI reset as it was upstreamed

Diogo Ivo (5):
  dt-bindings: display: Add bindings for JDI LPM102A188A
  drm/panel: Add driver for JDI LPM102A188A
  arm64: dts: smaug: Add DSI/CSI regulator
  arm64: dts: smaug: Add backlight node
  arm64: dts: smaug: Add display panel node

 .../display/panel/jdi,lpm102a188a.yaml        |  94 +++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  66 +++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 551 ++++++++++++++++++
 5 files changed, 723 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c

-- 
2.41.0

