Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A9784DF5
	for <linux-tegra@vger.kernel.org>; Thu, 18 Jul 2024 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721312053; cv=none; b=AoqZj6euVZQKcpNyzxidNNkbuLh+9x25ywa6DMe5xC1cmOzIHMBiKwxOFO2+vNRgPJo8s3DDELN798vu/SCz2fomZVmm2TaYzUokY5/4MORr8aMvK/KrgdZ5XF8KoF1tfTnfyN+ekaGFWMsIOM8BjAHuzd91V0Xw6WQFFnLzGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721312053; c=relaxed/simple;
	bh=rYwpk6s2aA8ZaW64DEjhw3d8KkxHYtZFWh2w7miHsMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jij0wUWJ7P3G8ez2T33wgh9QqW2YlS3agqx0Do3I7NjtGkJhRRzUAyCtFZnzsvDkKxNUoPqdIDka+gp6ePSF46hrQwtwOCT6RxaxZSxn8+ilLXdzI+UubR5CpgAM9eJrBKjm4bf5rBObEiyhY17fQbKWCTGDzSeK/uz/7aX6cdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i62v8n27; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i62v8n27"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eee083c044so9998021fa.3
        for <linux-tegra@vger.kernel.org>; Thu, 18 Jul 2024 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721312050; x=1721916850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwa/FUqGTiwfCXFjYhMYhkkWQN1Udk6UTjtKmVq4fKU=;
        b=i62v8n27rHqSgdenH9Ii5Hd9FaVDBMIBAbVf9t1kUGs8w5xEqwlJ+lqIUnEiQPuO0e
         bWDt7kG4VQKSTgX3gl2RSpfDezRSrbvq2hm58VbxAO+Fx8zChkv7Si8k/qzLXdVQ/Lem
         8Xgtniuaoclpg/j98jWreRsd7X9KUGJS9AacX9dJCB5EOGET4Ew4BF63QQVY1c/ZuThX
         NYZSMmFMU3aqKLDmLwWVgSkl+hRk7BSCb89WsfI0e+6xwRKekc6xJC4+/ymZ+MZqEu3y
         pQpCiwKB4cazLx4VvnlyCHuTwJZxwMyNk29UqTLInTdz5NltbVNZ7irr46XDQtAv9ds5
         tP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721312050; x=1721916850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwa/FUqGTiwfCXFjYhMYhkkWQN1Udk6UTjtKmVq4fKU=;
        b=XgC5DP9BmYZuZEc2lrj4le5mlTUbTF4+InvKW1aJ5mzFTtpjtRQMazyFfNnSn4xY7b
         9Ie3itdkhZ/z5jEFMg64vnDGSubMmbnWS5l8LVYXwMWRPXYxjyi8ad5BPc1bHIehEC8T
         nqKiWoqxNw3K3wgIsrvG11AImpOFC/tESScjActuT3oE508sPBY5RDsRe/iC/klUVZwL
         5f/03pzpDUYiuB+8ImkOIisiQ5jSty3u0HHI7oTfNIOg0TmAzjpXrtE5DFKjaoRQvxtt
         xkVgDVF1BijofDNUmgAgYaUkXkL+N4dYizcmpuZnb+wZpc+manC+X3il6u3keqZGSkJK
         FnLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMowIREt+G4opt7qQgZDX2z9Ey0MzhKc1gY/xmQ6x0frWPlpYvRSPF4vRIxMK/B/UL6lJ6e9Yt/hT6Sbyxn4dn1XDNWM4G3EzHNsg=
X-Gm-Message-State: AOJu0YzBM2n15zKvj/T5+O4nQZ5UnLiX7vH+l5QrHxft5vAKgSGHvtij
	cJu4S2dI0FhDT4fsMpdZqmG0EwCfIJgpEjZ/dGM1A65qB9U9QleDp41xCy9XY3eehGGeg0G+aVI
	cwxn4O0L/kXTw/M+uNkVtKB3yd4T0zL9R1F3eJw==
