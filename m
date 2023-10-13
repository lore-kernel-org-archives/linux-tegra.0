Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7F8CDB484
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbjJMPhc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 11:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbjJMPhb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 11:37:31 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A14CA
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:29 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9adca291f99so340649166b.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211448; x=1697816248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYPDhOVkv0waUVLnmOjl9NknnpY9Oe/qv6LhVI9mZSA=;
        b=PSlIsV+LQV0c8SDGBVXdaUsjmWaiEdRjn9ODcEd8FzJa3mqFq6VX6XmvbyhelEGsko
         p4aGlA3n8ihKp+mLAbZ14Qu///I8/0YA9LwggSakI9fnqzWKmPepD3kvUoyNfjPaeisF
         iZlrpjuv5XJinGFqopkM4U+HVzFZrjSw99zQNJdTzxOqeFgiIqHND2sGDi+jk0HjGjHq
         DPh+M23Tl2C7/tFQgVFasWRoKGa9VI7HQB9B1VX+afQfRixAK+mn39GIF0CXs9u1Gjyc
         iDUAQPFjQ8DEeCh9Bve7R+HIXHfQGqda39dayBvP1M+MDFWzNS37NTgpXYEBSymjbRYx
         vHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211448; x=1697816248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYPDhOVkv0waUVLnmOjl9NknnpY9Oe/qv6LhVI9mZSA=;
        b=l8tA/pyK5tyRQOmsTLphUEq0fCT7qctAmfbJDqf6dCfbQ/MzWLggy5s+5fHbwFNdi0
         DNvdRIUzYlNpaC56aNLPpJllOlcVfuCeEDCXVjM6DcqvHY+gs2lbZQs4PPV34aSg/Bt5
         kLtn7IedLzjvP85cQeMgmYUEiyyDla1xtUI2V4hxa2XM37dqzKNU8rqKRYLzoGv47avB
         hMjKoLoUVw56SMi9RTaaQF+zZyUFfrJOYWJoIM08MDTIh36l9JQM4BBuC2utum+tHLC9
         C/OufaxwFgZttcmgXHFNBNX4YEvbsrNiCL9VEwRt4URuOu/SzVwiN2ts9PFfMmFzkvdk
         s/uA==
X-Gm-Message-State: AOJu0Yyxx65p7d/Ymn3iF7Sy14WNMfcfPDmcElHEgWT0BX07RBB0yyiK
        w3UczYoXhQ8G/OawjM37XsQ=
X-Google-Smtp-Source: AGHT+IG8nj/Qv2VnFKlzi1cXekL/eiwwgncKIy1UFsOddZljrOd2B4TCVDk6myoz53lqhsLN1GH+wQ==
X-Received: by 2002:a17:906:8465:b0:9b2:8b14:7a3d with SMTP id hx5-20020a170906846500b009b28b147a3dmr25486973ejc.4.1697211447818;
        Fri, 13 Oct 2023 08:37:27 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ca9-20020a170906a3c900b009adc743340fsm12588732ejb.197.2023.10.13.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v6.7-rc1
Date:   Fri, 13 Oct 2023 17:37:19 +0200
Message-ID: <20231013153723.1729109-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-dt-bindings

for you to fetch changes up to 0434281722b5192f4c5f60ff891f98f95057a793:

  dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory (2023-10-10 17:39:33 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.7-rc1

This contains some rework of the Tegra PMC device tree bindings that
will help with validating device trees with json-schema.

----------------------------------------------------------------
Thierry Reding (7):
      dt-bindings: arm: tegra: pmc: Improve property descriptions
      dt-bindings: arm: tegra: pmc: Remove useless boilerplate descriptions
      dt-bindings: arm: tegra: pmc: Move additionalProperties
      dt-bindings: arm: tegra: pmc: Increase maximum number of clocks per powergate
      dt-bindings: arm: tegra: pmc: Restructure pad configuration node schema
      dt-bindings: arm: tegra: pmc: Reformat example
      dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 393 -------------------
 .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     | 416 +++++++++++++++++++++
 2 files changed, 416 insertions(+), 393 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
