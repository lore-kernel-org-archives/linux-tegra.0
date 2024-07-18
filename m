Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DEB64A98
	for <linux-tegra@vger.kernel.org>; Thu, 18 Jul 2024 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721329549; cv=none; b=ZKKAICn/LpippxHk3Y4IKDsKECmYwijiOjwWSx2hTDD6oeF3ZUlMypdTs37quqTURHP7QmsjXMQDrtebcJg8y3MCrZmz1ZP6CsTyROLgwUdUV3JYaRca/ppN2NMU58rI7IOYFViP5VJat14+B+a3zzBihy/tl9y7YxzjUtUpnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721329549; c=relaxed/simple;
	bh=LEpFXGHY09CKdjCqSNurpdIygGze9RqWT6Dpe3rXGqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFm/Sg6ehFg3+KzvXLkiJH081lQ5WBBqeFApijYO+Xb+Y3Q2Y2IGkLdTuEAr/DjydczVZNq/HTpc514ErpoJi8XTCHinBDizCcYlE8p0nWWrwP6E3gQ458W1G1Qi57Adaqh7/XJrFiqSEslshmHCiRGkVUUSPuY86D0MrnvUEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xY4Q+itR; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xY4Q+itR"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ee9b098bd5so16653801fa.0
        for <linux-tegra@vger.kernel.org>; Thu, 18 Jul 2024 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721329546; x=1721934346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beieGnkYMyeR1aFjFu8NC1zTKlJgT0GM9SMQS29saYE=;
        b=xY4Q+itRPJ6Gtn1KDIoObq2ba4QTDLs61ras+xiAKy2fNtESbBUvhh+SpyK0lZmfkZ
         +axZ2c71hba8ISYSCWHfhduIbeduGZ4IuspcqjBgTg6HFDyADeCmuYDL07Kyhk71xHQ0
         qT93JtXQ7S0ktjOnRY9U1kjnbbcteoD8QQ1MbIO7n5gSLg8B5e4N7dutxCFSldeVD3wj
         f0id/6XZRsPdsAUvaS4WwCP/u1a/QcegRVJiICnfw9iWoUk/wQ6WJoSedpTbu/HMRaG+
         3YVoTWBkSrLH7u8i8fuzHfR3lTn0LQUgkBEA+UxUGwE8Y6DnSPmQMS2g2vE1NiQpmw8d
         SMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721329546; x=1721934346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beieGnkYMyeR1aFjFu8NC1zTKlJgT0GM9SMQS29saYE=;
        b=ZAU6xo1+A4DGHGlUoQOxkfyHKVoMKSNRbnxQO8tkoeJ4bfob+E8AJn6j/OlO3D8AS5
         t3HtJ0PYIWu+drdgZ8iGKcJfnzZMmfO4lTCOyusg4l6BtoLU9Neq7KJTVtzy2rp7oev5
         onCBWu2BRpuJGTH5TaeYdtOS6P4i0/yLdD2eYw0PcxC2dyFs54AhbRrA2nbri7jFbruM
         NIVvxz2GOrsXbjX3pRHpjIocb1DhQcftJGfxQ/yLYqHRx061UCUOU35Yn7MxvsrdcsZy
         ye+t5CH53Q/oaRZUZBn7527H6/sQ1R2EUsFGdzPIM98FFnbd7tqeqKFUY3B99PR6yRA5
         VJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD0joxj3MoIRK0wqZB5igwkthW26Sk7sGsHOFuHDVLP2M7q5grnP3++dgaMBW11Jao9VJWXdtNqdjtMXmfU/G8ESb7x4JPt67KL04=
X-Gm-Message-State: AOJu0Yx7GIrHMot3sQjJu4qpu1eRxk0EEtNPpAEdaiYMNW5wI8kgSo6v
	sy1e3iNpLj6PKmKUey9aGRMhP5x7GaMhT5c2ihlUnaiOwyUlnmMh3IX15B7dp6HfZJfSgsxRcrP
	ouwyoCbCkErm2M5XoDpZ02IDUGSsIUBy6LLXNgw==
