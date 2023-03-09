Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4241AC64EC4
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Mar 2023 14:24:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjCIOYG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Mar 2023 09:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbjCIOXU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Mar 2023 09:23:20 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F1282377
        for <linux-tegra@vger.kernel.org>; Thu,  9 Mar 2023 06:23:17 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id x3so7598710edb.10
        for <linux-tegra@vger.kernel.org>; Thu, 09 Mar 2023 06:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678371796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jh5aPM7+Dw6V3HOON0YvwJwGKWnyCSyvceZb9F+qd44=;
        b=td3t1M6V5gDMd/hAACSOmU5P79sX4O5qe6W9Nd/LYQJRki6vOwrmKj5BFpQyYS3RAE
         BTH3sb+HRbW2fkukzHdHMwN8Mr1sU8HC9R9fhF9M81B34jN/OGvmUqBwyhowPYBSlRiK
         tZNh9BH96EzVjiTmoX3Osw6ASak54rgg8fZmviNMyH6Q5jdESAT0LV7ZCgOXsnwAPvjF
         4FWS5CL1MxZAOLzk0J74jtHlTTm+CRqjFBEVTQdrkIBXGTOrht83H9TiMBfwYRyNviRL
         qUnqXzIHaCzngA/ycg6Lhf7Fd6mG4J2Pk7dC7J1k6Vy5jQhYumWXa4c5SdMYLN0rjreg
         21Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jh5aPM7+Dw6V3HOON0YvwJwGKWnyCSyvceZb9F+qd44=;
        b=6Ymazq1tqYTaNlNi7k2EiqKG1FLLd1ymM4ym+r8m763Obrs9daSW7z1uOxFNcgFGvj
         QyvvznbkUL+CfORQI8w4YamzBv585yvVbJY+oZu+js8wUTtPxAP3q295TVa3A7VWnkVC
         Pb2LAuK+wm4bWORv3nkadbfm1N3VvTn5AoP/Lxe7axPnsatoh+hBOYDPO21+SRzkLsDJ
         WnEDw1YJjCoMVwKxMwK4RU8T15csks39m86A1zvZS3lTXCke4nvSLqYhuN07E4JMPL7s
         u9rhOxpJxsPjfqoQMWzH2Cg775gH42m2sk6Gb+yMzEjnWLbn3VSrmbWGLIM8Dk112lSu
         2Yrw==
X-Gm-Message-State: AO0yUKX3pNc000dkP48W2+LsoNEhd84Se9uzyxd6BqUiHgQXlbsl3kpg
        aChVZAcTZOTCWeIbGsJANlnMMA==
X-Google-Smtp-Source: AK7set+icoju+UnfarONFjF/sNDObZvo0VNeXFlRTb4Bgubd0olVyinNrL/jEWKS4FhRJixO5j80nA==
X-Received: by 2002:a17:907:9948:b0:8aa:a9fe:a3fc with SMTP id kl8-20020a170907994800b008aaa9fea3fcmr24302953ejc.8.1678371796294;
        Thu, 09 Mar 2023 06:23:16 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id u15-20020a1709064acf00b0090766deae98sm8795269ejt.166.2023.03.09.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     lee@kernel.org, Nick Alcock <nick.alcock@oracle.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-modules@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] memory: tegra: remove MODULE_LICENSE in non-modules
Date:   Thu,  9 Mar 2023 15:23:08 +0100
Message-Id: <167837171022.467499.6836316604855383208.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308202117.426808-1-nick.alcock@oracle.com>
References: <20230308202117.426808-1-nick.alcock@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 8 Mar 2023 20:21:16 +0000, Nick Alcock wrote:
> Since commit 8b41fc4454e3 ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
> 
> [...]

Applied, thanks!

[1/2] memory: tegra: remove MODULE_LICENSE in non-modules
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e63b0663f0028b265201798d74de163140ac124e
[2/2] memory: remove MODULE_LICENSE in non-modules
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d2456ddb2e7e1b89ed637e8190fcbbeadc7ea8a7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
