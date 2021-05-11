Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE33C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 00:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A6A61613
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 00:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhEKAHF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 20:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhEKAHF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 20:07:05 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B25C061574
        for <linux-tegra@vger.kernel.org>; Mon, 10 May 2021 17:05:59 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 5so5372068qvk.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 May 2021 17:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=;
        b=KFj5l6zhdrS0fLCWMGjmr/xO4BlTFtZoz3C0X6f4yXPAPd4QFYCKQ6VCRUB/RhrcYc
         /aNljSGJlQqpYw9kb4Ei54tqu7LZbNffzPVR359jRbFKseto3PQlwou2i3Frh18gwxLZ
         83EJdcrxGqEoNBrlRvGIOn9J8VC7CuWrNZTlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=;
        b=bXJxQBD1YK7pxF9rAYNQEV6gi1GjWzBNPesqjnyPyvYjKrMpJfXuGeKiupuHM42kbL
         IIJ8j6G9+4IGth9DwFBv34O6Kg0BqthkbmT5NRQlOJjN5Gt6Mn4SxaGz0wDMlJ34pzoj
         ZJoaPBjOV6ZrXfX/TQh9LfNp9RvAOhsws9+QQlYpSD+tUsE8L7kAXdjeO7iMDFsZyTbi
         cpqGWap2bcWf6WlxDxnjHFvVrtxMu7bS8oiuSTS9I1MgKxyC6iK9nS3F5BVXDBvxJNx3
         mCQXUP36TFHQ3lZ0wNI37jzBoizuS1iuhkKNYhumo9Gyb7US0Evu16X1WjGiynizNwAr
         U+Ew==
X-Gm-Message-State: AOAM533VgXZ4BGIFJ2RejyQR5S777Q7OUINULdgw72ZwgkEezQ4r5WEB
        JuCcf8WOGZO528BEjOJfYTY7MWYAbf608w==
X-Google-Smtp-Source: ABdhPJyCkYoK7/7wDxTBi8VGEQjXjWHThlXQYRisAxwCQKq3aOSJh9SWRw+HvJQQzC+6HZUodrvKag==
X-Received: by 2002:a0c:e749:: with SMTP id g9mr26215443qvn.13.1620691559204;
        Mon, 10 May 2021 17:05:59 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id r186sm12948014qke.97.2021.05.10.17.05.58
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 17:05:59 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id h202so23966127ybg.11
        for <linux-tegra@vger.kernel.org>; Mon, 10 May 2021 17:05:58 -0700 (PDT)
X-Received: by 2002:a5b:8cc:: with SMTP id w12mr37539122ybq.32.1620691558469;
 Mon, 10 May 2021 17:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com> <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 10 May 2021 17:05:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Message-ID: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] kdb: Switch to use %ptTs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Mon, May 10, 2021 at 8:04 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use %ptTs instead of open-coded variant to print contents
> of time64_t type in human readable form.
>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

I kinda doubt anyone would really care if we just switched kdb to just
the old "%ptT". Probably no machines are parsing this string.

...but in any case, now that the nifty new format is there we might as
well use it. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
