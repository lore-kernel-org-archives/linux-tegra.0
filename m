Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDC2C49361
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Jun 2021 11:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EC9E61245
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Jun 2021 11:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbhFSLM3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 19 Jun 2021 07:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbhFSLM2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 19 Jun 2021 07:12:28 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C608C061574;
        Sat, 19 Jun 2021 04:10:18 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id x22-20020a4a62160000b0290245cf6b7feeso3163220ooc.13;
        Sat, 19 Jun 2021 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jGT3JoRbOKhxxTLocr8dP2N6w63SdfEBqzsNI5J17gw=;
        b=RBzJvnEVWK1LtFiWxScAQn6nzT0Sk5L6qO25QaDXS0rVdnGk1WFArCdAosrmR3MJnA
         1ljimPzii8/mYU287XUObiHlFm/T/d8PrymYmnfG7nN1bcVzvF1yea86YRJw4nM/Zx2A
         POkNmZVrd2VNnWtgFr3lxUo94T5EqGuZ4DcLJd1nZjRjEtVd6t+rEdiXMpHR5WR8Qb1f
         k0mMaoKx1nKlTFgs+EA+PdP82pxnBmP5F2s3A6LRxqNfEAEa8LvxlgmGHQAOIky8q6Bv
         vr6QrTpcyAPz481g9166zi0Q8qkl7bTTbANoXieGJZYWjCqMOtqOlnWkl5wg1sB7qCES
         OT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=jGT3JoRbOKhxxTLocr8dP2N6w63SdfEBqzsNI5J17gw=;
        b=PykxzQCdcWD1eg5OCRN01k96MChktpyIa7msKBk067dzqBigvDcJugDoGiubgfbJkr
         vZfjxolrpr0Z5tN/vs0gcDeoI2UoNFJ0UB2Z13gk36HSz93SqybJWL1sGW9JAO+ijybM
         CBMbYie0Vw2ILAZqvgDlUqE0pIe1u3fRfAiyjDErpK6jYlBDvHKU8ntiIP5aAbwrF8ep
         5Ys1OGueg9yndnJEVfyZ16cF1D7H8sHUTvj3vGuaRR/xE0yVtv7mBKBP+1NnCPGYM+dV
         5JNLSB1mZwbcyNzsi8Xic+XkkaM4B7d0NdGfJc5FXNaJw/+EsKkLuUmWuInb007BGx6W
         FAVg==
X-Gm-Message-State: AOAM530fczIx+oJL1+0Syg5p7lVgmaOMRZM+QibrtH8Io79JplrhwONq
        /VVG2dXUYqudxuxrL76qXc8=
X-Google-Smtp-Source: ABdhPJwXppZizYY6AC+p7d4cJtypRmsh1F1i0wyhnzY0E5EvdZVCOiblZthNHLTtn8GA1jEJUfknWg==
X-Received: by 2002:a05:6820:23c:: with SMTP id j28mr12949720oob.88.1624101017470;
        Sat, 19 Jun 2021 04:10:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 111sm2620855otg.25.2021.06.19.04.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 04:10:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 19 Jun 2021 04:10:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/4] HWMON LM90 interrupt fixes and improvements
Message-ID: <20210619111014.GA1042635@roeck-us.net>
References: <20210618215455.19986-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618215455.19986-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jun 19, 2021 at 12:54:51AM +0300, Dmitry Osipenko wrote:
> Hi,
> 
> This series makes interrupt usable on NVIDIA Tegra devices, it also
> switches LM90 driver to use hwmon_notify_event().
> 

Series applied.

Thanks,
Guenter

> Changelog:
> 
> v3: - No code changes. Added changelog.
> 
> v2: - Dropped "hwmon: (lm90) Use edge-triggered interrupt" patch
>       and replaced it with "hwmon: (lm90) Don't override interrupt
>       trigger type", as was discussed during review of v1.
> 
>     - Added these new patches:
> 
>         hwmon: (lm90) Use hwmon_notify_event()
>         hwmon: (lm90) Unmask hardware interrupt
>         hwmon: (lm90) Disable interrupt on suspend
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
> -- 
> 2.30.2
> 
