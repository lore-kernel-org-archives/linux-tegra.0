Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482EAC678D4
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Mar 2023 14:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjCFOkD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbjCFOjy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Mar 2023 09:39:54 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472313A94
        for <linux-tegra@vger.kernel.org>; Mon,  6 Mar 2023 06:39:30 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id i34so39470938eda.7
        for <linux-tegra@vger.kernel.org>; Mon, 06 Mar 2023 06:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678113568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK40+IrvuLAaGEzw1vO71ZMnvX089nmXSE+KdSBZGxI=;
        b=yrdpLCMyHKrmoAudHhPHQnqdaN1kIKb4D1frwVvOfPs+vbAmT0/CwNE3zf7ZQHBPdQ
         KxXkPsaLP8mEdKymxbVC2tlDI6o6BpNwhSKkgqbz+MXikEAwDHC6VX2KvtqTs1Tx27L9
         Veb78Y6K/Pd/D5JxBEnt6dJaV5Z/xcGgYEEjHvX6zuMO+lzZJZl3IcYH74VLwAgdwZcI
         c/FigBOsborvk72pyqqZfRjkxaI2eReo0zhgzhNKyOMIutVJu5JYamCC9j+Tq76W+ohw
         5jXHPT3AAeqDHgeGD4q0Y/tS8fk4aDjrdvPTc/7pX/t8PsRXnv1z3ObflCbBIOdq7KY8
         HL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678113568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK40+IrvuLAaGEzw1vO71ZMnvX089nmXSE+KdSBZGxI=;
        b=JKvAeJofCVxaQKvUHdy0FQ5N+3rIYKOTi9o+yPZRxElmHE4UUJ0e0/Gy0Cy5s0Q0+N
         v3m7Yty0n5/Gif3hon6BLp9u2BVrmVh+KefrvpCNXxrQuxuBF7G0Clo6paUhU8RqeAzC
         xeAz7d/ia+dANfVvLPr5PcJwTKJlvckzYW1tW1PpH167kJJg3pOSr9yRMOXUuPRa/EAr
         q6mt7wh7ptlwwell6r//pF99bGcTIj84kXvsQiTLv7ak7YKOCzJj6Bi6zo5U7ewqAuvP
         gSf2vTEmr6dje5N4WFk1qO5K74TJAKdThjwBNpua1cLX0Bdgamb8xSF4z4EoZ/3fJIlD
         zMcw==
X-Gm-Message-State: AO0yUKUL3W6B5MwVcZzyKmjyM8Q0mG06FZlQBk1g7up+gwK6MaVwTdq0
        ZcxE6ANp39PuQidXfqv0R9NZJFlCNJMqOqWK4k0=
X-Google-Smtp-Source: AK7set9tagM4MvfxFASDbgv+ClynFHyi2+EfGVgbjvu5S9HDWrjjA77I6x2FIorpAtxNw/VW+IojBA==
X-Received: by 2002:a17:906:5e0c:b0:872:82d3:4162 with SMTP id n12-20020a1709065e0c00b0087282d34162mr10260275eju.44.1678112891814;
        Mon, 06 Mar 2023 06:28:11 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906a38e00b008b8ae79a72bsm4636763ejz.135.2023.03.06.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:28:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     mcgrof@kernel.org, Nick Alcock <nick.alcock@oracle.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: (subset) [PATCH 16/27] memory: tegra: remove MODULE_LICENSE in non-modules
Date:   Mon,  6 Mar 2023 15:28:08 +0100
Message-Id: <167811288496.11610.7328079575847216501.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224150811.80316-17-nick.alcock@oracle.com>
References: <20230224150811.80316-1-nick.alcock@oracle.com> <20230224150811.80316-17-nick.alcock@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 24 Feb 2023 15:08:00 +0000, Nick Alcock wrote:
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
> 
> [...]

Applied, thanks!

[16/27] memory: tegra: remove MODULE_LICENSE in non-modules
        https://git.kernel.org/krzk/linux-mem-ctrl/c/ee5ca07b2041dba178e11f33c79d4bfc20227f09

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
