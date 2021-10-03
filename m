Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8BEC433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 00:35:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCA9361AF7
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 00:35:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbhJCAhY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 20:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234287AbhJCAhY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 20:37:24 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD054C0613EC;
        Sat,  2 Oct 2021 17:35:37 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r7so6835885wrc.10;
        Sat, 02 Oct 2021 17:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g6IgKgTeOPn2kSgL3hUWPhBdd8ZQiQNCWpf+x3vkmn4=;
        b=StEygmgG9jKOWu/dcN1kETNu3JvN1iXbTU72tC0RMT37kCtIjPri4ZjrWFmpSXvmG+
         Dwe6TndDZ15Rs16xd44StTKc3eoreTaIr797kwMUDS9VNkojKwKAzasNTvTl6ZrGfAfk
         EsgOxeey9eLnfNningerBWfzqGBZ/GLiij5O3+tFQaD6bK9GKg6An47hcWWJFbAbZ5Qi
         Tsvi0XWcsvQOA3YUwmqVntp4vuzxq6pmbQtHi5qIL5Jl2BHms95SQ3WKNgaX+/HaEGqq
         HMOwtrFIMU9MeM3F9rbJci7ewtcDKMzHLhpVUuLeARYhvHKHM8GzW4XanZxl/647VAq9
         srAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g6IgKgTeOPn2kSgL3hUWPhBdd8ZQiQNCWpf+x3vkmn4=;
        b=p5kPQlk0pKNXVCdS2XspTxLjgo8fReHRm1ynMIirIIzqdPEV0B7RqJOVvmOVRXTKlk
         aES7tT8NqrdajXt03i4L0Zlxmv2WFThZGDK+loHA8Tjku3P/CO/PiXhlsTBz7z2dtDMu
         UX2AzpQs/KKAsVGooFAfRLZ8kJhuLAF0Z7+duqfaOCpi5D67jd4Ab31/sIj3nnTfAsba
         E/aS3qxA+qAZvqMqQOn+1jnwrguTll2/9akK8IbGqZbjjb2udqid5FmxszX0HjuhOlHv
         vG0Ds/d7hDlPWyCXgOW+LvMC0w/Yo5jHiDEIVmp6Rz+jRUcJk9pgpK17W1RV90inIPwI
         QFow==
X-Gm-Message-State: AOAM533YpgbUft71GLA5KNqX5i834d0FKf5TTLo1dnG/jioPzPqKYk2l
        r8QfnStZQh0HIfqwPb5ymOdS1MgQbms=
X-Google-Smtp-Source: ABdhPJwmRbqUE5DfLscEMV9Ey47bDq8RZudZp6oKsFIGvCypW0ysEfvxyV4mEpgvbMm5zNQSafzd6w==
X-Received: by 2002:adf:a147:: with SMTP id r7mr5793018wrr.52.1633221336366;
        Sat, 02 Oct 2021 17:35:36 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id m21sm10981445wmq.37.2021.10.02.17.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 17:35:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/4] tegra20-emc: Identify memory chip by LPDDR configuration
Date:   Sun,  3 Oct 2021 03:35:05 +0300
Message-Id: <20211003003509.28241-1-digetx@gmail.com>
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

v2: - Added separate binding for standard LPDDR2 properties, like it
      was suggested by Krzysztof Kozlowski.

    - Switched Tegra binding to use new lpddr2-configuration sub-node
      that contains the standard properties.

    - Extended commit message of the "emc: Document new LPDDR2 sub-node"
      patch, telling how the properties are supposed to be used, which
      was requested by Krzysztof Kozlowski.

    - Added new common helpers for parsing LPDDR2 properties and made
      tegra20-emc driver to use these helpers.

Dmitry Osipenko (4):
  dt-bindings: memory: Add LPDDR2 binding
  dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
  memory: Add LPDDR2 configuration helpers
  memory: tegra20-emc: Support matching timings by LPDDR2 configuration

 .../memory-controllers/jedec,lpddr2.yaml      |  80 ++++++++
 .../nvidia,tegra20-emc.yaml                   |  17 +-
 drivers/memory/jedec_ddr.h                    |  21 ++
 drivers/memory/jedec_ddr_data.c               |  42 ++++
 drivers/memory/of_memory.c                    |  34 ++++
 drivers/memory/of_memory.h                    |   9 +
 drivers/memory/tegra/Kconfig                  |   1 +
 drivers/memory/tegra/tegra20-emc.c            | 191 ++++++++++++++++--
 include/dt-bindings/memory/lpddr2.h           |  25 +++
 9 files changed, 404 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml
 create mode 100644 include/dt-bindings/memory/lpddr2.h

-- 
2.32.0

