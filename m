Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A40C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 20:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 939AF615A4
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 20:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345747AbhI2UFQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Sep 2021 16:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343734AbhI2UFP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Sep 2021 16:05:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F31C06161C;
        Wed, 29 Sep 2021 13:03:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b15so15401892lfe.7;
        Wed, 29 Sep 2021 13:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sdkKh++IicHPLPl/JfDO0Z0JL3OXooh+iQ8mPfucvPo=;
        b=eQZreV3qpCuEH5JMk23OkeOocU1pXR3VJ6h92cyJyn7JYtNo6ExiqCvurVcX1TyHWh
         331iTndkHo58ECkfqkjShliD7O58d7v2zu4MfL4F/dDnTD0SLxqAm8w9oqMD5wNybii7
         H+CywYy9vUqoILIpZw2euepPednNSyCv8Dg8akYLltPxzWZxaPFzWJOchQacD674Q87l
         FCaWFJTJzl296ElGcLTArlHKzvRglYCjMMSYSw5dB3CryUW8MplOQyrQbMBSDnAiZkm3
         +odFELi0a7CNwxTHV+55M9UXPkzCJMqhOWiYN7uEaQuSiUZQmRk/IKOWzVileN8/ENPw
         tN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sdkKh++IicHPLPl/JfDO0Z0JL3OXooh+iQ8mPfucvPo=;
        b=3YBKgucvpvHOHlsmUNI+UkgZT1Ju6/gkv4g650sIA/4YgQhChRD/mnadHE3CWgtNHZ
         M4kzfdZ05ctMbXpZW1mbyeTsyUZqoJi278vupP37HIVdtAukcbuznaN/CglGSSSPD+tj
         GoXRFNKgOE/BvDArPzsIHj2Va9aZPmXmeWwjHZ9qIcWuJTF6Yw15eeB4Ng2mIkG8fho7
         pzO6qPTu53CxIw0tu04sZs5IzJSZUIde0+C7yMHnsWRxZ/RmqSDQv6FSJX74geB8paqH
         qbUbNv06qDCGOAKrd1++ZxBr5ZVJxysiz3HrR3jmqiArxtbXZO2JnprJe5RYxSy4Ir4G
         7Y3w==
X-Gm-Message-State: AOAM531WNKL3EtcBCh+Gb9beVVz4gpOUsQWoMytvVRUKsA0t+e3nvfwK
        Q9GhyZLeLYriIhdqHV98ihg=
X-Google-Smtp-Source: ABdhPJzdJ59a+FjYBZxbdhxQUrbXnd3k4cYueFqOXVw5m6Y0jhYvHGuz/45HvH1UEgqWl1n9RFgOGQ==
X-Received: by 2002:a05:6512:1112:: with SMTP id l18mr1548926lfg.124.1632945812747;
        Wed, 29 Sep 2021 13:03:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id u7sm99578lft.79.2021.09.29.13.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 13:03:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/2] tegra20-emc: Identify memory chip by LPDDR configuration
Date:   Wed, 29 Sep 2021 23:03:03 +0300
Message-Id: <20210929200305.4245-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support memory chip identification by LPDDR configuration, which is
needed by Asus Transformer TF101 tablet device that doesn't store RAMCODE
in Tegra's NVMEM.

Dmitry Osipenko (2):
  dt-bindings: memory: tegra20: emc: Document optional LPDDR properties
  memory: tegra20-emc: Support timings matching by LPDDR configuration

 .../nvidia,tegra20-emc.yaml                   |  43 +++-
 drivers/memory/tegra/tegra20-emc.c            | 209 ++++++++++++++++--
 2 files changed, 236 insertions(+), 16 deletions(-)

-- 
2.32.0

