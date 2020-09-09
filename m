Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD52C433E2
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 01:13:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 082AF216C4
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 01:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eac1WE+1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgIIBNh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 21:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgIIBNh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 21:13:37 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F56DC061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 18:13:26 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r24so1341389ljm.3
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 18:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jj82HdlnfwJBabE3Abr3ieMOvv+zrwZvhDyEyryedaM=;
        b=eac1WE+1WLfzrxtEMgce8NTQ1hKbyaWoQoPt6qzi94OmsHrm494hEx7WLXzRGLoK2w
         7ScEIi0bZctdueYSZqcncmutlpV1ISI29djVaHox0zLuF72IngoDIhm/xbVGLWtylicc
         xOz2y6wT/ZqtgM7LhdJ/Htg/4uCPp3Se4g591idMlJxwqV+O2dfit+WPmR9hdz52qPFy
         ykV/ykOli8sRZRuSOzrYB8+I89brjh7Xq5grmxwfNWMbXuANRjfuqSQ49poeJOHTpi29
         hqqopFY0Rfn01H+YkEa5ykiwc9e30Ro0oI1sBrdus6O0kt5eqFAvB5uFf3r8UzHw8IXx
         Ppfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jj82HdlnfwJBabE3Abr3ieMOvv+zrwZvhDyEyryedaM=;
        b=Ro1idyheCakJAi3IRvuUi0QeyGEOVYZLJ7PkUXnoiZIDMrrf4+NnhVRAd0UniOD/y4
         qOoYpaNRhKo9efAvecUMuVND5QHVIk6eJOF20k+Gz3Qg++URR2WzehflTTvLzvzPXsSl
         5bx238RCozoejaEY3y5zAnXoLsjHnHygL+2oom5dBFEEyzD2WPVuL/96B5H1EH5vNs6i
         uzGw9PoeM0FHk3RH4po3JYwDocTpfXke2SRezP0kHR7TzVwxqSTyrtrxE/qnISSp7cUP
         XiQlejoa/uzk2VyuXnR5BbUcgsqAX9BwzgFpaHi9xvOAIhlL7dLCtepbK42yPPjv0E20
         uW8g==
X-Gm-Message-State: AOAM531O67QhB9tciAY2TDPMTPf2FNiqnnGiLT7J3GmE0gEAuU1jTwAs
        ukA4rKLVFjk5zZAjhgp8Y5c=
X-Google-Smtp-Source: ABdhPJw5+cc9vvB6KCyYmDiPP6Rp1BNitkjvcNKl5RtvpKYK7R+J7P6B4DI5CwLY3TNIMl4K+6RqEw==
X-Received: by 2002:a2e:8619:: with SMTP id a25mr607336lji.390.1599614005028;
        Tue, 08 Sep 2020 18:13:25 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 25sm326994lji.130.2020.09.08.18.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 18:13:24 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
 (submit_handle_syncpts)
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
Date:   Wed, 9 Sep 2020 04:13:23 +0300
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
> +int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
> +				   struct drm_file *file)
> +{
> +	struct tegra_drm_file *fpriv = file->driver_priv;
> +	struct drm_tegra_channel_submit *args = data;
> +	struct drm_tegra_submit_syncpt_incr incr;
> +	struct tegra_drm_job_data *job_data;
> +	struct ww_acquire_ctx acquire_ctx;
> +	struct tegra_drm_channel_ctx *ctx;
> +	struct host1x_job *job;
> +	struct gather_bo *bo;
> +	u32 i;
> +	int err;
> +
> +	if (args->reserved[0] || args->reserved[1] || args->reserved[2] ||
> +	    args->reserved[3])
> +		return -EINVAL;
> +
> +	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	err = submit_copy_gather_data(drm, &bo, args);
> +	if (err)
> +		goto unlock;
> +
> +	job_data = kzalloc(sizeof(*job_data), GFP_KERNEL);
> +	if (!job_data) {
> +		err = -ENOMEM;
> +		goto put_bo;
> +	}
> +
> +	err = submit_process_bufs(drm, bo, job_data, ctx, args, &acquire_ctx);
> +	if (err)
> +		goto free_job_data;
> +
> +	err = submit_create_job(drm, &job, bo, ctx, args, file);
> +	if (err)
> +		goto free_job_data;
> +
> +	err = submit_handle_syncpts(drm, job, &incr, args);
> +	if (err)
> +		goto put_job;

How many sync points would use an average job? Maybe it should be better
to have the predefined array of sync points within the struct
drm_tegra_channel_submit?
