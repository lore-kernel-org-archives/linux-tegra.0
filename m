Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25440C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 23:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D77CF23B51
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 23:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbhAVXUl convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 18:20:41 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:44615 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbhAVXUg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 18:20:36 -0500
Received: by mail-wr1-f42.google.com with SMTP id d16so5917369wro.11;
        Fri, 22 Jan 2021 15:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MOvI7mYKXT9PCD0Z4zY1t63wved2jlUYxuWT8ZQLYcI=;
        b=DPZDYfN4GEcNBjwg2yqpsY0NvJoxfogAPTJxWzkVYVUtkWoZTU8vmKoVxYqCtCh3g4
         Iumg8d2+qEbUXXrWXCFThFAho6blIUprpSMQjkVPcxify85jlLZjN0SGBS5zotlPUd8m
         4glREQTFAZ7rflaAz2pbfNilqNS8/C0r/lOjcbNhtJV6+8CyUKGYuld5SxMb1uTD78dF
         +3psvLqnA/1UnABexGVIKK/KJ2UrG0FOnc5yrewCvHJ55po29ICdInh++xeTY1ocX+zV
         caaERLWxza2ptSMwUvFTqWuq0c2wR+gLelJbBTHlXSBCwiAZtSvDuVkJVWVWN9Rs9sgf
         VHxQ==
X-Gm-Message-State: AOAM5320FDp1GSRUl3QqOkamLB6v0klBq9vkwKPX32pRFxue/EkeIbMU
        z9nioQ1dqHty6pnMd4E3bpI=
X-Google-Smtp-Source: ABdhPJyJdiEEYQhlsNZjc9NNHN/p9Y9xMjWGbin0H3nSt8NfCiqHxmUGH4pFakDZdejaDpQbYc7ang==
X-Received: by 2002:adf:9e47:: with SMTP id v7mr6518473wre.185.1611357592872;
        Fri, 22 Jan 2021 15:19:52 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id d5sm11535245wrs.21.2021.01.22.15.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 15:19:51 -0800 (PST)
Date:   Sat, 23 Jan 2021 00:19:50 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] memory: tegra: Check whether reset is already asserted
Message-ID: <20210122231950.znm7s3zukn63q46m@kozik-lap>
References: <20210119235210.13006-1-digetx@gmail.com>
 <20210122214005.bfsznpaga2rhl3ow@kozik-lap>
 <20cc8401-1934-6e4f-8e66-3216b86681fa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20cc8401-1934-6e4f-8e66-3216b86681fa@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jan 23, 2021 at 12:58:12AM +0300, Dmitry Osipenko wrote:
> 23.01.2021 00:40, Krzysztof Kozlowski пишет:
> > On Wed, Jan 20, 2021 at 02:52:10AM +0300, Dmitry Osipenko wrote:
> >> Check whether memory client reset is already asserted in order to prevent
> >> DMA-flush error on trying to re-assert an already asserted reset.
> >>
> >> This becomes a problem once PMC GENPD is enabled to use memory resets
> >> since GENPD will get a error and fail to toggle power domain. PMC GENPDs
> >> can't be toggled safely without holding memory reset on Tegra and we're
> >> about to fix this.
> >>
> >> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> >> Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
> > 
> > Don't add your own Tested-by. Author has to test it.  However this is a
> > v1 and already three other people added tests. Where are the emails?
> 
> The test results were given on #tegra irc.
> 
> Author doesn't have to test, from time to time I'm helping people who
> can't make a patch with fixing obvious bugs for the h/w that I don't
> have access to.

By default, author's patches are assumed to be tested, otherwise we
would be putting own Tested-by in most of the cases (ideally: in all).
Just because you do not see author's Tested-by everywhere it does not
mean that author did not test it...

Testing is also a requirement:
https://elixir.bootlin.com/linux/latest/source/Documentation/process/5.Posting.rst#L35

Therefore if your non-trivial patches are not tested, please also
mention it with RFT or after '---'.

> 
> Anyways, I'll make v2 with myself removed if you prefer that, thanks.

I applied it without your tested-by. If the tested platform is anyhow
relevant, just mention it in the commit msg.

Best regards,
Krzysztof

