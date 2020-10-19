Return-Path: <SRS0=MPHS=D2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E03C433DF
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 02:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1C9621D7B
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 02:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvCnVlGw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgJSCVX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 18 Oct 2020 22:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbgJSCVX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 18 Oct 2020 22:21:23 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6824FC061755
        for <linux-tegra@vger.kernel.org>; Sun, 18 Oct 2020 19:21:21 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l2so12239678lfk.0
        for <linux-tegra@vger.kernel.org>; Sun, 18 Oct 2020 19:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m+DOuOMWvvKHKiCURgikN8Y0Kr2cQb9cXTckw8NyNLE=;
        b=kvCnVlGwso7Jf67TjHV+ieOnUVecJsa7ctXI2WETH7qn/5IR6iriZkC0oyTnMR43mS
         /xUd6IcfLCve17t9Quie+Gk8uomjSh4nlgL7VwR1aPP1bzV06qKr3lgazXitAKOjWK1u
         87BR2mFaz1EmQpnGj0MOuqsYbFVGG9swF+omae2ubEJMIgSYCy8ffWHPe0wBnSD4cK+n
         HVVTSY4xMUNfJ6/Mb6TCnFMJ3kc1ZFtO2eintus/moZIJG45wdpfG+sfBwezJAEztJye
         8lYTOMhhU706ZRn6aDHkIGhBeZtVxfEdE4wB8MPjTOnxtLEzZh+O7jwbJ62d7EF3io3L
         Ae7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m+DOuOMWvvKHKiCURgikN8Y0Kr2cQb9cXTckw8NyNLE=;
        b=qFyuyt5388TJnqUen3mo0Xzb9XHCtjQc4kQ7JSjQiXVN0fE0rkdLaWaAcHAHom5F9/
         PStAL58p6i8g11CDh0WtJ1zFp/UBte7rFCaLD0z6lKWmUvIY0rSya28GRiTLvLUpqMYU
         ffoewfoOTkgldVLeea6rH/55j5ZGRdnaDI/JAyU8ulXVPQKHWJxlbLD8y9/t2w/sMgwG
         EXDs9oSOCe8P2sXHsDsfsQK1FmyuT7I/aOQE2k9f6qJjbQrv9L5Qn5ijH8DGXMUPI/fa
         kJqpSRxPGxdSeejUG0y2xxnYh4Qt8enaOqPlEHxDxlxi1QSJmYOT94Lt0SxOdv38CiCo
         WrPA==
X-Gm-Message-State: AOAM530OYOmgcMKTbmVcZShCHVnQ2qNTXSrGL6xYhHEpq9BArO9v5yrC
        ZDVGt3gw/judAvi348raRB4=
X-Google-Smtp-Source: ABdhPJx7PACSdz0Ay2NcOuJC/k7L5C2ZbWYRB+SqDKWIU+wlNbeITzTUrKJkMZZ8yGnBbSaMnErQ6A==
X-Received: by 2002:a05:6512:3053:: with SMTP id b19mr5441996lfb.338.1603074079944;
        Sun, 18 Oct 2020 19:21:19 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.googlemail.com with ESMTPSA id o4sm3048145lfg.247.2020.10.18.19.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2020 19:21:19 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
Date:   Mon, 19 Oct 2020 05:21:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007171238.1795964-20-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

07.10.2020 20:12, Mikko Perttunen пишет:
> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
> +				struct drm_file *file)
> +{

Hello, Mikko!

Could you please tell what are the host1x clients that are going to be
upstreamed and will need this IOCTL?
