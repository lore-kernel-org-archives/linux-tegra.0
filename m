Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F13BC6379F
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Feb 2023 12:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbjBUMcs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Feb 2023 07:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233778AbjBUMcp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Feb 2023 07:32:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32361E3B5
        for <linux-tegra@vger.kernel.org>; Tue, 21 Feb 2023 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676982718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kcBSztIBu8Elzf5YULsmxeT71u7vQPkAxFlgEGJG8QI=;
        b=GdcIZaZuDyG4wJ+KADEOfq9w4c3U8AVco7e8CsIcfHBkFzok74gumSKZ7NgqBmSztHHQVy
        t1ZDQ86L1A3CljHyND7l8sf8ocBqV7VB8e7o8eAK3+/4OiIobJ0ktnHgZ6U5z4uf7g9n4p
        LneSq4r8Hy82nEtWIk2cb+6qb8EyT/o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-KLdTBmZBPsCAMMaA54XS5g-1; Tue, 21 Feb 2023 07:31:57 -0500
X-MC-Unique: KLdTBmZBPsCAMMaA54XS5g-1
Received: by mail-wr1-f72.google.com with SMTP id i6-20020adffc06000000b002c5669766a8so949473wrr.4
        for <linux-tegra@vger.kernel.org>; Tue, 21 Feb 2023 04:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcBSztIBu8Elzf5YULsmxeT71u7vQPkAxFlgEGJG8QI=;
        b=Q07fNQLSj8e+S7JWr5NbRJwSVPw1d09cRDUS6nQr7m05aKM+bFTxQNJSvnCSMjf7tQ
         4izkzUOT2KAb/rp9wbbkeMeLvqTA6NgxJjQVOXSG6ij1brsGDqKN1pJEB3jcGWpbU9Rg
         pXjAeDWIiHbyRlqf3bZn1P7LOmCqdZ0E/udZnv3y/L5RlsT5beD4vrO6ofNtdd/nB1pk
         8En9/bUMQH9KpkDelBcgiEDH/GF/4ZR7wIjzK0ibARGyuBTaeff/ZnwUtsYLSf2biutK
         m1k1UXC7iHAblyvY1y/75X4AEL0EhetOu882J8nhDEtpMLuKK+IFwWUAASATH7wk/1NI
         ldHQ==
X-Gm-Message-State: AO0yUKVVXIYa9cf19kGhYwVYy+1rwEtWa852y9yk7a+2FsOV0QZK7+BT
        GrElJxasqFzQleKQFJSmDcApdbVjrrYVVSKkZENi1iQuoPbxg1sphEleENXReVQ+MsXEJRd8sEl
        9fxLr+sqYEwroxLAgpcfjs7ycQmpQ
X-Received: by 2002:a05:6000:1141:b0:2c5:a19e:6d16 with SMTP id d1-20020a056000114100b002c5a19e6d16mr2636593wrx.61.1676982715780;
        Tue, 21 Feb 2023 04:31:55 -0800 (PST)
X-Google-Smtp-Source: AK7set//Tf+JISa2y2oGaFX5tzeBEqdv+t7SGO62K3gr9LhE0gq2UicpG1BcV6nfaQQIe6dvwwpV3Q==
X-Received: by 2002:a05:6000:1141:b0:2c5:a19e:6d16 with SMTP id d1-20020a056000114100b002c5a19e6d16mr2636581wrx.61.1676982715510;
        Tue, 21 Feb 2023 04:31:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d6048000000b002c553e061fdsm6967238wrt.112.2023.02.21.04.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 04:31:55 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
In-Reply-To: <95ea4783-8eb4-63e5-767b-3b7feece955d@suse.de>
References: <20230216140620.17699-1-tzimmermann@suse.de>
 <87y1orxqiz.fsf@minerva.mail-host-address-is-not-set>
 <95ea4783-8eb4-63e5-767b-3b7feece955d@suse.de>
Date:   Tue, 21 Feb 2023 13:31:54 +0100
Message-ID: <87ttzftd1h.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 21.02.23 um 11:27 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Move drm_fb_helper_unprepare() from drm_fb_helper_fini() into the
>>> calling fbdev implementation. Avoids a possible stale mutex with
>>> generic fbdev code.
>>>
>>> As indicated by its name, drm_fb_helper_prepare() prepares struct
>>> drm_fb_helper before setting up the fbdev support with a call to
>>> drm_fb_helper_init(). In legacy fbdev emulation, this happens next
>>> to each other. If successful, drm_fb_helper_fini() later tear down
>>> the fbdev device and also unprepare via drm_fb_helper_unprepare().
>>>
>>> Generic fbdev emulation prepares struct drm_fb_helper immediately
>>> after allocating the instance. It only calls drm_fb_helper_init()
>>> as part of processing a hotplug event. If the hotplug-handling fails,
>>> it runs drm_fb_helper_fini(). This unprepares the fb-helper instance
>>> and the next hotplug event runs on stale data.
>>>
>>> Solve this by moving drm_fb_helper_unprepare() from drm_fb_helper_fini()
>>> into the fbdev implementations. Call it right before freeing the
>>> fb-helper instance.
>>>
>>> Fixes: 4825797c36da ("drm/fb-helper: Introduce drm_fb_helper_unprepare()")
>> 
>> I think this should be Fixes: 032116bbe152 ("drm/fbdev-generic: Minimize
>> client unregistering") instead? Because commit 4825797c36da just added a
>> wrapper function for mutex_destroy(&fb_helper->lock), but it was commit
>> 032116bbe152 that made drm_fbdev_cleanup() to call that helper function.
>
> Good point. After looking through the recent fbdev commits, I'll use 
> commit 643231b28380 ("drm/fbdev-generic: Minimize hotplug error 
> handling") for the tag. This is the one that added the call to 
> drm_fb_helper_fini() to the client's hotplug handler. And _fini() 
> currently does the _unprepare(), when it shouldn't.
>

Ah, much better indeed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

