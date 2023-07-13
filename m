Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A2AC001B0
	for <linux-tegra@archiver.kernel.org>; Thu, 13 Jul 2023 15:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjGMP2L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 Jul 2023 11:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235049AbjGMP1s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jul 2023 11:27:48 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6D63A9A;
        Thu, 13 Jul 2023 08:27:18 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so7830645e9.1;
        Thu, 13 Jul 2023 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689262013; x=1691854013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7lQ5ouR70Aypv2XQXFWU/jmz/ZI2ZaA+z3/htYKBig=;
        b=bTLgR4nSNeVX2XJppFWdqt/cKkh8lR0SvIvFIzKd4O+4+6w9AkKrtD6CstluaBOi8D
         lx4xOqDw/ZCGz6FwA93zBAG1jiguHZJG0jIcgvASDdOQRPT4Nh/3SAfmvYM9T/fakaTW
         BKIrhWv0gXKceEW7OxQVFaWD/vB2yH3K4IR7AByMdyTyV2umH41og+irMOgCnOrSejOi
         bpTxxo7ErFbZBO4+5k6CUmnys/2NbSp+MyPl7ZbhIrkNcDItJK7m1dcV04SBHXxCgTav
         g3u15HvwdpP17hbKptn6J3dgYjbPtjV/SjbvWqWFhlQvPDvSKtQZNqsZBfQeNhflexsX
         5BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689262013; x=1691854013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7lQ5ouR70Aypv2XQXFWU/jmz/ZI2ZaA+z3/htYKBig=;
        b=jiuZ5m3xUZJTHMFGrRRu6bLinKmPLi858+iK3GDwDFbZpkE88rrsjOidnekfUaozZ/
         8kclRvgLOe87iM3BLpfI0uHcwjY8ivNN6e4mWVf+6y3becQpC/v/fXM9lUOBG5ZeKyjc
         XTc61zvLDzWyqJb5ALgFii9NWNuaGSJDjoxFnFfV9FAHSrPA9wSAh94X6HTa4RL81yXN
         DtAydqV2/diHm0Ei5JR1byaAfq4gUQI5IXxURScyF0ccsy3O7oWyxhQFpbEWp/utnKJ9
         wrw4KI5orV3Vwr3R2I6aO//oSKz9FPYbRF8z/zEoyVUCoO4tmnlJyeWX9jLnNLH4JWAj
         tGOQ==
X-Gm-Message-State: ABy/qLaskyvIG21Y2OnfnIE0ryKBv00xlEhMZKJ9T5blKj+NLRczGm9l
        pq3woaELH4bMhCeDQMW6Cdk=
X-Google-Smtp-Source: APBJJlEpw5XP8b0gueX0CvzSmqjZ8tcwI/3hshe1l0lFuwkbDC0++RgpO3go35C/XIHuhfPDqUnaHw==
X-Received: by 2002:a7b:cd85:0:b0:3fa:991c:2af9 with SMTP id y5-20020a7bcd85000000b003fa991c2af9mr1698674wmj.16.1689262013242;
        Thu, 13 Jul 2023 08:26:53 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003fc17e8a1efsm8406827wmd.45.2023.07.13.08.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:26:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Fix HSUART for Jetson AGX Orin
Date:   Thu, 13 Jul 2023 17:26:50 +0200
Message-ID: <168926199654.2340273.2674419687541112832.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703113617.75311-1-jonathanh@nvidia.com>
References: <20230703113617.75311-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Mon, 03 Jul 2023 12:36:17 +0100, Jon Hunter wrote:
> After commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> reset-names") was applied, the HSUART failed to probe and the following
> error is seen:
> 
>  serial-tegra 3100000.serial: Couldn't get the reset
>  serial-tegra: probe of 3100000.serial failed with error -2
> 
> [...]

Applied, thanks!

[1/1] arm64: tegra: Fix HSUART for Jetson AGX Orin
      commit: 861dbb2b15b1049113887fb95e856f7123eea0cc

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
