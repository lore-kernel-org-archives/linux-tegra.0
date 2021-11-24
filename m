Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A14C43217
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344883AbhKXWJr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344628AbhKXWJp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:45 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D474C061574;
        Wed, 24 Nov 2021 14:06:35 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id l22so10957451lfg.7;
        Wed, 24 Nov 2021 14:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
        b=ARwTAJfTqtelTIPULCHTr4G1ZuHUenvIBkuGFZhD92TpJknc06Pw4cc8Q0R4MkYvx6
         ZrGOgymmMNeLJVRsE9/cc5Ab3/Isn6TJ/W0hPgcZwOEfa3j2FDIf0rCGr7KuMPBV59Si
         SJWeTuh6I7v7M09Q623XB87OkuNd+AwC4UztBJOpDnXF5/CBuHKP3gHgvGh5xNJ2QBbX
         9lOkMvN8rkLKzWw1To+uJiANLdC1wZCXreMAsaQUt4OfMwVpVCDk7gxkrKflx3D4zStc
         heknKMF8Gd2Lhn0RUV5qxHSS/hp6xVdYYKOqg1/ycE7I2303I3dBEl5MG0m2eWG+ITKX
         nlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
        b=orfR21d6gjNEWb1fr42axzfA+a1IT4JwtDqWRaerlE2TWKOMPizrwBM1eLSJErlR0t
         Pq5iUuumu18ZzCyqZ5si6P6iSLe44ImghQMQ1iVYh5ME6J//zt+7BtGFhy+Z9tuH3yYy
         fd+LV6fWzrIIe3sAeAy3JGlAS0JwdoZy7sNmIzjCEsagSjTKKwUU6z4gbW4/rfikAwwQ
         LkGQHC74jQdy9jtyG97Mqghy8S7dZU6MJc5FSZpQzZ6IAqTy80P70Ocm50Qh/Xr9vsaS
         PdzDn9hqISyrv69WRSoMsQXa4xiokjUMQKvlJPYheY+AqyROBNnULG5Lwz9Kl3nxEnXh
         OXkA==
X-Gm-Message-State: AOAM530BSjXYCh65tw2d3urkN6MqGC7ObbnijL7Auh+gXkvgG3Ph59Hx
        uZD5KJ9kFG2NGNbWt3hhoYk=
X-Google-Smtp-Source: ABdhPJzhi7UNU46047RRxIFY+qitxZ5+V78jiCA3Ag2Za0QxQcgCp2Ay3wCtMWWTnZuxJO6SBU4FjQ==
X-Received: by 2002:a19:c308:: with SMTP id t8mr18436846lff.621.1637791593535;
        Wed, 24 Nov 2021 14:06:33 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:33 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 04/20] dt-bindings: host1x: Document optional HDMI sound-dai-cells
Date:   Thu, 25 Nov 2021 01:00:41 +0300
Message-Id: <20211124220057.15763-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Document new optional sound-dai-cells property of HDMI node. This node will
be used as endpoint of HDMI sound DAI graph.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index e61999ce54e9..27b746f28f31 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -297,6 +297,7 @@ of the following host1x client modules:
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
   - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - #sound-dai-cells: Should be 0.
 
 - tvo: TV encoder output
 
-- 
2.33.1

