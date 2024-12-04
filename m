Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69D9207E0F
	for <linux-tegra@vger.kernel.org>; Wed,  4 Dec 2024 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334629; cv=none; b=VfP2GMEoWVKVdivoMfDFQmPxTByqNGRdqAo3V53PVwcNCrSuNZnAJOOPrDxfwMDfBnwLX+BS/6vZ1PFKDFjJkYWd2h/VxUIp2nrVGNGcFo0Io4NlSw8hbiagD2/Q05QG50nShJw8c71aZ4uYkirwuW13B3bs7aLKWav0W4vJO+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334629; c=relaxed/simple;
	bh=JpE7XVa+QpE7giYsqJyJGLOmOhKvLMHCdLIRRh5SoV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uy1gLLtrFUUBsx9Y48mX4ZUpcXztvQjVOgmd/jAly3ZdqefefyZc4UerO06pwPaw0nZYwJbNhUl01VVIm0G6qVOTFRXfBGpDFOeu1ssNIyORshqn1Q9zE1cMVWLMB5B+bXrUCCi1DT4diJtvD/CBMjvtUQHjuj5OqfU4++aqG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ake3oF00; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ake3oF00"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a8640763so517865e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Dec 2024 09:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733334626; x=1733939426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpE7XVa+QpE7giYsqJyJGLOmOhKvLMHCdLIRRh5SoV8=;
        b=Ake3oF00ZFcU0T5Z6xHjQRk03tvGsyViSYmB+7QzzsmL28aXWYtHUIR8GV89v8eyaw
         dbUcSkkoizOZD2IlYFTWv29zk4IJ1PQ6pPY+/tT+03cQ+u/UvfqLz+L38FQRIkQJZ+QH
         AkLzHVCz+vDuujreZIENEKYYEhZURyGekbVm+dF8dOyfqYV2h0m0H8DIU0ok/n5ql/6M
         f3JQ2cjrWPTUiBs78VE57V/C/tDjpr/EOG8ZFCI1Ze/p+bb0l3W+ScM/BOSTlrK8Ij8H
         N4H61AtDILNhHeyWUn4SG8LttByCPe2vKQykBxPljeYu4nt1laIHZSZ8WqI2nmUUrtzW
         A7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334626; x=1733939426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpE7XVa+QpE7giYsqJyJGLOmOhKvLMHCdLIRRh5SoV8=;
        b=qNALwCwIjO6buqtlFCUycxRLmHf4iWT2uVjycLW7sS/surXY/W7ypXFrowJ0cmqAcw
         1BsxAjjEkTSIiBJSFyxRJrJEPoOrymEfnKKVPxWcEdu2vidCTgaabM9c8VhyYVqVZnHq
         90iMkmL/7ztd/ngPCzTIbgodEscrAmyaY7q0GTRnMwWTS3aLzGqG5RYkjGYQqsCEsxr1
         GPPtXD/Puhdel/jMQ1f902YF/KU+dJewMKLSzq7Z+N8Tty3wMrVx+a+dfutFXTV3qChm
         cfgw/RkG7ZmimFluh/BTrUwP2em+0K8aA8gs2ZeqP+VsHhZzs7ZT1xb6cRkXL+incYGD
         GMwQ==
X-Gm-Message-State: AOJu0Yyb+muKUxI9Y8KWTyB/Osy5908ChNvYDVsilE1P5oM/lTkurJFy
	JN3e/D753ekIit6pkQdUQ5C/3C6KNvODtGxYAfc2KQkNmYMWRHk+0q9EHQ==
X-Gm-Gg: ASbGnctSPcOKoanbvAcWGM0k2Surt0CfdPMwrZusVRbdLJ3k+h8sBGqbHsEK0OOo1Wz
	H3bVRQRY2iC1el5cJ3lXqgK3x73bKOOYY3wWSVqc0Ioz4CwLg1524zFbqxP1Cv6CNxYi9L+dzCG
	clOjUUbr2KRl3WQS1FmALzWGgvuoWPerjGjFq5MwGjCkCosg1H3NvTj3kirQzWzBqdmU0nPQkEJ
	+p0OC4xSB2LFyir8xWwaYJvvl+gnizHvTiM/nkVXY2tvcDxldnks0w/Ab7UMaBLMbcRJ1XkO/a3
	2jn/K+p3NJeGAl3v9emUUcNjWeObaH1zI4dD
X-Google-Smtp-Source: AGHT+IEyL10sRORR7GqY0lslkOjNAHyt4o8akG1inhwbMjINhcIJmLJMFUoBK6OBJImrpFue+7GbKQ==
X-Received: by 2002:a05:600c:a44:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-434d4522624mr35712575e9.25.1733334625734;
        Wed, 04 Dec 2024 09:50:25 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d04e7380sm56134605e9.0.2024.12.04.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:50:24 -0800 (PST)
Date: Wed, 4 Dec 2024 18:50:23 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: Reviving Nyan support
Message-ID: <daqxykyvmd445jtai6oyyz6p623bdhw77ml45463xrupwogptg@ub7mo5utl3sv>
References: <20241108014603.219a0cee@foxbook>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ikchujadf2ua4vnx"
Content-Disposition: inline
In-Reply-To: <20241108014603.219a0cee@foxbook>


--ikchujadf2ua4vnx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Reviving Nyan support
MIME-Version: 1.0

On Fri, Nov 08, 2024 at 01:46:03AM +0100, Micha=C5=82 Pecio wrote:
> Hi,
>=20
> It came to my attention that Nvidia provides some degree of mainline
> support for old Tegra SoCs, so I wanted to try it on my Acer CB5-311.

