Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1A7C76188
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 12:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237218AbjDEMl5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 08:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjDEMl4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 08:41:56 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E5319AA;
        Wed,  5 Apr 2023 05:41:55 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id cn12so140759673edb.4;
        Wed, 05 Apr 2023 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680698514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOUU+WYtRgw0Km2cfaca2wgzA2YRDTKFKwCdkgtIVXk=;
        b=BctKvew9pvnAL7HzcZeZRXHHfmwQhKWtbjAgAgxSnKfcUI+aGzbGY3auilYhE/oFYH
         8zLF1VU3zxQyeDbfFRWrnGjt59zKyx8/1THC0yy0Y+ccg3uZjxrHHjWqWK058oiaibd9
         t1boYPwzwzjjORAg7R/027/oM03QcTkFNvYMMyre82WsSapd6A6yFph2lgikvWiW0pkB
         dgmqmgoGFyADi5MZ3EvuEvPfzjk7dUa0h3B33w4dlYnbuu+sisUthdgHqgXTywCCxjcv
         ynUOFSPJ44aduoJ5TRU9HQOpTLrfvX8AlrKMhqcNpA33JId+mgbmRyeWUSSoDVP9RFnE
         HLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680698514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOUU+WYtRgw0Km2cfaca2wgzA2YRDTKFKwCdkgtIVXk=;
        b=iHxpfgUf73c76cW0HNPqnCxbwawrvkk3E7SOjKCuqzKWMtVS5pFOdfhZVg/GyxHwK3
         XpwnMuSaHu3cyX2a3p2fo4nYKkmy+/S4aMBVySI1jUoWNWWcmnoaDY81HgEf1aoAXYNT
         KC7CoYtDm/krFcnXMXVIEz3xaduK3S20IlVMUCuaB1mVcfk7By2o59/TrdJ6JUlaRVwQ
         wQBlBsn1XaAvYtvjWAhB2ea4mkhCsrNoLruDRo/q/jE/iQGxiVVh9canp2dSfZ9cNVp6
         H0LtvktOEwp/hs/KI79GxMLDI5GDg9R5fms9rJdtsMn5km7mKbbmwkxQTbAoK3fItuTs
         8t6Q==
X-Gm-Message-State: AAQBX9e4De862xDYu5vvzSxv3fD4Z5q/YUzPaqFdaHHN1qh6fSiuRxhJ
        QWKBOlL7JX+P/R+tF2XXMMU=
X-Google-Smtp-Source: AKy350YoxL/9lUW0uXEhWMfgQzeEy1KAEs34jDHyrbDcmsMloAsnwXUD5QP7dirlU0h+FbixNOf1lw==
X-Received: by 2002:a17:906:5e06:b0:945:2f54:5eae with SMTP id n6-20020a1709065e0600b009452f545eaemr2535953eju.77.1680698514053;
        Wed, 05 Apr 2023 05:41:54 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gw22-20020a170906f15600b0093debb9990esm7301517ejb.212.2023.04.05.05.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:41:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     kernel@pengutronix.de, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 3/3] soc: tegra: cbb: Drop empty platform remove function
Date:   Wed,  5 Apr 2023 14:41:53 +0200
Message-Id: <168069850186.4040665.2921383822729147388.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20221212222549.3779846-4-u.kleine-koenig@pengutronix.de>
References: <20221212222549.3779846-1-u.kleine-koenig@pengutronix.de> <20221212222549.3779846-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Mon, 12 Dec 2022 23:25:49 +0100, Uwe Kleine-König wrote:
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
> 
> 

Applied, thanks!

[3/3] soc: tegra: cbb: Drop empty platform remove function
      commit: c299a2e6bf944b4218acc194a1cdf500b34e80aa

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