X-Google-Smtp-Source: AGHT+IGUVlI419Uq8uMTqzcmy7TKFkjT+FFh+z/2kkfsM1qDzqBSIRxHRwTuhYYGoQDDhRwTWQuYaw4MRfjnP3MtX7E=
X-Received: by 2002:a2e:908b:0:b0:2ee:d96b:83a with SMTP id
 38308e7fff4ca-2ef05c76889mr23211431fa.18.1721329545770; Thu, 18 Jul 2024
 12:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708075023.14893-1-brgl@bgdev.pl> <20240708075023.14893-4-brgl@bgdev.pl>
 <7c0140be-4325-4005-9068-7e0fc5ff344d@nvidia.com> <CAMRc=McF93F6YsQ+eT9oOe+c=2ZCQ3rBdj+-3Ruy8iO1B-syjw@mail.gmail.com>
 <CAMRc=Mc=8Sa76TOZujMMZcaF2Dc8OL_HKo=gXuj-YALaH4zKHg@mail.gmail.com>
 <6e12f5a5-8007-4ddc-a5ad-be556656af71@nvidia.com> <CAMRc=MdvsKeYEEvf2w3RxPiR=yLFXDwesiQ75JHTU-YEpkF-ZA@mail.gmail.com>
 <874f68e3-a5f4-4771-9d40-59d2efbf2693@nvidia.com> <CAMRc=MeKdg-MnO_kNkgpwbuSgL0mfAw8HveGFKFwUeNd6379bQ@mail.gmail.com>
 <5e432afa-5a00-46bd-b722-4bf8f875fc39@nvidia.com>
In-Reply-To: <5e432afa-5a00-46bd-b722-4bf8f875fc39@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 21:05:34 +0200
Message-ID: <CAMRc=McCa3qUL5Mjxn2TVUeJzqaBaDCx52z8i7hfO=tfYFGgWA@mail.gmail.com>
Subject: Re: [RESEND PATCH net-next v3 3/4] net: phy: aquantia: wait for the
 GLOBAL_CFG to start returning real values
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Brad Griffis <bgriffis@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 7:42=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 18/07/2024 15:59, Bartosz Golaszewski wrote:
>
> ...
>
> >>>>> TBH I only observed the issue on AQR115C. I don't have any other mo=
del
> >>>>> to test with. Is it fine to fix it by implementing
> >>>>> aqr115_fill_interface_modes() that would first wait for this regist=
er
> >>>>> to return non-0 and then call aqr107_fill_interface_modes()?
> >>>>
> >>>> I am doing a bit more testing. We have seen a few issues with this P=
HY
> >>>> driver and so I am wondering if we also need something similar for t=
he
> >>>> AQR113C variant too.
> >>>>
> >>>> Interestingly, the product brief for these PHYs [0] do show that bot=
h
> >>>> the AQR113C and AQR115C both support 10M. So I wonder if it is our
> >>>> ethernet controller that is not supporting 10M? I will check on this=
 too.
> >>>>
> >>>
> >>> Oh you have an 113c? I didn't get this. Yeah, weird, all docs say it
> >>> should support 10M. In fact all AQR PHYs should hence my initial
> >>> change.
> >>
> >>
> >> Yes we have an AQR113C. I agree it should support this, but for whatev=
er
> >> reason this is not advertised. I do see that 10M is advertised as
> >> supported by the network ...
> >>
> >>    Link partner advertised link modes:  10baseT/Half 10baseT/Full
> >>                                         100baseT/Half 100baseT/Full
> >>                                         1000baseT/Full
> >>
> >> My PC that is on the same network supports 10M, but just not this Tegr=
a
> >> device. I am checking to see if this is expected for this device.
> >>
> >
> > I sent a patch for you to test. I think that even if it doesn't fully
> > fix the issue you're observing, it's worth picking it up as it reduces
> > the impact of the workaround I introduced.
>
>
> Thanks! I will test this tonight.
>
> > I'll be off next week so I'm sending it quickly with the hope it will b=
e useful.
>
>
> OK thanks for letting me know.
>
> Another thought I had, which is also quite timely, is that I have
> recently been testing a patch [0] as I found that this actually resolves
> an issue where we occasionally see our device fail to get an IP address.
>
> This was sent out over a year ago and sadly we failed to follow up :-(
>
> Russell was concerned if this would make the function that was being
> changed fail if it did not have the link (if I am understanding the
> comments correctly). However, looking at the code now, I see that the
> aqr107_read_status() function checks if '!phydev->link' before we poll
> the TX ready status, and so I am wondering if this change is OK? From my
> testing it does work. I would be interested to know if this may also
> resolve your issue?
>
> With this change [0] I have been able to do 500 boots on our board and
> verify that the ethernet controller is able to get an IP address every
> time. Without this change it would fail to get an IP address anywhere
> from 1-100 boots typically.
>
> I will test your patch in the same way, but I am wondering if both are
> trying to address the same sort of issue?
>

The patch you linked does not fix the suspend/resume either. :(

Bartosz

> Cheers
> Jon
>
> [0]
> https://lore.kernel.org/linux-tegra/20230628124326.55732-3-ruppala@nvidia=
.com/#t
>
> --
> nvpublic
