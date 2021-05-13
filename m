Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C753AC43460
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 09:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AFE56143A
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 09:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbhEMJfe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 May 2021 05:35:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:48810 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230463AbhEMJf3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 May 2021 05:35:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1620898459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bOeXjgffhRk4ROYar2MNv8Jtg7kJ41kJ+qOqxZ43DeA=;
        b=JldI/5nRDymnQ0GD1tOj3C0xjFauFlRVsMq7TmtJAemWoVVsiaetI55P07F0ZtkXSTwqLp
        bYhVznRykaMlcfnF0XK5Dn/J/UlFgc2DRdxfnLReWlZIkgq7pVSzVhgV+TiQTkzz6j6td4
        SvRnqkcCxcQxm6oV+cuTFNRJC42t+YQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BD533AED6;
        Thu, 13 May 2021 09:34:18 +0000 (UTC)
Date:   Thu, 13 May 2021 11:34:17 +0200
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
Subject: Re: [PATCH v2 1/4] lib/vsprintf: Allow to override ISO 8601 date and
 time separator
Message-ID: <YJzymZ7m3R1ELjGD@alley>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue 2021-05-11 18:39:55, Andy Shevchenko wrote:
> ISO 8601 defines 'T' as a separator between date and time. Though,
> some ABIs use time and date with ' ' (space) separator instead.
> 
> Add a flavour to the %pt specifier to override default separator.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am going to queue the entire patchset for 5.14 via the printk tree
the following week unless anyone complains in the meantime.

Best Regards,
Petr
