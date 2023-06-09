Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43A0C7EE25
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjFITgl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 15:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbjFITge (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 15:36:34 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB7430D0
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 12:36:33 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so3215773a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339391; x=1688931391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG5qiuB70s2QzuITA0PPQCAlcduZcJ39qIHHzmtXAh0=;
        b=qOcoFkU/Z+OkqBNg6ziq0ijJCttUyV3XTHiThOP2t6XeA1PKC8cNh2naDxKxNH3EQR
         okMnEempMGd3DOfXYbQ4iDx/Lf0PKb2RSili9rxu0MnAZvwVu0ZYqcr1kBKxjcuW1/yZ
         aHplLoVdHk57gDXxG1pafbyO4lle8+feopUGQ668jGbTzq5UqPvRkiVus4cSIXMZIM0s
         u4hyGtRILGGYN8Lc7IrAo0vkwXHsbTzlL0MWw2cgsRAxGoOy31EFlPjV4f19eV1MfN0m
         6I2P7Qfrrc/JbAQFO9C2SAa4lVB6RDLYP1FdTTLUVh2fVnG4nHI/34zKTywI9iRWbFFw
         Sb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339391; x=1688931391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZG5qiuB70s2QzuITA0PPQCAlcduZcJ39qIHHzmtXAh0=;
        b=ifehFzJ9bHS55alD+KBHTJmuXdWG+iZtENsLeENQq9NoB51vF6ubP2uIuaHEivFfUc
         xNkLkR9DJqzC3JHI+PJTiYXqZgH42CWo8m81sbKAi+lUMbMCZ2zkTpEOOH9bl9R1VhOr
         ehaOCE24AEzqH4eydexvpgoCKl6hfE5fwYu7+zgyTlUKHkbCtRHYqsgj0omcQ1vJYnZ9
         8aeppZ3Gf5y91tI47WBizlsEQ8//C5F8umKHY3VbX0Di21Wy7DLhMzfltzi2Bk8MrHML
         1FIgOT9Jb5NulIBZtmGxUsDzUabHgV4oqlbo3pqSxmPw+Y8m86LqDfFB7req0xmFXgXB
         kD/A==
X-Gm-Message-State: AC+VfDw7Z5w8+0Y703eZhmRQrIS9N7Su0F+W6BpAUJbMzAHYLsUN+28X
        gPqkcqd7AwWI85A12F8RHp8=
X-Google-Smtp-Source: ACHHUZ6roflLK6ayLPBq2LM2wA8LYzV9N09UBOIOo4xBbUF+9fs6m+Q2ntrz4uuM/zm9rTl76g0c/Q==
X-Received: by 2002:aa7:d1d4:0:b0:514:9b64:e16b with SMTP id g20-20020aa7d1d4000000b005149b64e16bmr1767331edp.35.1686339391680;
        Fri, 09 Jun 2023 12:36:31 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w18-20020aa7dcd2000000b00504ecc4fa96sm2061422edu.95.2023.06.09.12.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] PCI: tegra: Changes for v6.5-rc1
Date:   Fri,  9 Jun 2023 21:36:19 +0200
Message-Id: <20230609193620.2275240-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-pci

for you to fetch changes up to 9365bf006f53d04b69d560ef7e2bf4be4c4d693a:

  PCI: tegra194: Add interconnect support in Tegra234 (2023-05-16 12:11:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
PCI: tegra: Changes for v6.5-rc1

This contains updates to the PCI driver for Tegra194 and later devices
that depend on the memory controller interconnect changes.

----------------------------------------------------------------
Shubhi Garg (1):
      dt-bindings: tegra: Document compatible for IGX

Sumit Gupta (7):
      dt-bindings: tegra: Add ICC IDs for dummy memory clients
      memory: tegra: Add interconnect support for DRAM scaling in Tegra234
      memory: tegra: Add memory clients for Tegra234
      memory: tegra: Add software memory clients in Tegra234
      memory: tegra: Make CPU cluster BW request a multiple of MC channels
      PCI: tegra194: Fix possible array out of bounds access
      PCI: tegra194: Add interconnect support in Tegra234

Thierry Reding (2):
      Merge branch 'for-6.5/dt-bindings' into for-6.5/memory
      Merge branch 'for-6.5/memory' into for-6.5/pci

 Documentation/devicetree/bindings/arm/tegra.yaml |   5 +
 drivers/memory/tegra/mc.c                        |  24 +
 drivers/memory/tegra/mc.h                        |   1 +
 drivers/memory/tegra/tegra186-emc.c              | 133 +++++
 drivers/memory/tegra/tegra234.c                  | 595 ++++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-tegra194.c       |  44 +-
 include/dt-bindings/memory/tegra234-mc.h         |   5 +
 include/linux/tegra-icc.h                        |  65 +++
 include/soc/tegra/mc.h                           |   8 +
 9 files changed, 871 insertions(+), 9 deletions(-)
 create mode 100644 include/linux/tegra-icc.h
