Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8E3C001DC
	for <linux-tegra@archiver.kernel.org>; Sun, 30 Jul 2023 12:52:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjG3MwO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 30 Jul 2023 08:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjG3MwN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 Jul 2023 08:52:13 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805C3A7;
        Sun, 30 Jul 2023 05:52:12 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe0e201f87so4517496e87.0;
        Sun, 30 Jul 2023 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690721530; x=1691326330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TS4d77RuuSBWqhkL5Vq49qXAEaDvIl/yRrOhHnAUGH4=;
        b=gujmOCbyF4Am/Pf2J+TtM42XEFaMCdAmVYGJU1LKKKiI0ZD1LBi2E7GshD03i9hkN3
         /bqrCzgAWIW53KXHNy6MB/N8DCRWD5HdXrgAIEAHY4+LBXbPuzaJdKzjR1rpRqLbWbU7
         BoPXYFAUDrqHjyCyQChZDsnJ7IGlRT9QAOoBNUBV7ld+bQgNZlhQvPJkBrTCnlSfzcz2
         yneUTe70vrIsM2BsWjIGmq05HuEPWWcYo9LKcFQMzl9wuogHsX2UYgICcYjqBL8suBLS
         Bxwuo1ZOQpUw6n8AN2FX6i63O+oYvVXHB7UgiUKuuIxlELOWDLI2kY/8lLh/c6tpY2aD
         p6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690721530; x=1691326330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TS4d77RuuSBWqhkL5Vq49qXAEaDvIl/yRrOhHnAUGH4=;
        b=YmWE2WIkdkPmVd78IU0ANf7pneyuk8GmUU2sZcFJMltgK4pzofX3w/V45ODp/ZUGc0
         uxe91S4gwJ943NwgV3UknYPN395RcCANM5wvfMZKCQ1LETaQqNaU7itCYYBsrCrIH0XJ
         mqw9WTkpMNvcaFPQM0YLthctY7x5Rr3GXFbcGxTTcJ9HEEU3jiBUMeSAOnXeQ2+Fah+j
         SSuupHuAGZrWFcuGML25qIaTmbzuPcauCczzUpq8KBxRZxwfKS2bl3C4+Xnzx36GTki/
         XigPerwOrer6xTywLyPMDdFXBUbOTZxhORUP4EbYyeg41TaDyC+Hvn2fF7zN0HzFKDaN
         bykQ==
X-Gm-Message-State: ABy/qLaVPzks2qdrMIIXbGIDmaJTSpbZtbC+nLNKkIuRsTuVDTaOndwD
        x/UiCtNQ8zO4FWJJFKfEex8=
X-Google-Smtp-Source: APBJJlGZy2NGNLweeuBQKWKTR6C+XgyxgaTyr+AQ9NH4V4aq6OQBizRe9JaxXdx4hWvWRfvUbxKO9g==
X-Received: by 2002:ac2:5df3:0:b0:4fb:8ff3:1f74 with SMTP id z19-20020ac25df3000000b004fb8ff31f74mr2544734lfq.20.1690721529998;
        Sun, 30 Jul 2023 05:52:09 -0700 (PDT)
Received: from xeon.. ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id e6-20020ac25466000000b004fe1f37035csm1227273lfn.224.2023.07.30.05.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 05:52:09 -0700 (PDT)
From:   Svyatoslav Ryhel <clamor95@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] Transformers: switch from paths to labels in device tree
Date:   Sun, 30 Jul 2023 15:51:49 +0300
Message-Id: <20230730125150.4716-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use phandles in aliases instead of paths to ease device tree comprehension.

Svyatoslav Ryhel (1):
  ARM: tegra: transformer: use labels for mmc in aliases

 arch/arm/boot/dts/tegra114-asus-tf701t.dts           | 12 ++++++------
 .../boot/dts/tegra30-asus-transformer-common.dtsi    | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.39.2

