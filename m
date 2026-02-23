Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D6E346A14
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771838868; cv=none; b=GHJ5p+pTW42HNpfSUqAvpIRIlygzPDsPkBM8AK5nOi7JQ0TE1Bbr1bY84yXYZRwUjGOkbNcz1OfVO7TpINYylQ7ulVGZrfeYU0cpzh2gbyp5AQtK0By/RXJamymvnW0FvygWRJjcX+2ggPrYTnth7oSTmGUKxBG/cU+vk68QYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771838868; c=relaxed/simple;
	bh=OyGFTWWAQRbhcAjRDP0+Rd6GLfLhNM1/YURdgrzC1b8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgVbuloaKQv9eVQ/Dw1gAYJD5Pf4r3cmpX4IBFlz0niLJufo8FXLAQGRjwPUgT7NHJuL5JBuQyo5iefmp2TZ9R8d0ApuZDGaBXe2PtiZoKvoVEbasv3/f8NGM3mHMeKqzVaDJ+fUuFBrp2HJO45xXibLSp+i6CBTwRtaYH0Uob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mzv8+vRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mzv8+vRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927BBC116C6
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771838867;
	bh=OyGFTWWAQRbhcAjRDP0+Rd6GLfLhNM1/YURdgrzC1b8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Mzv8+vRt5AgwSaXc0SQkB8ORQyVsexu03SzZnhyd0LnhlPuCAo/hWG6cTh1oD6LaA
	 HeyYMJmg4v4g1Iez+LUfoAZLcaWmdBPJ0tuWWt0jqzfeqFJntQay9NVzrDbJvwChE7
	 QBNFKloYi7SW02qj3fWX8HSZJHn8A/axkn8eGisoaQ/vAHvkp8kmvAXE+4Gkrv5nwY
	 xXhVnd1RWiLg+5FUx404w+bo/Ewr8PEm4rr/hvDISzSdEQLKdHxzf6KyZ5AIqftWg4
	 Ytaaw2moiUoqTdVcMqx9GMk5bzfR5q7/Ts7ISqCMD40OBfPUycfQo7m9+gQmJoBCAi
	 64d3Ua0vmChQg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-388126f79bcso34500441fa.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 01:27:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUY5z4nLKJ/hDcXh7CfQMlL0KoYIZPE9obiCPlYiT7desmLmKuJXLMyYZgGoT57o82c1rSREHt8c1qPpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhzJaaGDQmuU47+ya2HrThjnOKqCxXo2btaWyf1xG0WNmiKrsO
	CR/7z2RzgqM6cCNWVWI7i1fjn/cpeiaASY+H30hGWJshaHhgoqp8d4j3RQlz5Dj+GD/Ck10n7wa
	UfZsw66bMYGLGUpTltXOaSAShhQdBrQw=
X-Received: by 2002:a2e:a99e:0:b0:386:1ce2:11a6 with SMTP id
 38308e7fff4ca-389a5de767amr21982451fa.24.1771838865947; Mon, 23 Feb 2026
 01:27:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZnzulZBukibZUXKM@google.com> <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>
 <aY1GZQJLKAF0fsz6@google.com> <74b13dba-830b-6ea3-e5d3-95f0423fe741@gmx.de>
 <CAGb2v64BApjGy2AZsM5sJit4ZDKDreVE230kxFikBeo-SFnGzA@mail.gmail.com> <de212734-0b59-144c-7ec9-91d1b3443148@gmx.de>
In-Reply-To: <de212734-0b59-144c-7ec9-91d1b3443148@gmx.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Feb 2026 17:27:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v66a=joEGmwyoEZ6_FJQFdGqSLoVzg9DLn5=c-VpK5AJig@mail.gmail.com>
X-Gm-Features: AaiRm533zyjmIVjIQdEPqa5bOiZeeQphW8VIiO6gupdt7m4aGch75EKhJ5fdiuA
Message-ID: <CAGb2v66a=joEGmwyoEZ6_FJQFdGqSLoVzg9DLn5=c-VpK5AJig@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs
 for WiFi rfkill
To: Marc Dietrich <marvin24@gmx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 4:40=E2=80=AFAM Marc Dietrich <marvin24@gmx.de> wro=
te:
>
> Hallo Chen-Yu,
>
> On Sat, 14 Feb 2026, Chen-Yu Tsai wrote:
>
> > On Sat, Feb 14, 2026 at 10:27=E2=80=AFPM Marc Dietrich <marvin24@gmx.de=
> wrote:
> >>
> >> Hi Dimitry,
> >>
> >> On Wed, 11 Feb 2026, Dmitry Torokhov wrote:
> >>
> >>> Hi Thierry,
> >>>
> >>> On Fri, Jun 28, 2024 at 05:35:08PM +0200, Thierry Reding wrote:
> >>>> From: Thierry Reding <treding@nvidia.com>
> >>>>
> >>>>
> >>>> On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
> >>>>> Complete conversion of the WiFi rfkill device to use device
> >>>>> properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instea=
d of
> >>>>> a lookup table.
> >>>>>
> >>>>>
> >>>>
> >>>> Applied, thanks!
> >>>>
> >>>> [1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for Wi=
Fi rfkill
> >>>>       commit: 47ac458bb229f8c4864081d173adbcfc55c34880
> >>>
> >>> Do you know by any chance why paz00 does not simply configure rfkill
> >>> switch via device tree? The driver (rfkill-gpio) seem to support devi=
ce
> >>> tree...
> >>
> >> last time I tried this was rejected because the wifi chip is on the us=
b
> >> bus and "rfkill" should be a sub-function of this chip [1], but that w=
as
> >> some time ago...
> >>
> >> Looking hard the schematics, the wifi chip does not have a gpio input =
as
> >> first thought. Rather it seems that the first gpio toggles a regulator
> >> which supplies the wifi module (m2 card) with power and the second gpi=
o is
> >> just connected to the wifi LED.
> >>
> >> Not sure how to transfer this into dt, but I guess this would be the
> >> better solution.
> >
> > Then the first GPIO should probably just be described as a fixed regula=
tor
> > feeding the USB controller that the M.2 module is connected to.
>
> I think that is what rfkill-gpio is for, so the proposal of
> Dimitry looks fine, execpt for the reset-gpio, aka LED which is
> already included in the dt (but maybe with the wrong gpio).

I did that some years ago and was rejected. It was for SDIO, not USB
though.

Note that if the wireless driver also registers an rfkill device, you
would end up with two rfkill devices in the system, and with slightly
different behavior.

One would just disable the radio portion of the WiFi device, while the
other would cause the WiFi device to disappear.


ChenYu

> I will give it a try on real HW and report back.
>
> Thanks!
>
> Marc
