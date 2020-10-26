Return-Path: <SRS0=h/hb=EB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9367C2D0A3
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 16:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C03D2222C
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603731035;
	bh=RGibMZYpM6ZDgjHk21pqkjf0q6njJaq+AvR8CSfA+HI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=C/kDW1WSLGJARLGvEYAIHfgl5deTDwIMoZDW5D5koJGYw0UdZpCW6asMjdlQKj9EX
	 0W7hUYetTbKWVegZpucV6GNKxgS7aLFJarW0k8SRRzX9ULJtz/cNCB27Cw9pAVtZZE
	 qnGutqP3rEVnN1OhTYXU4318MksfG77RNCd9KP1A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786503AbgJZQuX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 12:50:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:42780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1786382AbgJZQso (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 12:48:44 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C10F9223B0;
        Mon, 26 Oct 2020 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603730923;
        bh=RGibMZYpM6ZDgjHk21pqkjf0q6njJaq+AvR8CSfA+HI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1zX4cXGj08NNPpEI6/O7WwmdRHyw+vAq2dN4aE2zGc3BfvDaglcrmk7Ce0Yy7TAwv
         fSTxrq33cXoH6KPe6sqoyq9cx//MrhXtNSIHl5SGOtsMPPxObpoDN2MgxwXCnnJGov
         9GNhZgTYIPij/Z2nguBm0/zI6Y5zJ9KF3hkoHg00=
Received: by mail-qt1-f178.google.com with SMTP id q26so7181636qtb.5;
        Mon, 26 Oct 2020 09:48:43 -0700 (PDT)
X-Gm-Message-State: AOAM530H69tynfnMV9AB/kReDk8lBlfZHnqjqhaAgP1TITFXr2u61LDA
        EXMBzW9J/AIzVrVl7SkcPGyctLaT27MZETInEMo=
X-Google-Smtp-Source: ABdhPJzBABvE4mRQr4OqWtCOyehT6inyRFmWZZWtTB2kzQ4n4JjYM2GiYWTneGxmiX03lbUHdHwMHq9JNDxjA79dWos=
X-Received: by 2002:ac8:7cba:: with SMTP id z26mr17834534qtv.7.1603730922833;
 Mon, 26 Oct 2020 09:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201026161026.3707545-1-arnd@kernel.org> <20201026163524.GA1491649@rani.riverdale.lan>
 <CAK8P3a1+_o5HC8uU+9p_Wv9NXtXzn0Mp3s+hrpofgfR1wT1mOA@mail.gmail.com>
In-Reply-To: <CAK8P3a1+_o5HC8uU+9p_Wv9NXtXzn0Mp3s+hrpofgfR1wT1mOA@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 26 Oct 2020 17:48:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3W961sSD8Xa0-gnOvzEcjHw+m6tTb-a_tJKr9JuO3SEQ@mail.gmail.com>
Message-ID: <CAK8P3a3W961sSD8Xa0-gnOvzEcjHw+m6tTb-a_tJKr9JuO3SEQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: tegra: fix strncpy()/strncat() confusion
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 26, 2020 at 5:40 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Mon, Oct 26, 2020 at 5:35 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > > diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
> > > index c1bbba9ee93a..9ec20ddc9a6b 100644
> > > --- a/drivers/firmware/tegra/bpmp-debugfs.c
> > > +++ b/drivers/firmware/tegra/bpmp-debugfs.c
> > > @@ -412,16 +412,12 @@ static int bpmp_populate_debugfs_inband(struct tegra_bpmp *bpmp,
> > >                               goto out;
> > >                       }
> > >
> > > -                     len = strlen(ppath) + strlen(name) + 1;
> > > +                     len = snprintf("%s%s/", pathlen, ppath, name);
> >
> > Didn't you get any warnings with this? It should be
> >                         len = snprintf(pathbuf, pathlen, "%s%s/", ppath, name);
> > right?
> >
>
> Eek, I did get a warning about a different issue in that one-line change and
> fixed it up in the wrong way without testing again. Sorry about that.

Actually it turns out that gcc did not warn about my broken version.
The argument types are (roughly) correct and as the third argument
is not a constant string it could not verify the format string. Maybe it
should have complained about the constant string used as an output,
but it doesn't seem to care about that.

       Arnd
