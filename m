Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E16C43219
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344689AbhKXWJq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:09:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344603AbhKXWJo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:44 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2FCC061574;
        Wed, 24 Nov 2021 14:06:34 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id b16so8345579ljf.12;
        Wed, 24 Nov 2021 14:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=piUl9l4MQ9w1o9KgxY94nBJ6EwDi73VAxTX3rtlk9+s=;
        b=NnGQjYeMF7hAh3MvNIYc14WpNok1tPGHyd1qnl/CGxuC+gbNQCaXAPra1OaALM+Bcj
         Ba16/vKJx+czY7gUhwlanY6zp1lXw2Z0rH0G8iZNes7WdJkB0wspYS+G/h61RDgKJSR0
         MGHSYJZfcQKuLEEC17W5xAId3EV/xQkQZBqjGUVtA+NGMq/VLLBMuffjjTlKbnu3dwFw
         V0kvvVOREK4dIEKpxxid4r23XsFL91vPkgOVTUw4E98V5/KCjrgQnG2gIcTBUskM+Aeb
         2AL6qhW/16WZmPfp8lLHwhGJ6DWls1++NZr2CDkSIHB8Sg+y0OQUBbmeS33FhJq1UkTZ
         dSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piUl9l4MQ9w1o9KgxY94nBJ6EwDi73VAxTX3rtlk9+s=;
        b=0R+RAZlhUxHGcpYGbF1FE8GP2zRQ+4jFcPv6sPh+Lwxjh902zAvRsbXbcrWWW0iGW8
         xtQyXbhysOiCRcyWiHHm1hEVjKkDcpNj8kt5p24DzUJMMfcjFUP0c79QuqI3+LGt8sue
         YNHpAH+r8TeNDSwsd8VBdSvfz/BrYr4BPcJ5NcDjcjZHlhtlPekT9+X46yjE+JjYry3O
         rGq7JaVAY/IF1sWqZwXxhSYEcRJNqsn58jrXu7QpmUGihhWQihz30b5HKN3+p8Jg7BVy
         UOJzRwTmDFrC4Z6OrrOVMAwWKgDkmFF5/fCamh4GM7yVA3bkxNJ3711Q+VSB2q55lSg4
         vBCg==
X-Gm-Message-State: AOAM533QR8jXOteNeYfpGPSgtIc3ZHBUk3QBt+jM+hy9YEkfdH5v3XFD
        EZSZbEwOCoL1gNTj1hzQN4c=
X-Google-Smtp-Source: ABdhPJyC5uiCLhekgH2zxjYZ7iOS2JEJsVe0rvh5Rs4pecyXEimPxIdfdARMrq1pZ88KSK26qXk7Jg==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr19436751ljg.13.1637791592719;
        Wed, 24 Nov 2021 14:06:32 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:32 -0800 (PST)
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
Subject: [PATCH v1 03/20] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate property
Date:   Thu, 25 Nov 2021 01:00:40 +0300
Message-Id: <20211124220057.15763-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Document new nvidia,fixed-parent-rate property which instructs that this
board wants parent clock to stay at a fixed rate. It allows to prevent
conflicts between audio components that share same parent PLL. For
instance, this property allows to have HDMI audio, speaker and headphones
in the system playing audio simultaneously, which is a common pattern for
consumer devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index cd87eb4ef995..28f964c759f6 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -42,6 +42,13 @@ properties:
       - const: rx
       - const: tx
 
+  nvidia,fixed-parent-rate:
+    description: |
+      Specifies whether board prefers parent clock to stay at a fixed rate.
+      This allows multiple Tegra20 audio components work simultaneously by
+      limiting number of supportable audio rates.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.33.1

