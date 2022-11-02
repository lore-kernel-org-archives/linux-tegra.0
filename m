Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6663C4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Nov 2022 10:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiKBKCc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Nov 2022 06:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiKBKCb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Nov 2022 06:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9681A23E84
        for <linux-tegra@vger.kernel.org>; Wed,  2 Nov 2022 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667383286;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QoVTRIE06q1gLaA+FiGPh2NoY5TNtlfidxMdk3t+aTM=;
        b=fuSs/eA4/7vZhV+X35FsnJlEhJ/20+W2k2LZenlQ7FIAvrb5mWjQpHZEEE3G7/vkuBezcY
        ci/Smj7q/Z7hIgWVlQx1F2hNiJZQuFSvdEElWEudDf6CzncUGzYGNXoMcPmOQDpm4N2pDn
        leC3TPAoQgZGNS5Qf5k3LtPYa4n+dVI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-XiNgRuf4M1mpEsB7CFf9KA-1; Wed, 02 Nov 2022 06:01:25 -0400
X-MC-Unique: XiNgRuf4M1mpEsB7CFf9KA-1
Received: by mail-wr1-f69.google.com with SMTP id n16-20020adfc610000000b0023650935090so4614058wrg.5
        for <linux-tegra@vger.kernel.org>; Wed, 02 Nov 2022 03:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QoVTRIE06q1gLaA+FiGPh2NoY5TNtlfidxMdk3t+aTM=;
        b=r2ftl6gUaUdLAKRAxHDCp14QYSHPVmXHpGgUdFSdKj9MTnRMOO8UVb9RM0n8t09wwH
         fytRLiyOpMFP/W9fynP8I8Uk/bk8cgZ/505Z805NTF8HLYTOZjVjORJBkuMs5loKdfpF
         jcwx+TifbRhI2bb+b7xzKrRjYBaJu0WFldK714fHTEGf59uvtbGdbjWPs1oSwdktEb0i
         hK/YHTI2asKDPq2jJgt5sx4DSNuwsi+0LSUKOHbw7yYwe2FMBJViqKbM5ebYWkByNlka
         rEQIxuNocCm0uCK0Fc3/c8b5r0neSdr20b8UgJ+Uguqv6v76deLtDkkfu3/SoaWZZ7r7
         +8xQ==
X-Gm-Message-State: ACrzQf3NhRVeFBxTd+uo2QlTQz4iujYOGIaDCXDFmzT0WBwNnJM0+0xB
        8Q6+mMINpFqiwZCCnV1D76sHjYG/rdddvLzVnKidUPkG5nWjhR1UJityPy4WPzLrbEiUwmkvfDO
        RRT8KCBxRW1Q+D+SZ2foArVg=
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id b5-20020a5d5505000000b00236582b7eb0mr14405765wrv.68.1667383284422;
        Wed, 02 Nov 2022 03:01:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ieiweFPtXW5w3c0VZoUXMoQohTPuy1WtQBfT29g+UzlDhvHMzFOjUUUPFpm0LZwMa5DV8ag==
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id b5-20020a5d5505000000b00236582b7eb0mr14405736wrv.68.1667383284200;
        Wed, 02 Nov 2022 03:01:24 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d550d000000b002366b17ca8bsm14230263wrv.108.2022.11.02.03.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:01:23 -0700 (PDT)
Message-ID: <1d2b9809-857f-48cc-1177-72e6fc67b8e5@redhat.com>
Date:   Wed, 2 Nov 2022 11:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 20/21] drm/fb-helper: Move generic fbdev emulation into
 separate source file
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-21-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-21-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Move the generic fbdev implementation into its own source and header
> file. Adapt drivers. No functonal changes, but some of the internal
> helpers have been renamed to fit into the drm_fbdev_ naming scheme.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

