Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E7AC4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Nov 2023 17:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbjKARzm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Nov 2023 13:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbjKARzl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Nov 2023 13:55:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC9B120
        for <linux-tegra@vger.kernel.org>; Wed,  1 Nov 2023 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698861293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NnKpb4EeK07qAJufbEwOR+W4LEQMu0mtbC3uRm1Hwfg=;
        b=T7CKSQCo+4p1EXCJcHJXjv9u0OyIl6Ot25lEZxWl6RpND63Y3OijiBHgUdLb9nnLwRgajh
        50PsAXY6bdWRVcCfMA7ZQBtCEcNeKSJAYxaPwtgPKeIlHebYHzJdYg/7Dcm1PCjCZsxK07
        4cmSjxjLuK4T04WqN3YjyX0Ee0nQbdM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-jGal8JYpPMKlX48EP5et0g-1; Wed, 01 Nov 2023 13:54:50 -0400
X-MC-Unique: jGal8JYpPMKlX48EP5et0g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-54001189946so32496a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 01 Nov 2023 10:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698861289; x=1699466089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnKpb4EeK07qAJufbEwOR+W4LEQMu0mtbC3uRm1Hwfg=;
        b=FWWlJwW27xial916Zef/63c2pOCdrc7VYXRQ3DKOeSBQWTXXVb5OotgjRPlfagjP+O
         aDTO8dkAkeKXoY/jcnruFlvdC5RtyZIkcJZaIbWFG07yy3dWt3piaEMCXLyTFqHTXx+V
         DglTp7sOeTPrx7eYYiHlKvUWiQ3UUTNhy8L6xOv+4LxQZOl7vJ4sqGwQJdFkIcFZDcmc
         HLmDYn4jG42ncRvbDWNyKcJRv+O+VGB2Vw3ZH7uvxfA8aCB8XLWq5uuRnf2s+rJQYVvo
         2X6wPE7zaZDToltrXeH564SkDBrDM/Sg7cgXeP5Aj3zfRzhcyhb7bB4ycSNBtPz5jmxa
         Lqqg==
X-Gm-Message-State: AOJu0Yy7dOOPGnwSLugYIc9h/k6fjehLX7OY9n+muDufnPtjbtjNIZMz
        Rmv8RRz+JYdotYn9kifhSv7YEb/vi3x+Ro/KDAboMbTaxsaPVUHFGVAVlLt9z78zL3aedoDObrQ
        4TKu51FLf0WmjtVTh3hHifn8=
X-Received: by 2002:aa7:d0ca:0:b0:530:74ed:fc8a with SMTP id u10-20020aa7d0ca000000b0053074edfc8amr13224038edo.41.1698861289533;
        Wed, 01 Nov 2023 10:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVnFRMTGJHQlmpCorHWXgjX/JDj2IwGcvCvUpQyXc80EQmO4QlCuNvR898VgWual5BmnPZQQ==
X-Received: by 2002:aa7:d0ca:0:b0:530:74ed:fc8a with SMTP id u10-20020aa7d0ca000000b0053074edfc8amr13224026edo.41.1698861289276;
        Wed, 01 Nov 2023 10:54:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l2-20020a50d6c2000000b0054018a76825sm1353748edj.8.2023.11.01.10.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 10:54:48 -0700 (PDT)
Message-ID: <56fbbe6c-0342-01d9-9840-40c7fa13f1f2@redhat.com>
Date:   Wed, 1 Nov 2023 18:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] fbdev/simplefb: Add missing simple-framebuffer
 features
Content-Language: en-US, nl
To:     Thierry Reding <thierry.reding@gmail.com>,
        Helge Deller <deller@gmx.de>
Cc:     Robert Foss <rfoss@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231101172017.3872242-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 11/1/23 18:20, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> This contains two patches that bring simplefb up to feature parity with
> simpledrm. The patches add support for the "memory-region" property that
> provides an alternative to the "reg" property to describe the memory
> used for the framebuffer and allow attaching the simple-framebuffer
> device to one or more generic power domains to make sure they aren't
> turned off during the boot process and take down the display
> configuration.
> 
> Changes in v2:
> - remove unnecessary call to simplefb_detach_genpds() since that's
>   already done automatically by devres
> - fix crash if power-domains property is missing in DT

Thanks, the new version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Helge, will you pick these 2 up, or shall I push them to drm-misc-fixes?

Regards,

Hans





> Thierry Reding (2):
>   fbdev/simplefb: Support memory-region property
>   fbdev/simplefb: Add support for generic power-domains
> 
>  drivers/video/fbdev/simplefb.c | 128 +++++++++++++++++++++++++++++++--
>  1 file changed, 123 insertions(+), 5 deletions(-)
> 

