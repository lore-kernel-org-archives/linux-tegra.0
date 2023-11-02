Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43F6C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Nov 2023 10:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346709AbjKBKzr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Nov 2023 06:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346817AbjKBKzq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Nov 2023 06:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEAF131
        for <linux-tegra@vger.kernel.org>; Thu,  2 Nov 2023 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698922501;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rDScEF2O82i+YasDdzJYzr0zXZ3g8ZG6cVf0gZaER+0=;
        b=TnqhCl3aVB9MTU9NESx/V29j5HpBCjsR7gYriVvmUmHKC3tpkZ4E/nQ7ffzypKCQxuFUjG
        yF19YtZC4I4MbqS8bzpcqN9fz06Mc3pdw/tSFzVCHIuudrP/ucgNZZBXyx/NN4SOyYiKJJ
        bZpcdEk/+cAnPp9ytZ4DoVk1FpVsqkU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-OYqqmkOFNkueVsYn7Lu4bg-1; Thu, 02 Nov 2023 06:55:00 -0400
X-MC-Unique: OYqqmkOFNkueVsYn7Lu4bg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bca0b9234so54844766b.2
        for <linux-tegra@vger.kernel.org>; Thu, 02 Nov 2023 03:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698922498; x=1699527298;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDScEF2O82i+YasDdzJYzr0zXZ3g8ZG6cVf0gZaER+0=;
        b=b2jlcOY0B2Kw3cvWUNhzHBv4zH3NaEm5X559GeIGuBSBp91mYSBb3pZKpFXWrMsBg3
         hTq28NsyUDGbDf8sJHCG0lioWfAEormaZT+VdAK2bpuxUMv9kdZ/uyOcWF0vFGBtgKLV
         WgNC6/2VBLOrKEyRCJ8S30SQnZ/l5LVevPv6GLIgKR7Yk6BAStqcuoyHsED7e60zwbZU
         MzCRMiFIvoWL+EatRDwYtce8OuSqktLOlqWojfOOBNqqGqBm7iLNoQENXdfP2n5M9bMp
         FhdlwnKsDuzD5tYLiVWjSBLCEC/ZKOF7+tzq3SF0TsOdQv2JGwaMJdk8fsyYcJA9MBsR
         YqrA==
X-Gm-Message-State: AOJu0Yzqx80mSN8/IXokIfxdu43UtcA1f82GfKVQJrOuzarTc6snxTgA
        kKvykVqradbARuh/EmNEzqayjOoUaZkmsiJgx/+Tp2ftIKk/VAv4UR7/HcHoFeoEiJZKvVn8new
        uafSUbEZaeiWGVJi331Z49MBgIkut09I=
X-Received: by 2002:a17:907:25c6:b0:9bd:e74b:abf1 with SMTP id ae6-20020a17090725c600b009bde74babf1mr3812315ejc.8.1698922498528;
        Thu, 02 Nov 2023 03:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpOoo/gHPrFW7q5k0Nk4IT1LkiKH6+7Adch5Y9SLGgRh4AyMOkHjDcasHc9ORZJ/8+aHt9Sw==
X-Received: by 2002:a17:907:25c6:b0:9bd:e74b:abf1 with SMTP id ae6-20020a17090725c600b009bde74babf1mr3812300ejc.8.1698922498200;
        Thu, 02 Nov 2023 03:54:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d25-20020a170906175900b009c657110cf2sm990147eje.99.2023.11.02.03.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 03:54:57 -0700 (PDT)
Message-ID: <80081ce9-f6a6-312b-a798-d64655d8e5d4@redhat.com>
Date:   Thu, 2 Nov 2023 11:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] fbdev/simplefb: Add missing simple-framebuffer
 features
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Helge Deller <deller@gmx.de>
Cc:     Robert Foss <rfoss@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
 <56fbbe6c-0342-01d9-9840-40c7fa13f1f2@redhat.com>
In-Reply-To: <56fbbe6c-0342-01d9-9840-40c7fa13f1f2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 11/1/23 18:54, Hans de Goede wrote:
> Hi,
> 
> On 11/1/23 18:20, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Hi,
>>
>> This contains two patches that bring simplefb up to feature parity with
>> simpledrm. The patches add support for the "memory-region" property that
>> provides an alternative to the "reg" property to describe the memory
>> used for the framebuffer and allow attaching the simple-framebuffer
>> device to one or more generic power domains to make sure they aren't
>> turned off during the boot process and take down the display
>> configuration.
>>
>> Changes in v2:
>> - remove unnecessary call to simplefb_detach_genpds() since that's
>>   already done automatically by devres
>> - fix crash if power-domains property is missing in DT
> 
> Thanks, the new version looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> for the series.
> 
> Helge, will you pick these 2 up, or shall I push them to drm-misc-fixes?

I have pushed this to drm-misc-next now.

I now I said drm-misc-fixes at first, but on a second look
these really are not fixes, so getting them in mainline
will have to wait to the next merge-window.

Regards,

Hans



