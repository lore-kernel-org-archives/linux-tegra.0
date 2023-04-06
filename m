Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D08C77B72
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 12:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237404AbjDFMsp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237208AbjDFMsK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 08:48:10 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31440180
        for <linux-tegra@vger.kernel.org>; Thu,  6 Apr 2023 05:48:09 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id by26so1091034ejb.2
        for <linux-tegra@vger.kernel.org>; Thu, 06 Apr 2023 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPWDczGne7HJOkL6V/dZbAS1zqSXRveSE1GPiL2Q4Bo=;
        b=d5VGRNdfCFCw8qz2Eez08tIyMeWTupHSycLdTxITIbMGrjIl5Kb/TDinl1VILuR0y9
         m0vxUNrDoETsNHhb+YxX9r7xEaYKF8DgErIiZ8w7fo6ClzwLX+sal1LrZ6f1waeRhts/
         5rhbNu7H78Nqt/37043sz4ULQt4UEYclrl9a0bHmBlmD1gWRF6VHUJIL8y1mx81Bjte9
         V9ALJZP54Di05iGRcN+AtMByEZaeexbRI/9hxlQrxiUfShYbY165TQZrD0xSS+iaHnx1
         H76JSu9z+Zk50Z9XckKwS1aEJIRpssU0ZUbgkh8ogMYdHeM3BmurtVchG5MBJjoU7V0m
         VLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPWDczGne7HJOkL6V/dZbAS1zqSXRveSE1GPiL2Q4Bo=;
        b=xETBzbtDwJrsIoWLdoQGTxSv/Kpv8n2RMWdT8ugsOJP+HAiNCfEpyk2CVe+Spl/e+g
         OwWzJNl3PCgPNCpmoqm6fLD2ibzCGbZFM83ZIbhdkGeHkkLyCQ2gmxYKeR//t2OPrJhB
         F4p1cEumDUjt3XX6xHs0wlGj+XNi6jrfWFYgWswPC08acRD2yR4ULGNZSe/iOKKtniWu
         QhQixO/XTrAEhhCbLB8V8PgUNPK97EArjxVb+w606o7JFoGXPxECWZClL/iN10npX9Wv
         wzJ8f9mnx35rRL4BO8O1976BcNGZJPmXY5GzgvpgGm1OWDSq+Xo2E7k4Wq/wIQCtYsYr
         /IlQ==
X-Gm-Message-State: AAQBX9eN0ij66p0WG2helpIX4Cc4r5Nf0dg4Rhbtu3ElWmjGbA8a74Bu
        YYyXhWVdBN03EwkD7ETTXkKBvfu9np4=
X-Google-Smtp-Source: AKy350Z1SlBOrdCmfUh6G8iYDOG00v+rhQc/PSeiEsmWfl3RyLgCXAZr5+h2ZwUy1UKS+zkFnS8nUQ==
X-Received: by 2002:a17:906:edda:b0:932:2282:dbd6 with SMTP id sb26-20020a170906edda00b009322282dbd6mr6856142ejb.5.1680785287717;
        Thu, 06 Apr 2023 05:48:07 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id z4-20020a170906814400b0093018c7c07dsm778777ejw.82.2023.04.06.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] dt-bindings: Changes for v6.4-rc1
Date:   Thu,  6 Apr 2023 14:48:01 +0200
Message-Id: <20230406124804.970394-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406124804.970394-1-thierry.reding@gmail.com>
References: <20230406124804.970394-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-dt-bindings

for you to fetch changes up to c94673e80377d67ba36ee4059d7814b2ab98fa71:

  dt-bindings: arm: nvidia: Drop unneeded quotes (2023-04-04 15:32:11 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.4-rc1

This is a single patch that drops unneeded quotes from various Tegra-
related device tree bindings.

----------------------------------------------------------------
Rob Herring (1):
      dt-bindings: arm: nvidia: Drop unneeded quotes

 Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml | 6 +++---
 .../bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml           | 6 +++---
 .../devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml    | 4 ++--
 .../devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml        | 8 ++++----
 .../devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml        | 4 ++--
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml     | 4 ++--
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml     | 4 ++--
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml     | 4 ++--
 .../devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml     | 4 ++--
 9 files changed, 22 insertions(+), 22 deletions(-)
