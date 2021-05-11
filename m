Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801F9C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 07:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F9F36192B
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 07:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhEKHPb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 03:15:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:49685 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230422AbhEKHP3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 03:15:29 -0400
IronPort-SDR: YdVnGlzXyd71xhGTfCNp/oOO85xRxoGJWmDlupeJ1rHhGQxIYEGFCaFzmVGdFU4t3IS5r0mDoq
 +iOtdq0fXm/g==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260638235"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="260638235"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:14:22 -0700
IronPort-SDR: c9aBpxO375CWUx7wQBSZFwPtRRtr9HPVsWUAJ6QjumnKzHL2Jr2PXOzEB/RbxjSno3CUx58zEW
 Tc/8aidWwKIw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="536865524"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:14:16 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lgMaq-00BNFg-I9; Tue, 11 May 2021 10:14:12 +0300
Date:   Tue, 11 May 2021 10:14:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
        Joe Perches <joe@perches.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
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
        Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 2/4] kdb: Switch to use %ptTs
Message-ID: <YJouxMmwwVwqqKi1@smile.fi.intel.com>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
 <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, May 10, 2021 at 05:05:46PM -0700, Doug Anderson wrote:
> On Mon, May 10, 2021 at 8:04 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Use %ptTs instead of open-coded variant to print contents
> > of time64_t type in human readable form.
> >
> > Cc: Jason Wessel <jason.wessel@windriver.com>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: kgdb-bugreport@lists.sourceforge.net
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  kernel/debug/kdb/kdb_main.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> I kinda doubt anyone would really care if we just switched kdb to just
> the old "%ptT". Probably no machines are parsing this string.

Formally it's an ABI.

> ...but in any case, now that the nifty new format is there we might as
> well use it. Thus:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


