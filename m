Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F703EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 12:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjGUMlX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 08:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjGUMlW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 08:41:22 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ADF2D56;
        Fri, 21 Jul 2023 05:41:21 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3159d5e409dso1943031f8f.0;
        Fri, 21 Jul 2023 05:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689943279; x=1690548079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPjxOQjsofbhfrk52iWdbyU68feunbE03M6sVA/B7o0=;
        b=BsV9RhILT2RPOQXEEjjeW/g486KHZxSGwn0MC2p3a+gsen69Qjjj5r4UbuW1HL4vnk
         PC1/D+K+DHpYI34kc/9ceQ3DQ3hsh1vEgceuHI2RC/NdYJm3m8aUNYAK7ptJqveW8ap/
         DSgwEnhW+40aJM1oOT4ZU6g8VpLzwl6qsi8xd91wNr6UmeVtqSYIXIreD54jCvnV8hyY
         jgPg16En7zTX5BhPf2QxIeornEm1lk62dXlBwvT+sFZM6CJkvriMZiMxD6GKKGZCECpY
         7VOO/+ZxW+UYrIKk9MJn4U1ZGpzkvQgrz/s4PixOEjBkWG1g0RRmcpXteKT0OM//ByxR
         e9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689943279; x=1690548079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPjxOQjsofbhfrk52iWdbyU68feunbE03M6sVA/B7o0=;
        b=fL8sdO1bNS3zgZSIPnvYMvKZ6uKLCFU2Bw9edEF3ko1E0Hv+/xL6lGp6PQW85Nr3xh
         q5UMyjHfoFkKJOZc5rhJyq5KODV/ah2CI1GQMuog/I+fXeok6DPepA5NmV8ulYGO6CnP
         Y70Cv8xorEXsjeO8ZUZ7CTU+aUiay3wbyYBDSu9Cx8DhrcmmqlavycdurGsHR9DKasfG
         mVuuC8w4FMWbjYpsc1YEH/ImJU19AhDCTn5bbc5TfmRK714Sa132zUzhXqsnGbAmcVjR
         K4NVQkDp1ZVTM4p3W5BAenz0QliSnKhg4+gbbLiZC7sA2bkxOFmsc4lH3MN162W08ZMn
         0biQ==
X-Gm-Message-State: ABy/qLarP79jHg5Hkgu/XIQU6tvn7zpRe9ZUXB8a7LLFg/Y1Jp2qz6Dq
        qKHg77Ftl5KL3vOHkgptjTY=
X-Google-Smtp-Source: APBJJlF9yXGwsOf2tbz3srktjFKOzeUfIapbxiO2CDuLpJrlfo2uaNm6krkt7LA4XzPXfKybuhsPkQ==
X-Received: by 2002:adf:f812:0:b0:313:e2e3:d431 with SMTP id s18-20020adff812000000b00313e2e3d431mr5114262wrp.12.1689943279219;
        Fri, 21 Jul 2023 05:41:19 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bc5d7000000b003fc06169abdsm3337978wmk.2.2023.07.21.05.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 05:41:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: arm: tegra: flowctrl: Convert to json-schema
Date:   Fri, 21 Jul 2023 14:41:17 +0200
Message-ID: <168994326009.2987791.1353302439424549340.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705155222.2519728-1-thierry.reding@gmail.com>
References: <20230705155222.2519728-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 05 Jul 2023 17:52:20 +0200, Thierry Reding wrote:
> Convert the Tegra flow controller bindings from the free-form text
> format to json-schema.
> 
> 

Applied, thanks!

[1/3] dt-bindings: arm: tegra: flowctrl: Convert to json-schema
      commit: 41b97d0c7b467f9db89d4075e9ce8b8a49c65e46
[2/3] dt-bindings: arm: tegra: ahb: Convert to json-schema
      commit: e94c92f886df319bc5388f0bdd1ed4df0aa00b6f

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
