Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCA6C11F64
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 18:09:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 505D961C75
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 18:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbhF1SLj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbhF1SLj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Jun 2021 14:11:39 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBEDC061574;
        Mon, 28 Jun 2021 11:09:12 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id l8so13578575wry.13;
        Mon, 28 Jun 2021 11:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o5PPwvIqoEMAWQO+bsBzWSD46fvy9+pFCdpISpP5frs=;
        b=hwaGLCEDvCIbSPK25alLYTWfzMt5h+iS1lF5FDFUxfbtt7gNx26I42MSrnm9iqlu0j
         qM31Dq4MTncem1U3iVMW1ljwSvxBfwJA5MqYU5+5vHTbK7KbfTMlY6rF8QO62AJyOU4V
         eeYOO2Iy6jJ9KPMRD8erVh1AkzE3H1ujTkzn8U1UrdpiM7LmxencnKJ4QnCxks6jqoGx
         lpG62UiW/RanNYo/KnrlB+tTMHYxy2Z2dybOqAaO4WMbz1Wn8kdC5FisXkFQYpNvm4g5
         wmS+DI3NPhi4GVUseXz2hb+miGU3qUNvD3JmIQQaKcMt5wrZMLyfFERSieijTH4/5+yH
         fYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o5PPwvIqoEMAWQO+bsBzWSD46fvy9+pFCdpISpP5frs=;
        b=dsRKh6ai89X4iHIOa7wz0bQIy3H9+amtw/+50Oqn5zwx8O0+V+ujIi+GK2JstVAHwP
         Fz+soxCt4DLxqo1f3yxzcxZ4WcJ0pO9tGzaIZEWtzxzg6I01UXqNqJQhbVXkRxNztYWm
         0JknoDlkCXYcnN+AID+k9/k1KD5SrNENhtgdqHVkTIbZcIt/6J7oVqk+WPXigBlXIZ1S
         nKqBqa0VEOG8Kse1HwSxEchq+Ns0eKt2DnPQxaH/SpuVkLvF9M3oUy5z0g2oQ6O02kmE
         lo7Hu0zZIPMdGw3PhzNC1U43JfOgpXBvyNBh//c8lVTVbm2E815G5onE7qjC7mAfZLpX
         v8Bg==
X-Gm-Message-State: AOAM533XGrGM/JHD1pT3MMVJF+SWd7nC3NUbNCU5WddOtFcPZJmmDS5b
        pWuub5Wel5Jg91H53XpMEGw=
X-Google-Smtp-Source: ABdhPJyMi2zHzK/ZSwv8LoaqOCoCXNjIv6Wby0gRqvWrTn2pmpIKTsa+90HML9AGahEP83Nym3frpg==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr24403213wri.10.1624903750618;
        Mon, 28 Jun 2021 11:09:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r12sm16081681wrn.2.2021.06.28.11.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 11:09:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date:   Mon, 28 Jun 2021 20:11:16 +0200
Message-Id: <20210628181118.2295007-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This small series addresses a minor issue with how IOMMU support is
wired up on various Tegra generations. Currently the virtual "card"
device is used to allocate DMA memory for, but since that device does
not actually exist, the path to memory cannot be correctly described.

To address this, this series moves to using the ADMAIF as the DMA device
for audio. This is a real device that can have a proper DMA mask set and
with which a stream ID can be associated with in the SMMU. The memory
accesses technically originate from the ADMA controller (that the ADMAIF
uses), but DMA channel are dynamically allocated at runtime while DMA
memory is allocated at driver load time, drivers won't have access to
the ADMA device yet.

Further patches will be required to correct this issue on Tegra186 and
Tegra210, but I wanted to get feedback on this approach first.

Thierry

Thierry Reding (2):
  ASoC: tegra: Use ADMAIF component for DMA allocations
  arm64: tegra: Enable audio IOMMU support on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  4 ++++
 sound/soc/tegra/tegra_pcm.c              | 21 +++++++++------------
 2 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.32.0

