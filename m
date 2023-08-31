Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE167C83F10
	for <linux-tegra@archiver.kernel.org>; Thu, 31 Aug 2023 06:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346086AbjHaGda (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 31 Aug 2023 02:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbjHaGda (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 31 Aug 2023 02:33:30 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AA6CE9
        for <linux-tegra@vger.kernel.org>; Wed, 30 Aug 2023 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wcz8AYR7IFs/urqjOjWwrz40QXB3EYgGYI6013WLugY=; b=LPeCiYyVaL9RDl8PfIzFdtHCj1
        NeaX7JBkvqwlgozViZuKaLVAvtkmBYhYO6lZZuO5E5YSgTi7gAJQ0zJ5Y1qoR1xtLoAzbvoiES+8r
        Cb+qyaXwx5XOPuX0iqGhN/pt1hmApGjnuRyahbWW4n3+a798OAVnss6VMSi3w+fltyGng0nCsJqB5
        vDZuhy+Sz5vWitYuQJBg00XnnroHxc45bF40WP1za/9cmAOAxp4xYL+oCNo/7akzMZXT+bTcPhJJn
        MtXqjGRFWusP9j4o/W5SJlPhz8wcXco83K1H4r1FxfeUkrmDFO7E9tIRxksIELTd1q4ox/IPMjK5F
        Fns4XnTw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <cyndis@kapsi.fi>)
        id 1qbbF2-000sID-1Z;
        Thu, 31 Aug 2023 09:33:20 +0300
Message-ID: <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
Date:   Thu, 31 Aug 2023 09:33:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we support
 display
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 8/30/23 13:19, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.08.23 um 15:22 schrieb Thierry Reding:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Tegra DRM doesn't support display on Tegra234 and later, so make sure
>> not to remove any existing framebuffers in that case.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index b1e1a78e30c6..7a38dadbc264 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct 
>> host1x_device *dev)
>>       drm_mode_config_reset(drm);
>> -    err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
>> -    if (err < 0)
>> -        goto hub;
>> +    if (drm->mode_config.num_crtc > 0) {
> 
> If you don't support the hardware, wouldn't it be better to return 
> -ENODEV if !num_crtc?

While display is not supported through TegraDRM on Tegra234+, certain 
multimedia accelerators are supported, so we need to finish probe for those.

Cheers,
Mikko

> 
> Best regards
> Thomas
> 
>> +        err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
>> +        if (err < 0)
>> +            goto hub;
>> +    }
>>       err = drm_dev_register(drm, 0);
>>       if (err < 0)
> 

