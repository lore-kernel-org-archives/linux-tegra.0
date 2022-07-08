Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD47C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239305AbiGHS4Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 14:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238135AbiGHS4P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 14:56:15 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7606318376
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 11:56:14 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a9so9408285ejf.6
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 11:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRYIx80qdKmzRctOou8xam0gu9RHS40xRv10uoapvYs=;
        b=GMJBWXg556ODFg1/ApAUP5GYYjY14xfzfznUVhXitno80MAFgkMcHw4z154kht5wvO
         FMeFycAM3PlpYfpVkbAo4KTv4OI+daiiaoUakn6qZ1lVJE7w9L2zFO1zf7TTDGYDAnz9
         ailGY6oyDRlvSyMRgXhJgjbg0JwvTdR3crC46Ht239vhLAh0jSEFDv1NLMu3og/tiRPv
         sOl/7CzYJO8pRrzFaMUzDqG7eBpdcutdHJQRtn/6MfTvY9tEhhVuU5tpFwvi5kwMT0h+
         veqNFUc4tLVPNe+u2m00umfJVDI6edUcJ0fDPENjtRxF8lybmPesZFXYloYjbpjVF/Vl
         mQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRYIx80qdKmzRctOou8xam0gu9RHS40xRv10uoapvYs=;
        b=y3Tu2gyLQpdJ43HzNcdV7jJwGMsVPhiInSToWtykhrn4bVUwi9w0ZazHjiRH2K+xCG
         hZT9TFFIiLsOffkcAgIkAzLp8N7lPCNHqT4jQf6iGJWwkJuqblViE5o+RB8gs1XjGid3
         f4rmL+KbMzxcinuZnbZX/kjuxdQsbHjx+AmJ0SdPSobh/GHtAt1oC6DE6+EjVi2XBsl/
         Wb/uH5cAav5Zc8HUrdAVBx25+v5iXLnHQconRdy3w9BbgzaGJTQSB5xDD30oDHy2AWhc
         OV1W2ANZTyUocKiaOb2EsTjTS3+9dbOHmoM6iazpTRoHqzRaCiAilYiB5DTm9o5d4r/r
         hKgw==
X-Gm-Message-State: AJIora/FUTDWScn32tvZWDWmJW7jgGRHNlrszEl2iTB3PgK+ebQxCcbk
        wiInRl1hidDULCgz2K2Uueo=
X-Google-Smtp-Source: AGRyM1sX0SUidsuvfN5IatjAuoyijwMulWE//lmBOY9ijGDRQfBgH/VT59UfTzjXLiWkY7KP3sfqFQ==
X-Received: by 2002:a17:907:7f8e:b0:712:f503:1a56 with SMTP id qk14-20020a1709077f8e00b00712f5031a56mr4779244ejc.364.1657306573068;
        Fri, 08 Jul 2022 11:56:13 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906304700b006fe921fcb2dsm4413565ejd.49.2022.07.08.11.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 0/7] NVIDIA Tegra changes for v5.20-rc1
Date:   Fri,  8 Jul 2022 20:56:01 +0200
Message-Id: <20220708185608.676474-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

here's a set of Tegra pull requests for v5.20-rc1.

One thing that I would very much have liked to include in this is the
Multi-Gigabit Ethernet (MGBE) controller support for Tegra234. That's
very important because it unlocks much broader coverage using our test
farms and makes the devices generally a lot more useful. Unfortunately
there were some unforeseen delays and I don't have a final Acked-by on
the device tree bindings yet. I do expect that we'll finalize this in
the next few days, though. If we do, would it be acceptable if I sent
an update to two of these PRs (dt-bindings and arm64/dt) to enable this
critical piece of functionality?

Thanks,
Thierry
