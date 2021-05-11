Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D6BC433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 14:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 734CB6134F
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 14:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhEKO6N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 10:58:13 -0400
Received: from mga03.intel.com ([134.134.136.65]:1059 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231604AbhEKO6M (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 10:58:12 -0400
IronPort-SDR: apC16J+4AF0c2a+ZLQMklF7Q9r6o/cV8k/aqDaynICZjdfFdrlf84osuzd9JE8yj5pOLszTKi9
 f9tQLgSWqo2g==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199514448"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="199514448"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 07:57:05 -0700
IronPort-SDR: 8PQcwvpWU6Dh0UpthJR9/VCiXxCuDjTvMOh/WTQFuV/wJApSX5qc5E38iTSMC3V6n/LRYT2qN2
 dP3l2iQdzTCg==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="468941442"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 07:57:00 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lgToe-00BTUX-KM; Tue, 11 May 2021 17:56:56 +0300
Date:   Tue, 11 May 2021 17:56:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Petr Mladek <pmladek@suse.com>
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
Message-ID: <YJqbONasNp9BXx9Q@smile.fi.intel.com>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <YJqRYNlAu0SfWpb5@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJqRYNlAu0SfWpb5@alley>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 11, 2021 at 04:14:56PM +0200, Petr Mladek wrote:
> On Mon 2021-05-10 18:04:10, Andy Shevchenko wrote:
> > ISO 8601 defines 'T' as a separator between date and time. Though,
> > some ABIs use time and date with ' ' separator instead.
> > 
> > Add a flavour to the %pt specifier to override default separator.

...

> >  	%pt[RT]			YYYY-mm-ddTHH:MM:SS
> > +	%pt[RT]s		YYYY-mm-dd HH:MM:SS
> >  	%pt[RT]d		YYYY-mm-dd
> >  	%pt[RT]t		HH:MM:SS
> > -	%pt[RT][dt][r]
> > +	%pt[RT][dt][rs]
> 
> Sigh, we do not have clear rules what [xy] means. It might be:
> 
>       + always use one of them
>       + optionally use one of them
>       + always use any of them
>       + optionally use any of them
> 
> %pt[RT][dt][rs] is a great mix:
> 
>       + R or T is required, the rest is optional
>       + 'd' or 't' can be used but both together are not supported 
>       + any variant of 'r' and 's' is supported including various ordering
> 
> Honestly, I do not know about any magic solution that might make it
> easier to understand these monster modifiers.
> 
> Well, what about using the following at least in this case:
> 
> 	%pt[RT][dt][r][s]
> 
> It might help to understand that both 'r' and 's' can be used at the
> same time.

This is the case, yes, thanks for catching it.

> An attempt to distinguishing all the possibilities might be:
> 
> 	%pt{RT}[{dt}][r][s]
> 
> where [] means that it is optional and {} means one of them must be
> chosen. But I am not sure if it really makes the life easier. Anyway,
> this would be for another patch that updates the entire printk-formats.rst.

No, this is not the case, the d and t can go in any combinations: none, d, t,
dt, or td.

> 
> >  For printing date and time as represented by::
> >  
> > @@ -528,6 +529,9 @@ in human readable format.
> >  By default year will be incremented by 1900 and month by 1.
> >  Use %pt[RT]r (raw) to suppress this behaviour.
> >  
> > +The %pt[RT]s (space) will override ISO 8601 by using ' ' instead of 'T'
> > +between date and time. It won't have any effect when date or time is omitted.

...

> > +	do {
> > +		switch (fmt[count++]) {
> > +		case 'r':
> > +			raw = true;
> > +			break;
> > +		case 's':
> > +			space = true;
> > +			break;
> > +		default:
> > +			found = false;
> > +			break;
> > +		}
> > +	} while (found);
> >  
> >  	if (have_d)
> >  		buf = date_str(buf, end, tm, raw);
> >  	if (have_d && have_t) {
> >  		/* Respect ISO 8601 */
> 
> The comment is slightly misleding now. What about something like?
> 
> 		/* 'T' by ISO 8601. */
> 
> Or maybe call the variable: iso_8601, remove the comment, and
> invert the logic:

Okay, I will think how to improve, thanks!

> 		bool iso_8601 = true;
> 
> 		case 's':
> 			iso_8601 = false;
> 			break;
> 
> 		*buf = iso_8601 ? 'T' : ' ';
> 
> >  		if (buf < end)
> > -			*buf = 'T';
> > +			*buf = space ? ' ' : 'T';
> >  		buf++;
> >  	}

-- 
With Best Regards,
Andy Shevchenko


