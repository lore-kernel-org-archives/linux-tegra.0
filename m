Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3E5C433DB
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 12:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2762238E4
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 12:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbhAHMUm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jan 2021 07:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbhAHMUl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jan 2021 07:20:41 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A07AC0612F4;
        Fri,  8 Jan 2021 04:20:01 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id w1so14149350ejf.11;
        Fri, 08 Jan 2021 04:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMT5dGsMHSLpkqrgbCQ5MwkgGYzbIuBCTAWpR0U9n6c=;
        b=n1nr2iFJPn1w+0Ja3QZrUJnxHYlJys9dJUs5U992Myoh7A1dKmrBZA6HbJpCptHX1e
         VefhqYhXjgQBI5QQKz/SbHw61wAa4br6gd0Q+9YnCZis7j0El4asyOn7eKH2Wh8DMuj1
         KFP6gdpZdi7xclj9b91TOyTFIGIlMPcSPXqpjm5bGD1DgxEjJGJU8eZThibDT6iQSJpj
         wwMik0mpgBr6g2d5CgbuRswdQXOJ1ycnEk6GJ7pPPYlqW/4tMWWi68WqIFFp1BfuXkuw
         3z9lnUTQJSwlaO3jGdlOR9wbYvDedQFzb8MtxJoYo+5ESpo/UWWN2NWq9g6F3QVSWr6z
         c1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMT5dGsMHSLpkqrgbCQ5MwkgGYzbIuBCTAWpR0U9n6c=;
        b=XEJPYR++H3y0o7vP44hpFJn5I92DqxJw9ncebsbpNGpz/onrdzJ53vBq0FCXFujxWJ
         m6SVHmG9MTflKYh84C2cwp6k0YAUhu5oG5u9BRXIZuy9xpXsQTnQxAw/iXkS+9fwtW6I
         KW2Rg4ELBXI+dwobGzf7zpZf5IGm8yEeRL2I4x+bV+65NG8scpY78Mn0KMjyjpKI6t5p
         Q89eGH6CHzYb0aeyDAuchrTrFHCGb7fkv6MHix1P3Hx1gk5/2Igf5xfHuaxc6JDAP93l
         326/n9TisP0aDXh/RCjHUn9eol5XOu1LvfJCaKUW3spl6JIeRtWyDWQV5WE12YB6hxvi
         x2WQ==
X-Gm-Message-State: AOAM531p9FL7cUiFF0QIJY37PHhxUIQNgd9vuxxKzlP2V+leEoOL4hpI
        bv4X3VlBwabIVJD38djDM3AYluGWMee5Y8k7ODw=
X-Google-Smtp-Source: ABdhPJzRAJo80XQXhGAdeCbnNuTvVN6JmbxywmfM4xmGGorpYrDXJWue8z/2SCkfVT5smUpa5bvm3IdZrPo7A9ce8AU=
X-Received: by 2002:a17:906:e250:: with SMTP id gq16mr2390315ejb.382.1610108399899;
 Fri, 08 Jan 2021 04:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20201225012025.507803-1-pgwipeout@gmail.com> <20201225012025.507803-3-pgwipeout@gmail.com>
 <0c3665b2-bac6-546a-bdd4-0ab7a90adf7c@nvidia.com> <CAMdYzYraT5AXzyscN3Pa+0FWZwHFsD-4ZwbA80kNxgtn7Y1PXw@mail.gmail.com>
 <b3a3ede2-22d5-b13d-f245-7c3b40ea411a@nvidia.com> <a2c5c1d4-500b-6dad-d4ab-339154624c43@nvidia.com>
 <18f44f67-ba81-98d6-67d9-c6ddbb3c9302@nvidia.com>
In-Reply-To: <18f44f67-ba81-98d6-67d9-c6ddbb3c9302@nvidia.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 8 Jan 2021 07:19:48 -0500
Message-ID: <CAMdYzYqwL32_=b3fFKFiOoXkDxZYyHsU68LxxzPSRbgPCeh+Mw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Sameer Pujar <spujar@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohan Kumar <mkumard@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Ion Agorria <ion@agorria.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 8, 2021 at 6:33 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 08/01/2021 10:54, Jon Hunter wrote:
> >
> > On 08/01/2021 08:00, Sameer Pujar wrote:
> >
> > ...
> >
> >>>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> >>>>> Tested-by: Ion Agorria <ion@agorria.com>
> >>>>> ---
> >>>>>    sound/pci/hda/hda_tegra.c | 3 +--
> >>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> >>>>> index 70164d1428d4..f8d61e677a09 100644
> >>>>> --- a/sound/pci/hda/hda_tegra.c
> >>>>> +++ b/sound/pci/hda/hda_tegra.c
> >>>>> @@ -388,8 +388,7 @@ static int hda_tegra_first_init(struct azx
> >>>>> *chip, struct platform_device *pdev)
> >>>>>            * in powers of 2, next available ratio is 16 which can be
> >>>>>            * used as a limiting factor here.
> >>>>>            */
> >>>>> -       if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
> >>>>> -               chip->bus.core.sdo_limit = 16;
> >>>>> +       chip->bus.core.sdo_limit = 16;
> >>>> Future Tegra chips address this problem and hence cannot be enforced by
> >>>> default. May be we can have like below:
> >>>>
> >>>> if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
> >>>> chip->bus.core.sdo_limit = 16;
> >>>>
> >>> It will need to be a bit more complicated than that, since the
> >>> tegra186 and tegra210 device trees have "nvidia,tegra30-hda" as a
> >>> fallback.
> >>> Looking at the generation map, tegra30-hda can be the fallback for the
> >>> broken implementation and tegra210-hda can be the fallback for the
> >>> working implementation.
> >>> Does that work for you?
> >>
> >> As per above explanation, it is fine to apply the workaround for
> >> Tegra210/186 as well. So it simplifies things for all existing chips.
> >
> >
> > FYI ... we now have minimal support for Tegra234 in upstream that should
> > not require this. Given that the Tegra234 device-tree does not include
> > support for HDA yet, I think it is fine to apply this as-is. However,
> > once we do add support for Tegra234 HDA, then we should ensure that this
> > is not applied. So that said ...
> >
> > Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>
>
> Sorry I was chatting with Sameer offline and we think if we just switch
> the test to the following then this will take care of Tegra234 when we
> add it ...
>
>     if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
>
> Peter, would you be able to send a V2 with this?
>
> Thanks!
> Jon
>
> --
> nvpublic

Certainly, thank you all!
