Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C265C2D0E4
	for <linux-tegra@archiver.kernel.org>; Sun, 15 Nov 2020 07:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3E9922447
	for <linux-tegra@archiver.kernel.org>; Sun, 15 Nov 2020 07:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIm+9HH5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgKOHzX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 15 Nov 2020 02:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgKOHzX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 15 Nov 2020 02:55:23 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C33DC0613D1
        for <linux-tegra@vger.kernel.org>; Sat, 14 Nov 2020 23:55:22 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id v20so15973041ljk.8
        for <linux-tegra@vger.kernel.org>; Sat, 14 Nov 2020 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w351LFQNF9H2QQU5s9ICrFROPbDSbajAx2THMxGUsJs=;
        b=OIm+9HH5pTxZdbp+Ua7HVxFls3Z4ovdHo+cdgB72BMcXNgmnBEnmCI4Y3H7OQ6x4gw
         6LdLCIWZCK4yvnBzJ4rrQpM8qh52Z6cjpzp3BYZ0LsAB0+U+NdTBL7fsb7M2A93BjOoS
         F+5BEmJfrUukPiDaLmmo33ZgYlVfToC1N8appDAj5YAdVNVgh4Xr7xM+og5YfjgdRhB0
         MOtDqLSSt7qctEfR1/W3YVvH/BheGL9iqz6TW/6pN08k7nXzvprFxWwLM7l3n2k/zkjJ
         +sQwMGMZ3avs+OdiySYlhOmPcfv/XLxfiWaEELaoK2bMTMYctb591BmtQsoQhNY15BJD
         DMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w351LFQNF9H2QQU5s9ICrFROPbDSbajAx2THMxGUsJs=;
        b=iUsqPrP6g4qm9FXKoAzjn8Di5bjLUHfXJKKPnw0jL4C7T7ALhBLoMd+MUC/P9PY11O
         URwb3ZwnwtvWGrUj0ojI4oaS8/HcOLDXoPojGrhjdp3HTDsBp+8ILlvFloDd26gpgsVc
         aCDwOC2f/I6aaNV6UvXfas0pnxP97ojxveTe162+m2K0Do8YvubdJ1MAjbOP8BDdcwTd
         37dyxNRKpOgGIzKf8SUXQh3fTlIn3j4A2dxu9mg+4fZVEkbDq8ZVq9LDIPfCZ2BsJNMU
         t+44Fcov/PHxq3dWgP7r8k9CbIVusidnSwDawWu7oyGjd6aZoQsIJkUL4EBtLluSRb9d
         /K1Q==
X-Gm-Message-State: AOAM531aGjVaB56nM1/3f+Hf9/xU+FgjGdai5bHQI7Ht8/bYmKOKOPN/
        EPFOXCRAlk9Ln+9IUz557UXm0mcM07Q=
X-Google-Smtp-Source: ABdhPJy9HFFHagEjDNPf4zW//YiPfEdFCCgGSDoM2Y/a2ggo7IJWx8pK8epYfLRru62hfl7EsOJa2Q==
X-Received: by 2002:a05:651c:22e:: with SMTP id z14mr3700798ljn.215.1605426920756;
        Sat, 14 Nov 2020 23:55:20 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id f22sm1758862ljn.99.2020.11.14.23.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2020 23:55:20 -0800 (PST)
Subject: Re: [PATCH] drm/tegra: output: Do not put OF node twice
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20201113204157.1942919-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c39de51c-9ae5-6f60-16db-6506d792f578@gmail.com>
Date:   Sun, 15 Nov 2020 10:55:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201113204157.1942919-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.11.2020 23:41, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The original patch for commit 3d2e7aec7013 ("drm/tegra: output: Don't
> leak OF node on error") contained this hunk, but it was accidentally
> dropped during conflict resolution. This causes use-after-free errors
> on devices that use an I2C controller for HDMI DDC/CI on Tegra210 and
> later.
> 
> Fixes: 3d2e7aec7013 ("drm/tegra: output: Don't leak OF node on error")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index 5a4fd0dbf4cf..47d26b5d9945 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -129,7 +129,6 @@ int tegra_output_probe(struct tegra_output *output)
>  
>  		if (!output->ddc) {
>  			err = -EPROBE_DEFER;
> -			of_node_put(ddc);
>  			return err;
>  		}
>  	}
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
