Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C112C04E69
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 16:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbjGYQcT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 12:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjGYQcQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 12:32:16 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2231D19F;
        Tue, 25 Jul 2023 09:32:15 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5221e487e08so5171186a12.0;
        Tue, 25 Jul 2023 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690302733; x=1690907533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBceGRzWKpIE4Dd/AMTfq7Rggqdnr61DBeWmKWRpEqE=;
        b=KNvTlfT+60jypZWuCwqeG8SesM+TtQaGtksxIVlklEpEc4D2iHgGg1Ed7WyDCZFLQK
         HM3Fu3UGYcYZWZrNMUd8YEVBiFvX9BrIwQyCIhUjfWLLtH+jU37qLDoVzOCQO4i7My+w
         4uI8rfKdioqfd+coqpqEcDoj6VVALOU8vRXnRO0UPXLFeiavGhOk46Frbg0BUOV1stKB
         RHv/F8RTbz6J+ou4S7kcipMYxRn8R7wUvHD82HtoJGgMapmYEackf2EbmjGGAUTWCOwT
         S6NywXy/LAAzWQDPvGdp96noLp+MqrfpOTa/vOtnp77fQK7Ih4OI85rbjMAEmHcvdNGt
         dDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690302733; x=1690907533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBceGRzWKpIE4Dd/AMTfq7Rggqdnr61DBeWmKWRpEqE=;
        b=HXD4GqyntXKUnZEXPkCBroT1rhmo0XcM1sbcMgxSdFFVEO/190RCIJot7Jh1JUeoSq
         vySuHKwyQx+2VGU0DbZdRAxaCPrHYzy6eBYI4GMBrAes8xd+Pt2Dd0Z0C4YMdeGT5PZX
         sSkulk3KTDzyj+nlz5XDYa9V5ZIVfT0pfrvCGXmChnPWdNFAIiYx8fsREbqOniPHODdb
         6QR25GHXiAO6qIP7ZRcJxYuR3czopkpZW4dD9o06fMDCEj3CW0wc5nHoWFHjCXbJFOON
         n/UbLEQGRYLiUWkRqaOeRhtMxJiYSrh9wuPTxD2uBhqVwf1mna/TnxVENCcfaElnAHJG
         nowg==
X-Gm-Message-State: ABy/qLbDHBA/29rBijBeLwxgtzrx5JRbrbJGJF26GzPSHnXMovKm2fE3
        NhgfXJphHwmgqOaEd+oTkw0=
X-Google-Smtp-Source: APBJJlFb1vzxvjaKwOWRYjPswClbk1BsCzApc40hjwU0NrTC+VsA4meenv3sygCcWn5om09Eg3omQA==
X-Received: by 2002:aa7:c90a:0:b0:522:2ba9:6fce with SMTP id b10-20020aa7c90a000000b005222ba96fcemr5951789edt.8.1690302733593;
        Tue, 25 Jul 2023 09:32:13 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w12-20020a056402128c00b005221f8fe4b7sm4506993edv.11.2023.07.25.09.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 09:32:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Dietrich <marvin24@gmx.de>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: arm: tegra: nvec: Convert to json-schema
Date:   Tue, 25 Jul 2023 18:32:10 +0200
Message-ID: <169030265764.1427964.7325298289951978580.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721124623.2988445-1-thierry.reding@gmail.com>
References: <20230721124623.2988445-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Fri, 21 Jul 2023 14:46:23 +0200, Thierry Reding wrote:
> Convert the NVIDIA embedded controller bindings from the free-form text
> format to json-schema.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: tegra: nvec: Convert to json-schema
      commit: 436ebd32b02568378eb694f97f5c1c2fa8c984c8

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
