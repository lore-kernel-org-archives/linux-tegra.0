Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26765C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC63620757
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkWKt+Gk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgJEOW5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgJEOWy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 10:22:54 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19962C0613CE;
        Mon,  5 Oct 2020 07:22:54 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l17so9523036edq.12;
        Mon, 05 Oct 2020 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CdKoB5teJzxZL7jWfdQ4g7D1MnR9iAi8iKm+mfkmSuw=;
        b=FkWKt+GkmOtkeJIRlY4UmBa6D+ctgcppq5K4SeVo6xTYjpT54L1wz2oMsiNJ77AoNH
         OiLnwfk02KHpV1yGKaeoEhsLcLfNJ4K5g9Ci5OUxYjntIIDirWnX6t5UPj4+tX37ilTi
         G9OrINPPbN21xHGCBGqjEinSBsQyLmsktWwt5cOrK1eUaJ5V19qhFQC3DiiJqs/QaB5E
         MhWKLnY6TdQ+hhHUzCQFW9YtTyeo5wxDYONseX3l2IkIqZDlZWRF/Cgycd5ZG8+OlgFq
         sMiGmCtkJbVyjpi8lZWuN73GDSImbWie7N0LnWUxpG0qWR7c/Cgp4QtIJOerorOWxEyf
         16Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CdKoB5teJzxZL7jWfdQ4g7D1MnR9iAi8iKm+mfkmSuw=;
        b=LZgyz9gjkbEXjhvHk2sKawxGjCMyY/K36Tc6xc7Vso2YG9b2rLUeiQTz6vaAReSPLH
         xQ1AsbmajsiF55vfeAByZ7/ywxegiT8lf6YYceheBhm4LsSo6+D7unyc3gRRfmqNhkB0
         b374YzCOAqYMmotsr1Q5hRl43Sd5VZyI0Ukrd4p6jfADR0GRtuUHcIx/Ozxn4rb5Bdfg
         3bTGl50LZqoQd/lSE+ze+XUPXSTUEYTnbq/MSEk/SiF9f2hdBCswfW81+Pp+/8pC+ZpH
         HrEp0z10242X3CUaXk8H9cCSM+IGtgL+VP6UVH4mek+a2awZt8fgpuuzX76yHDXUbN8l
         qrgg==
X-Gm-Message-State: AOAM530fArqAGznWNwAwbzkzl4mY9VkG2B9UGNhZcyJQP3m0T48j5Nl6
        R7S1/BekgN1IwRjQKsGSP+LPfDUnKwLrwcsPY6P1viPWj5bCGg==
X-Google-Smtp-Source: ABdhPJwN9B1916yhWPM3OwElMYG9R/EG1uHsP62ezdKCjmVQE+mVetP9RE9ip8PLM9leJoDoAK2UamKruFUiqn+k69I=
X-Received: by 2002:a50:fe82:: with SMTP id d2mr17028990edt.86.1601907772599;
 Mon, 05 Oct 2020 07:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201004133114.845230-1-pgwipeout@gmail.com> <20201004133114.845230-2-pgwipeout@gmail.com>
 <b3b99578-73c8-17e1-81ff-4b3fdf1b58f3@gmail.com>
In-Reply-To: <b3b99578-73c8-17e1-81ff-4b3fdf1b58f3@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 5 Oct 2020 10:22:40 -0400
Message-ID: <CAMdYzYoKYzTsdWd=99LbwJ4-dG1WOJLo=hxsu_h=Hwrtybiw9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: tegra: Add device-tree for Ouya
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 5, 2020 at 10:02 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 04.10.2020 16:31, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +     thermal-zones {
> > +             cpu_thermal: cpu-thermal {
> > +                     polling-delay =3D <5000>;
> > +                     polling-delay-passive =3D <5000>;
> > +
> > +                     thermal-sensors =3D <&cpu_temp 1>;
> > +
> > +                     trips {
> > +                             cpu_alert0: cpu-alert0 {
> > +                                     temperature =3D <50000>;
> > +                                     hysteresis =3D <10000>;
>
> Hello, Peter!
>
> A day ago I was tuning thermal zones for Nexus 7 because found that the
> current variant is a bit too unpractical. In particular temperature
> hysteresis should be small, otherwise cpufreq could get throttled
> enormously to the point that device becomes unusable. This is an
> active-cooling zone, but it looks to me that hysteresis is a bit too
> high and should make Ouya much noisier than it could be.
>
> I suggest to try to set hysteresis to 0.2C here, i.e. hysteresis =3D <200=
>.
>
> I also suggest to bump the temperature threshold to 55C in order to
> ignore temporal temperature spikes because CPU temp should be about 40C
> during idle and then it may raise quickly for a brief moments during
> average usage.

Good Morning,

The Ouya has a rather large heatsink with poor conductivity and a
single stage fan.
The fan is not terribly loud, as it runs at a rather low rpm.
The temperature at the cpu tends to be much higher than observed at
the heatsink.
I've found that a low hysteresis value leads to a situation where the
fan is constantly toggling on and off.
I actually burned out the power transistor driving the fan on my first
Ouya this way.
The high hysteresis value provides a good balance of fan on/off time
under most loads.
The temperature threshold was chosen for this as well.

>
> > +                                     type =3D "active";
> > +                             };
> > +                             cpu_alert1: cpu-alert1 {
> > +                                     temperature =3D <70000>;
> > +                                     hysteresis =3D <5000>;
> > +                                     type =3D "passive";
> > +                             };
>
> And here to 0.2C as well.

This value was chosen to protect the CPU in case of fan failure.
Again, with the large heatsink and poor conductivity we need to
maintain throttling for longer.
Otherwise the cpu temp will overshoot and risk thermal shutdown before
throttling can prevent it.

>
> > +                             cpu_crit: cpu-crit {
> > +                                     temperature =3D <90000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "critical";
> > +                             };
>
> The critical zone perhaps should be fine as-is.
