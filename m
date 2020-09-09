Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55B3C433E2
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 00:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8694B2177B
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 00:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6safOFV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgIIAsB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 20:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgIIAsA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 20:48:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F18C061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 17:48:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v23so1297859ljd.1
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 17:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SMdtemqsHrC7o2SwRp4RF1GGbfg74NwIjMRJECxbRjg=;
        b=A6safOFVJudoa5KZgxHa40b1VjmyEAResenlwBJm8UdX66WMmzPKH8MQLppjRuhXCe
         i246XM1RX9yH7bTB2RoJadAjq6ze/x10FbRqKO9HEKqMNV6ymKTkShdum+B/4AOx/zGx
         8rPK9LJ2zGU+JT+gAB2y+/Mf5k0XxD9TtlmVKuG4NOs0t4TdfgYnrbdX/aj+SkGBRSHZ
         bUzXf16omi9QLz8zy06oPIxIBoJ4Ami4AJ/F329wXRvMEZ2COdkQA7phoNTTkUnZU3IY
         iF7qLxuVjEsqECWmVWl6jz4E6DxlLdvMUnaH3aGvn7QO5Etcdjd7yIzlp7eyaTFFWJIi
         UeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SMdtemqsHrC7o2SwRp4RF1GGbfg74NwIjMRJECxbRjg=;
        b=n0SwIKX4NoqR/TrWl4jP7CSkxslc/2qKYgnKGLDI82+dpsksSf6l8QuxMFUcLxdhUz
         u+TRSWdl3oJttOa/hhajrzZd0U0mKEuCgSw8Oo+UoWzvfouCT9NpiY7W1HaBiT8vecnR
         8gxVXESNrncxp6CEA7Kh/JdiQXmG6bGfWa8EWempJ+jXqQr7F+3FsOTt3GmYNgws6oyL
         BU0RzHbE8TAt/C6kTKuAt7oIyYCan4ruBOFRFvR5ErK6kvSQx4GPkcXkXd9u51Rhlhb4
         9G2dUiCPcppntyAy/RXzE0u1tEMeburab6eAlugMce48yM0ERKzmCA12Us/Q2tySPTEb
         RwTQ==
X-Gm-Message-State: AOAM532fOxo7oWyNt9zNIO42GspI+/2+R7ZDzcf685spKGx1RC0iZQGt
        gw+1C6Ku7CizPo3BK+PwKLg=
X-Google-Smtp-Source: ABdhPJwr/efLVkk/+qq6gi9+5qG2YFjdBaSAZj7M+c0wuI8sGQ9/uZzdTrSml9/a/BkOM3fGBtqVvg==
X-Received: by 2002:a2e:8552:: with SMTP id u18mr533748ljj.359.1599612478506;
        Tue, 08 Sep 2020 17:47:58 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id k10sm312223lja.112.2020.09.08.17.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 17:47:57 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a238707e-942b-2996-5644-71811d4cee72@gmail.com>
Date:   Wed, 9 Sep 2020 03:47:57 +0300
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
> +static int submit_process_bufs(struct drm_device *drm, struct gather_bo *bo,
> +			       struct tegra_drm_job_data *job_data,
> +			       struct tegra_drm_channel_ctx *ctx,
> +			       struct drm_tegra_channel_submit *args,
> +			       struct ww_acquire_ctx *acquire_ctx)
> +{
> +	struct drm_tegra_submit_buf __user *user_bufs_ptr =
> +		u64_to_user_ptr(args->bufs_ptr);

If assignment makes line too long, then factor it out.

  struct drm_tegra_submit_buf __user *user_bufs_ptr;

  user_bufs_ptr = u64_to_user_ptr(args->bufs_ptr);

> +	struct tegra_drm_mapping *mapping;
> +	struct drm_tegra_submit_buf buf;
> +	unsigned long copy_err;
> +	int err;
> +	u32 i;
> +
> +	job_data->used_mappings =
> +		kcalloc(args->num_bufs, sizeof(*job_data->used_mappings), GFP_KERNEL);

The checkpatch should disallow this coding style. I'd write it as:

size_t size;

size = sizeof(*job_data->used_mappings);
job_data->used_mappings = kcalloc(args->num_bufs, size..);

> +	if (!job_data->used_mappings)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < args->num_bufs; i++) {
> +		copy_err = copy_from_user(&buf, user_bufs_ptr+i, sizeof(buf));

Whole array always should be copied at once. Please keep in mind that
each copy_from_user() has a cpu-time cost, there should maximum up to 2
copyings per job.
