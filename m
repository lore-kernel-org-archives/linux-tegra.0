Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198B5C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E04D261A26
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCYQku (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhCYQkq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:40:46 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4237C06174A;
        Thu, 25 Mar 2021 09:40:45 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j7so2981865wrd.1;
        Thu, 25 Mar 2021 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YFSqMATttwvnEjox5mDDMXVQmf/3aquCS0HIVj6Hd8M=;
        b=YJYg7GzEy6eYG0tQt7jGwsFchmsnf+97rlxrBtGJo/3ExZbGd93Qn6m6O4xAQvLpX3
         RJ/ug1TZL1JKn800jH8/OEwrJY1MaFG5AeduhnhIX7cpdM6fXqKvuB/QEDuWn0bO8Emj
         uqMBThTbqNaTkIdeEVrl8MFgvA29dFGTvwhDexbS3ySlA3Ws3a54Oq7Wmz51kPPcLpZ3
         NstEO4Ke3y4i+Hdzjh5whcWiGVb7nLnPzeLm8fXhqI2cIBiMUjfGZK/mJN4bDFrScO+H
         +kYEX53eTiF3Ir3t60zj1vDsMJhUXDVmzhbs4BCBwlO/XWRgJ7Ua3m1k1JvZ4XXkPfFG
         1PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YFSqMATttwvnEjox5mDDMXVQmf/3aquCS0HIVj6Hd8M=;
        b=rtw0S6Ku3aNKwybNXn4pfLOMPDpPDmVJgKZ5dbYaSkQgZg3eywGqVszcfdL/mZDJsR
         u9lH+zQFFvtn9qwcn8RBcZdnbx5o79+tm3P3i31PIUQCfpAHSUm8m3L6Z40078wnaO9w
         VUJdzp4RsMzj5IYuUqy0Wf8PO76/0PU79uG6vNcZzxraZKwL1wPhm71VgquFXQ67TcTG
         TwvfqRpGIDCCX/JvvQrJh0nbdXxXLNRtWjhum8KDKmhizJYbZqtJIZeZDEEjjLScy7WQ
         GoDEUswTPKKdvAlLTMjPWiqxnLgPW+s0CGPw2khKgSiq+qYwh6H0YWtLdGilJnwSxbZL
         odAw==
X-Gm-Message-State: AOAM530TK0HS9i0AOztncIPGmJBfAsYrmvKTfKfF1tDEx9+F0uQeb2bX
        8ubj/2alA17G7xIRslTo5g0=
X-Google-Smtp-Source: ABdhPJzbSHaK3fx6FuRZT8GUnvbbhA34wtR5k7r/LDHoXqVWAj0QJPFzW+EAA/qkswAowOlV2ORN1Q==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr9944791wrd.47.1616690444397;
        Thu, 25 Mar 2021 09:40:44 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 91sm8415188wrl.20.2021.03.25.09.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:40:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 00/13] Tegra XHCI controller ELPG support
Date:   Thu, 25 Mar 2021 17:40:44 +0100
Message-Id: <20210325164057.793954-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
state for power saving when all of the connected USB devices are in
suspended state. This patch series includes clk, phy and pmc changes
that are required for properly place controller in ELPG and bring
controller out of ELPG.

I've rebased this on v5.12-rc2 and fixed two minor issues that
checkpatch had pointed out. One of the patches compared to v7 was
already merged into v5.12, so that rebased out.

Greg, you had previously indicated[0] that you'd be willing for me to
take the USB patches through the Tegra tree to resolve the complicated
dependencies within this series, but I don't think you ever gave a
formal Acked-by. Should I take your comments to be equivalent and just
add them to the USB patches?

Vinod, as discussed earlier, please take a look and provide an Acked-by
if you're okay with me taking this through the Tegra tree for v5.13.

Thanks,
Thierry

[0]: https://lore.kernel.org/linux-tegra/YB1wxazg%2FQpRSJz6@kroah.com/

JC Kuo (13):
  clk: tegra: Add PLLE HW power sequencer control
  clk: tegra: Don't enable PLLE HW sequencer at init
  phy: tegra: xusb: Move usb3 port init for Tegra210
  phy: tegra: xusb: Rearrange UPHY init on Tegra210
  phy: tegra: xusb: Add Tegra210 lane_iddq operation
  phy: tegra: xusb: Add sleepwalk and suspend/resume
  soc/tegra: pmc: Provide USB sleepwalk register map
  dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
  phy: tegra: xusb: Add wake/sleepwalk for Tegra210
  phy: tegra: xusb: Tegra210 host mode VBUS control
  phy: tegra: xusb: Add wake/sleepwalk for Tegra186
  usb: host: xhci-tegra: Unlink power domain devices
  xhci: tegra: Enable ELPG for runtime/system PM

 .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
 drivers/clk/tegra/clk-pll.c                   |   12 -
 drivers/clk/tegra/clk-tegra210.c              |   53 +-
 drivers/phy/tegra/xusb-tegra186.c             |  558 +++++-
 drivers/phy/tegra/xusb-tegra210.c             | 1553 ++++++++++++++---
 drivers/phy/tegra/xusb.c                      |   92 +-
 drivers/phy/tegra/xusb.h                      |   22 +-
 drivers/soc/tegra/pmc.c                       |   94 +
 drivers/usb/host/xhci-tegra.c                 |  613 +++++--
 include/linux/clk/tegra.h                     |    4 +-
 include/linux/phy/tegra/xusb.h                |   10 +-
 11 files changed, 2615 insertions(+), 397 deletions(-)

-- 
2.30.2

