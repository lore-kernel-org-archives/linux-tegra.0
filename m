Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517391DF75B
	for <linux-tegra@vger.kernel.org>; Sat, 14 Feb 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771080566; cv=none; b=BTF0SHUKjwWfyk+GRgaWQ5Bip4eJIuIPyIicz0kMdhZW7Qpaartxnnb/qJplv9yjGGSkJKmTFe7ya/bDcz3/mNRpilxW/8HAwTL1byp1eQSdr5qjFfb0XDhiLXxQUNXsU1W8nAhlotWO0X3xHTeMp+rutQpD85/osJ6cHG7Kd1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771080566; c=relaxed/simple;
	bh=t4u+2E8pb9LEvxahGdOO9bs11ZhM9Fvc9+f3N2mcbF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFg7u/MwCaTDXLsOyrQxBLqE/Qh6YHwb2Vp9lVr7Cpm3aG/bmDSkcJeq7tiDudRsD5EWUugznbkxET2pEfgo5prdbkVLeCKCJ21shb2saj7O5PPy+z6zRk0dMYnL4OqZCl8zjlGHXbcFldLstUFwRcobyK5AcRE2N+BhjLL7kj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puZ7xGzZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puZ7xGzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032D8C2BC9E
	for <linux-tegra@vger.kernel.org>; Sat, 14 Feb 2026 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771080566;
	bh=t4u+2E8pb9LEvxahGdOO9bs11ZhM9Fvc9+f3N2mcbF0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=puZ7xGzZvjT+IfyfkVmPzykkNhW1E97hXJPEE1ROrG7S/HTUgq5qEZDVYWT7DG2ys
	 T3oTHvLiV/TmEf+uhNd1SWVwgiNkWtgzr062c11GsmUaMUszACDXTjQgfrzT+QsqUM
	 dw+JpZRZfqpHjYy2LmHgSFjeysdqXAvPJHiVCVdCBbvR2kQlcy/B+HgmozGj1ASVY8
	 jRju9o/DECgvGICK9tys9a9z/ASCi0k5H/h7wocR+VfnLPxorZw7Vci81yLm9ww6BG
	 4PFqE/MhAYe6kaYMubPH8K51WUosWV16v423M54HjhMtxyXB5QQAr7AgMat56cAeU/
	 zWyX4IOtajqeQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38708180241so13398881fa.1
        for <linux-tegra@vger.kernel.org>; Sat, 14 Feb 2026 06:49:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVN2OcgDfPFkKeI8hRFfGH0LyRVKbkE+KbheF2hUuIaDmEPHXyElUPVzqr6wqwZm/3a1mtMSmP8OvGbew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPQO0H90cnEQt9fCKF3h6o1dB3TL9N3jWLoS1M+qOajWSzm5+Z
	+oB0UfBoYwjAASjfaYVxSUakQBgsKnYPwvH5Vs4ApwF+zlS99FOgN+LhV+krm4zfd8/DNOTqFpq
	8c6opp41XAnDfH07e8RZeUoR+ytCv0+k=
X-Received: by 2002:a2e:bc08:0:b0:387:197d:2067 with SMTP id
 38308e7fff4ca-388105705b5mr16636991fa.28.1771080564339; Sat, 14 Feb 2026
 06:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZnzulZBukibZUXKM@google.com> <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>
 <aY1GZQJLKAF0fsz6@google.com> <74b13dba-830b-6ea3-e5d3-95f0423fe741@gmx.de>
In-Reply-To: <74b13dba-830b-6ea3-e5d3-95f0423fe741@gmx.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 14 Feb 2026 22:49:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BApjGy2AZsM5sJit4ZDKDreVE230kxFikBeo-SFnGzA@mail.gmail.com>
X-Gm-Features: AaiRm53k3rSL_h2LUOXtrsfNzAhuFX0EJwZlhfvfCCFszsxpJJjDWoFbW7UVCGg
Message-ID: <CAGb2v64BApjGy2AZsM5sJit4ZDKDreVE230kxFikBeo-SFnGzA@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs
 for WiFi rfkill
To: Marc Dietrich <marvin24@gmx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 10:27=E2=80=AFPM Marc Dietrich <marvin24@gmx.de> wr=
ote:
>
> Hi Dimitry,
>
> On Wed, 11 Feb 2026, Dmitry Torokhov wrote:
>
> > Hi Thierry,
> >
> > On Fri, Jun 28, 2024 at 05:35:08PM +0200, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >>
> >> On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
> >>> Complete conversion of the WiFi rfkill device to use device
> >>> properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instead =
of
> >>> a lookup table.
> >>>
> >>>
> >>
> >> Applied, thanks!
> >>
> >> [1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for WiFi=
 rfkill
> >>       commit: 47ac458bb229f8c4864081d173adbcfc55c34880
> >
> > Do you know by any chance why paz00 does not simply configure rfkill
> > switch via device tree? The driver (rfkill-gpio) seem to support device
> > tree...
>
> last time I tried this was rejected because the wifi chip is on the usb
> bus and "rfkill" should be a sub-function of this chip [1], but that was
> some time ago...
>
> Looking hard the schematics, the wifi chip does not have a gpio input as
> first thought. Rather it seems that the first gpio toggles a regulator
> which supplies the wifi module (m2 card) with power and the second gpio i=
s
> just connected to the wifi LED.
>
> Not sure how to transfer this into dt, but I guess this would be the
> better solution.

Then the first GPIO should probably just be described as a fixed regulator
feeding the USB controller that the M.2 module is connected to.

There's also a WIP M.2 E-key binding and driver, but AFAIK that doesn't
actually implement USB support.

The second one could be just a GPIO-driver LED with a netdev trigger?


ChenYu

> Marc
>
>   [1]
> https://linux-tegra.vger.kernel.narkive.com/hRFke8jh/patch-1-3-net-rfkill=
-gpio-add-device-tree-support
>
