Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A73C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 17:58:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 411546191D
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 17:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhCWR6P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 13:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbhCWR5q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 13:57:46 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF16DC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 10:57:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u10so26815079lju.7
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XLxTdLFQwwFdrnajKUv88Hjw3uCEQcJZ82QDErheT38=;
        b=vKLRoS37YEt73kxWpvOi12Ya1/JLN6HWmCTEYDGadUSpMiUfwkpR6cplisdJ5G0gOB
         IW2OFKz4c7uu/GWBwGamyUND6VBQSnPcCyGdSRq79trM1LuhP89ZbViMD3DN/8o0iBl4
         a5AIcWsEHnQRJHS2rlOikrg5Khn48nCjP5T9fdrZYDwEm7TzIcUzixeLdYIUxZoFICf7
         U8zXpkcd/Q5bagOJuaHTt4ptBjyX6u2Q7Z1EQY13biJz1WcujjhoOAFDNV8+nfRRmtki
         0i4mShKW3h6222+1zZqSwLStrzf9KH8CtCAirHFn6D8y21Bf3k6rO3HY/jgkYFYFs/Uu
         UAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XLxTdLFQwwFdrnajKUv88Hjw3uCEQcJZ82QDErheT38=;
        b=CXkGLxlwDKufBCmL8xGMRAQ7fW5hhwxB2ah4O7NKgp928aRhOxwo/MjLg+jlDLuAdf
         PaERwvUnacmuPPaHU5Kh7oTnd5wSsTy4fApTMYx1NwJJrvhl37aWu+0WXyE63MrBs/Hl
         rEbFYzGjfR7pNDzZXb3VirMpHDH9Bc+GydKAZO1Za5J760MNlVyCTQivDnil9UXdmVM0
         bkpwqdBiHWUdUvOJBGEv2h3ATVBi8imEnzIFNroEnaZKwUasWC+SlC5xmFPTnvZQRES/
         6nHHIQPMLDrpyy4CsEyeZ7LaMA2JrCbmVljJDugAmGtcvsrHLFBhCiFomp6n/puj28HI
         gU1A==
X-Gm-Message-State: AOAM533ay3K++3HNpIRFzv9gJYvz/kt/RcPE0XxzvmDa1//2eL6U3b1b
        lX3oZ6wDTsQve3h1UrjXCASIndwK1dA=
X-Google-Smtp-Source: ABdhPJwK3fQlVVk9I27uIymCqYnIErWow5dboq0PHU9jO11WR0Dp3DjLysQJxJifOlmFND5GyNc3xg==
X-Received: by 2002:a2e:140e:: with SMTP id u14mr3924997ljd.413.1616522263119;
        Tue, 23 Mar 2021 10:57:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id t13sm1917433lfq.66.2021.03.23.10.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 10:57:42 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/tegra: dc: Implement hardware cursor on Tegra186
 and later
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-5-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
Date:   Tue, 23 Mar 2021 20:57:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323155437.513497-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.03.2021 18:54, Thierry Reding пишет:
> @@ -920,15 +934,42 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
>  	value = tegra_dc_readl(dc, DC_DISP_BLEND_CURSOR_CONTROL);
>  	value &= ~CURSOR_DST_BLEND_MASK;
>  	value &= ~CURSOR_SRC_BLEND_MASK;
> -	value |= CURSOR_MODE_NORMAL;
> +
> +	if (dc->soc->has_nvdisplay)
> +		value &= ~CURSOR_COMPOSITION_MODE_XOR;
> +	else
> +		value |= CURSOR_MODE_NORMAL;
> +
>  	value |= CURSOR_DST_BLEND_NEG_K1_TIMES_SRC;
>  	value |= CURSOR_SRC_BLEND_K1_TIMES_SRC;
>  	value |= CURSOR_ALPHA;
>  	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
>  
> +	/* nvdisplay relies on software for clipping */
> +	if (dc->soc->has_nvdisplay) {

But coordinates already should be clipped by
drm_atomic_helper_check_plane_state().
