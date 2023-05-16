Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D49BC77B7A
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 09:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbjEPJ7I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 05:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbjEPJ7H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 05:59:07 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6DFCE;
        Tue, 16 May 2023 02:58:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9659c5b14d8so2337620366b.3;
        Tue, 16 May 2023 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684231135; x=1686823135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jr3MXx57w4YpAO+hjBNpT5SRrLAOBG6WW73leQUyFhw=;
        b=qn6NM7SGUu3WluUF2zVY2jas75t5AKK9rCaPDSq69XBafRxM3rWEjoBWZatXh2qBuf
         fVaA5mzHG6B6Juumm/S8ZqNpgGTl9GNetFogdYzDpZ2EbXjd1rFeU64z7FG31OhRgbSH
         aKWELHoQri3EZsgqxDUtN1IVE2Py8TN6Wjg8bIfL8Zbodzq44mukfFHjs8lC5ZYkooio
         2YHOkeJbvGow8t6KtYj0ru/XHwLX1uiRLZPcPwj6Zw9C+RIviWGAVh8awlgHXZl1hWIB
         1f9tisEegoLnC0E2S8lkI0VLbjRdBe4DA9lksFyQuqdmmy2sGDIFYTVEVCSbyZY3OcJX
         ULmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684231135; x=1686823135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jr3MXx57w4YpAO+hjBNpT5SRrLAOBG6WW73leQUyFhw=;
        b=j33clAenQ9VY8CkNmKvKKaJOrzDlTAypN5VF9WLm6jHxf8jYrcQoP0SC87H4UkXqFT
         IOurltfH4+yrAe8CjSESsErEu+A0lDuoKIIzryYqnHm736NbrswJxdZ6kspOPgt64rrz
         rCRHifNVlaMaj9tW3E4XstD075Wi+0eR8pMLepxTv62AvUOXnJsdB4D6l3IQdjnsOBrZ
         VjVKnGuuLONQPDlgiuEUmQZu2hT7q6wJMvxE7VbVXe+RXYpky8yMZwU6Bi0GWIPONgIp
         wWXGgKc+SYL9KINyRpWDDJwZgvRpG5NjGBAiR8qycu542/TBeyfEXgxtoaUVse1aDrl1
         jsHA==
X-Gm-Message-State: AC+VfDx7MPFetIQF6gkuN9QsJyTFXSrT2IR/MOfD+5hXl0i2hZ0Mkkzg
        1hmBijXVId9iK7K23ThSiBQ=
X-Google-Smtp-Source: ACHHUZ7naI+7G3JO4RlGLEqCdIdN/s4kjjOozxUIBs7fNJvbKl7V/TPTAxPRTEgJ3HCoJoQagxHJRA==
X-Received: by 2002:a17:906:974b:b0:965:ff38:2fb3 with SMTP id o11-20020a170906974b00b00965ff382fb3mr34469287ejy.74.1684231134948;
        Tue, 16 May 2023 02:58:54 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id jx6-20020a170907760600b00958434d4ecesm11009006ejc.13.2023.05.16.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 02:58:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] arm64: tegra: Support Jetson Orin Nano Developer Kit
Date:   Tue, 16 May 2023 11:58:47 +0200
Message-Id: <20230516095850.2426604-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this series documents the compatible strings for the Jetson Orin Nano
module and the corresponding developer kit.

Changes in v2:
- drop patch that documents extra SKUs for Orin NX
- drop compatible strings for extra Nano SKUs

Thierry Reding (3):
  dt-bindings: tegra: Document Jetson Orin Nano
  dt-bindings: tegra: Document Jetson Orin Nano Developer Kit
  arm64: tegra: Support Jetson Orin Nano Developer Kit

 Documentation/devicetree/bindings/arm/tegra.yaml   |  9 +++++++++
 arch/arm64/boot/dts/nvidia/Makefile                |  2 ++
 .../arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi | 14 ++++++++++++++
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  | 13 +++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts

-- 
2.40.1

