Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E46C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378523AbhKZQij (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238600AbhKZQgi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:36:38 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDF2C06179C;
        Fri, 26 Nov 2021 08:19:43 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id r26so25479632lfn.8;
        Fri, 26 Nov 2021 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=po9scD5dBEjtGuaNhMEfvHFzFtb9Ravcd9iJs0UTlhE=;
        b=LNs+LBfmYL28Sq2zZuiCUBRiBODtL+mQpFsAHjq8Zns4ntquqRmiplXDwyVYKjduMI
         FbBQ996hudy2zR49koSrDFj5aYM3xtC0Kaxo2GgTTTeV4X8BH7GgRhIO5Apf8tgxGpz5
         XRw/giTB4gdN0aG+rI4CRwgaLfu98u4su4XqHszD+O3lUkEvkdo569+5zMcgIaKLb0r8
         TljFdnnVI1/a484vxfGIIbtn/uWJJQUAu+Ia18aV2wmvt9mtp8dQICwELCUZ/8Zi2DoA
         x4yqLx6ME4DKZWXHShFuwEmDl8iY+XJ0LJkhqFrjdD6Hpqd3JGLbLBx54DyeuGa2R1Bq
         T9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=po9scD5dBEjtGuaNhMEfvHFzFtb9Ravcd9iJs0UTlhE=;
        b=c7o6YVcEl8L8Vyhy/BoFTLueVKlHOcweJkkK01VJYANN4ubjc6nGXcl5bwnjnBa+Mo
         ki8lZRIrZuShKqBSUE88k3adNoBor0p/6wN43PEo+0EQg7y66GNnLN3G9wmfIieCixIG
         mPkCyZYpY+lRTVlBCtnjvww/lGXz7wGQeD+VQzsXN+XbViPQ8lRcLQ5rFAsFMuYWxsg1
         g+YWA+Hbqsedln+E763eenu8YxwrYS/J8tzS6o1WkzJKl1kaO7MVY0KiJw0W4z7mjXtH
         Euk7tEck4LLVWtCMmgCaJhjVoZvg45kMIWGfEq6JYAKTL4vsioviU35x60bJCVvzrK9u
         wK1w==
X-Gm-Message-State: AOAM532q3Yh6m9PC4hfEhHfvln5AX9AlbDzfi3Btik+oyL3D+Nr0m2HZ
        kygfOUpHNk15tEa7tVTsYfE=
X-Google-Smtp-Source: ABdhPJxYVWZExVjYtIGn+qzQ1ofRZlsbTingOF1DzMsidrhuUxsrKi22yVGR0OWGg5FMU/aNw7eVXQ==
X-Received: by 2002:ac2:5cd7:: with SMTP id f23mr30678322lfq.153.1637943581509;
        Fri, 26 Nov 2021 08:19:41 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:41 -0800 (PST)
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
Subject: [PATCH v2 03/20] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate property
Date:   Fri, 26 Nov 2021 19:17:50 +0300
Message-Id: <20211126161807.15776-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
index ad43b237d9af..68ae124eaf80 100644
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

