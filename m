Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8909AC001DC
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjGZQ2D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjGZQ1y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:27:54 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7546269E;
        Wed, 26 Jul 2023 09:27:53 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso10155935a12.2;
        Wed, 26 Jul 2023 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690388872; x=1690993672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsEowniGr6Wk6wqHwLPaL+irpr9VN82cw7vXn+mEKas=;
        b=H1a9vdDRRR819uM5nfpyUg3KbCzHQ0VB8mH5XJ9IIApTLYJSZvzIV2h5eHKYuWoWJC
         fzlYkJ3v1ic8GlBu/Qhf2dS798nm//R9/pWB9xvZqHMqltepEdv/jyAQZNwvMdl1xHS7
         hTGJwOeYi6ilHt7ExWhwn6cE+IRdip1eBIyD2D6hAmLKNdUbPsZA/ZU9nfEUaLQqPZzu
         TCzLhs9w+CIWqVnr8XxpasMyOyA7IwmwQZp1iwVPXAoBTNCEtaDHprVEagFavoZxlvBa
         /lrH/eWcBsq/E8e/J1LoftpCYUJLoeDMBHOTQmCDkjhpKINr5ZYB3I1Wcq1KD4VAG0bo
         UU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690388872; x=1690993672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsEowniGr6Wk6wqHwLPaL+irpr9VN82cw7vXn+mEKas=;
        b=I98doVuHRq96tgis0IQFF4Mf8533Iq6SfgaKQDjEGqXlVXjMRN6orwY63E23WbMTXW
         lXUhtDUNlKh+dpphaOK5WlKH/rdbxp7mxg/1NB2z/XrHpBqdMW5AWt+MZ3fp9E2HzmYY
         Mx3sYqMjbuuNC1A9a/BW8dkgKJbttwEY1niltsrfCwKsvAqQ6pRmf9hQSAPtX9IJj/0h
         ygutk4Dh79eJgEeMnh75bab8+83s8p9HffWXwk5PJ2o7I6FEoJtuwT4gvGv69ryfIQ0e
         bj+OHGMsQ+yoxH2P9u4VVVsFz/v3K5BwOGQp2AF+EUfjrTb9MgWjZJdy/TV4sq7V9ILh
         K8iQ==
X-Gm-Message-State: ABy/qLarn+CwMbQTXaZzhoYFK1Do2y7Qj8dXI27FsuWaGVMvLvN0oonA
        dEyGAo8d5/V+FkDRIS9go1M=
X-Google-Smtp-Source: APBJJlGncj+O28VUzSn0902FqhpKnKY2t1ZvAuNe19swUVOlL+4RDlv6VKIcjPDIkFYOu2xl6JQjtA==
X-Received: by 2002:aa7:df8b:0:b0:522:1fd2:ca7a with SMTP id b11-20020aa7df8b000000b005221fd2ca7amr2040106edy.29.1690388872113;
        Wed, 26 Jul 2023 09:27:52 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bc14-20020a056402204e00b0051e0be09297sm9027325edb.53.2023.07.26.09.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:27:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 4/7] dt-bindings: arm: tegra: pmc: Increase maximum number of clocks per powergate
Date:   Wed, 26 Jul 2023 18:27:41 +0200
Message-ID: <20230726162744.2113008-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162744.2113008-1-thierry.reding@gmail.com>
References: <20230726162744.2113008-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some powergate definitions need more than 8 clocks, so bump the number
up to 10, which is the current maximum in any known device tree file.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add Acked-by: from Rob

 .../devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index d6f2c5862841..a336a75d8b82 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -226,7 +226,7 @@ properties:
         properties:
           clocks:
             minItems: 1
-            maxItems: 8
+            maxItems: 10
 
           resets:
             minItems: 1
-- 
2.41.0

