Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711EAC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 18:15:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C48B23435
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 18:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbhAMSPE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbhAMSPE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 13:15:04 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006FDC061794
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 10:14:23 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o17so4153296lfg.4
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 10:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fDpcPGN452QW5OstMWYz6Q82ZuKqAUV5xehi8i2tN9I=;
        b=KNIpNxOC+0ROwINquN8usqkfwfSG1mVjw4G5frTgIAtMXE/ZlrsvZ9RzieWI1aAUar
         1SrvSfGs2AwG8TwkVEVddhPNl2E1MTBkFbhWbVRNeCJAojAqxVx1trnCDTsAuECAdUMH
         rHTcLYcLmBOBY+ugXSuWGyD+3C1YjIjQdSCU6Qm4Xtu+loXqQK/6IEobK2aJ/LjKYgLf
         LQe77X1Kcc0sN1PYh4riwM+/vgpb6bcC78JzMTt/uRh4NftsSEqZ0BT92RxnxPrEOji5
         AgM1Z5XoRCPxSvrllK7DCROD54YDlhKqKkT8LnnxGr1kcKLCx1/Cm8/W97vHNqxe1pT6
         Ulig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fDpcPGN452QW5OstMWYz6Q82ZuKqAUV5xehi8i2tN9I=;
        b=hHEJsvATskcU8LupMuOk1V3m2bWNhokNQ3scX4XZVUQxfHhrMDIW3Rpm6Sma+wLdba
         /ZqP23ykTK1PBM0CZhTkFK9TUAohZKPRv92DdslrN8UMR3fshmS44x2eFLsAYAUFINjU
         EiHcoDbL7GWtXySSNFROfvqBA5XN3vIxmgAEXZEc6Ksi+po+sLfqomOs9mDL3QpvJlgB
         ekRET4RVYT/iJ0rzYtwDKZHyd7kXiDaw647UcghYrHwNLRfAhRyyu66HoxjuapMEHEp1
         onHdLNx7mrJ7EYFuLhbwoYglaAzTBYlF+GZj3fYjktHChL88F0TW/vLyeHYe44z9JdAa
         4e5A==
X-Gm-Message-State: AOAM533UAJEi8JQJOOpoI5v7FyJ5wdHSZx74TxbOreabSinEVHgg3chd
        9LzFr2kcLnPQBu17GhK761g=
X-Google-Smtp-Source: ABdhPJw3rJ5CLT9LFCN3W+KjUdWcmLiOEm8u1wnTDpduvU3f3O2g3ybptVU+hhr5ywH3iJ0HBkFFAA==
X-Received: by 2002:ac2:4950:: with SMTP id o16mr1327813lfi.19.1610561662520;
        Wed, 13 Jan 2021 10:14:22 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z14sm284407lfq.130.2021.01.13.10.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 10:14:21 -0800 (PST)
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
Date:   Wed, 13 Jan 2021 21:14:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-16-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.01.2021 16:00, Mikko Perttunen пишет:
> +struct drm_tegra_submit_buf {
> +	/**
> +	 * @mapping_id: [in]
> +	 *
> +	 * Identifier of the mapping to use in the submission.
> +	 */
> +	__u32 mapping_id;

I'm now in process of trying out the UAPI using grate drivers and this
becomes the first obstacle.

Looks like this is not going to work well for older Tegra SoCs, in
particular for T20, which has a small GART.

Given that the usefulness of the partial mapping feature is very
questionable until it will be proven with a real userspace, we should
start with a dynamic mappings that are done at a time of job submission.

DRM already should have everything necessary for creating and managing
caches of mappings, grate kernel driver has been using drm_mm_scan for a
long time now for that.

It should be fine to support the static mapping feature, but it should
be done separately with the drm_mm integration, IMO.

What do think?