X-Google-Smtp-Source: AGHT+IFVNqh/Ic+HGgiTUP80uh/xt5qB6Maa3HQuATJzOmnrapkD+TnATl8wZg505uKzpIjbkG0XUm3KWjSHRIG+r7I=
X-Received: by 2002:a05:651c:153:b0:2ee:88d8:e807 with SMTP id
 38308e7fff4ca-2ef05c78c57mr16981821fa.16.1721312049997; Thu, 18 Jul 2024
 07:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708075023.14893-1-brgl@bgdev.pl> <20240708075023.14893-4-brgl@bgdev.pl>
 <7c0140be-4325-4005-9068-7e0fc5ff344d@nvidia.com> <CAMRc=McF93F6YsQ+eT9oOe+c=2ZCQ3rBdj+-3Ruy8iO1B-syjw@mail.gmail.com>
 <CAMRc=Mc=8Sa76TOZujMMZcaF2Dc8OL_HKo=gXuj-YALaH4zKHg@mail.gmail.com> <6e12f5a5-8007-4ddc-a5ad-be556656af71@nvidia.com>
In-Reply-To: <6e12f5a5-8007-4ddc-a5ad-be556656af71@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 16:13:58 +0200
Message-ID: <CAMRc=MdvsKeYEEvf2w3RxPiR=yLFXDwesiQ75JHTU-YEpkF-ZA@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 4:08=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 18/07/2024 14:29, Bartosz Golaszewski wrote:
> > On Thu, Jul 18, 2024 at 3:04=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >>
> >> On Thu, Jul 18, 2024 at 2:23=E2=80=AFPM Jon Hunter <jonathanh@nvidia.c=
om> wrote:
> >>>
> >>>
> >>> With the current -next and mainline we are seeing the following issue=
 on
> >>> our Tegra234 Jetson AGX Orin platform ...
> >>>
> >>>    Aquantia AQR113C stmmac-0:00: aqr107_fill_interface_modes failed: =
-110
> >>>    tegra-mgbe 6800000.ethernet eth0: __stmmac_open: Cannot attach to =
PHY (error: -110)
> >>>
> >>>
> >>> We have tracked it down to this change and looks like our PHY does no=
t
> >>> support 10M ...
> >>>
> >>> $ ethtool eth0
> >>> Settings for eth0:
> >>>           Supported ports: [  ]
> >>>           Supported link modes:   100baseT/Full
> >>>                                   1000baseT/Full
> >>>                                   10000baseT/Full
> >>>                                   1000baseKX/Full
> >>>                                   10000baseKX4/Full
> >>>                                   10000baseKR/Full
> >>>                                   2500baseT/Full
> >>>                                   5000baseT/Full
> >>>
> >>> The following fixes this for this platform ...
> >>>
> >>> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/p=
hy/aquantia/aquantia_main.c
> >>> index d12e35374231..0b2db486d8bd 100644
> >>> --- a/drivers/net/phy/aquantia/aquantia_main.c
> >>> +++ b/drivers/net/phy/aquantia/aquantia_main.c
> >>> @@ -656,7 +656,7 @@ static int aqr107_fill_interface_modes(struct phy=
_device *phydev)
> >>>           int i, val, ret;
> >>>
> >>>           ret =3D phy_read_mmd_poll_timeout(phydev, MDIO_MMD_VEND1,
> >>> -                                       VEND1_GLOBAL_CFG_10M, val, va=
l !=3D 0,
> >>> +                                       VEND1_GLOBAL_CFG_100M, val, v=
al !=3D 0,
> >>>                                           1000, 100000, false);
> >>>           if (ret)
> >>>                   return ret;
> >>>
> >>>
> >>> However, I am not sure if this is guaranteed to work for all?
> >>
> >> Ah cr*p. No, I don't think it is. We should take the first supported
> >> mode for a given PHY I think.
> >>
> >
> > TBH I only observed the issue on AQR115C. I don't have any other model
> > to test with. Is it fine to fix it by implementing
> > aqr115_fill_interface_modes() that would first wait for this register
> > to return non-0 and then call aqr107_fill_interface_modes()?
>
> I am doing a bit more testing. We have seen a few issues with this PHY
> driver and so I am wondering if we also need something similar for the
> AQR113C variant too.
>
> Interestingly, the product brief for these PHYs [0] do show that both
> the AQR113C and AQR115C both support 10M. So I wonder if it is our
> ethernet controller that is not supporting 10M? I will check on this too.
>

Oh you have an 113c? I didn't get this. Yeah, weird, all docs say it
should support 10M. In fact all AQR PHYs should hence my initial
change.

Bart

> Jon
>
> [0]
> https://www.marvell.com/content/dam/marvell/en/public-collateral/transcei=
vers/marvell-phys-transceivers-aqrate-gen4-product-brief.pdf
>
>
> --
> nvpublic
