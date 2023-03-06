Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7263C61DA4
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Mar 2023 14:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjCFOcP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjCFOcD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Mar 2023 09:32:03 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7651731E21
        for <linux-tegra@vger.kernel.org>; Mon,  6 Mar 2023 06:31:34 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id cy23so39208833edb.12
        for <linux-tegra@vger.kernel.org>; Mon, 06 Mar 2023 06:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678113019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7renzVF3Du2PZ3KQ3/Pr4i3lBiVisATDCE3vcFtxWY=;
        b=qhtT+WlOU8If0FHi1LbEzOfuBEB1K4/mB3NMftJ/EI89ZYQaF0LUWwXgduMW+ApHEJ
         intQvrKiW4wYwrhsXDrQP24ZlGCCqNxbJ3e/xg21136tbVAh2nlQXWWgCiiIIPUcbRxA
         +AF01zAZ+Gv61SWhScpPYYGyRHj+ufi5zFGsv31WrzoiZEoHNB5A1nLDk3bnIunKL/h1
         pQBrO9EdqZD6Eu24TVMzonCowGOIvntm7nuu9KJ4pnhqJy42nbgMYlAAD/v0Zsrozi8z
         y3xiJGLMnzfc7orAzoKcu5rgzaZjusbBu+lW6SXhQyAgL1bwM3BgiUFxNCqZFBjo3YMG
         ocJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678113019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7renzVF3Du2PZ3KQ3/Pr4i3lBiVisATDCE3vcFtxWY=;
        b=5TA0X72slr9py8RPCYDmychjB6xris05pXYZ5f9Ak8oLSzPDjhnntR5bdf5V4OBUK/
         iqFOcDcCpBDqvYzXL6Rks0BtWWcqMAEtWG8j0oqYkVWWH8wTbufqzW6q0tsFb1TeQ/tR
         aJ5Afx4d3EbLSlXX2GcDQA8F6jGE940/5+1mWspkrMDbsvJYXOAT3VES7tqLN2jkDMom
         oVHTZYz5jo7XyWPRtBxsvVojKAvvHa2yuWIyBHYCU/ViIi9ISMn8JT2sHQcxK8+1eRNa
         O7NnHKZIDFi/52UMVOOWOxCm93GPhUUAP7IG4NzHUudtJHQ2DtBUoveq5Yj3io/68Uf4
         Dlgg==
X-Gm-Message-State: AO0yUKX4cY8Ov2XrVXuSa5nn1x8R+c3oqyBAQvWWX3/05s4CiU6i4CMI
        kQFDbLuy2+VLCsUUZy/i3ef9Dw==
X-Google-Smtp-Source: AK7set+IzGi0bFpAuzz685sYQ4n5ukaNPjStMmpLNnpegW7yNnsIlGR6WuRZIYdEFeCBArrEYXYu5w==
X-Received: by 2002:a17:906:3b4b:b0:85d:dd20:60a4 with SMTP id h11-20020a1709063b4b00b0085ddd2060a4mr10211759ejf.40.1678113019366;
        Mon, 06 Mar 2023 06:30:19 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:c1e7:5006:98ac:f57? ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906040800b008bda61ff999sm4658905eja.130.2023.03.06.06.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:30:19 -0800 (PST)
Message-ID: <c6f39365-e840-d782-8ec0-e34ec3681b98@linaro.org>
Date:   Mon, 6 Mar 2023 15:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/27] memory: tegra: remove MODULE_LICENSE in non-modules
To:     Nick Alcock <nick.alcock@oracle.com>, mcgrof@kernel.org
Cc:     linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20230224150811.80316-1-nick.alcock@oracle.com>
 <20230224150811.80316-16-nick.alcock@oracle.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230224150811.80316-16-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/02/2023 16:07, Nick Alcock wrote:
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
> 
> So remove it in the files in this commit, none of which can be built as
> modules.
> 

Applied as well. Squashed with next one. Same subject messes with b4, so
prefix should be corrected if these were to stay as separate patches.

Best regards,
Krzysztof

