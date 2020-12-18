Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A6AC4361B
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E56923A5B
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgLRMMK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Dec 2020 07:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgLRMMJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Dec 2020 07:12:09 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A46CC0617A7;
        Fri, 18 Dec 2020 04:11:29 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id y19so4754978lfa.13;
        Fri, 18 Dec 2020 04:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wmKmmssP571GSjnFYi6HX98tL6vYtUuHsqmX9JpWAKE=;
        b=YOn3/2Ua2DaHNl9slwXBL4Mu9YvF0aqiet7j6Wj6tmddHMH8oNolTsbuumtocs46OY
         ZUfM6sUwG9Spfexy7NsVoZ3ZI9mi11iTueOpdn4I5hIDiaHxUPDI6A7LnycXkIkT/3Xo
         Med+wxfO4lZPHS+jXwsaxzk7yP190TcHZPW03QFtuLOWxOWzSwfjdjmOyZ04xt8VcjDi
         O1I9EgSQw01QkpVbY4kQcJ7z6wv+Cse0dDhcmoA6kSr2v5Fu3A44xLBHTClXN7ItJHJj
         oWcEfiLGmvVpHwIHXKlEdEPGRIryDZFEPmxBq8qV8R62GbaZi0tDDyB+p5grMvM1l3bC
         zXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wmKmmssP571GSjnFYi6HX98tL6vYtUuHsqmX9JpWAKE=;
        b=D8zpYLurLt98/4Q2FgPB/k+jSxutjNVitTdWTjEdSrOl19WIUfu6EXZWxXFRM6i28D
         wYREgTJJawRSGQRGMX1MCqT6u4FANLDNeTM8trCEu5eOqkBvHapWKQ2oPqYqWxVr1ipy
         0JjNI9bbVqXoHogBPdXU8Ej5riNAx+PUTYBrC/nzYpDdRZpZ5aR66PwXTRoN5sXEWUuj
         Qxb0cE4gdLyrtqN4srYbW5t1DeNEVQtmIoFb+5Jae2Gx5p92Bb8VnPxCesvNMMusjBMy
         f4fPObAmtZvH4iakDpkpKOFVNvEJ5cusSaPoMqSQQSw6RZIN7OfhWVfNtcjNV4jcJJzP
         V7FA==
X-Gm-Message-State: AOAM533GZWrV2gkSiRvEcM9RXyAhme1qn8szgvQ9OxRmHBtEZPsOI4jF
        rS3+XJr3aFus1cP02CKYch8=
X-Google-Smtp-Source: ABdhPJzSn5dO4duO6qBxIhZ1ShydDBRv6a7EPdYniILINI5ediFhUy224FFACqQXVd7qq4dLfCO/nQ==
X-Received: by 2002:a19:c70b:: with SMTP id x11mr1353353lff.258.1608293487769;
        Fri, 18 Dec 2020 04:11:27 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id i9sm1036472ljn.18.2020.12.18.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 04:11:27 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, Ion Agorria <ion@agorria.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] Support Runtime PM and host mode by Tegra ChipIdea USB driver
Date:   Fri, 18 Dec 2020 15:02:37 +0300
Message-Id: <20201218120246.7759-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series implements Runtime PM support for the Tegra ChipIdea USB driver.
It also squashes the older ehci-tegra driver into the ChipIdea driver, hence
the RPM is supported by both UDC and host controllers, secondly this opens
opportunity for implementing OTG support in the future.

Patchset was tested on various Tegra20, Tegra30 and Tegra124 devices.
Thanks to Peter Geis, Matt Merhar, Nicolas Chauvet and Ion Agorria for
helping with the extensive and productive testing!

Changelog:

v3: - Replaced "goto" with if-statements as was suggested by Thierry Reding.

    - Improved wording of the deprecated Kconfig entry as was suggested
      by Alan Stern.

    - Added ACKs from Thierry Reding and Alan Stern.

    - Added a new minor patch "Specify TX FIFO threshold in UDC SoC info"
      just for completeness, since we can now switch OTG to host mode in
      the ChipIdea driver. Although, OTG support remains a work-in-progress
      for now.

v2: - Improved comments in the code as it was suggested by Peter Chen and
      Sergei Shtylyov for v1.

    - Replaced mdelay() with fsleep() and made ci->hdc to reset to NULL in
      a error code path, like it was suggested by Peter Chen.

    - Redirected deprecated USB_EHCI_TEGRA Kconfig entry to USB_CHIPIDEA_TEGRA
      as was suggested by Alan Stern.

    - Improved commit message and added ACK from Thierry Reding to the patch
      that removes MODULE_ALIAS.

    - Fixed UDC PHY waking up on ASUS TF201 tablet device by utilizing
      additional VBUS sensor. This was reported and tested by Ion Agorria.

    - Added t-b from Ion Agorria.

Dmitry Osipenko (8):
  usb: phy: tegra: Add delay after power up
  usb: phy: tegra: Support waking up from a low power mode
  usb: chipidea: tegra: Remove MODULE_ALIAS
  usb: chipidea: tegra: Rename UDC to USB
  usb: chipidea: tegra: Support runtime PM
  usb: chipidea: tegra: Specify TX FIFO threshold in UDC SoC info
  usb: host: ehci-tegra: Remove the driver
  ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove
    USB_EHCI_TEGRA

Peter Geis (1):
  usb: chipidea: tegra: Support host mode

 arch/arm/configs/tegra_defconfig     |   3 +-
 drivers/usb/chipidea/Kconfig         |   3 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c | 344 ++++++++++++---
 drivers/usb/chipidea/core.c          |  10 +-
 drivers/usb/chipidea/host.c          | 104 ++++-
 drivers/usb/host/Kconfig             |  10 +-
 drivers/usb/host/Makefile            |   1 -
 drivers/usb/host/ehci-tegra.c        | 604 ---------------------------
 drivers/usb/phy/phy-tegra-usb.c      | 103 ++++-
 include/linux/usb/chipidea.h         |   6 +
 include/linux/usb/tegra_usb_phy.h    |   2 +
 11 files changed, 518 insertions(+), 672 deletions(-)
 delete mode 100644 drivers/usb/host/ehci-tegra.c

-- 
2.29.2

