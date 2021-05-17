Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC01C43461
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 06:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C15B61166
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 06:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbhEQGWf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 02:22:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:58163 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232218AbhEQGWf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 02:22:35 -0400
IronPort-SDR: ZlFeQ66o4K72j6LEypN4Ec23gPjiSXxrz9q/m5YWKEJvEVW9se24p8llF5nDJ4aLOc6bRBryTg
 I9Z+fcDiVsTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="187798130"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; 
   d="scan'208";a="187798130"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2021 23:21:18 -0700
IronPort-SDR: ucTslSVrfm3Dr7fBX9XveScssOvJXF8A+PoVzICYkR7EOlQpPaKaAxwPSXA5dOhVeMulwInDJF
 8ZsWmYFEWLOQ==
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; 
   d="scan'208";a="611468871"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2021 23:21:12 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1liWcn-00CfzY-8g; Mon, 17 May 2021 09:21:09 +0300
Date:   Mon, 17 May 2021 09:21:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Thompson <daniel.thompson@linaro.org>
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
Message-ID: <YKILVUc3stIWeHpo@smile.fi.intel.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <20210511153958.34527-2-andriy.shevchenko@linux.intel.com>
 <20210513093130.qzbh6tm7lbclgayh@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513093130.qzbh6tm7lbclgayh@maple.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, May 13, 2021 at 10:31:30AM +0100, Daniel Thompson wrote:
> On Tue, May 11, 2021 at 06:39:56PM +0300, Andy Shevchenko wrote:
> > Use %ptTs instead of open-coded variant to print contents
> > of time64_t type in human readable form.
> > 
> > Cc: Jason Wessel <jason.wessel@windriver.com>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: kgdb-bugreport@lists.sourceforge.net
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Any clue what route this will take into the kernel? I'm certainly happy
> for someone else to take the kdb bits alongside the vsprintf stuff
> (so here's an acked-by too in case they are fussy about that sort of
> thing ;-) ):

I hope Petr will take it thru PRINTK tree.

> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


