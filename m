Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90E4C433ED
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 12:49:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A65561404
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 12:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhEMMuN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 May 2021 08:50:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:46704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231140AbhEMMuM (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 May 2021 08:50:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5905761154;
        Thu, 13 May 2021 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620910142;
        bh=HgdIHeZib83/Z6f6pPdeUSwiU8GORWLQNoCbyvVNcgk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QqB7EoJa4CcvhF8HCHcdnZ2K9lMjmXCjBboQ56AK9f5SL6WjgDN+zN+f6bzaoffT7
         BvSw3FfZCNhqnIbMcIuMMaVLeOrM9UYEpISIds0VQnR85HtvUw9Xl5Tb5Ik3kp/MJN
         R8UvQ/VH0xuASqMM+aTS5dVnuLCeHpB80bBGMCxY=
Date:   Thu, 13 May 2021 14:49:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/4] usb: host: xhci-tegra: Switch to use %ptTs
Message-ID: <YJ0gPBHHP6VkhSdb@kroah.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <20210511153958.34527-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511153958.34527-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 11, 2021 at 06:39:58PM +0300, Andy Shevchenko wrote:
> Use %ptTs instead of open coded variant to print contents
> of time64_t type in human readable form.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
