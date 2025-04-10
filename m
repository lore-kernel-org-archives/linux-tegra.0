Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FEB214221;
	Thu, 10 Apr 2025 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279757; cv=none; b=k0sEkrSguYX84QKs5B4OZApENhsd0a88ymq+SzKUBYeOiHy1Q3sxRfEb2Or7FIJoNbq7/6RQhbfU2o1tCBzHXnvZQjte7X3l0aQvIYcPtTFaTGgbYw+c0XGkeOJUy1Sj68LVbluHJlZ5lsIOdUqzmim1Uaf39rI8yDjgg4qQRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279757; c=relaxed/simple;
	bh=BhQMJayU3j/QO0N0kHZ+qJ21ommY+47ijFlvTt1XyTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALJCzbbQJbiDJ3RXtFhAw6WSsqp2/Vtaai0DFcKqSI0deVzk6vChdcqdH/uOTNM0Lb6SbQn31yLCYzopt88P1v/VA4+5zdWTOd9GY6bMRwwWz5f42hjnFj8JORyB4liK0tWkkPMrt+E86eGg+bDPiDUUGDXPn6PaMvXBInNktNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvY8wbhu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvY8wbhu"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so458995f8f.3;
        Thu, 10 Apr 2025 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744279753; x=1744884553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w02+jJJxM/xaPC4HDT9hy9ekuIwpAGcOJfa2SFKKUlU=;
        b=TvY8wbhu1bBW2RKkCdG0z35Z4Gh/E+AiaRQZ/KZG8P3E+rE5gw96awJNQwY7hDrJSV
         lcdsnPfYdthlegB4XeX8wqnwuyfxb0tZv4D//7jse4KvndUpfwNO0PChGBVm4tDohUwZ
         crzN066L166OGInybaM3TDALeEIda5+/czzX8xj5UYqH98I/3kxW7IrelNCrxT5j0VJQ
         BM78g8yFoGyez7hbWa8OozOJMFDluUDysjfVgu/sqn6+KnXzOQk6cPDEhFsy9BSlMyL1
         aT4mhhdf/pvefP0MF1YPkHKPIJ7pAedGlf8wnjlLEGAwVrPzUbXQP/MhWvL7Rl52l6FN
         oL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279753; x=1744884553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w02+jJJxM/xaPC4HDT9hy9ekuIwpAGcOJfa2SFKKUlU=;
        b=Oox6aQQjpe7r4MAGuU4AOuN2OhJo4Om3PmLCWazL/frwpZi3h1XqvTEmPOavg5hPc9
         XadZPeKnMNhnxY29X+axLbX6csSHVJvLTqT8gEBKP/ejyAytZSCUj//vgcmL8aX9z4oB
         jvUZcA9bDk1yL50aYuweytos8Anff9WXgGs4H5HtI49WprsgY1dHWD7u2MfFE8jo62ig
         y+jWFxYu4GjtFMKpEfayV5LkbV5nZpfS7C4jDy4I4KN+zrKQRUWLypWSEpRvtra4l7fb
         /U4G/v2hasRu+NYxVsWQWo2bIlea5ioJEHjpOG9BwSBKLpHwbehGabznnXzv526Zk7KH
         M6KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/gVndpj1CV44jFlBWWanUjzXMe5soiA1DWZ/z6mVk8oxIZp9JfezXl+e5j21ESSS3945XW0PyA443xxg=@vger.kernel.org, AJvYcCXYzu9oiVIWGe7YvlSHz60TgHbJauLKbPy7l01l8dOepymMRupJUpHLH+DEGTo0L4KY23DJHnMZLErIroA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGz1EETh/D5MYNxncABzGDQf1LlOZpIZKGNrVu8Y890Q1Cy16
	6UHyOB5mIw0zHjjOrM57YOr8L+nXX+h4a+n5+ZYxmv35uO4aP7SP
X-Gm-Gg: ASbGncsUB8TycUQPE9GU+3AqQ/1wNEmjSRgDYZNKintaRRBbjCDqCEqCLEeO8+dD1Wj
	b4mN3AnTizK9iS2N+st8Q1jL3QJoKLSs88/5OWktC7p71d3AnvSyCKahFag0yFtEJeYefp3Pjyp
	xdehu1SypBgrx/VooUTLVcfejFbyI7FIWCrsuEMYUaP7BOY0ckDjj2C+1IXVBFyRWjLPs2deKOQ
	9FIzS2UfBTM6Phsew/CLDU0dfNuNI904Rh/tBZ8ig7yszJmN9y3XghVe/TehAMaFg8U16l7AAeL
	TIktU4yk7cQjHLOgu4nHgU4xTaoEJwOYjWIJeuz1WfgUpb/dCyMfLa6v6ro2+I34WVwPZOl6qnq
	clhcLLqupC36+XYI9KWPi2QYD1FDQ/LB3s2K7TA==
X-Google-Smtp-Source: AGHT+IGZESeez/iQN6TI+/Ch2LZrYS850SUSyWm723PWqcbRWWwTKfE/TeyguE/3pAH1dDZDT4Sm5Q==
X-Received: by 2002:a05:6000:2a3:b0:39c:13fd:e50e with SMTP id ffacd0b85a97d-39d8fd63db9mr1691347f8f.10.1744279753146;
        Thu, 10 Apr 2025 03:09:13 -0700 (PDT)
