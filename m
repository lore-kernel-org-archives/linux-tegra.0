Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB12C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:05:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16F3B6112E
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236191AbhKNUHz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 15:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbhKNUHp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 15:07:45 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B966FC061766;
        Sun, 14 Nov 2021 12:04:49 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b1so31811700lfs.13;
        Sun, 14 Nov 2021 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96RcEWyK1nEHA7WMjfyQIixAVj6RLVNjCyJp7XEuCRk=;
        b=disv6LmuT2rNE98rR+GMp34NKFi2GwApxd95lZEKlpP3tkxbT4QA2R0U6qD3IiA8hI
         f/vtQEBUJlM+Apez7FVu8BGzTrxXjoTf/97Onsizhxb9C7PGsS9lcH3damLK/xq4LR9J
         P6O4wKht25ycSyEu9sS8/puay2MbCA7ISLNITPVhSejhd5JlezxOFsB/wkYOfg4v6xrd
         ZrCe7GhfQAqTVkpfoLIH9JkSv9tr9CPk12vFKyLTCB3gzlaZmhKDzhwts0LX9iJ1OZtz
         zYWXmYFRRR6VFZaP3dPepzjeWLEgQWAerSobVuCmgEDP6yma1oVcgLGgLeXKCZxK4CS8
         wWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96RcEWyK1nEHA7WMjfyQIixAVj6RLVNjCyJp7XEuCRk=;
        b=BwdZl3dTDH9Wd8U0DFTwDuvwRYT4OwsmuCb9L8vuTC774IEnXzbut9igO2dnvr/K8E
         ZvsfDMWCnDpkgcrjkH52XBiK4Vk4nZrGstlf+1194/9aOyzRHTfewzOAhS/vS1/wskkv
         MKna1HFwftIIx0TjxMEi7ov/tE1/oFTBhppu6LLtp/IUtjNBDulKbeuVBLU600p3+0BT
         bSvO4G1W8UA46Xz/fM/HJOUQA8U4Lh3kEoharcP6PBpVmmFWc+K8aAaiM/pdX38epM3E
         LCOALtrPJYrQdPCgfknSk8npETkIXrvLuQqLQbLwAZ1YIUtUJqA5JzeGVUTy/ScQSRY8
         zwOg==
X-Gm-Message-State: AOAM532RYoW2yCGtIBo/P5T+ZXA4EKpxlIyPBU8ZbR1xQQgwCpt1QhSd
        HiUZulyI3i+x4JhCTT8nHPk=
X-Google-Smtp-Source: ABdhPJxAdg84UeMZ1sSQ0Lsp7SztH6mQo1weUbFhj2NuaWEpLOrH3fM4OrYOvEcRloQ0i8QcuWbYgg==
X-Received: by 2002:ac2:4292:: with SMTP id m18mr29904021lfh.539.1636920288127;
        Sun, 14 Nov 2021 12:04:48 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id g4sm1193914lfv.288.2021.11.14.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:04:47 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: display: simple: Add HannStar HSD101PWW2
Date:   Sun, 14 Nov 2021 23:04:30 +0300
Message-Id: <20211114200431.28484-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114200431.28484-1-digetx@gmail.com>
References: <20211114200431.28484-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add HannStar HSD101PWW2 10.1" WXGA (1280x800) TFT-LCD LVDS panel
to the list of compatibles.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f3c9395d23b6..ecb9a79c2e78 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -156,6 +156,8 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
+        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
+      - hannstar,hsd101pww2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.33.1

