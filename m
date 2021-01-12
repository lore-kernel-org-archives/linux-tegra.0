Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B79C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 22:28:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC3C123130
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 22:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbhALW1y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 17:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391125AbhALW1p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 17:27:45 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20497C061794
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 14:27:05 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s26so5736948lfc.8
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 14:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KZTVZX+G1faRH05XHR9eW49XGapVn7odqnWVVEsQeeU=;
        b=mjY6QsoOXqXLjUlDXa1uFZye0tpvyiHP17TLeeRaNHObEmGqA7j3lgvNpjBbctNvQC
         D8Y/DkStU+z8uhOuIZVeCn/Yf+LbKgDdykSyJJJHi0ShVUavxV0gsVKg8Me2yRXWao3l
         cUqlptaxfGOqGh3vkaZLebKgJUgXLddhbtwG3rRqTT/0LXGnPmEUphpGLb088JH53dO+
         3OgDyjQ3e6dhqwqlhLPTHyVQgaQQooXKGwjyL2bZqVAzR2rdIhOLjJkDuK6kJkHu5b8v
         PLPyYKbpkVvNbfUHSSfQdT2Z3xQorlp7C9DOqZadsLJoyvoVQr9+5PBP4FlTrIXIcywK
         x2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KZTVZX+G1faRH05XHR9eW49XGapVn7odqnWVVEsQeeU=;
        b=jlo93VMT42F++4Ro/wyJqW/Omygmlkmwp76wYo0gTevufk0pw4cO1dfRv4UXkV1I9X
         FaLJnGe3veC7SRXS0v+NtFDjGAvpalLnKirqfVwoxZAcZHF6XqicATDPO6KiVtd7uvmk
         6CbMGnssHPeUpECL60vbFYowLqwwhw99d+PtvUibtVW9asl3b9rq0IWo2uME5HAQ9MQw
         53vjWk9heomS83YPF5hmanREXsGMOjBhQuNWlk+9rn6xOkKCzIRl8UMT4ILWQwPRdwMm
         VBZghu2/J1fNUyFDG7+B5+bY/HhU7nZzd6pvFehAhoq3HQSed189yZv50q8QQXetbg3G
         PA7Q==
X-Gm-Message-State: AOAM531sGc5wj56S4kQXiVFTdd84xMR9WvL71vuiLmD0SUuNidrDgT+O
        Zc9OSex5Rc8NSeuSdGzroHI=
X-Google-Smtp-Source: ABdhPJxCjoQBortocwDiTLP454k0ohJgpNerRSVUQQGnZbbECAA0NzL96jnWpdlDXzK/36UXME1Pgw==
X-Received: by 2002:ac2:598a:: with SMTP id w10mr442750lfn.547.1610490423712;
        Tue, 12 Jan 2021 14:27:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id l8sm1011lfk.120.2021.01.12.14.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 14:27:03 -0800 (PST)
Subject: Re: [PATCH v5 19/21] drm/tegra: Implement new UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-20-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fef08a5b-dbe4-f1a2-2ecc-41c86611cfe4@gmail.com>
Date:   Wed, 13 Jan 2021 01:27:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-20-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.01.2021 16:00, Mikko Perttunen пишет:
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
> +	if (args->flags)
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

Let's omit the shared_channel until it will be really needed and used.