Received: from orome (p200300e41f1b5e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:5e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ed041sm48976975e9.2.2025.04.10.03.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:09:11 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:09:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robert Lin <robelin@nvidia.com>
Cc: daniel.lezcano@linaro.org, jonathanh@nvidia.com, tglx@linutronix.de, 
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	sumitg@nvidia.com
Subject: Re: [PATCH v3 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <kq4ie5pdf6ozi4pnpkngiuny3h62tdcerntkpglbnp52yqaqfs@pjm3y2eraqve>
References: <20250407102323.2690911-1-robelin@nvidia.com>
 <20250407102323.2690911-2-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m76cup4ijsdsl6xi"
Content-Disposition: inline
In-Reply-To: <20250407102323.2690911-2-robelin@nvidia.com>


--m76cup4ijsdsl6xi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 06:23:21PM +0800, Robert Lin wrote:
> From: Pohsun Su <pohsuns@nvidia.com>
>=20
> This change adds support for WDIOC_GETTIMELEFT so userspace
> programs can get the number of seconds before system reset by
> the watchdog timer via ioctl.
>=20
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra186.c | 53 +++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/t=
imer-tegra186.c
> index ea742889ee06..fc2ca86c1436 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>   */
> =20
> +#include <linux/bitfield.h>
>  #include <linux/clocksource.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
> =20
>  #define TMRSR 0x004
>  #define  TMRSR_INTR_CLR BIT(30)
> +#define  TMRSR_PCV GENMASK(28, 0)
> =20
>  #define TMRCSSR 0x008
>  #define  TMRCSSR_SRC_USEC (0 << 0)
> @@ -46,6 +48,9 @@
>  #define  WDTCR_TIMER_SOURCE_MASK 0xf
>  #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
> =20
> +#define WDTSR 0x004
> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> +
>  #define WDTCMDR 0x008
>  #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>  #define  WDTCMDR_START_COUNTER BIT(0)
> @@ -235,12 +240,58 @@ static int tegra186_wdt_set_timeout(struct watchdog=
_device *wdd,
>  	return 0;
>  }
> =20
> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wd=
d)
> +{
> +	struct tegra186_wdt *wdt =3D to_tegra186_wdt(wdd);
> +	u32 timeleft, expiration, val;
> +
> +	if (!watchdog_active(&wdt->base)) {
> +		/* return zero if the watchdog timer is not activated. */
> +		return 0;
> +	}
> +
> +	/*
> +	 * Reset occurs on the fifth expiration of the
> +	 * watchdog timer and so when the watchdog timer is configured,
> +	 * the actual value programmed into the counter is 1/5 of the
> +	 * timeout value. Once the counter reaches 0, expiration count
> +	 * will be increased by 1 and the down counter restarts.
> +	 * Hence to get the time left before system reset we must
> +	 * combine 2 parts:
> +	 * 1. value of the current down counter
> +	 * 2. (number of counter expirations remaining) * (timeout/5)
> +	 */
> +
> +	/* Get the current number of counter expirations. Should be a
> +	 * value between 0 and 4
> +	 */
> +	val =3D readl_relaxed(wdt->regs + WDTSR);
> +	expiration =3D FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
> +
> +	/* Convert the current counter value to seconds, rounding up
> +	 * to the nearest second.
> +	 */
> +	val =3D readl_relaxed(wdt->tmr->regs + TMRSR);
> +	timeleft =3D FIELD_GET(TMRSR_PCV, val);
> +	timeleft =3D (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
> +
> +	/*
> +	 * Calculate the time remaining by adding the time for the
> +	 * counter value to the time of the counter expirations that
> +	 * remain. Do the multiplication first on purpose just to keep
> +	 * the precision due to the integer division.
> +	 */
> +	timeleft +=3D wdt->base.timeout * (4 - expiration) / 5;

I'm a little worried that we might be getting a very skewed value here
due to the multiple rounds of rounding. Can we not compute timeleft in
microseconds until the very end and only convert to seconds then?

Thierry

--m76cup4ijsdsl6xi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmf3mMIACgkQ3SOs138+
s6EtZRAAuB2kaNP4wXjUw6l+S5ySRm0rmdMmnli+vlGAYC3g4qZyONUtoqcPDHrh
BhLejV9N7QXXxw3yXBKfdJIx7sjoRqnAuLyGe4QZlGuKcq01kgSHxs+q+2dU+pXi
RUczz/tTie/enla58cP0KOumojwoOlvN7WGZZB4GmyI0iRS+tqdXnsrw+3Yi1qkw
wP/fZBZuBLKEtcQvpxd5x5owIhibNpehRi7HCS4Zo8x7bgPgbKA7jO29+TSXtrjO
Sg6i1ulHV+m/DuMtjvO0rl13AoAaxYqcpndQlRNEanapobsW85uHayy/XWpzrtyK
yCPuRnKbeIywMUWNX/vPPffKXKiQThNe/gmzny7BG60OwGOLxwbgbtbs6A6hTBDX
zmFE1R9qZxxHG/o0QlQBbpqlvlenTaKkXW3yl9WmQs8OprxGn42h0dk2tMOZY7t4
h8YaFNAut4cDsGmFqm+9zgs/nEKiGaiyG7QqSO6H2oc+ycBTya+AY/b7BpMABAyh
JBTvHt51BqeXTZU18kDTvS58P5aqdEQVOUg/u1MIqd9oPY+qkd18Oqaity12RlNO
R7REeYkmTNXR9cNVXEZvzR7mH3kCBrsNOzECvFSX4kvMGfBa4C2yy0vW0AJlce0Q
76etESLbOMXWRRUUSKbAxCSRZ/TPXemikDZvlHCx+e7cPqOM5mM=
=kFFu
-----END PGP SIGNATURE-----

--m76cup4ijsdsl6xi--
