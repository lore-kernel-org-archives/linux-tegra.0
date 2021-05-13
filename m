Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD055C433ED
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 12:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7918E61186
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 12:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhEMMHo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 May 2021 08:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233638AbhEMMHd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 May 2021 08:07:33 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E77C061763
        for <linux-tegra@vger.kernel.org>; Thu, 13 May 2021 05:06:23 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id h127so21517256pfe.9
        for <linux-tegra@vger.kernel.org>; Thu, 13 May 2021 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=;
        b=JSy1a6GCJq2YyfpTNSfJS8qqrILCcxtDE5ElH2K2/E24R3FWXdOQ02VULX9h2Pj+I+
         NtrEoxuFD2ShSH71n+IAsSvw74CstZseJ176nvisB5OpUB7L1E7Ary5a0jtBHXhivVKF
         kD+16nkHtwzi2iAoAEmeBpD4ePQ/xbCiBUASU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=;
        b=e2DQaHYYCjORkuhQDjPVkv8cvhJpnRz+VFjHpNPOzYAmiH9PKSO6KNdUKkDo8xntI2
         Qu6UhAXk6lGbiNGu2InIhlOB8DlpaqIUlhAs0SrOuCJlrrjHmXdnKL85DggGLtKJvSIy
         YC8ffOxSUsvo6gQwv8BKEFQcpQvRkkBpHr6ShsVrvB8T3ZDcVymWRf1cuiv1uY3GVVhn
         oyeiWuDRlulkzgXGj7DbO4KD/SMNd4gwzUTOP7A6R3ZMrJX2+bcdnUgAbbjt0y3riTwR
         PMedZlzMOAIKBOlNs77v8jirn+242m8Hrc95vGst9Ao9ftfmxWlYDNqn8f1RmlcK4dvF
         iWGw==
X-Gm-Message-State: AOAM531NBfmSPkZEXkETHxzmPOHZnZCIcMhPwma2xqP6FBuWkQSQlhQM
        Gt3uCR6tt//mHtiTAqkPwgjQCQ==
X-Google-Smtp-Source: ABdhPJwfllyYOMfe4rEresq4fLk8nKv6sDRzFnk94yymmf2sl08gP8XdMvFcQyRYMXfrGcMKqNEoqQ==
X-Received: by 2002:a17:90a:2d8e:: with SMTP id p14mr4752238pjd.121.1620907583031;
        Thu, 13 May 2021 05:06:23 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:161f:cde2:c883:ef91])
        by smtp.gmail.com with ESMTPSA id f14sm5112636pjj.53.2021.05.13.05.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 05:06:22 -0700 (PDT)
Date:   Thu, 13 May 2021 21:06:14 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        JC Kuo <jckuo@nvidia.com>, Joe Perches <joe@perches.com>,
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
Message-ID: <YJ0WNuFr7JmSrN62@google.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <YJzymZ7m3R1ELjGD@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJzymZ7m3R1ELjGD@alley>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On (21/05/13 11:34), Petr Mladek wrote:
> On Tue 2021-05-11 18:39:55, Andy Shevchenko wrote:
> > ISO 8601 defines 'T' as a separator between date and time. Though,
> > some ABIs use time and date with ' ' (space) separator instead.
> > 
> > Add a flavour to the %pt specifier to override default separator.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> I am going to queue the entire patchset for 5.14 via the printk tree
> the following week unless anyone complains in the meantime.

Looks good to me

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
