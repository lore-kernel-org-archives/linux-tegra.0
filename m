Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4522AC48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 253B460FE8
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhFRVgO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbhFRVgO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:36:14 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94981C061574;
        Fri, 18 Jun 2021 14:34:03 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso11046975oto.12;
        Fri, 18 Jun 2021 14:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tDLxgRw6U+jtyiXpfy58MFNS9bu38g3mj9DzBt0QoYI=;
        b=epDWvQLwnmqnMnaIxDXHkGUT8yMrs7usVOVM1jpfgGphdLPTeOxTzg6fh0wHNH8HZA
         Fa9gQaoD19avx122YKr7ia4NC5PG5eX3BMXWjEO5mJghoKXRNKmhfjkngPN1Is0RrIsw
         HTxBRrM1WEXnrKXam+94HQKdrlhuUvMtLpe5ap0J+6UjOoEgFtCd5e7+IfH59PAd5Gxf
         YpnMOiaTH71R46OUVsIE3rAmAZ7VjJ1hI9OMpWk3Suq6kZXI6pBsgS34Hm0coq2HOsPQ
         xVzPeURK74VXeqsv777omV0PnPmcChabS8F4DgXzMMw7mAmrkIeqKC1r8c/VGK5OtBFr
         bbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=tDLxgRw6U+jtyiXpfy58MFNS9bu38g3mj9DzBt0QoYI=;
        b=WRnvA8P7NJzC9/EcVA8Yps/VrHV2JDpCJbjgIzYYrkMCMq7Y46yKwJM7QqpvZsn7Dl
         sdYHWlmmwFFvMfg7nkqCg4eubzBgMdfN+sbac249SGDweF8Fm8ZVOGLzPGxw7+/eHAhD
         OI7wGISkRogYd0HvGxTpRWSpDRbrt1nGTbdxn6OFBdyJjzhYNkcfD3WrgpFg/or9mU8o
         ENyW3mRz/SN72KGELARYAxdVHeEmXQaMCzhw0WcvX6Rgzv8ABKwQ0IZTv9USlwZxqR6R
         T3QsnHGwJrqQ+P1efmvuJYfH2OOhs9+ykZYPFJwE/o1aZT+T2LqeiQerx4jSHhzHFit9
         PKyQ==
X-Gm-Message-State: AOAM532LyaXhIkSWiY2pa9q9z/TUj7iu9s7NXqB61jB4TGSOdhj1SgoK
        g8A5FZIrHR1QamNxXnoZN04=
X-Google-Smtp-Source: ABdhPJwKE6/xUtXPVXgGpOWe9bodqGM1V9zK00jBCTaPyFJei1r4v/neRzg8dhzEEEghALdQK2eF8Q==
X-Received: by 2002:a9d:2034:: with SMTP id n49mr11822816ota.231.1624052043016;
        Fri, 18 Jun 2021 14:34:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o20sm1151285ook.40.2021.06.18.14.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:34:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Jun 2021 14:34:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/4] HWMON LM90 interrupt fixes and improvements
Message-ID: <20210618213400.GA1668818@roeck-us.net>
References: <20210618211202.2938-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618211202.2938-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jun 19, 2021 at 12:11:58AM +0300, Dmitry Osipenko wrote:
> Hi,
> 
> This series makes interrupt usable on NVIDIA Tegra devices, it also
> switches LM90 driver to use hwmon_notify_event().
> 
> Dmitry Osipenko (4):
>   hwmon: (lm90) Don't override interrupt trigger type
>   hwmon: (lm90) Use hwmon_notify_event()
>   hwmon: (lm90) Unmask hardware interrupt
>   hwmon: (lm90) Disable interrupt on suspend
> 
>  drivers/hwmon/lm90.c | 79 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 13 deletions(-)
> 

Please resubmit with change log.

Guenter
