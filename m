Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C68FEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjGUNJY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjGUNJX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:09:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27EA10CE;
        Fri, 21 Jul 2023 06:09:18 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51e28b299adso2700097a12.2;
        Fri, 21 Jul 2023 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689944957; x=1690549757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CD+E4Mp2otFk1S66k5Xymn+CvNSYCteHOda2qgMiMM=;
        b=Bq1v7VyYcQlcBAWfYwOaW8515/6SMgGYDVaYXyUS9t3ndMRrNyPVvoDIRQ3WVgmX3K
         OSqQHYIStDrHSXEJGr6/g0nHAOjU6Aty2efrsKVwgeOPB9ba5v8W6oVzULlld3Izq8/2
         7pCj6kvkoz62LlsqodyPXc8OjIgjLP7cPcU5+giTGWQSRnx8YayXmS4AJ1qECvHTKQ/j
         EouXbEBVLb7rvP85Uq2OO4ULa15J6f9HLdi1UyZib1wNXucM+sNJ3H0zeESzTWlMuIfM
         vQ3eJI02HppFzjZaOQBvvMGxgmNZ7yVXJ1O+P8PztS/78zbmH9K0LcMOU3xVRewnj0p8
         /FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689944957; x=1690549757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CD+E4Mp2otFk1S66k5Xymn+CvNSYCteHOda2qgMiMM=;
        b=RFCBoUiDxB0dkKyJ2ccBqeWdBLaeexvsgb6YeORdg8GDsviGBI0rDLFXH2YmdhNWdA
         Nj/KkXw6rRNk4V/5wkh2UwrOY42Md19EaoQVHHSdjnvbBQkXKPENSbg81J1HVvw23AKv
         zvneB87Agdwv7CIYCJ7pX8QeBi41GBsQqUqtX8WDHf2nf71/qeZmq+gsIALAXUnWaLCs
         oEL+gXArEgjyekcw52vvk/LTrUNky8ixjAc/CyKw73y0abzqFvklz49IYb3E6umJdcL6
         L12kYIC1Q9nGNMjHIDs9+0okStynBBshkGEUjx1pogpZIFlHspFfvofdALYrsTJAMnzy
         c+4Q==
X-Gm-Message-State: ABy/qLbUmZ4IeS3qmJSyYo/SBKPhfa45FV7EQ42Klo3Ytm8yWo3YRxyd
        cgHVcvOTTLa12xBBrzFtjuU=
X-Google-Smtp-Source: APBJJlHWrSWg2F6CABqZvwrQ4/ipO5QJ1okv7LBb4fdlQbav5hnDFleOnAOVRbXbHHBF1iX1Go13bQ==
X-Received: by 2002:a05:6402:b10:b0:51e:164c:b67e with SMTP id bm16-20020a0564020b1000b0051e164cb67emr1685738edb.0.1689944957323;
        Fri, 21 Jul 2023 06:09:17 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bf9-20020a0564021a4900b0052177c077eesm2077087edb.68.2023.07.21.06.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:09:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpu: Document NVIDIA Tegra186 CCPLEX cluster
Date:   Fri, 21 Jul 2023 15:09:13 +0200
Message-ID: <168994493671.2990720.1708157405890484835.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705152825.2514544-1-thierry.reding@gmail.com>
References: <20230705152825.2514544-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 05 Jul 2023 17:28:25 +0200, Thierry Reding wrote:
> Add device tree bindings for the CCPLEX cluster found on NVIDIA Tegra186
> SoCs.
> 
> 

Applied, thanks!

[1/1] dt-bindings: cpu: Document NVIDIA Tegra186 CCPLEX cluster
      commit: daa0e17d3e1d79ddaff10cb0a18cb7b43c198e48

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
