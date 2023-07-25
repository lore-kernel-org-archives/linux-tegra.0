Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3828C04A6A
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 16:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbjGYQcT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 12:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjGYQcP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 12:32:15 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40CF13D;
        Tue, 25 Jul 2023 09:32:13 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977e0fbd742so911580166b.2;
        Tue, 25 Jul 2023 09:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690302732; x=1690907532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rkfJmJDchPlVP0Sck1alECQIstmUhrdozhhrt9tbbQ=;
        b=efJOysIm1P/TUTRD2/BOXezS0dk/1n8akM6muFJBdygwY3SnkF0C1Cl9oylLvTyHdi
         w3BhjUypOKebJCVlMOT2GwQSo7NOMs5mCTNo/iG+bZs2XG0KiaYL3wr1LpkJdKajm91n
         Y2d0OBOxHsQtBoTjRWgoEAV+EKd+DX9eXsHKxdddDdInMoMrVZujgZygKDizLgkMyut1
         eZcXBnQvuNerewJpK6On0KEoQiVKNO2XDjpWYZ/Bln16TxYHMt9/sgC+fyc5hr7jdFuZ
         znltZtg4eA1vJDLRY+2DnXRNYfi3fFQBGE5ppug674JI+wcpZPPproqcjdjSXSJcxj6h
         d/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690302732; x=1690907532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rkfJmJDchPlVP0Sck1alECQIstmUhrdozhhrt9tbbQ=;
        b=fLTCZVc0Dh3GYtzm6fgOSMjwWEOW/8rmA0Br6YD93d0NYumxTMsnUxUU3qdy2cV/6r
         xlnK4fgyaGh8s/Gfg7eVFpueHh05QjAgCiz0LxqtCOCEn0J0UwSniQsx1NZJoF2f3zxQ
         Cad0fxEWQf89KFRF5JbMFDYYo/rn0f7W+UWVZlFJu38Xj/QPXefMd8WW9KAmS5UHLqjl
         DYrDn2iOjBH7pJGZaUVRCz+pdywv/TrWug/k/siPJtvqLbx2OyusfYoWwxqsfCAdEG80
         5mrTVIi0LoKI61hWFWwFK4pMzVnIdmO9whDJBzpv3K2oCpSNKNHsYBtGdedlqZwL/SCk
         4GCw==
X-Gm-Message-State: ABy/qLbLH7+T5BaY+R5EsypmLPoAyoCP3HffpP41jPHo+cGI4+9YaItJ
        SmZv/pRIa0R3WbX0ft5sYvs=
X-Google-Smtp-Source: APBJJlF5a8Tp0tdX5CGtjdqU7mmsbaTimBXTdWG/XO7FRKSqi4KyPUw2yV0VzZf/EzIwobDWeujRag==
X-Received: by 2002:a17:906:328f:b0:993:f611:7c95 with SMTP id 15-20020a170906328f00b00993f6117c95mr12102365ejw.39.1690302731847;
        Tue, 25 Jul 2023 09:32:11 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h20-20020a170906399400b00991d54db2acsm8399282eje.44.2023.07.25.09.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 09:32:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: clock: tegra124-dfll: Convert to json-schema
Date:   Tue, 25 Jul 2023 18:32:08 +0200
Message-ID: <169030265763.1427964.6521590596582713282.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721131322.2991364-1-thierry.reding@gmail.com>
References: <20230721131322.2991364-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Fri, 21 Jul 2023 15:13:21 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra124 (and later) DFLL bindings from the free-form text
> format to json-schema.
> 
> 

Applied, thanks!

[2/2] dt-bindings: clock: tegra: Document Tegra132 compatible
      commit: a640358defd84c71640b68065eb0ce359722e145

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
