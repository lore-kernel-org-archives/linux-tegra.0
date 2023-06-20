Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04618EB64DB
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Jun 2023 16:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjFTQ0t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Jun 2023 12:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjFTQ0t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Jun 2023 12:26:49 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715D01737
        for <linux-tegra@vger.kernel.org>; Tue, 20 Jun 2023 09:26:21 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3113dabc549so3228435f8f.1
        for <linux-tegra@vger.kernel.org>; Tue, 20 Jun 2023 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687278380; x=1689870380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNf5mVKgwBsvZ6xOaLly6gEODuH6PagrP0QydiyOIUQ=;
        b=fWwI8BkeziguhVSc9vipm88YTccwT0muTTGl/2s++yDMmqVHizC0RhbyFOwXbtVprG
         0HCxRgW7268S35Sd4ikFXERDVqHqgmubelwsbm1Rz/KJou15pjWe8N7cRm35YhVq3HB+
         OHUTWd7x58G6ZGbsecSfBQQUJL1OmRPqEaq9LDYD4wy+6sFss43VUR7pU/bxkpvENqt4
         X7gWJ0FsmYlyPrmaOuT28xyYJPRw3x4rM5b10LC3bDqnZ81PJK7eQvMJu+JZXSEU9Xch
         SNJbmIQhU9UMOOL9I35UGzQfw59zBtaSLv8iETO8kWBqd/GDesvkODY5ymIrJx3lZwUH
         w5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687278380; x=1689870380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNf5mVKgwBsvZ6xOaLly6gEODuH6PagrP0QydiyOIUQ=;
        b=guqF5BI1G6qqSwjFT2+KSLvZlSdYyDwu9FIjwI5VZk4gXR9l/EQQ0LUaTBAHY7vGZi
         svuOJD3eZbgY7+pAsIB56ZNM9EgE5Fr18riaAzVNjy/S/RnVrY9FDJm+J46iuYrjWWhp
         Ys6D3fX+4CFvpiW9twGyaRiE9LvFjxC9uuMLYAvC6PDkKv9EJPTyVZFc8BpVgPqgQC1C
         iwKdSrTp24UpQYMNTs0Ne4brKBM7ceRgF6Zv081ZLIs/4XwaYd4lh5oRnZlYqLzSvIX2
         X9eXEfAIYKj0ozepdc/JFIXy0tCA8O3pnumIa4llbL13VSZTzQGSdjlbP1UFUP+Lqf+7
         JCTA==
X-Gm-Message-State: AC+VfDzLS5T3/f2Q3UiFYM7ppexbdF1oyu1HljueOaTbCI7dB4WO6YUN
        G9+X6v51NXntHNyjdnXytes=
X-Google-Smtp-Source: ACHHUZ4zULPiLZUwx0g1vit8yRgkE3g8ZCfY6k5npCBRWGaLagaEwYulHgK85PbGQx3RpnAEosRbpQ==
X-Received: by 2002:adf:e8c1:0:b0:30a:ea8a:7a6d with SMTP id k1-20020adfe8c1000000b0030aea8a7a6dmr10974086wrn.16.1687278379430;
        Tue, 20 Jun 2023 09:26:19 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d66c1000000b003079c402762sm2373328wrw.19.2023.06.20.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 09:26:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] dt-bindings: Changes for v6.5-rc1
Date:   Tue, 20 Jun 2023 18:26:15 +0200
Message-Id: <20230620162615.2043450-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609193620.2275240-3-thierry.reding@gmail.com>
References: <20230609193620.2275240-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-dt-bindings-v2

for you to fetch changes up to 9928d6789ac84d12d329bd0937c05e3f9a92a536:

  dt-bindings: gpio: Remove FSI domain ports on Tegra234 (2023-06-20 17:46:01 +0200)

After looking a bit more into the ABI breakage issue, it turned out that
the situation is more complicated that I thought at the time. In a
nutshell, there were two versions of the affected GPIO DT header, one
that used the correct mapping and another, slightly older version that
ended up merged into Linux v5.17. The version that we merged upstream
contains a wrong mapping and there are a lot of DTBs as well as other
operating systems that use the correct version. Upstream Linux is the
odd one out and in order to avoid having to break all the correct cases,
the proposal is to rectify the situation by properly fixing the header
that we have upstream to make everyone use the canonical version of this
header. Effectively this is now the same as the original pull request,
except that I've added a more verbose commit message to the GPIO DT
header patch that hopefully better captures the reason for this.

We'll put better checks in place to avoid this kind of mishap in the
future.

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.5-rc1

Several new modules and devices are documented and fixes incorporated
for the Tegra234 GPIO controller pin mappings as well as the possible
Tegra XUDC PHY connections.

----------------------------------------------------------------
Peter De Schrijver (2):
      dt-bindings: reserved-memory: Add support for DRAM MRQ GSCs
      dt-bindings: firmware: Add support for tegra186-bpmp DRAM MRQ GSCs

Prathamesh Shete (1):
      dt-bindings: gpio: Remove FSI domain ports on Tegra234

Shubhi Garg (1):
      dt-bindings: tegra: Document compatible for IGX

Sumit Gupta (1):
      dt-bindings: tegra: Add ICC IDs for dummy memory clients

Thierry Reding (3):
      dt-bindings: usb: tegra-xudc: Remove extraneous PHYs
      dt-bindings: tegra: Document Jetson Orin Nano
      dt-bindings: tegra: Document Jetson Orin Nano Developer Kit

 Documentation/devicetree/bindings/arm/tegra.yaml   | 14 +++++++
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    | 39 +++++++++++++++---
 .../nvidia,tegra264-bpmp-shmem.yaml                | 47 ++++++++++++++++++++++
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |  7 +---
 include/dt-bindings/gpio/tegra234-gpio.h           | 20 ++++-----
 include/dt-bindings/memory/tegra234-mc.h           |  5 +++
 6 files changed, 109 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
