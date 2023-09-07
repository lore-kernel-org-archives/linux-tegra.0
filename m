Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3E0EC874D
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 18:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbjIGSSc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 14:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbjIGSSa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 14:18:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8D11BD7
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 11:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694110617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kF37Os6pT1PJ2aRTeP1aQHaXwH+prUD3dlnj+MQOFCE=;
        b=UDdr6zF6jPT0RkX3n4W6pxLC1aw8uBD9oSjd/NIJHi+Akg6PDefVuzkCpiy2Odt/rZFgRB
        3QSPj7NWDxSwt7dBmGMP9O69gUq1Xizt9Nxo9oRS/NUQkiu9SC5w+WY3mICWlImcLAtxyz
        noqViSQlICO0ubq7DXaF8wdz4igfXbM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-zs7HAThvOXGT-uM5IBvOUg-1; Thu, 07 Sep 2023 04:47:51 -0400
X-MC-Unique: zs7HAThvOXGT-uM5IBvOUg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-2f2981b8364so504089f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 01:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694076470; x=1694681270;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kF37Os6pT1PJ2aRTeP1aQHaXwH+prUD3dlnj+MQOFCE=;
        b=jB0g95GinpsW9FhdXJn+LODCPZlYlhj0eB9JVe4JyKLV0VioDs4JdojS4TTM/U/m0j
         tyaKtBWcfM0gVGtGeF8feY3ngrWExsU8HK2EkHgbvG90hXnSCIhJqEgVmc+wlYVRqte2
         8uGczSxL4CLbDxjANUTbhpjK05SObLAeReJrmYdp7fGU7lIc6hPNQgvlUY2nuYD4a5gg
         4rKzGfZVLBoqMz95Zju1+aYmTf9Mi6czJPRPgTeWc6l6ellL2K82wiWU7hUD7POMWOUS
         ApgNF1TgN+P/zekqqIU3VqGpJdNCAbklIlxRpwIDBiBQVWhHKZlL2QZUMeuLJWgisJy2
         bIpQ==
X-Gm-Message-State: AOJu0YzNfYgjmahA3cEoh62yrXeNhLRX8ZwdR8dLBOCGroNQHgVyyi1u
        uhF5lI4VlcnSkHgzS9omzGA7xu2R22eMUD+SEBRj9V4pc/9ykW/OecOTl1EKOTfVVZwCNoUgNxc
        h3aRLevvrLt6P84pNEIrnQaE=
X-Received: by 2002:a5d:4f0a:0:b0:31a:d7fc:28f with SMTP id c10-20020a5d4f0a000000b0031ad7fc028fmr4236731wru.19.1694076470446;
        Thu, 07 Sep 2023 01:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaR5bvde5g0wWiq6Fboo20IBKUE4ldGPwfZnLzZV0LVIQJIY8kyRGcYcYOIxdDbryuK0GDog==
X-Received: by 2002:a5d:4f0a:0:b0:31a:d7fc:28f with SMTP id c10-20020a5d4f0a000000b0031ad7fc028fmr4236720wru.19.1694076470110;
        Thu, 07 Sep 2023 01:47:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d6844000000b003197b85bad2sm22782849wrw.79.2023.09.07.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 01:47:49 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
        dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <dd898338-813f-df63-4255-986903aa7cb6@suse.de>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
 <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
 <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
 <ZPmD5WNZzz279qZ7@orome> <dd898338-813f-df63-4255-986903aa7cb6@suse.de>
Date:   Thu, 07 Sep 2023 10:47:49 +0200
Message-ID: <87tts62wui.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>> That's a good point. However I recall from earlier attempts at doing
>> something like this in Nouveau (although this is now very long ago) that
>> it's not very easy. The problem, as I recall, is that the driver is a
>> singleton, so we would essentially be supporting either modesetting or
>> not, for any device in the system.
>
> Take a look at struct drm_device.driver_features. It let's you clear the 
> flags that your device doesn't support.
>
> https://elixir.bootlin.com/linux/v6.5/source/include/drm/drm_device.h#L128
>

That sounds indeed as the best approach and I see that at least i915 does it:

https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/i915/intel_device_info.c#L418

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

