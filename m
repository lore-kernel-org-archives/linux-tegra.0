Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A85C433B4
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Apr 2021 15:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C5F761369
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Apr 2021 15:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhDDP4U (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Apr 2021 11:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhDDP4S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Apr 2021 11:56:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B13C0613E6;
        Sun,  4 Apr 2021 08:56:13 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d13so14203269lfg.7;
        Sun, 04 Apr 2021 08:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2GicbZKkN6LfcZ4MLArm9B1njH7t58AaL5mU7ipO98=;
        b=lC4kDJVRbnh/iTn1E1QXkNR7F1sTI35TxrzxhPxt4UbXpLyi8f7UGPvhSFUumGgpEo
         TloGwK0jQMwLzHqTJrW8oF506EMBZlpCH1V/nEhddI/JLyNFgTHKkMf5bpr/EBDqIOzH
         /pXpt4hBVSZyjQlO2KSFVcbypX/Px2nitz8MKin7xBf0yRW6CyV3IPx30iO0/ijPJg51
         Q8Q+ZgCqu/Swvs50TawuDdPY2wT6WeVZkrZo0nv3sJoXhM4T7CC//hR1FNZUSnYal2a0
         ADfDfwAyE3tuKVhg+TV/hmyVsV6xO7W97QDLuClfGtl7J+n2rqVqFRT1V4KMKtggZsOV
         Hjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2GicbZKkN6LfcZ4MLArm9B1njH7t58AaL5mU7ipO98=;
        b=PpS39mRF0wd5oZeMOGbECi1wznbje7xkt4/cdtUvdALkN3XT40KhF5NDEo8artflfU
         kWf+s9ibINpNIBC1MKUqlTJECMCNZH7DY65nZ6cguO8I0Hk1u/QS67mIOvTwmBAappwW
         4QXAFJQIpaTUKo9GXua5CzbOowL5LuV8cHgbkO4eSuFu1hk/TK5Jd+ExudY8gDQN79r6
         DUvUT4u1ihBNwsuLMtEM/tY1WvO0xMEaOLL6CuJ9rOtzj26L9taL6prGIUuMde+EUDOu
         sHkCXORxz+Mb9j4ByjrDZMTmto49f+81DZGQsiIvGypIqLeLZM/ltKtepzAshvlEd51O
         gGSw==
X-Gm-Message-State: AOAM530Zm6+AqxBvlnuHhI4akq11SKh+k+8Jkv5z2lKGgkrMZPzBdhKx
        vrdrb7eK+5aeCvwq7Swvxqs=
X-Google-Smtp-Source: ABdhPJwdEZ1UXR6qyOOGTlCj7Qw0/HOPEYdW+KGBEIG60OYYhZOr7J5G5E8HDsieVaCKfSKg92kP7A==
X-Received: by 2002:ac2:490b:: with SMTP id n11mr14363800lfi.491.1617551771834;
        Sun, 04 Apr 2021 08:56:11 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.gmail.com with ESMTPSA id u6sm1483273lfm.56.2021.04.04.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 08:56:11 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/1] NVIDIA Tegra memory improvements
Date:   Sun,  4 Apr 2021 18:55:00 +0300
Message-Id: <20210404155501.5066-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

Here is the last patch of the series which had minor problem in v2,
the rest of the patches are already applied by Krzysztof Kozlowski.

Changelog:

v3: - Added new optional reg property for emc-tables nodes in order to
      fix dt_binding_check warning.

      Please note that I will prepare a separate patch for v5.14 that will
      add the new property to the device-trees since Thierry already
      sent out PR for v5.13.

v2: - Fixed typos in the converted schemas.
    - Corrected reg entry of tegra20-mc-gart schema to use fixed number of items.
    - Made power-domain to use maxItems instead of $ref phandle in schemas.

Dmitry Osipenko (1):
  dt-bindings: memory: tegra20: emc: Convert to schema

 .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
 .../nvidia,tegra20-emc.yaml                   | 303 ++++++++++++++++++
 2 files changed, 303 insertions(+), 130 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml

-- 
2.30.2

