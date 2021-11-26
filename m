Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D678C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378574AbhKZQiu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbhKZQgt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:36:49 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40911C06179E;
        Fri, 26 Nov 2021 08:19:44 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n12so25549427lfe.1;
        Fri, 26 Nov 2021 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
        b=kHcqo3Hdoj+Nqd8Ud4iK9R/J/uH0C/whKTjYqjDf/tc4gbFtOi20b+X0fwScJI3XgE
         w1uJD3Kn/ZPx+GJe5Ni17mAKfxobdslbSTtHt9ZgYI7mD54nlnN3Xn5N+OUh5jS86tqH
         1R29ze3ftawnZjR8t+tOedRBH7Bgl4wPJiRGm1oiD0WronEIfoQAoQDfPmZ5oHkhjxTJ
         BM1grZQI4H8T34r+xH4xnqdbWnR099DKjL3t/aqmVQsRFZUBTcRk7nnb1dIOjN05Eqcz
         kFQmwBFUjNiHiZkWrHOc6vH2BJTE8t+Lw8shx9I+HJWQloEOtGR+Xt3SvRqzQmbJt0G/
         z45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
        b=SghLee4PqEWmx+gKD+fvUOgUIpPTQbBTWmin7viGUxHvxBEAl0fTyQ7PurqwqGj/ZR
         53H5Nd611fVV7S4DBV06/T751lhNrLG7Kia9BvflvbHnqgCpVAJ59ZydyN+zKNuwq2VJ
         uB/3lRAELyMQP+R4YILT+Y7uvmbm2WZaE/2k6Y9LJ6vz9UUAUP4YHz4pGxMlnf5Uc5Qd
         LWpFkvALvOkNsD79D25PGhpUXMA6n+x6HHFljNAL65iRDyLuR1Dz+uQWCFyxvRRLdQnQ
         Hdehhc/ESBmCqbdgW5O70WniVkStnr2C3oEmRw9hwAI7b8GEvjC+UZ6/Tqdl4rPu0iFr
         Cdrg==
X-Gm-Message-State: AOAM5302War9r+xFAZkaJjef1YBC9hb27o9fn//GHLIRmLVTeEvfykx3
        ELc14kUH+r+L43IHZ//xzQE=
X-Google-Smtp-Source: ABdhPJyu83chU0nnqPvnIxvSELamyDC2FkUBRpE0GuXjevFykLKZzCD2MrUwMLgf0AfqXE32YyaF5A==
X-Received: by 2002:a05:6512:2212:: with SMTP id h18mr32046721lfu.55.1637943582592;
        Fri, 26 Nov 2021 08:19:42 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:42 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/20] dt-bindings: host1x: Document optional HDMI sound-dai-cells
Date:   Fri, 26 Nov 2021 19:17:51 +0300
Message-Id: <20211126161807.15776-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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