Exciting! I think I do have one of those devices, though equipped with a
Tegra132, so the 64-bit equivalent of Tegra124.

> I checked out v6.11.5, applied tegra_defconfig and booted this kernel
> with tegra124-nyan-big-fhd.dts from mainline, using CrOS bootloader.
>=20
> The kernel came up and userspace got to the login prompt, but then some
> issues appeared:

Okay, that's pretty good given that we haven't had testers for a few
years now.

> 1. Most importantly, the EC keyboard doesn't work, I had to use USB to
> log in and see what's going on. Turns out, tegra_spi_set_hw_cs_timing()
> rejects timings expressed in units other than clock cycles, while slave
> drivers like cros_ec apparently prefer to specify us/ns.
>=20
> Searching around, I found I'm not the first one to run into this issue,
> not only on Nyan, not only on T124. I got around it by disabling this
> callback altogether, because SPI core apparently has a workaround. But=20
> maybe it's preferable to fix it properly?

I'm not sure what the right way is to fix this. The values in DT are
clearly required to be nanoseconds, so either the driver needs to learn
about those or the core would need to convert somehow. The core doesn't
know about what the driver supports, so it can't do a really good job.
Maybe a good compromise would be to have the core expose a helper that
can convert to clock cycles (the reverse is already done in
spi_delay_to_ns()), which drivers can then use if they only support
clock cycles.

I think that'd still be preferable over relying on the core's manual
delaying. If we can make it work, obviously.

> 2. I noticed that tegra_defconfig doesn't include LPAE. Tomorrow I will
> see if full 4GB works. Maybe LPAE could be a default on 32 bits?

I think LPAE cannot be enabled by default because it would break on
Tegra20 and Tegra30 which both don't support LPAE. Tegra114 was the
first to feature this (I think), so we'd need an extra LPAE config
that's applicable only for newer chips.

> 3. Some more warnings about bypassed regulators and missing touchpad
> supply (but the touchpad is enabled and works, per evtest at least).

Not sure how much can be done about this. Unless you can find the
schematics we'd probably have to do this on a best effort basis.

> 4. Doesn't come out of suspend. No idea what's wrong, how to debug it?

My first step when debugging suspend/resume issues is usually to pass
no_console_suspend on the kernel command-line. That's really only useful
for debugging consoles and it probably doesn't work well if you've only
got the framebuffer console.

Other than that it might be possible to try and validate suspend/resume
on a more "accessible" device (such as a Jetson TK1), fix any issues
that might have and hope that also fixes Nyan.

You may also want to play around with different suspend modes. Suspend
to memory is usually easier to make work. Anything else might require
assistance from the bootloader/firmware side (there's often a warmboot
binary that needs to be executed when resuming from lower, or I guess
higher depending on how you look at it, suspend modes).

> 5. USB is power-cycled on boot, which is a bit annoying as I'm booting
> from a USB connected disk. IIRC CrOS kernel 3.10 wasn't doing it. Any
> suggestions where to look?

Is this really the power going away and coming back up? In that case it
might be a regulator that's being temporarily disabled during boot and
then brought back up. It could also be a USB reset, which I think is
something that's absolutely necessary in order for the kernel to be able
to properly enumerate the devices.

If it's a regulator it might be possible to mark it as always-on.

What exactly are the side-effects of the power-cycle? Does it cause the
USB device not to work at all, or does it stall the boot, or perhaps
even break it (I assume not since you mentioned you can get to a login
prompt).

Let me know if you make any progress, or have any questions that I can
help with. I have limited options since most of the devices from that
era that I used to have access to have stopped working (or accumulated
lots of dust at this point), but I'm happy to help if I can.

Thierry

--ikchujadf2ua4vnx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQllwACgkQ3SOs138+
s6FgHBAAgoKdYp/vwO3xmKrCSqZQF8wxLhEFngYjjU+IBkeWjzEDrf3mPy6GsTPS
WidwVv7N2tk25JDHyQylvg50JLKx0uDXEDIsOg2+wDqbUIs0dNDg0DGZlblBzVnI
X/cpvMfDc55XmNwkYd/ncQ21++JkKMHzkuY+VAFzq1b1PV062XuFdh1Ki6fV2cBr
6GTcI/z3D2e3Oc0/xfp63y6qadsuvgg4mHzeRBcbqbp9Ltb0H/7Zr5L3TjHcBcPP
b84djYpdzLONrbriLx6u/+ZQNmX8BFF+1CYLZfTnhXm53jo7CYE7SYcd9yy7qkf0
bhXyKZdUamxZuPvuflXmnLh3A8vdANnOiJ9YnyH2mKsQ2nKIx8CwmDP6WakGDzVC
aBqH8tRRJ/FgkFZ3PrPaXCY4mOB77xqXZdP1Gepo+Ql7s/NlnEThb/hKfu3wr7y1
ZKqfjHStnDfANHRSpZn2UuOdIMl1Othio4jXol5dZd9OPoupFSNVFV2eiKK3MKDi
7w0baIvuqomNfhwjk14izVhsEIvVEmnHSmsDqhFR8KnaRw2wYej1JDJrDbX3WAOw
uXn6tijz/EpvSIWEUx8wYHPsZ/sh51t28KY04wu/flWYuRTyCDgCp4Sz2P8WDg8x
ATQbPWQIfsRZ9EXJOwBK0rgr90S4ZsuPY+9bVb5RDNWn27Ph8QA=
=BdTO
-----END PGP SIGNATURE-----

--ikchujadf2ua4vnx--
