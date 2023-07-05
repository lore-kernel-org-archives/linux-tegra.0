Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BECEEB64DD
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 09:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjGEJOe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjGEJOd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 05:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D9B1711
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jul 2023 02:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688548432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Rik35amMtwyfsql6qwDwxhFyML3yiol4Y+GAZ2CyrAI=;
        b=iNTSzdNa12XsbUMb7g796WRj+R5RHCN6OCFxKCUMoJPTQ/UkjPD/hHYIeOYpPEPSse4rmu
        /MkenCf0D2sCiTyzblab0HL1bCMfri8CAdjcza/kUsLP+WqWxz0LKZxyc5MrKbCa7+O2c9
        lAtCKlQ8GQ8n44s8OmfazPXqlwIMW8Y=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-2mdobuPNN3y5-4fAaXbWmw-1; Wed, 05 Jul 2023 05:13:51 -0400
X-MC-Unique: 2mdobuPNN3y5-4fAaXbWmw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4edbdd8268bso6030028e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jul 2023 02:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548429; x=1691140429;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rik35amMtwyfsql6qwDwxhFyML3yiol4Y+GAZ2CyrAI=;
        b=gNQYzEgv8VwY12bXG8kfuNniP8e1ewgIKBQKNCXCerOVTNxLdzXpyyBu/dmlMnd0yV
         z3IMV8CoFb2cFIYxTXQPRNBK3a6YW8pplKOpZ2GSHIuB+bbFCWulopbUSSPOgWtBEvDt
         PHSfnI1/ydC6RA7ZfbZjs7OzhKAEPS7XQEdgYu+IbBFMb1tDeeRC9eGjiq/BxavrjrNZ
         OHGyM4wBZLnYbzUnirve5e+0IMJXkUPdFEI2jUCBz5E9CWRD53vrMkj+xO0DytZWDB94
         ib4mAPQZhghB09cGJ8QMkl1/dOuG1HgHGgGRTGn9u/HWkKxK9UyFxDTsxgOXzvKxu/Sq
         4Qtg==
X-Gm-Message-State: ABy/qLaE8UFrmeXU+6WHJXJZBJnUtNq//WGSSX5nZl/enCW0myeNELj4
        54rkS5iysCZmL8GDxOt4Rz/qupgh+S8jw4qs6M+O4U7ulajIMwhD9xpjX//0WBqZ50+7+VIXkDq
        tmhvE5OInL5VGZ8sDjDpLSxLZzL5IUK4=
X-Received: by 2002:a05:6512:2390:b0:4f8:75af:e917 with SMTP id c16-20020a056512239000b004f875afe917mr13371321lfv.41.1688548429591;
        Wed, 05 Jul 2023 02:13:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjlCwK+D/L2otHSAcjbQ8sKKCy18gUu/mb3rWmvZIWyjXZh7PIhlP01348E9bdMzGE5uNgkQ==
X-Received: by 2002:a05:6512:2390:b0:4f8:75af:e917 with SMTP id c16-20020a056512239000b004f875afe917mr13371303lfv.41.1688548429289;
        Wed, 05 Jul 2023 02:13:49 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fbc2c0addbsm1520495wmc.42.2023.07.05.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:13:49 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
In-Reply-To: <45ed59d1-32a5-86cb-094f-5ce7ad758d5b@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-2-tzimmermann@suse.de>
 <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>
 <45ed59d1-32a5-86cb-094f-5ce7ad758d5b@suse.de>
Date:   Wed, 05 Jul 2023 11:13:48 +0200
Message-ID: <87cz16ra9f.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>> 
>> The comment for I/O memory helpers says:
>> 
>> /*
>>   * Initializes struct fb_ops for framebuffers in I/O memory.
>>   */
>> 
>> I think that would be good to have consistency between these two,
>
> Sure, I had the same thought. I think I'll rather change the existing 
> comments a bit.
>

Yes, that works for me too. Thanks!

> Best regards
> Thomas
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

