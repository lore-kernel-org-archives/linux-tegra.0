Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62C8C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Feb 2022 20:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbiBUU35 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Feb 2022 15:29:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiBUU34 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Feb 2022 15:29:56 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF171237C8
        for <linux-tegra@vger.kernel.org>; Mon, 21 Feb 2022 12:29:32 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id e8so8388454ljj.2
        for <linux-tegra@vger.kernel.org>; Mon, 21 Feb 2022 12:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JX92JbueB/ws0+fnmetMx1WHpeM17m1CK4LnOHWhCBs=;
        b=AaELFfPYbaSEgQL3sit82AFMQEC70aaEiOn6I+yMOJTZBkMOEuiMH/JHAXJ2zdxl8o
         sJSesXuGvNJDPbEU9IliwLvyRQftpr5mXaJLzsXConS66fHFdO4EH2uanfRcot/CbDNv
         8lMSe6K56/ZGkS4QontcyjaYVKOwfvrMwr8NLCD1zOCL9h5Z7ML5FbUo65WSH3CupnQg
         qrv6KcicL6uU7X50JO/SIRNIVqMX98l2Oi0yAYWEVxLJmvaam35UEWu3W8qBunutqRap
         tl53TxQLhwRjrDgSSoY6+SglDBls6PcmMJK/Ov8h4rcZRKrr9vpBm+CxTnmPkbA7FQQE
         yxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JX92JbueB/ws0+fnmetMx1WHpeM17m1CK4LnOHWhCBs=;
        b=Gtxrgi8w7s0dednf5scZBE6guWjYUG2CbeGWH5ValZRWjvg7tG1WdvytP8I/7Zy2zT
         YZtfJsAIQZ3Pl9TrKK1HkHXLc15nCoU9WuMN70myELrY4lXjLfscbdmq0IjDygrAtqhO
         liTMeNbbBW0D3aszJq0lG23gcRuy4/KNLXJq2AdZafGS7mM4HdFzB5py+XEl674FALH4
         0dU7hwv8abGkHgRiZA47i8M2OnzwwoClwNLS93vv3+jAfUQexA2tD25jdZ/zgclT0pLL
         MnOeMf+IFjL7usynUpyXJUMYf51h7K/CUthgfSO3P6YkFe7iog3GllfISKYRQeuB0Qt5
         dCLw==
X-Gm-Message-State: AOAM530nvMoUf40OxyWltiBi6pib9s9xZn6BcbNWiSjsH1xYtFiy3yrX
        QcXnjTnJEVCohv249E+PwpE=
X-Google-Smtp-Source: ABdhPJySwG73wg9/mu5qjE/fqxawciyyP3eUEsnZw/alxwOEuOw2/uDwn1KLy6B1b3mocJYO2CHG1w==
X-Received: by 2002:a2e:900a:0:b0:246:17bb:a771 with SMTP id h10-20020a2e900a000000b0024617bba771mr14727734ljg.363.1645475371346;
        Mon, 21 Feb 2022 12:29:31 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id m7sm1442377ljb.87.2022.02.21.12.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 12:29:30 -0800 (PST)
Message-ID: <c207663d-7d7e-6c10-6ee4-3dd0378181f9@gmail.com>
Date:   Mon, 21 Feb 2022 23:29:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Content-Language: en-US
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <ed92bf43-1df2-8059-5228-83b98d6bbfae@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <ed92bf43-1df2-8059-5228-83b98d6bbfae@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.02.2022 12:31, Mikko Perttunen пишет:
> On 2/17/22 21:16, Thierry Reding wrote:
>> ...
> 
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Left one cosmetic comment in the VIC4.0 patch, but overall looks OK. I
> think it would be fine to have some basic tests in libdrm as well.

There is a question about who is going to use this libdrm API. Are you
going to use it in the VAAPI driver?

Grate drivers can't use this API because:

1. More features are needed
2. There is no stable API
3. It's super painful to keep all drivers and libdrm in sync from a
packaging perspective.

It's much more practical nowadays to use DRM directly, without
SoC-specific libdrm API, i.e. to bundle that SoC-specific API within the
drivers.
