Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7635C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 14:43:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DDD760F58
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 14:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241341AbhJHOpS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 10:45:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230350AbhJHOpR (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 8 Oct 2021 10:45:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF5AE61038;
        Fri,  8 Oct 2021 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633704201;
        bh=ydkNMFwowHjqi1EPLN1rd87HIVXYxcPIVVc2jN+WelI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sNI4J222L/76hrc8WAU6OX1WLX/H6iuW6mqHU1udywVP+VunfaO+qQwTE/sax4OK9
         Kay4ysKaZqyM40I45Seut3Q1wWWv8RDq3+rwuvpe7N4OaiHJ7M6FK7WSycslQ0YGfi
         QpG3oC71ovrShU0JNu/EQ+Sivy6gKBXncIzOrG43AJVLAIajmiIaJBabDPlu2xLe3r
         8IVC5vy3/rEL4R1iGjFBox+D12RXAOoKJku0CVRrwI1DqAGts+Y1nk0e59bEYuwUXY
         vGfpjqB4yUwMGgo6/lEV4Qq/J/fhqG5Sj2Fmzgi3HFiVswd4DHWy9vyaDPmi2eSCH9
         dhJYgvoqpWSmA==
Received: by mail-wr1-f54.google.com with SMTP id e12so30574328wra.4;
        Fri, 08 Oct 2021 07:43:21 -0700 (PDT)
X-Gm-Message-State: AOAM53222Z3F3DUWSr6TqzpZqDx9z9CjNbf3cjE5Oq0GcpXcM8jhK8hZ
        Fl+0bCBySj+d3LAb9gxEGY/wgW3KiT/qlsHSvo4=
X-Google-Smtp-Source: ABdhPJz1vUdU73k6INDWOLvIDoXTjyqdbXvtukzvyrFTaw7jdT5bcmej8noCbVc0zE+ywr4rL97mQG2c+gmZH/oJGDA=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr4601118wrc.71.1633704200233;
 Fri, 08 Oct 2021 07:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210927124148.1415359-1-arnd@kernel.org> <YV84OJWGqd3zGSfJ@orome.fritz.box>
In-Reply-To: <YV84OJWGqd3zGSfJ@orome.fritz.box>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 8 Oct 2021 16:43:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1x3SCk-dY42oNjzv+dVEiYvq4k=BiiM30Q_GiWMFr3iA@mail.gmail.com>
Message-ID: <CAK8P3a1x3SCk-dY42oNjzv+dVEiYvq4k=BiiM30Q_GiWMFr3iA@mail.gmail.com>
Subject: Re: [PATCH] [RESEND] firmware: tegra: reduce stack usage
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 7, 2021 at 8:11 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Sep 27, 2021 at 02:41:40PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Building the bpmp-debugfs driver for Arm results in a warning for stack usage:
> >
> > drivers/firmware/tegra/bpmp-debugfs.c:321:16: error: stack frame size of 1224 bytes in function 'bpmp_debug_store' [-Werror,-Wframe-larger-than=]
> > static ssize_t bpmp_debug_store(struct file *file, const char __user *buf,
> >
> > It should be possible to rearrange the code to not require two separate
> > buffers for the file name, but the easiest workaround is to use dynamic
> > allocation.
> >
> > Fixes: 5e37b9c137ee ("firmware: tegra: Add support for in-band debug")
> > Link: https://lore.kernel.org/all/20201204193714.3134651-1-arnd@kernel.org/
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > I sent this one in 2020 but got no reply. It still appears to be
> > required, please have a look.
> > ---
> >  drivers/firmware/tegra/bpmp-debugfs.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
>
> If this is not a problem on 64-bit ARM, then perhaps we should add that
> as a dependency. BPMP is only available in Tegra210 and later, all of
> which are 64-bit.
>
> But dynamic allocation also doesn't sound that bad. This is debugfs
> support, after all, so shouldn't be in any fast path.

Right, it stays below the warning threshold on 64-bit kernels, but using this
much stack is still a bad idea, so fixing it in the driver seems better than
hiding it in Kconfig.

> > diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
> > index 3e9fa4b54358..f6888cee83ee 100644
> > --- a/drivers/firmware/tegra/bpmp-debugfs.c
> > +++ b/drivers/firmware/tegra/bpmp-debugfs.c
> > @@ -74,28 +74,34 @@ static void seqbuf_seek(struct seqbuf *seqbuf, ssize_t offset)
> >  static const char *get_filename(struct tegra_bpmp *bpmp,
> >                               const struct file *file, char *buf, int size)
> >  {
> > -     char root_path_buf[512];
> > +     char *root_path_buf;
> >       const char *root_path;
> > -     const char *filename;
> > +     const char *filename = NULL;
> >       size_t root_len;
> >
> > +     root_path_buf = kzalloc(512, GFP_KERNEL);
> > +     if (!root_path_buf)
> > +             goto out;
> > +
> >       root_path = dentry_path(bpmp->debugfs_mirror, root_path_buf,
> >                               sizeof(root_path_buf));
> >       if (IS_ERR(root_path))
> > -             return NULL;
> > +             goto out;
> >
> >       root_len = strlen(root_path);
> >
> >       filename = dentry_path(file->f_path.dentry, buf, size);
> >       if (IS_ERR(filename))
> > -             return NULL;
> > +             goto out;
>
> Shouldn't this and...
>
> >       if (strlen(filename) < root_len ||
> >                       strncmp(filename, root_path, root_len))
> > -             return NULL;
> > +             goto out;
>
> this reset filename to NULL? All callers check for !filename as their
> error condition.
>
> I can fix that up as I apply this, but perhaps shout if you did this on
> purpose and it needs to stay this way.

Indeed, you are absolutely correct. Thanks for finding the bug
and offering to fix it.

     Arnd
