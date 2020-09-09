Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE2FC43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 02:06:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72EB0216C4
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 02:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMBwItlS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgIICG5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 22:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgIICG4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 22:06:56 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73DBC061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 19:06:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c2so1390756ljj.12
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 19:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CxD0K5ERopLSbf6cvkQwLtW5syT9rt5pdwC61DUguiE=;
        b=GMBwItlSrwzsWAdp91ahdy7Pi2m+LdLOEFbWZU6DfjpIbh2SwAQdMZGdtpshN38cGS
         RNUEnY+s7nmhut7zAxIjAVXoTAOTpYDn/tcgXm8jcK7hOKNzA9D5nRHTYyzO9URVSg/J
         Hw9BO2yOzhrivGoeS7ART7aXt3YH6A/O3Ez8U/S01Xt/R7N9SvCaO/apEVy++3ZdG7rU
         w/hABDk+Kz2WmGAF8yWk6JfgMBoy6ef4j67nhvrPAOCW1LVleyCCVJr7ucfCAx0AKvhM
         BWu4KrYeiRkp67AKlJN9svFL+QeKSBWDxzBfXUHKJr8MCMvBb802Z9MRXvbV6yf09Hk0
         XLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CxD0K5ERopLSbf6cvkQwLtW5syT9rt5pdwC61DUguiE=;
        b=b6p44TIT5cZoILSge2MIbvcCWoJY3pwFB2jWBwK+CcJVCCp3aEfrHGIdxvHSdgcWva
         qnpFIOsU3SiRxJ2dYMw7EteyhA0On8eQBBeHpnUplp/id3V1uZWSft+k/a+qB8gTLcMK
         ANmnkkjH4OO7CMtjnX0zymrj0X4bgXbkPXYTbHgjg9Jh3vXS0fgYVL44eupQvcrSbH++
         dqthquNc2NpaJG2Vq3CQ0mqQhhK4WnPF7BL6BdP7osyiQJMo0iQzcn0PF1VGAjmWU8pM
         kydqPcs7/+NivjG6DL5Pw0iS9aDes24P33XaB9MRexjWLHdZEEW7SyjtN3o3ZxC/zn96
         +7kA==
X-Gm-Message-State: AOAM530iKUfu+yIdZAPwGgyqlt4XLMLUB81MzrfZzFSwq+eB94448d4d
        dYInf+AwcpiM1XmrstYGe1qNdDrJwvE=
X-Google-Smtp-Source: ABdhPJzTEfBiW5wnT+E8sPjnN6aQhgbBQkm8zRs21KV5Hf7WYovJYTFtoOsdg3ZwjBfF7NQmFpqgRQ==
X-Received: by 2002:a05:651c:1193:: with SMTP id w19mr605476ljo.89.1599617213398;
        Tue, 08 Sep 2020 19:06:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id u14sm349930lji.83.2020.09.08.19.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 19:06:52 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <172f940f-af60-8f8a-6c76-4ff89accd8c5@gmail.com>
Date:   Wed, 9 Sep 2020 05:06:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-18-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
> +int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
> +				 struct drm_file *file)
> +{
> +	struct tegra_drm_file *fpriv = file->driver_priv;
> +	struct tegra_drm *tegra = drm->dev_private;
> +	struct drm_tegra_channel_open *args = data;
> +	struct tegra_drm_client *client = NULL;
> +	struct tegra_drm_channel_ctx *ctx;
> +	int err;
> +
> +	if (args->flags || args->reserved[0] || args->reserved[1])
> +		return -EINVAL;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	err = -ENODEV;
> +	list_for_each_entry(client, &tegra->clients, list) {
> +		if (client->base.class == args->host1x_class) {
> +			err = 0;
> +			break;
> +		}
> +	}
> +	if (err)
> +		goto free_ctx;
> +
> +	if (client->shared_channel) {
> +		ctx->channel = host1x_channel_get(client->shared_channel);
> +	} else {
> +		ctx->channel = host1x_channel_request(&client->base);
> +		if (!ctx->channel) {
> +			err = -EBUSY;
> +			goto free_ctx;
> +		}
> +	}
> +
> +	err = xa_alloc(&fpriv->contexts, &args->channel_ctx, ctx,
> +		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
> +	if (err < 0) {
> +		mutex_unlock(&fpriv->lock);

Looks like the lock was never taken.

> +		goto put_channel;
> +	}
> +
> +	ctx->client = client;
> +	xa_init_flags(&ctx->mappings, XA_FLAGS_ALLOC);

Why not XA_FLAGS_ALLOC1?
