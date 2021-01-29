Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF7BC433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AE2D61477
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbhA2Tdp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 14:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbhA2Tdn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 14:33:43 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BFDC061574
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:33:02 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id es14so5013693qvb.3
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mwt6PYt422RZr5pAeACM9vyiMCyLXs8GJeF9XZ1Ku/4=;
        b=XvEoFspRjc44ZPN01jRZgrDB0RcoMQx30OGPldUb0GekBNzzbbWHmmokWKb1QpDcY0
         zT8sD6jjRTNCsPDMtwG13pdDrr+UsKufx70NWQhm4z0PZxMWhsUxu64Pil/833RPbD4w
         moUi/1sJbECYY9mXtGpFubfV4066tSJKNGKRWmTCj3uOr1+p16awkyTBKK7HD/Woz1HT
         vVAK0mNtCgAzuQqSh8EXnkGt/bS0QMEesvVIN56zlBp3xGVLvvoINi8JRieE+x/R5+6Q
         3ctFEHB8o2/qAzYwfHbAKspZnEicA0Zr5ed5yWApu6wZMBPCi3W2sFnfpIx53UbJQIsz
         BqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mwt6PYt422RZr5pAeACM9vyiMCyLXs8GJeF9XZ1Ku/4=;
        b=YT/mVZUx4gaJFTqskPke/l3L3gINEftLrIcmxtiyAG5PaX2S1e5wfewRcdOzMW2M8Q
         8wBy608I7FfSmTsLBUsirkEEQ9bIUo3m/dIlpOIUUT61wSKkPIPPopjuRAQzXfo7R+Ek
         5wQLU5fNdC4J8coRN7pmRKtlfRHdG8qXQRCqdneRC46kwDP2fXw9diah+A9Ya+FuDpA/
         ZKLRuXDq0g+GrfqNgC5aHxoH6I1OxsAtdn62MwUpbiCPxllx4gtolldn8dXjhcCWi6gq
         IMLqBbF1glMO0Bf5TK4omTF8GhaY/LDx9RnsqBhILnhnID9vep5/bWm5/0TungVJJa0/
         raQA==
X-Gm-Message-State: AOAM5316HloSZ7GUIFb2nnlbqDkQVDj66AaidiTh/qkM8bqUcaeff3cg
        +GexIwoKryBrDXJHvzeIFQs=
X-Google-Smtp-Source: ABdhPJz6//JxPflubp5RhH+Qrff2wJYD+9lPMkoqu3M/SZu9QEK9EVrKezOiEwB1HQiXJU1P+wJCkQ==
X-Received: by 2002:a05:6214:7aa:: with SMTP id v10mr5405656qvz.2.1611948781910;
        Fri, 29 Jan 2021 11:33:01 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m10sm2615314qtp.72.2021.01.29.11.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:33:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] dt-bindings: tegra: Changes for v5.12-rc1
Date:   Fri, 29 Jan 2021 20:32:50 +0100
Message-Id: <20210129193254.3610492-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-dt-bindings

for you to fetch changes up to 6c50321fd65135a28450f16b5745b72368d61006:

  dt-bindings: arm: tegra: Document Jetson Xavier NX eMMC SKU (2021-01-29 16:56:47 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: tegra: Changes for v5.12-rc1

Exposed a new QSPI clock to DT on Tegra210 and documents the eMMC SKU of
the Jetson Xavier NX board.

----------------------------------------------------------------
Sowjanya Komatineni (1):
      dt-bindings: clock: tegra: Add clock ID TEGRA210_CLK_QSPI_PM

Thierry Reding (1):
      dt-bindings: arm: tegra: Document Jetson Xavier NX eMMC SKU

 Documentation/devicetree/bindings/arm/tegra.yaml | 8 ++++++++
 include/dt-bindings/clock/tegra210-car.h         | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
