Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FAEE9271E
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Oct 2023 16:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233917AbjJEQP7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241474AbjJEQO2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Oct 2023 12:14:28 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392E97282
        for <linux-tegra@vger.kernel.org>; Wed,  4 Oct 2023 23:47:13 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-49d0d90a7ddso279805e0c.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Oct 2023 23:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696488432; x=1697093232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jW4B9vB7AjqRcLvugm3rYUGuuH5juE2C5rgpEuWVrM=;
        b=Oyv1NIExlmlqaXkDA5spZHt7RK5i5+6u4yk3lR9xQCeSXDZtWfgBzra3Ej0Qx4tQfL
         /KYnWBDoxco040FHTRPzvp3i7iaGJzKTwiVRLTTI74GBTq+gx2KMIAwjkmD6SlO7kq0u
         dMh+aN5Ez3z85/5wTSyxgwjnufh1RBu7M/6iOAIhvsRs9o04kU9NZZGcJztuzBMC2sxF
         +MfrZtNjtirxkBC/PBDo0To2wQORaIFCYraM5OkKpkdU0MSlG+MjCsZLshKTidRsz1ME
         5t9QXFTkWQmgReKP0nXwUPaDSggcSo/8vzULbbSKcKbvYdDU4+YEKm2FOlviLEDrZZx2
         BjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696488432; x=1697093232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jW4B9vB7AjqRcLvugm3rYUGuuH5juE2C5rgpEuWVrM=;
        b=OM2c/qau1axiktzWu8PJj/ckZtdntdL4WkR6WABdtyvofG8ShHAEJir2QCT8YtSMeG
         bLxJ4+fU1G1jzRyJVg7L9ARe2Ukd/8LVv9oDi21smOhMWxPdXoecAtKdlqgdfHjH7T1/
         zwOnGeMPjsPyBRkSiMpGVjYGC9X+zeMSgJ7YayprCw4AZfCBLFfH658mY8ETtgVJKbJi
         Sn0j8rlozLG6RguLKqsBRJ7RF2FbCrmtHv+qDMmbdVsjAhAp0kcx2Cmh8HEib8wMFW7D
         DY8NEGXhtV6Cj4cdpt+Mr9JZuYeazVOzcoMExtMIQc9C3nzlGDP7sZK4GH+YSHj/8aas
         MfUw==
X-Gm-Message-State: AOJu0YwH11fuB7mupe4O8d1rFDzc8hV1ydPI6AOfRNCApW/yNTKkO12e
        dtelZ6yJHV5SS9OANprZKDGSniN5E8nbRGg4rYxDdg==
X-Google-Smtp-Source: AGHT+IFNjDqGJnmk1DwdR80YBd34CbV4CUqePlsoUbIb8WmsHQmdMVqyYWfTXS6i9UHB3WXoJAeJK8L/e2xAWMF8p+M=
X-Received: by 2002:a05:6122:221a:b0:49a:88a9:cac6 with SMTP id
 bb26-20020a056122221a00b0049a88a9cac6mr5164584vkb.11.1696488432143; Wed, 04
 Oct 2023 23:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230911094443.14040-1-brgl@bgdev.pl> <cd4df23c-cc02-6723-e36d-34ca03409e6e@nvidia.com>
 <CAMRc=MeWXapho1bsX9Si5uSx7MWVhpT2cqrv5S+qPo51Ko=Vtg@mail.gmail.com>
 <7766de61-a046-3e17-1322-28bd7f1e61da@nvidia.com> <CAMRc=Mfbt0iUbM42zR0ZrBWgbQkctQm3LxwiFFP5dXNuQC-EqA@mail.gmail.com>
 <59ea74ba-b951-cf89-9d7f-bc7212ddb08a@nvidia.com> <CAMRc=MeuMkExMef1fsEV9pPHyshGTLJLSHpT2vjLVXgEm6CD3A@mail.gmail.com>
 <7956eb81-014e-74cf-6630-b347a0b9d919@nvidia.com>
