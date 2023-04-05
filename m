Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1FAC77B60
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 13:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237940AbjDENKA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 09:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238257AbjDENJ5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 09:09:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9318626B5;
        Wed,  5 Apr 2023 06:09:55 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id er13so99939484edb.9;
        Wed, 05 Apr 2023 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680700194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXULW1Tg1AvdOyR+817NcoyG6wJR38hO2pnEfsLrzL4=;
        b=q5oa/vCMhLevDXLGtIpoACoVOPOvmzLMX9o3qnP3wKbXQyOzatgUXfu6V6QBdE1Dsf
         tMEkU2b4o4yLO24wRWesww5hno7GPFbEzWv6GVGryZArFf8E1r5kae7bSzduSCbAtIs8
         hcrvr5AfakYeh7BUqpimcK+GUIl68tYdBsPcdXWb6FWLlwnwoCBXa79/2lr8de5Y1p0R
         /Kbpuqk+eAn7/XobajFP5P5ce4DdDtIxgqndoqbQUXgXtrp+5fHNocsiKgrYXQQp07pm
         L67ZFx10y/0kbp1eFtGyw012hyVOYhXHIF9ykmGKNLYL+yCLljKzjiKs69bNaD9yHvlG
         TMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680700194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXULW1Tg1AvdOyR+817NcoyG6wJR38hO2pnEfsLrzL4=;
        b=X7wLvXuJF6Y3lQJzsH4tDxe905B9h+Z8iUcvtYwXfrrFjIfn262cPeXePIfCoXNGYO
         1gUwBDHYjKKFuBlmU3LfPBxtwQEbu2HeR8DAg9sPgJHg9WamSR75Gm8ao9Krs2vGV7G4
         bLlcDUkWys3bFQx5JOHiYM1MdWT0TwYlda1nt6lT/6OXV7uVJuFoUw1wxnL1LzUI5vXT
         JByPF01S3L0zjkJrYig6DTNaN/ckGJPMJjMvNTZAJsyiklyVlKgmXbp8H/UhJ4OClwAi
         /FM+VT/XsLcG4OI66bz/gdo66vPp3w92jCVmpiavO/BCk8EX5lkWaxoqLRI7UtC2ZxpH
         H3MQ==
X-Gm-Message-State: AAQBX9djBKn7pb/FfgUCtO8dh44fXuNQikWwD/E3SSRWuZAY74/5Dn40
        kzHWoxGHYKecqSnNZ5Qxec4=
X-Google-Smtp-Source: AKy350Y2m+a9IWIGy84W5fLSXxpY0qaEzQ49JdELMllLsc1czCEAlJXIYXIq7s7xpfJypNaP/7iGoA==
X-Received: by 2002:a17:906:4714:b0:931:d644:b9d3 with SMTP id y20-20020a170906471400b00931d644b9d3mr2789003ejq.59.1680700194084;
        Wed, 05 Apr 2023 06:09:54 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906018800b009306ebc79d3sm7302203ejb.59.2023.04.05.06.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 06:09:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: dts: add vccmq on p3310 TX2 SoM
Date:   Wed,  5 Apr 2023 15:09:47 +0200
Message-Id: <168070017409.4044223.8463461096099563249.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230127093910.426233-1-ben.dooks@codethink.co.uk>
References: <20230127093910.426233-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Fri, 27 Jan 2023 09:39:10 +0000, Ben Dooks wrote:
> The TX2 SoM's SDIO WiFI card is connected via mmc@3440000 however it does
> not look like the upstream kernel is even bothering to power this (and
> the regulator framework shuts down this power rail post kernel init).
> 
> The issue seems to be a missing link for vccq from the MAX77620 PMIC's LDO5
> which is labeled vddio_sdmmc3 (and not used anywhere else) to the mmc@3440000
> node to ensure there is at leasr bus power.
> 
> [...]

Applied, thanks!

[1/1] arm64: tegra: dts: add vccmq on p3310 TX2 SoM
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
