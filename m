Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C91E49F
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 04:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771822677; cv=none; b=gBsnNU2+pIMZDDBL/e4/2GiAPK6icOu1NFm34FQoXFAkibGHdy9jaEw8Gpa+7fCgJw64g14K2uUA1dzh/9PqDncc14u1hvuq1f35ag2GbYaJd6wlKCpxirmtlA8ciXAr0QrfwHzFYZbQR9USddU7KV3vauuXKnBM0D8C1jL2Ljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771822677; c=relaxed/simple;
	bh=1+fj/osOFOTUhi6//cNsWxgUvEAAcYmf9baAm1ts5cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+bimBoSU4rsZgNdN9YhriFkK47ST+1RjHbHacixNHcBqZkfuROyJTnZgm1OSjA8wHodaUBqpPEOPnBF/H5+1Uz30OMdIBBBos8nNlERgfBP8CqooJnMLCkwvne1rblQzC2CtEo+GJiuX/61pkLK4hCB9DBLyo8ln+BkksTC7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKCKqHKN; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKCKqHKN"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1274204434bso3252536c88.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Feb 2026 20:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771822675; x=1772427475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoD6tE+yirYO2wDnJyh3VhePC5QLfqyFQbq0eMsMM6o=;
        b=SKCKqHKNcvrisaNOx+xrUeJZW3r4vvf+FJEl/sWKdeIWhyGxvzHy8BJW8UL1qeeF0P
         XrQK2POy3PeNqnEXJTCBduCWG8nKuSauqBu4uCKFUVjvn3zOhwkLCiG4EnNpmGH6EhE9
         5fOh8uGhU/iGiedONOPvgEN3pmgX5mLRP2WXe22W2Qjot65JGLRGWshf6okRQhyPFsCo
         TLrDTloQXH3Pk7wWEJs/4IhDy9+4iyv0JrONaTwMgxguIL6JgbQGJO4tnam4B90qbCns
         deoC5Zud2h4Z/MhIIjkDKdEoz0Djbda36SOcNbPCJi6W/N7qQ7sTds3tdkq0FvcdikrL
         rZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771822675; x=1772427475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoD6tE+yirYO2wDnJyh3VhePC5QLfqyFQbq0eMsMM6o=;
        b=CEKdFfb9d39TaXvbbyt0FM/ni5JCPlwQx587m1qW0/CSP93/j1DJvw30i6WibVmtRo
         GCLXT5yLmqYRPBWT8Vr8vsooywkhfQh9F8fV2qZKjTTSmUlmNGNybyJdBrxzOmxPBqhq
         WkRJmmi4pINDhQFnqRPtX+biuU8Z+k714bAoMHkEdVS49hXMdciGKajNe8bKim0z1ITI
         ITFxYCNhKqK3WxefHRBSd2cFyVAW0skl0/pZTwK7G6/d2sNAxtt+Ig82Ysa+twuCnCme
         W6VbP4g24QzhgWtWv3Um6ji4VVPvBGd/ckp/ibmCU8peNdp6XEfmoZt6Y6O2twwjH8Fz
         4xbg==
X-Forwarded-Encrypted: i=1; AJvYcCUhDeoQF2XOGYrzz0Odf8sH9CoYIPxU09giW7GR6Zn7mKBRJ4gsRwidcB/TB4JTkrhkSvUalFSz7pKfIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+s2j+L6F9TWG69/nCic8t8Zue0eHcN3WzNEVDKHfy2BuTrDaH
	w3UAcTppUlZnOcRrIBvUwYYIchDOAqtwS4MP5txhbXu8BjS8JdjSTIDC