In-Reply-To: <7956eb81-014e-74cf-6630-b347a0b9d919@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Oct 2023 08:47:01 +0200
Message-ID: <CAMRc=MfWnZUnOcFDXHTBuSY4gZPgLFMFpNMPRa4PbKfeeBvt6A@mail.gmail.com>
Subject: Re: [PATCH] hte: tegra194: improve the GPIO-related comment
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        timestamp@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 4, 2023 at 10:24=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wro=
te:
>
> On 10/4/23 3:04 AM, Bartosz Golaszewski wrote:
> > On Tue, Oct 3, 2023 at 6:42=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> =
wrote:
> >>
> >> On 10/3/23 1:58 AM, Bartosz Golaszewski wrote:
> >>> On Mon, Oct 2, 2023 at 6:27=E2=80=AFPM Dipen Patel <dipenp@nvidia.com=
> wrote:
> >>>>
> >>>> On 10/2/23 1:33 AM, Bartosz Golaszewski wrote:
> >>>>> On Fri, Sep 29, 2023 at 11:38=E2=80=AFPM Dipen Patel <dipenp@nvidia=
.com> wrote:
> >>>>>>
> >>>>>> On 9/11/23 2:44 AM, Bartosz Golaszewski wrote:
> >>>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>>>>
> >>>>>>> Using any of the GPIO interfaces using the global numberspace is
> >>>>>>> deprecated. Make it clear in the comment.
> >>>>>>>
> >>>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.or=
g>
> >>>>>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>>>> ---
> >>>>>>> This was part of a wider series but since this is independent, I'=
m sending
> >>>>>>> it separately.
> >>>>>>>
> >>>>>>>  drivers/hte/hte-tegra194.c | 13 ++++++++-----
> >>>>>>>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra19=
4.c
> >>>>>>> index 6fe6897047ac..9fd3c00ff695 100644
> >>>>>>> --- a/drivers/hte/hte-tegra194.c
> >>>>>>> +++ b/drivers/hte/hte-tegra194.c
> >>>>>>> @@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_=
chip *gc,
> >>>>>>>               return -EINVAL;
> >>>>>>>
> >>>>>>>       /*
> >>>>>>> +      * GPIO consumers can access GPIOs in two ways:
> >>>>>>>        *
> >>>>>>> -      * There are two paths GPIO consumers can take as follows:
> >>>>>>> -      * 1) The consumer (gpiolib-cdev for example) which uses GP=
IO global
> >>>>>>> -      * number which gets assigned run time.
> >>>>>>> -      * 2) The consumer passing GPIO from the DT which is assign=
ed
> >>>>>>> -      * statically for example by using TEGRA194_AON_GPIO gpio D=
T binding.
> >>>>>>> +      * 1) Using the global GPIO numberspace.
> >>>>>>> +      *
> >>>>>>> +      * This is the old, now DEPRECATED method and should not be=
 used in
> >>>>>>> +      * new code. TODO: Check if tegra is even concerned by this=
.
> >>>>>> This use case is to do namespace mapping from gpio subsystem to ht=
e. Few doubts:
> >>>>>> 1. What does deprecate mean here? Does gpio subsys not use global =
space anymore?
> >>>>>
> >>>>> It does but we don't want to expose this to external users in any w=
ay
> >>>>> anymore (and haven't to for years). This is what deprecated means.
> >>>>> Users should deal with opaque GPIO descriptors not global GPIO
> >>>>> numberspace.
> >>>>>
> >>>>>> 2. If yes, what GPIO number is set when it comes from gpiolib-cdev=
, as based on that I may have to
> >>>>>> reflect in the mapping, tegra194_aon_gpio_map for example.
> >>>>>
> >>>>> Why DO you have to use a GPIO number though? If HTE needs just a
> >>>>> number from some HTE numberspace (which in itself may be unnecessar=
y)
> >>>>> then why not just keep a local IDA for it? Do you have to know the
> >>>>> GPIOs internal numbering scheme to make it work?
> >>>>
> >>>
> >>> Dipen,
> >>>
> >>> Please set your mailer to wrap lines around at 80 characters as is
> >>> customary on the mailing list.
> >>
> >> my email client misfired, will make sure. Thanks.
> >>>
> >>>> humm, overall, I just need to know which GPIO it is, for example, GP=
IO controller X Port A GPIO number 3
> >>>> to do proper mapping.
> >>>> Continuing from above example, the hte driver gets:
> >>>> - GPIO Controller X from DT node
> >>>> - the rest details in current code gets it from [1] and [2]
> >>>>
> >>>> If there is alternate method exists, I would like to explore. I thin=
k IDA will not help in this case as ID assigned
> >>>> does not hold meaning in this context.
> >>>>
> >>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/drivers/gpio/gpiolib-cdev.c?h=3Dv6.6-rc3#n760
> >>>
> >>> Here: any reason why we have to translate the desc to the global GPIO
> >>> numberspace? Can we just pass the descriptor pointer directly to the
> >>> HTE subsystem?
> >> Sure, if from GPIO descriptor with combination of any helper APIs from
> >> the GPIO subsystem can help identify the GPIO pin, we can eliminate th=
e need
> >> to pass global number (I assume gpio desc
> >> can be only accessed/manipulated using GPIO subsystem APIs)
> >>
> >>>
> >>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/drivers/hte/hte-tegra194.c?h=3Dv6.6-rc3#n421
> >>>
> >>> I still don't understand why you need to know the GPIO base? I'm not
> >>> quite sure what the role of line_id is in this driver. Is it only to
> >>> index the array?
> >>>
> >>> Please bear with me, I don't know this subsystem very well.
> >>
> >> Sure, no problem. Let me see if I am able to elaborate:
> >>
> >> 1. Map arrays' indexes are GPIO offsets so to avoid having
> >> the extra field for the GPIO numbers.
> >>
> >> 2. The HTE driver needs to know exact GPIO to enable corresponding bit=
s
> >> in its registers. For example, hte register bit 3 would correspond to
> >> GPIO 6 of GPIO controller X. If gpio descriptor is passed here, I thin=
k
> >> I would need to do some conversions to identify the GPIO to enable
> >> corresponding register bits. In the current scheme of things,
> >> I though it was easier to identify passing the output of the desc_to_g=
pio* API.
> >>
> >> 3. Since GPIO global space is runtime, need base to calculate the offs=
et
> >> where offset does not change. So in the above example, gpio cdev would=
 pass
> >> 306 and HTE does simple conversion from the base, ie. 306 - 300 =3D 6.
> >> Now 6 will serve as pin number as map array index to find the register=
.
> >>
> >> 4. Overall, I rely on base + global number to do namespace conversion
> >> between gpio and hte subsys as far as gpio-cdev use case is concerned.
> >>
> >
> > Ok, so you *don't* need the global numbers, just controller-relative
>
> Thats correct....
>
> > offsets. This makes sense. This ties nicely into my plan for removing
> > all accesses to gpio_chip except for GPIO providers.
> >
> > Looking at the tegra dts I'm surprised that the GPIO controllers that
> > use the HTE don't take the hte_lic or hte_aon phandles as arguments.
> > How exactly do they resolve the HTE device to use for timestamping?
> gpiochip added few callbacks during hte subsystem patch series to manipul=
ate
> gpio line that needs hte. So it does not need any handle as of now for th=
e
> tegra series of gpio controllers at least.
>
> >
> > In any case, I think this commit is still correct.
> Agreed.
> >
> > Bart
> >
> >>>
> >>> Bart
> >>>
> >>>>
> >>>>>
> >>>>> Bart
> >>>>>
> >>>>>>> +      *
> >>>>>>> +      * 2) Using GPIO descriptors that can be assigned to consum=
er devices
> >>>>>>> +      * using device-tree, ACPI or lookup tables.
> >>>>>>>        *
> >>>>>>>        * The code below addresses both the consumer use cases and=
 maps into
> >>>>>>>        * HTE/GTE namespace.
> >>>>>>
> >>>>
> >>
> Reviewed-by: Dipen Patel <dipenp@nvidia.com>

I think you can just take it through your tree, GPIO does not depend
on this change in any way.

Bart
