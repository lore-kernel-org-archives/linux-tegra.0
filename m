Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359F7C433FE
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Nov 2022 01:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbiKSBsY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 20:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbiKSBsF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 20:48:05 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B94532C0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:33 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id n20so17145344ejh.0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbfoB6c/UjNlcqISExBxrNR+Gfa67oAo9Qlc4W4UOAg=;
        b=KSLhX264k+IOo0mAuAPfLH/1foRxs+K6tkJuDT098hpRXMY4tGQvh9KdYdkZX4Wmm9
         bcEUkdVEylkFyGgFfgLeKv/0S4FquJnVjFKWjqv6njGuAqcSIOj1kBRa1r9I/cWmCWtx
         eNPg+S2yvMemxZe112isBa0CO9cr+pM4DL6tTP4al38Ga4NKCx/OTKGYfqFOJ0WGdmVu
         RXs5iPEZDOwIHtGR5YrhdP1P0Z3khSnDnwQVo2Iv7hnHKTDUzOlDGW+75G5+hAbftQa1
         QnCKFkXvzCB6dVYnzpPbC5L09F2CVV5/PuAwhUm80cj8tTyDjaQhxdn8oGybznJKJ8ks
         5/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbfoB6c/UjNlcqISExBxrNR+Gfa67oAo9Qlc4W4UOAg=;
        b=pXPt9WlQWVlQnrMUMh7ZToq+Mjrc7ARLPD79Z7P1ioRX1VDcVSLVeLWA623a7N5FvB
         9MRz8SU/r6zMXeAbLJqFm2Ijz9p3GsDnElgbXEeu2xr02FnDIaS9qd4Ynrk/DIecHIay
         x4iJKIwlYV54HSd/uTaR0JJQRgTbmUCouGtlEBRcVDgBZPgTozLcl7eN/Cs8cXNfwUlY
         FtCtNSo99F9Vb1WodZVVvfqIlATFjd4t10SRqoExYL+SC1+W+jz84T15LQWzJyCPCeXs
         yDI+W26DHo0UY8YnBZda1VeK14gGtRVubVfyrm6eL05Viw21BA88QI2r4+/DL7oR3CAg
         fnhg==
X-Gm-Message-State: ANoB5plL8UWBKemF0w5pDQorILVG/44aeZ+lgrD76SI3CqY2r9mxfjUi
        drG9j++1+gQsptLUQQ2ersM=
X-Google-Smtp-Source: AA0mqf4ZhE+3dLywNGW4ArFee0NvtkX1VLVd3EKlZD8se5YYnR49unxuUUs1Y+nI1choMdLaYRel1A==
X-Received: by 2002:a17:906:1641:b0:7ae:7d78:9fa1 with SMTP id n1-20020a170906164100b007ae7d789fa1mr7868452ejd.98.1668820833213;
        Fri, 18 Nov 2022 17:20:33 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d10-20020a170906344a00b0077b523d309asm2294476ejb.185.2022.11.18.17.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:32 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration updates for v6.2-rc1
Date:   Sat, 19 Nov 2022 02:20:25 +0100
Message-Id: <20221119012025.3968358-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-arm64-defconfig

for you to fetch changes up to b4c8adc40f4918d77ab851fbc06415fb313d6c7f:

  arm64: defconfig: Enable HTE config (2022-11-11 15:51:29 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v6.2-rc1

This enables several audio-related options, as well as the Tegra186
timer and hardware timestamping engine drivers.

----------------------------------------------------------------
Dipen Patel (1):
      arm64: defconfig: Enable HTE config

Jon Hunter (1):
      arm64: defconfig: Enable Tegra186 timer support

Sameer Pujar (2):
      arm64: defconfig: Enable couple of audio codecs
      arm64: defconfig: Enable SND_ALOOP

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)