X-Gm-Gg: AZuq6aJHQlLIA2sVSYzYi47yfq3D8UPStmBt9JLhSEJI7730zKyR1csq3Bz3cm0mEi2
	vG3Mai3/7E94FE0L0YOkPWpWclJWO9Dq0gpKegZzv2PZCAjr3LOCUuI9AlvVRHtat12EdLX/UCM
	+Khgq+LtKEpLRoshlHevDmqNi9QzrfXljvt7TeELuYaJMM+xfCqsXHw6oY/MSh+rRn/JQBGBSOQ
	ICo81AoM1yvBkSrua9qxlDOr92yLsxfVKMR4SnYWG3ZIUDlWeVBVvlRx8EmhSVGO9ZiOz3dmnuu
	KVLggqpgT1/vvpoKhkzRJgMZOjFpOTx/Tpf7VBizhz26TFm0unkBQmybAzvynGRXbPd4W6tV3Xu
	w+7yd8+6T9U5jsSKrrgDA3se0VeUcmxlSF/cbaZEVQ52qUbJRIhlwuHJSsVx+yaF78X1zN9x+d8
	rc9K7Ye22022TUuUVv95UqWEIZ45ve24xm6Ev2kditpWX53E2pQiq1RhH/q0y8Jcw=
X-Received: by 2002:a05:7022:48c:b0:11b:f271:835a with SMTP id a92af1059eb24-1275fa41703mr6770004c88.3.1771822675098;
        Sun, 22 Feb 2026 20:57:55 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2ea06sm8045507c88.7.2026.02.22.20.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 20:57:54 -0800 (PST)
Date: Sun, 22 Feb 2026 20:57:51 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <aZvdDIYlCjg8sVGT@google.com>
References: <aY_BpRQmLdqOOW2K@google.com>
 <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de>
 <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de>

Hi Marc,

On Sat, Feb 21, 2026 at 03:24:35PM +0100, Marc Dietrich wrote:
> Hi Dmitry,
> 
> On Sat, 14 Feb 2026, Marc Dietrich wrote:
> 
> > Hi Dmitry,
> > 
> > On Fri, 13 Feb 2026, Dmitry Torokhov wrote:
> > 
> > > As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
> > > device can be instantiated via device tree.
> > > 
> > > Add the declaration there and drop board-paz00.c file and relevant
> > > Makefile fragments.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > > 
> > > This is not tested on real hardware, compile tested only...
> > > 
> > > arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
> > > arch/arm/mach-tegra/Makefile               |  2 -
> > > arch/arm/mach-tegra/board-paz00.c          | 56 ----------------------
> > > arch/arm/mach-tegra/board.h                |  2 -
> > > arch/arm/mach-tegra/tegra.c                |  4 --
> > > 5 files changed, 8 insertions(+), 64 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> > > b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> > > index 1408e1e00759..d1093ad569e6 100644
> > > --- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> > > +++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> > > @@ -706,6 +706,14 @@ vdd_pnl_reg: regulator-3v0 {
> > > 		enable-active-high;
> > > 	};
> > > 
> > > +	rfkill {
> > > +		compatible = "rfkill-gpio";
> > > +		label = "wifi_rfkill";
> > > +		radio-type = "wlan";
> > > +		reset-gpios = <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
> > 
> > I guess this can be removed, as it should trigger the LED, which is
> > already included elsewhere ....
> > 
> > > +		shutdown-gpios = <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
> > > +	};
> > > +
> > > 	sound {
> > > 		compatible = "nvidia,tegra-audio-alc5632-paz00",
> > > 			"nvidia,tegra-audio-alc5632";
> > 
> > I'll give it a try and report back.
> 
> rfkill (and LED) works as expected. With the reset-gpio line mentioned above
> removed, you can add my Tested-By.

Thank you Marc.

I am still a bit confused about the reset gpio. As far as I understand
looking through old commits reset gpio (PD1) is distinct from the LED
gpio (PD0) that is currently being controlled by "gpio-leds".

I guess the rfkill driver needs at least one of "reset" or "shutdown"
gpios, and that is why it continues to work with only shutdown, but I am
trying to understand if PD1 was never connected to the WiFi chip reset
line and instead is used for something else, or if it is indeed a reset
line...

Was the patch not working with reset-gpios present? I am trying to
gather data to craft a proper commit message.

Thanks.

-- 
Dmitry
