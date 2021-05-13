Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04BBC433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 09:31:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E2A861182
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 09:31:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhEMJcr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 May 2021 05:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbhEMJco (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 May 2021 05:32:44 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60287C061574
        for <linux-tegra@vger.kernel.org>; Thu, 13 May 2021 02:31:34 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id z17so7194603wrq.7
        for <linux-tegra@vger.kernel.org>; Thu, 13 May 2021 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K2KX3N3qEtXhLRhml3Iacue6w4dhQzMo6cc0mTtnvQM=;
        b=r0pHg9wLk+EkYR5JCrgzCwvxfLOJCEKZ7rlImrKtZJl/RFxusIlb/dHrHqumPtHekw
         TuV6M6W+5C+88MZcMWoYC03FLTQRmP+HZMlOaDrQZ05FPxs039l9uS8pmlV0dKcHMLz5
         CUqwLbiwuftKZoH8oiGOepbGAFDSG4Xu5+/lPafGcdhEnhzFZdCxQq3GbaAARfd4JsuT
         kHeqskEgSV555dWibYEfk/fmA7mMm6ZrQ1QRkSy9E8MD6r3u6nR2yInb8/OXA+SqhpjS
         pZLrEoh296DZ+mareJMyQNItfC2RAfn4QvCt91FAO4gpzmeg8UIwAnQk+eaJMz+vsqlG
         BA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K2KX3N3qEtXhLRhml3Iacue6w4dhQzMo6cc0mTtnvQM=;
        b=kllWw+byNA5jmf258WXY0b5lWGC6w+lH1fmTP8XZVwq5AvAn9i0VqKaBjgtDReao1h
         o5wwFS/qP3xCiwfrdr+HIpXuU3x5rvG5jpahCQnApWp5WCdjZC2MIwUn13X+m7wvMNjK
         k4ETTNmmoS8jL/R0RUfwylCEcR4S3STBnNOtQ6Uyr8qjH5oqoEym3Efc3tu2YMDu2MnR
         PY+BLnMpz1pSmTMw3xup2IzfqXBzunkDQvlbsf+S4CBFGPhvhZmIxECt3RrFtzoVg3F2
         89m4UFItLwtLo847EvYD7Zpa2M91bms5zX7gF7xMRFnhzgRq5c+3zpzpig7luJUfynMy
         oyTQ==
X-Gm-Message-State: AOAM531bMeVIbtYBrxNPX9AyTu2aQ2seW2jtdgbfavZEC3oPFITgf7S8
        3+4ms1EU1Uz5erA460ZeptCG4A==
X-Google-Smtp-Source: ABdhPJwmID9w2Hp1ruXNrBudSly/39AHF+tVW4EuRSQip8bKri1BbA6tswXSbk2m1ujO+jkvowzwUw==
X-Received: by 2002:a05:6000:2cf:: with SMTP id o15mr15604521wry.243.1620898293114;
        Thu, 13 May 2021 02:31:33 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id f3sm2252580wrp.7.2021.05.13.02.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 02:31:32 -0700 (PDT)
Date:   Thu, 13 May 2021 10:31:30 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
        Joe Perches <joe@perches.com>,
        Sumit Garg <sumit.garg@linaro.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-nilfs@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/4] kdb: Switch to use %ptTs
Message-ID: <20210513093130.qzbh6tm7lbclgayh@maple.lan>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <20210511153958.34527-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511153958.34527-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 11, 2021 at 06:39:56PM +0300, Andy Shevchenko wrote:
> Use %ptTs instead of open-coded variant to print contents
> of time64_t type in human readable form.
> 
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Any clue what route this will take into the kernel? I'm certainly happy
for someone else to take the kdb bits alongside the vsprintf stuff
(so here's an acked-by too in case they are fussy about that sort of
thing ;-) ):
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
> v2: collected tags
>  kernel/debug/kdb/kdb_main.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 1baa96a2ecb8..622410c45da1 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2488,7 +2488,6 @@ static void kdb_sysinfo(struct sysinfo *val)
>  static int kdb_summary(int argc, const char **argv)
>  {
>  	time64_t now;
> -	struct tm tm;
>  	struct sysinfo val;
>  
>  	if (argc)
> @@ -2502,13 +2501,7 @@ static int kdb_summary(int argc, const char **argv)
>  	kdb_printf("domainname %s\n", init_uts_ns.name.domainname);
>  
>  	now = __ktime_get_real_seconds();
> -	time64_to_tm(now, 0, &tm);
> -	kdb_printf("date       %04ld-%02d-%02d %02d:%02d:%02d "
> -		   "tz_minuteswest %d\n",
> -		1900+tm.tm_year, tm.tm_mon+1, tm.tm_mday,
> -		tm.tm_hour, tm.tm_min, tm.tm_sec,
> -		sys_tz.tz_minuteswest);
> -
> +	kdb_printf("date       %ptTs tz_minuteswest %d\n", &now, sys_tz.tz_minuteswest);
>  	kdb_sysinfo(&val);
>  	kdb_printf("uptime     ");
>  	if (val.uptime > (24*60*60)) {
> -- 
> 2.30.2
> 
