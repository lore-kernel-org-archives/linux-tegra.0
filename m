Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A17C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:01:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ECA661163
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236810AbhJEXC7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 19:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbhJEXC7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 19:02:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A7DC061749;
        Tue,  5 Oct 2021 16:01:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id y23so2574640lfb.0;
        Tue, 05 Oct 2021 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcAG2pFexEAw/PhPteoF7b81eoy0hwDWD/QB7DB/ry8=;
        b=m11a3PRGubAZu9CedRiqalqX6IvjzIq1nb4WdW7eYtbv9ZceqzTUFHC7obeX4bfqOn
         oykrvTPGGgN0hg6XE2WGzvsOngWj8AEqeNdAFwgwzJ3tvNzrfd15R1eqYaj4YsXFcUXS
         5Xt9QJRVqs1bvaOZJMynCQ5C4SM+HkagbJGCJhD58y+IY4EzlnqGNk4FFcmNz4DljFJq
         A65VXdXA9VMNdAFv+NbPiVxBn3HxBiRYmbYk4iDxqvqQEMYnor9S17TY81x3Y9SvveFl
         ijvDF9DFo2QuYrx0D4EclIz3VjdESKo7Hm6A5c5i8tIxlb2mPAIk1GRFWm9fplS4xXFs
         +5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcAG2pFexEAw/PhPteoF7b81eoy0hwDWD/QB7DB/ry8=;
        b=wd48897OFmf4awIQAUMGkXlVI+jIPcUHkr7vEf8d9EZ1ipPY0NXWwEuhCglsJQ2DiN
         Ht6Le9sxIdwPdvT05UM1Ts/qvBP0iMOPOglTh4FVyZMxx7hc6th4CkDRBNjsswaG/uGY
         dd7LKjbMGl10UwXge1+ANEcaiM/AQBFeOVT+ooU3+T/krsEd5Xn6wmLZZS8yL+T9B9YS
         /MQVI8sVLYxS+UAj01G2k+z196HdKc3hU+MP8JaZ5MaWM13iLKK0Qktohpcc9R95fPUN
         801Kkn2W7X584xvp4FBkRpU6uAn7Lxzo5EQgug3f74QmiEejp2dFIfn35qkhqFVhtn74
         lp6Q==
X-Gm-Message-State: AOAM530DssuVP78QDiKTm/1w3NLQQLl8lRn+IaKI4qpK1b9VBDOXW76r
        mrd27Ed3WPyyYJD3GzfD0ko=
X-Google-Smtp-Source: ABdhPJy3p4HRUlLetJSBx/9ZvegpjZCcDTe1M8os3brumHYKiH49B+fWolEOMCV9Emxz32zj9u7L5A==
X-Received: by 2002:ac2:57d4:: with SMTP id k20mr6308063lfo.160.1633474866219;
        Tue, 05 Oct 2021 16:01:06 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id j18sm2101125lfu.84.2021.10.05.16.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:01:05 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 0/7] tegra20-emc: Identify memory chip by LPDDR configuration
Date:   Wed,  6 Oct 2021 02:00:02 +0300
Message-Id: <20211005230009.3635-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support memory chip identification by LPDDR2 configuration, which is
needed by ASUS Transformer TF101 tablet device that doesn't store RAMCODE
in Tegra's NVMEM.

Changelog:

v4: - Moved DDR bindings directory to memory-controllers/, like it
      was suggested by Krzysztof Kozlowski.

    - Converted existing LPDDR2 binding to schema and utilized it,
      like it was requested by Krzysztof Kozlowski.

    - Added Elpida B8132B2PB-6D-F compatible.

    - Made code changes that were requested by Krzysztof Kozlowski.

v3: - Corrected sub-node name in tegra20-emc.yaml.

v2: - Added separate binding for standard LPDDR2 properties, like it
      was suggested by Krzysztof Kozlowski.

    - Switched Tegra binding to use new lpddr2-configuration sub-node
      that contains the standard properties.

    - Extended commit message of the "emc: Document new LPDDR2 sub-node"
      patch, telling how the properties are supposed to be used, which
      was requested by Krzysztof Kozlowski.

    - Added new common helpers for parsing LPDDR2 properties and made
      tegra20-emc driver to use these helpers.

Dmitry Osipenko (7):
  dt-bindings: Relocate DDR bindings
  dt-bindings: memory: lpddr2: Convert to schema
  dt-bindings: memory: lpddr2: Add revision-id properties
  dt-bindings: memory: lpddr2: Document Elpida B8132B2PB-6D-F
  dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
  memory: Add LPDDR2 configuration helpers
  memory: tegra20-emc: Support matching timings by LPDDR2 configuration

 .../devicetree/bindings/ddr/lpddr2.txt        | 102 ---------
 .../memory-controllers/ddr/jedec,lpddr2.yaml  | 208 ++++++++++++++++++
 .../ddr/lpddr2-timings.txt                    |   0
 .../ddr/lpddr3-timings.txt                    |   0
 .../{ => memory-controllers}/ddr/lpddr3.txt   |   0
 .../nvidia,tegra20-emc.yaml                   |  23 +-
 drivers/memory/jedec_ddr.h                    |  46 ++++
 drivers/memory/jedec_ddr_data.c               |  41 ++++
 drivers/memory/of_memory.c                    |  88 ++++++++
 drivers/memory/of_memory.h                    |   9 +
 drivers/memory/tegra/Kconfig                  |   1 +
 drivers/memory/tegra/tegra20-emc.c            | 199 +++++++++++++++--
 12 files changed, 599 insertions(+), 118 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ddr/lpddr2.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr2-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3.txt (100%)

-- 
2.32.0

