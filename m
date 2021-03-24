Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3752CC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 14:41:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08A0961A07
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 14:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbhCXOlW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Mar 2021 10:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236170AbhCXOlN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 10:41:13 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD88C061763
        for <linux-tegra@vger.kernel.org>; Wed, 24 Mar 2021 07:41:12 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b14so19086611lfv.8
        for <linux-tegra@vger.kernel.org>; Wed, 24 Mar 2021 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qYlws7H6Jxfn/y4LVXeYz0t3nAbGfGiXv+hhlwSEdmM=;
        b=XsWZxAgOc3IKw5oLV+VZfY4JXCt3mKEVAxc/A7MMF5Cd1DYpDYyvm6y6bdBvYeA4jK
         TIhxFmxKQf9iEoKwHPQnjZyRKwOnFmKOgZN25tpOdAy+pq53KhGR6/L/4kY91Rj0N7wz
         1GJHE7y2iJ67eG3CwRm3lWyO82Fsxt0XG0PyZMSGN1SH7WmC+6RSi31Of8tk/yjq2dDT
         Fy+IIiiWHIC4sM0AUXR9eaZJhSBbgrYOqc35jNiuxfMgLI7R88gRJ1EzIv1luZQ7pRT/
         p9hQfUKKT6dw8vMbOexkD3l2d4kyOkc8aX7Cc/d+terIIOggUlBX0It7HThwdrLAf1cs
         fB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qYlws7H6Jxfn/y4LVXeYz0t3nAbGfGiXv+hhlwSEdmM=;
        b=nTzf8dliMqaj48pEghjqYC0Oz0JJgtvbvK77tbj4+CA8I+ALIVkec0X4w5I6kBlkz2
         nQZGxWs0CZgDDzYqEQz/oelmaCMgahsu9Ss1Y7vQoTXqENDjvQHUQfqQ5wrqHXUhyVLB
         Nl/lA0LyvAJkE4IlciOSSI9kqO8Hiwcub4y2NTj92tJREIveJI60CWGJ6NSW3u/Dm8nL
         7twoqWLoJprgL5p58Dupz1Dag7RAP2xG97iuGGwg1wBHgtnG9/K7fFjg6LgrNowllzI5
         OJAdVwjZ17e69JibtSFnCqzK0yKTtYTcOsUXmkY1BlbapRaJVKXHKzmnOS+nzLPu71Bd
         PfcQ==
X-Gm-Message-State: AOAM530zwuUiveN8t1r5ore0kGnebfJ5jMfMgm0eIOYBhoTraOH8+5jL
        gWACW8MsXIjmGSYKQKNbltjpUA/SQw8=
X-Google-Smtp-Source: ABdhPJx4UTSUgLO2cfpzNf2uVmX5cnFnbZ3G5cLjKVxLPhGHmHxi/QQCPnuocUeefxyCeV1Zz2uL8g==
X-Received: by 2002:ac2:4298:: with SMTP id m24mr2230404lfh.429.1616596870491;
        Wed, 24 Mar 2021 07:41:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id l21sm249737lfc.91.2021.03.24.07.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 07:41:09 -0700 (PDT)
Subject: Re: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-7-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <21d2e691-6404-503b-422a-be97a7b9d1b4@gmail.com>
Date:   Wed, 24 Mar 2021 17:41:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323155437.513497-7-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.03.2021 18:54, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Clarify when a fixed IOV address can be used and when a buffer has to
> be mapped before the IOVA can be used.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/plane.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index 19e8847a164b..793da5d675d2 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
>  		dma_addr_t phys_addr, *phys;
>  		struct sg_table *sgt;
>  
> +		/*
> +		 * If we're not attached to a domain, we already stored the
> +		 * physical address when the buffer was allocated. If we're
> +		 * part of a group that's shared between all display
> +		 * controllers, we've also already mapped the framebuffer
> +		 * through the SMMU. In both cases we can short-circuit the
> +		 * code below and retrieve the stored IOV address.
> +		 */
>  		if (!domain || dc->client.group)
>  			phys = &phys_addr;
>  		else
> 

This comment is correct, but the logic feels a bit lame because it
should be wasteful to re-map DMA on each FB flip. Personally I don't
care much about this since older Tegras use pinned buffers by default,
but this shouldn't be good for T124+ users.

Perhaps dumb buffers should be pinned to display by default and then we
should extend the Tegra UAPI to support BO mapping to display client(?).
