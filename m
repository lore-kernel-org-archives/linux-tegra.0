Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C97CFA3742
	for <linux-tegra@archiver.kernel.org>; Mon, 31 Oct 2022 12:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbiJaMTl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 Oct 2022 08:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiJaMTl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 Oct 2022 08:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B210F2DE1
        for <linux-tegra@vger.kernel.org>; Mon, 31 Oct 2022 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218726;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y9o0NAEqIzltln/rJd0nXK88QZ5o4OnoHZo920P8Bvg=;
        b=Yq2vh5BPAFYXNqTmz45TO27gOGaEcKKgJ74J2P9uFbq1II6y6U3bF40ps2tONPhT0DZf/I
        RF7/5zp+GKvMpKk3D2IsUcBkI4g8j5sOLxHbx0adGnOOxtABBMolAreUnovH59S+8xcSb+
        LOJjnMj8GgK7Xopo8ZsJFx/qs9eO+aA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-Jc92kSaiMyWpewCLhgEztw-1; Mon, 31 Oct 2022 08:18:44 -0400
X-MC-Unique: Jc92kSaiMyWpewCLhgEztw-1
Received: by mail-wm1-f69.google.com with SMTP id bg21-20020a05600c3c9500b003c2acbff422so5676998wmb.0
        for <linux-tegra@vger.kernel.org>; Mon, 31 Oct 2022 05:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9o0NAEqIzltln/rJd0nXK88QZ5o4OnoHZo920P8Bvg=;
        b=aU94YpCcVZ99aggVQwLj7hWq/DtdPUrN0lrk9wlVPsDSz25pNe6N/4Y3633uO/NjRQ
         f0OZ++sXzg336YK6StAJeSqVIV3avdFQHvIZ3mRrz8veZF9KH0DV/6b6eBHJFPg1ft8c
         1BXiUhlKp2XJm+0tbZNzBUbbI/xCHtc8oV/8HNtpvh9Rv1ZwKSXqsD8z3ovt02MrglFP
         jTLdW9icFHdmEDldfpsH1V7PSgMjqSucMia5zt1WZIvbzycIGw7lObZtb4pJpt7aV0Oh
         Z7fkDXlVpFXJNLcq6QbNSwc4mK5CrqFOVF0asJXbTFL4kVY4brrbL8tWrVspN4ikjtac
         /N0A==
X-Gm-Message-State: ACrzQf31VZLhVtKa7PsRV1/bnqLH1GZ9hE3JvTrkTm/eJ0IgzS6mlxz5
        JRbhkniFgGQWRakyX7hwbiVxhsxrEwHFXXwfvX/SCqb424jwnA8ZCyOmfb9yKYZlSMcMokEzMB8
        RAi/q7tEBkn3k17rg7LPoeOI=
X-Received: by 2002:a05:600c:1913:b0:3c7:32c8:20f1 with SMTP id j19-20020a05600c191300b003c732c820f1mr18174573wmq.81.1667218723534;
        Mon, 31 Oct 2022 05:18:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7l/GcAhTFdfukiyp7nV9yfjX7i/zfBGid5JfBMyP3xXFRWK8fegD9382/Cb8rQ8SeG7Fkrtw==
X-Received: by 2002:a05:600c:1913:b0:3c7:32c8:20f1 with SMTP id j19-20020a05600c191300b003c732c820f1mr18174541wmq.81.1667218723353;
        Mon, 31 Oct 2022 05:18:43 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b003b505d26776sm1928473wms.5.2022.10.31.05.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:18:42 -0700 (PDT)
Message-ID: <05a2ad4a-b053-ba98-2547-520ab51d3e77@redhat.com>
Date:   Mon, 31 Oct 2022 13:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 07/21] drm/logicvc: Don't set struct
 drm_driver.output_poll_changed
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
 <20221024111953.24307-8-tzimmermann@suse.de>
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as logicvc uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

