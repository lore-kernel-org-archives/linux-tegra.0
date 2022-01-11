Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340A8C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 11 Jan 2022 10:21:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237688AbiAKKVh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 Jan 2022 05:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233911AbiAKKVh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 Jan 2022 05:21:37 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5F0C061748
        for <linux-tegra@vger.kernel.org>; Tue, 11 Jan 2022 02:21:37 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id f17so15555560qtf.8
        for <linux-tegra@vger.kernel.org>; Tue, 11 Jan 2022 02:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sYa1AOMbwuEU5EoeFlC3BWCMkWWYeKQ6MzYHnQnQ7eE=;
        b=ADWJF9NlN1riYAttU3zhO5neGE8WbLaCIvok+V9lSGE0piCV0prLf7+bn5z3SMJ+K2
         IHjlTQb93qCePszMBjx5pEpzCajoEv+8wY/FNe7qfccpCPzTFxdbklOP+qumxiq3L1VW
         uvvuDmP/W53sjpnR37YNLy9ZrfEewxiMn66a6GIGHegB21ctGhTK2tDmxwbGvnmSw9/v
         8alfe6uTMOwU9BspizOMNMgQf2OJTzu3cSUTcyfUoMNWfA1+iF3KtNcaFy7lt9GhxsvP
         0j9w3a1jnioAk8FlLcANFsacbWLO6Rmskg7IDKIptjcHfyUiLwVI0B+zdeGDR7Qjk+8b
         poWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYa1AOMbwuEU5EoeFlC3BWCMkWWYeKQ6MzYHnQnQ7eE=;
        b=EWWqAQfoCkX7pMMA9a4bYRoIEzH4mCO3knadM7d8Q9A8l++7Sru84jzZzEtEXQSvCN
         KAXFa5olXMPDYPxUQmyLcq8Swuj5qUM0aAvhewDmC/9UwNNp+OE4APrz6xs9lisqnCY1
         fgjlDaxxngxyG75MCPks6oibbb/SI0UJdJZNCZtT0UTBd8z3rw9WSTiE5O57UtqnuCqM
         zTGg0g4Ng2DW/9C3i/CLgwKeWIdAWcJqUE8URPQ3jWUsojDCylX+oIbfbENNwkZf19Qm
         k+zlj8GulNaIKyf/DWSBfdGCq11My/oPqkLDcGIjxXYdQQWWTpy0JCOfketJmo35moBU
         sgFA==
X-Gm-Message-State: AOAM531YWNuwUTrcp2O8R872l6RRoY85kqq4tCmvfXm69+EbvpIegnl+
        Cuo0XHfsPcGuYJeWwJeYwsY0UtHJcU/qB++q2bna+g==
X-Google-Smtp-Source: ABdhPJzbbUNfgyjXmi4t4BA1QOJPl5KiyFfbLF2N8k+Y03nyY+75s+ZulSA2IoVUQkNdry1B9vDzlMJWaMglFWDoSCo=
X-Received: by 2002:a05:622a:5d2:: with SMTP id d18mr3059764qtb.154.1641896496162;
 Tue, 11 Jan 2022 02:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20211215104318.18866-1-tzimmermann@suse.de> <20211215104318.18866-4-tzimmermann@suse.de>
 <87pmpy3za7.fsf@intel.com> <2165cfb8-c9c6-1aca-b492-587a8e07eb9f@suse.de>
In-Reply-To: <2165cfb8-c9c6-1aca-b492-587a8e07eb9f@suse.de>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Tue, 11 Jan 2022 11:21:25 +0100
Message-ID: <CABxcv=nnyfULvog9z=nMduDK0iT1ZwkxYhdKs3xW88St6C00pw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/dp: Move DisplayPort helpers into separate
 helper module
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Dec 15, 2021 at 12:12 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 15.12.21 um 12:04 schrieb Jani Nikula:
> > On Wed, 15 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>      * move DP helper code into dp/ (Jani)
> >
> > I suggested adding the subdirectory, but I'm going to bikeshed the name,
> > which I didn't suggest.
> >
> > $ find drivers/gpu/drm -mindepth 1 -maxdepth 1 -type d | wc -l
> > 68
> >
> > Assuming we move more of the drm modules to subdirectories, how are they
> > going to stand out from drivers?
> >
> > I suggested drm_dp, which I understand results in tautology, but hey,
> > all the filenames under drm/ also have drm_*.[ch]. And I find that very
> > useful for git greps and other code archeology. With just the dp name,
> > you'd have to know and list all the drm subdirectories when looking up
> > stuff that's part of drm but not drivers.
>
> I think we have enough filename prefixes already. drm/drm_dp/drm_dp_ is
> just ridiculous.
>

Maybe what can be done is to just add a drivers/gpu/drm/core
subdirectory that would contain all the DRM core code ?

Then the dp helpers could be moved to drivers/gpu/drm/core/dp/drm_dp.c
for example. This would also make easy to differentiate the drm
modules from the drivers with just:

$ find drivers/gpu/drm -mindepth 1 -maxdepth 1 -type d -not -name core

Best regards,
Javier
