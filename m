Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5807C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 14:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82619613F7
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 14:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhEKORR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 10:17:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:58600 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231753AbhEKORO (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 10:17:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1620742566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1ove9wdw6r4iRHmo5g2yf2LcNNnIGLL9LU3ZkdcjuVc=;
        b=aHvLzZWIvsJk1KMLjdyNkEl8fXIYI5sftWVx1O7AA6S/iM87WBaV6ilz6N02Tp7slpyKxk
        aWeZ9QgSIV0pOH2fYyPdmmgugb4RmMECxMagF9xTGA/EcSXVvRv3T5A6govBKbm5qdo7eB
        XvolUoxUH7M50DZ6xJdMrgZtnvdpjHQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 41DEEAF80;
        Tue, 11 May 2021 14:16:06 +0000 (UTC)
Date:   Tue, 11 May 2021 16:16:05 +0200
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
Subject: Re: [PATCH v1 2/4] kdb: Switch to use %ptTs
Message-ID: <YJqRpe4wiAflzkus@alley>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon 2021-05-10 18:04:11, Andy Shevchenko wrote:
> Use %ptTs instead of open-coded variant to print contents
> of time64_t type in human readable form.
> 
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
