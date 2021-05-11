Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F134C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 14:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F21A861155
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 14:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbhEKOQL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 10:16:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:57816 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231676AbhEKOQF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 10:16:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1620742497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=K/INbdoVMnVmSuC17hTHtZF9dvmPCdhexs0UvUqBKdU=;
        b=ZZwWnWCNMaCOX6VuJYsh6oDMSznOuCqE3OHNdSQVV9/C2i0EXmlVIOuh76zDI23pRGvYVq
        EdiYKyL07Upk0ornxhN4Gi2nyy4RC7SRHE8PQ9BMhtJqB0xiBEOX6bKgzrgn7jH38dTUrN
        WPMatuYcPOyjzG1cFGyFyLMWper17QY=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AF6FEAFE8;
        Tue, 11 May 2021 14:14:57 +0000 (UTC)
Date:   Tue, 11 May 2021 16:14:56 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Joe Perches <joe@perches.com>,
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
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 1/4] lib/vsprintf: Allow to override date and time
 separator
Message-ID: <YJqRYNlAu0SfWpb5@alley>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon 2021-05-10 18:04:10, Andy Shevchenko wrote:
> ISO 8601 defines 'T' as a separator between date and time. Though,
> some ABIs use time and date with ' ' separator instead.
> 
> Add a flavour to the %pt specifier to override default separator.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/core-api/printk-formats.rst |  6 +++++-
>  lib/test_printf.c                         |  5 +++++
>  lib/vsprintf.c                            | 19 ++++++++++++++++---
>  3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index f063a384c7c8..bc85fd4685e7 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -514,9 +514,10 @@ Time and date
>  ::
>  
>  	%pt[RT]			YYYY-mm-ddTHH:MM:SS
> +	%pt[RT]s		YYYY-mm-dd HH:MM:SS
>  	%pt[RT]d		YYYY-mm-dd
>  	%pt[RT]t		HH:MM:SS
> -	%pt[RT][dt][r]
> +	%pt[RT][dt][rs]

Sigh, we do not have clear rules what [xy] means. It might be:

      + always use one of them
      + optionally use one of them
      + always use any of them
      + optionally use any of them

%pt[RT][dt][rs] is a great mix:

      + R or T is required, the rest is optional
      + 'd' or 't' can be used but both together are not supported 
      + any variant of 'r' and 's' is supported including various ordering

Honestly, I do not know about any magic solution that might make it
easier to understand these monster modifiers.

Well, what about using the following at least in this case:

	%pt[RT][dt][r][s]

It might help to understand that both 'r' and 's' can be used at the
same time.

An attempt to distinguishing all the possibilities might be:

	%pt{RT}[{dt}][r][s]

where [] means that it is optional and {} means one of them must be
chosen. But I am not sure if it really makes the life easier. Anyway,
this would be for another patch that updates the entire printk-formats.rst.

>  
>  For printing date and time as represented by::
>  
> @@ -528,6 +529,9 @@ in human readable format.
>  By default year will be incremented by 1900 and month by 1.
>  Use %pt[RT]r (raw) to suppress this behaviour.
>  
> +The %pt[RT]s (space) will override ISO 8601 by using ' ' instead of 'T'
> +between date and time. It won't have any effect when date or time is omitted.
> +
>  Passed by reference.
>  
>  struct clk
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index f0c35d9b65bf..5f36c7a43cdc 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1834,7 +1834,8 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
>  	      struct printf_spec spec, const char *fmt)
>  {
>  	bool have_t = true, have_d = true;
> -	bool raw = false;
> +	bool raw = false, space = false;
> +	bool found = true;
>  	int count = 2;
>  
>  	if (check_pointer(&buf, end, tm, spec))
> @@ -1851,14 +1852,26 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
>  		break;
>  	}
>  
> -	raw = fmt[count] == 'r';
> +	do {
> +		switch (fmt[count++]) {
> +		case 'r':
> +			raw = true;
> +			break;
> +		case 's':
> +			space = true;
> +			break;
> +		default:
> +			found = false;
> +			break;
> +		}
> +	} while (found);
>  
>  	if (have_d)
>  		buf = date_str(buf, end, tm, raw);
>  	if (have_d && have_t) {
>  		/* Respect ISO 8601 */

The comment is slightly misleding now. What about something like?

		/* 'T' by ISO 8601. */

Or maybe call the variable: iso_8601, remove the comment, and
invert the logic:


		bool iso_8601 = true;

		case 's':
			iso_8601 = false;
			break;

		*buf = iso_8601 ? 'T' : ' ';

>  		if (buf < end)
> -			*buf = 'T';
> +			*buf = space ? ' ' : 'T';
>  		buf++;
>  	}
>  	if (have_t)

Best Regards,
Petr
