Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF468C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B364C61051
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhILSUf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Sep 2021 14:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhILSUe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Sep 2021 14:20:34 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70B9C061574;
        Sun, 12 Sep 2021 11:19:19 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id l18so12955111lji.12;
        Sun, 12 Sep 2021 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwAz+eFrgKl8oHm0xRZhgu8D9En46dMSqliWlyNbl+w=;
        b=VO6vLDeZxAi1KT3NKxufq0jS7iPMKXeI+cMGVwkURz+k/ycOjy29yIdxfCi/oSThEO
         rDsxFnYyRXjFF0InS/SLLfgqRw5g9fX0t7/UaO71AZ9iQK7ddFLO+Yg4iFP0AUNHE1b8
         c1wEfXUrMp9gV/5jBp0HjwV67UKl1EMQzdqNbgWKSWx6cPouBjwoxbHpPfA9Ear3d7Ki
         ySqFj/3P1FwFTVcOlF95nCkq58wLXI3h+MDbygzpSEFae4styjXa7XKtS4tgH8BuzBSV
         AE6fT8gHfdQzRD9XpoVhMTlrptNjQaBemXO+5PYZ5okISE49d9L1Dpft1h9HVuwwGyuO
         M2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwAz+eFrgKl8oHm0xRZhgu8D9En46dMSqliWlyNbl+w=;
        b=YXCL+pqys3aigLq+VQ9oi+jf4E1Ka0Yw0MfYzYIYth6p4zooodwadX0qry1jsfEMD9
         y6uxMDwIfLmTPn2nsoje1f/iN0X4KBQBgL6+0aYBy/Q0og3ScQWlIQd+kc+nY7/liTg+
         MBQuUe71CjELz2sHMLUf1RJJFisM6GpHusMElXcQa+pxD0/3WwF+3D3OpVfI8E9z0Wnl
         UGLNY7GNJ2Rvbe/4IxhBMu85DLcn8bPHUkj7aiklvh/hoK7SPQDXm1AZMI5aB28lVyBi
         Q/l5JPBwBnyytld76pMjvDLpjLAvOmu3TasTz1vO2C37a04ea+36esKpJRd19NtWregE
         YFfQ==
X-Gm-Message-State: AOAM531Q0OPKIYpak/7J2P5m12NF5MGsxkIRijPVFo1iKoKbCsfA8y4M
        Imb6QVOMA1DJ/B4zB1+xryk=
X-Google-Smtp-Source: ABdhPJz6pHW9NuDEx3XT5+Q5qxSTafwQ7eWozjxrv1+6m3fDW2cUzffvKjS8EJkHJ2He1qTb6K+O/A==
X-Received: by 2002:a05:651c:1505:: with SMTP id e5mr7085821ljf.9.1631470758237;
        Sun, 12 Sep 2021 11:19:18 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id a18sm664556ljd.4.2021.09.12.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 11:19:17 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v7 0/7] Add OTG mode support to Tegra USB PHY and Nexus 7
Date:   Sun, 12 Sep 2021 21:17:11 +0300
Message-Id: <20210912181718.1328-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series adds USB OTG mode support to the NVIDIA Tegra USB PHY driver
and Nexus 7 tablet.

Changelog:

v7: - v6 partially missed 5.15 kernel, only the power/supply patches has
      been merged. Re-sending the remaining patches for 5.16. The usb/phy
      patch needs ack from the subsystem maintainer.

v6: - Added r-b from Rob Herring to the OTG properties DT binding patch.

    - Corrected "smb347-charger: generic regmap caching" patch, it now
      sets the .num_reg_defaults_raw, initializing cache properly.

    - Added new patch "smb347-charger: Add missing pin control activation",
      which prevents never-enabled charging on Nexus 7.

    - The "otg-fsm: Fix hrtimer list corruption" patch of v5 was already
      applied to next, so it's not included anymore.

v5: - Replaced "Remove caching of charger state" patch with "Utilize
      generic regmap caching" after Sebastian's notice about disabled
      regmap caching.

v4: - Added r-b from Rob Herring.

    - Added unevaluatedProperties into SMB binding for VBUS regulator,
      which was Requested by Rob Herring.

    - Added cell to nvidia,pmc phandle instead of explicit h/w ID
      property. Requested by Rob Herring.

    - Added stack trace to commit message and ack from Peter Chen to
      OTG FSM patch.

v3: - Further improved interrupt handling in the PHY driver by removing
      assumption that interrupt is enabled by the CI driver at the time
      of set_wakeup() invocation, which makes this function a bit more
      universal.

v2: - The PHY's interrupt is now enabled from PHY's set_wakeup() callback.
      It prevents getting a spurious interrupt during the CI driver probe
      time.


Dmitry Osipenko (7):
  dt-bindings: phy: tegra20-usb-phy: Convert to schema
  dt-bindings: phy: tegra20-usb-phy: Document properties needed for OTG
    mode
  soc/tegra: pmc: Expose USB regmap to all SoCs
  usb: phy: tegra: Support OTG mode programming
  ARM: tegra: Add new properties to USB PHY device-tree nodes
  ARM: tegra: nexus7: Enable USB OTG mode
  arm64: tegra132: Add new properties to USB PHY device-tree node

 .../bindings/phy/nvidia,tegra20-usb-phy.txt   |  74 ----
 .../bindings/phy/nvidia,tegra20-usb-phy.yaml  | 373 ++++++++++++++++++
 arch/arm/boot/dts/tegra114.dtsi               |   4 +
 arch/arm/boot/dts/tegra124.dtsi               |   6 +
 arch/arm/boot/dts/tegra20.dtsi                |   6 +
 .../tegra30-asus-nexus7-grouper-common.dtsi   |  25 +-
 arch/arm/boot/dts/tegra30.dtsi                |   6 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      |   6 +
 drivers/soc/tegra/pmc.c                       |   6 +-
 drivers/usb/phy/phy-tegra-usb.c               | 198 +++++++++-
 include/linux/usb/tegra_usb_phy.h             |   5 +
 11 files changed, 625 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml

-- 
2.32.0

