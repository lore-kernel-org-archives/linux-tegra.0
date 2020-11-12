Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EDCC2D0E4
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 18:35:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 310962223F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 18:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fr5l0fBA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgKLSfg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Nov 2020 13:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgKLSfg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Nov 2020 13:35:36 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5A9C0613D1
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2020 10:35:35 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id o24so7364376ljj.6
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2020 10:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=miIu13KxlSOBKHhTLoXa2WQbRM17FuJOoRdz4AkNItI=;
        b=fr5l0fBAq2ZmeoxgV+JJ0kcApWaUf08Oml/ufjfvroOXOng1hAGXJ8QoJUr6kK1NWD
         JtAg0c6r03I0AeN3xAYZ9+driV8BKfbzKasKnmZr7gd5RREdIvP1QRUIzVe8Isq+84JA
         sukx9nHj+EB6o1gERkPJQEN/fBtIcYTB+LqKzcCXZDDUduQHyt8KE5Az/MO4DJacAVj3
         eUgWptNjBAngAg67NqLTZlV39nvaN+Ow9S6EK1j03fiNYUqigSxvS81bVknHd9cZZ9Fu
         R39M4uWekRUVWA9i58vTMBEpb3Nb+TFhFjLkcRxu0kSyXWranJZguS8oKgq90CoL3Vqg
         rpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=miIu13KxlSOBKHhTLoXa2WQbRM17FuJOoRdz4AkNItI=;
        b=lpkWsSyRQD0DXhMj+oUAd8Q07WrjB1wTZ22X0/xg0eNAVX+DL+/QjeHeBt3JFnha0M
         pmEnUL42Q8tR4qMf8ERodvgFPpRQIKS5z23Vy9gHhU8UpaFx9z1QMTwK5jzPS/3XMrJI
         fjmUcmz+6kDI3bFS73ogc4vLy3FKokWZiayLKPRHhFHeDRx8BrrXcUNWsLkDV0Ig0MMq
         sDftG9RcVlMvvV47awjhcQdrP5qorRjimZ7VlKAhJv6Pj6rxaiTxlYEK7GV1s/Di+CbP
         kchGgNPhF5CwizDDeVPgrHSp9M1KwTAxE3LZvr6ZBU89VrzEElECSwKIxongi+odHgk/
         EZyw==
X-Gm-Message-State: AOAM533PSYSuOoPVKdZWK0TDkt6zEtmFGeMRprwbeUepHwv2oa86mxzX
        c/mbgfg3rllLXzkvSz3a2HQ=
X-Google-Smtp-Source: ABdhPJxvidQKpVH9KguGEtW2lNOcIPN6PI+8msmeYNakuq2X2PmLasc5jQ4UbxhPMnfF/riuT73D/g==
X-Received: by 2002:a05:651c:1122:: with SMTP id e2mr335918ljo.317.1605206134426;
        Thu, 12 Nov 2020 10:35:34 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id r9sm767192ljd.23.2020.11.12.10.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 10:35:33 -0800 (PST)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
 <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
 <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
 <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
 <6ef6337d-3bb5-bbba-f39c-6de1722ddc44@kapsi.fi>
 <0f1c8226-4960-aa35-9436-2361fc8fb6ae@gmail.com>
 <6aad99a9-a9a2-498b-9834-9314a6fa9af6@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b73ea2ff-59c5-929c-ebbc-b7bc25c9105e@gmail.com>
Date:   Thu, 12 Nov 2020 21:35:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <6aad99a9-a9a2-498b-9834-9314a6fa9af6@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.11.2020 17:53, Mikko Perttunen пишет:
...
> I guess for the channel_map we can drop the offset/length, I just think
> it's fairly obvious that an IOMMU mapping API lets you specify from
> where and how much you want to map. Sure, it's not a functionality
> blocker as it can simply be implemented in userspace by shifting the
> reloc offset / IOVA equivalently, but it will reduce IO address space
> usage and prevent access to memory that was not intended to be mapped to
> the engine.

It could be a good feature, but I'd want to see how userspace will
benefit from using it in practice before putting effort into it.

Could you please give examples of how this feature will be useful for
userspace? What is the use-case for allocating a single buffer and then
mapping it partially? Is this needed for a userspace memory pool or
something else?

...
> I am well aware of that. I'm not saying that we should copy the
> downstream stack. I am saying that when designing an ABI, we should
> consider all information available on what kind of features would be
> required from it.
> 
> Going through the proposed TegraDRM UAPI, there are some features that
> would probably not be immediately used by userspace, or supported in a
> non-NOOP fashion by the kernel:
> * Map offset/length
> * IOVA of mapping
> * Creation of sync_file postfence
> * Waiting for sync_file prefences
> * SUBMIT_CONTEXT_SETUP flag
> * Having two syncpt_incrs
> * Reservations?
> 
> I suppose we can remove all of that for now, as long as we ensure that
> there is a path to add them back. I'm just a bit concerned that we'll
> end up with 10 different ABI revisions and userspace will have to do a
> version detection dance and enable things depending on driver version.
> 
> Anything else to remove?

I guess it should be enough for now.

Reservations are needed for the grate drivers, but they need to be done
in conjunction with the DRM scheduler. I guess it should be fine if
you'll remove reservations, I'll then take a look at how to integrate
them and drm-sched on top of yours changes.

> Regarding things like explicit channel_map, sure, we could map things
> implicitly at submit time, but it is a huge performance improvement on
> newer chips, at least. So technically userspace doesn't need it, but
> going by that argument, we can get rid of a lot of kernel functionality
> -- after all, it's only needed if you want your hardware to perform well.

I have no doubt that it's better to have static mappings, but it's not
obvious how it should be implemented without seeing a full picture. I
mean that maybe it could be possible to avoid having these special
IOCTLs by changing the way of how hardware is exposed to userspace such
that generic UAPI could be used in order to achieve the same goals.

...
> If it is known to deadlock, we should fix it. In any case, which kind of
> scheduler is used shouldn't affect the ABI, and we already have a
> functional implemention in the Host1x driver, so we should merge the ABI
> first rather than wait for another year while the rest of the driver is
> redesigned and rewritten.

Perhaps should be fine to start extending the ABI, but then it should
stay under DRM_TEGRA_STAGING until we will be confident that it's all good.
