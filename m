Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8661B95B;
	Thu,  3 Jul 2025 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539080; cv=none; b=R2GcfAcJbESSGpKURVFm3Qu8iO6X725glq8DyHvTgGR/AuzSK7PUanyzSWM5TFzKa1NTvmkxSN5COaa/KB4E2v7QyNXR6mTD1U024EFSnzj5z8Ww9HbyFabnGqw83g2I8jexywtiCbTMr3GGJP5+0HXE8BoT4vKpL63DzanThVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539080; c=relaxed/simple;
	bh=S8KDLR3KN4A5JzZuRNFi9clwE0TaXll8SMiZK9Uhuxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsBq/Me/5QBhdjKTyZ5M0ov0nRZsdun2XEGsL7/S3PTyuCrrbFH617qzGdmvl91T4cI5WyBSlyJCPmHrrvzhPNfqFTvO9z39iqHx95Cnt+TlzY18CYT0bmK0EXj5+P9FdDkz/58+fc/WYi7t8DvNJTCefa0TTnN6XsqtmK3JBQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZdRnoNO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZdRnoNO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ce671a08so35892105e9.3;
        Thu, 03 Jul 2025 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751539077; x=1752143877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8KDLR3KN4A5JzZuRNFi9clwE0TaXll8SMiZK9Uhuxk=;
        b=OZdRnoNOWSpN/CT3NvusEc+TDqtw4CEt2XtP7BgHR0Jy9pnsRSFF82e7iVv7LVHADQ
         UeKQk+BI4pHik9svj19O4CYz/N+CNwWx3iDy+u3FISbezriEwqUn6DdXp1x6oytPHPHg
         RXj1KjG+H0KiCT5mbiMSlu8zEaW9IuyNlegw++Ru16da73P80/dz3Y5B+RAytagcOQit
         XCdU8wERlClrOeOCQbI7WD3NrBUDyPY7O4OVrZtL4FIqmhHszWoFDDHCEbgZQMWZyREp
         k6goi1vN0/5LV14gWka4LOasLbe4zKtIr+NjA2cmY0K90uIyu/2vKsboEayjn14HJqQw
         09qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751539077; x=1752143877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8KDLR3KN4A5JzZuRNFi9clwE0TaXll8SMiZK9Uhuxk=;
        b=wqOFR2T4HI8dgupfm/RPWVS1s8Qz0Tq7qz9HpVrMEKIlW6uCDb5ruHAjeCZ6S6Q7zo
         atU3SHk2fvGNfPWylCovW6hHKOOGGOq05/aYZ7FKRQMDjNZYv7pWuvP+LGMcAYl3wv55
         VKaBBhmQ+0WuyeEYkCFZd77H+G1C+h10Blc5LuCeVyBVUgz1o3xQcmJVdeC+hY1Brs2q
         Io6lyj3svh6WHmnTpQr6XWxtvdYhWlldpr5rJPUzCtyb/QWv46ZeotLmwxXmDHSFppqk
         4ynDEjflH/H3z/dcrI/vD2veMzZnfVQCJYBbHhgl4qzdW31nsFVE7wAT0et8R+43uQB5
         lpSA==
X-Forwarded-Encrypted: i=1; AJvYcCUx2zqcrUExlEGghSCvTanDf8/+krxAA+3ErL1zkr6O6WQxRoJRhZ+sQCtdV6s/ygkgpuAqvXKDLdUN@vger.kernel.org, AJvYcCVPIAHl54I6Y58yE8MnuXin4xCMgCtW1lI3zMX1D0wdpuH7z1ut+19ys8EE2tuu1OmGjvW3r3GQjwEWjZs=@vger.kernel.org, AJvYcCXhRCIwCS0HVjTJVS+GETTCrgvkmGUkCkEy4ZcBwmAiXnZPvwIPct0hdU85X9KdkQos87QyL54meElDkJCq@vger.kernel.org
X-Gm-Message-State: AOJu0YzcbSNJPXb45rcERHBmvHEC8lhqCh16GB6O/ypd7GC9c9sy6plp
	C1QSpytaB6eGaF9Vof5tZO+ROp3U1ejzJhZdcNEfvt3uL+fSGnXqwG4CoJ+tNw==
X-Gm-Gg: ASbGncvw2jlJhX/BDbuX9RFbZcsGANlWzbNy4QKH2gGTjst3hD1SZK4Jk6LV6ufM388
	d+iMZ9HDVyKZ8vn4Q764XPcUKP2YLucp/Iygtxar4vX4OP/To22JM5KG36EoN6n5fjBDuh0caXI
	PUbiAsPtIhP75kwo6YvHkdRYDUti56I9k+UPRwC5FogYcxXxgk7KwcWO1K4Vog5u2IRtdC25fC5
	51gvue+fUfKUGyAJIhG4t/TTCQFr0e8HeVT6BR/k6KJb/wjAYoF1MrWKadjmYdGxwdjnVg9hZ5O
	J69YpoIOn4XqWsSAapZ4uzXi8q+lDYOXoPTKIdPjdI6C5J+6NVYObCf3HWFj/7ZUQRoXo3kWAvm
	QGbuQPg6sSitPJpMhoS9pTO8gidXnQWGo7StzHeOZ/wqBxCAK
X-Google-Smtp-Source: AGHT+IHmrWAT4c7TivRqBn2eIdZNwMbKfo3PksYVKbh+dbdc1D4lvAcKnJar4ko4DWCGt7WYjOunNQ==
X-Received: by 2002:a05:600c:4e90:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-454a373b017mr63305665e9.33.1751539076610;
        Thu, 03 Jul 2025 03:37:56 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969f2asm23608785e9.8.2025.07.03.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:37:55 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:37:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables
Message-ID: <paksdvlwrbmdo7wg5cuzdazi4epu3oukxdavkkzoje2gw7aeuy@grsls7hp4khb>
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
 <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com>
 <eba00bd5-fa1a-4cad-bb41-b395011235e1@kernel.org>
 <CALHNRZ_WPUM8wKSLcyyZm4jc9onBYiP3oLd=39k4=hoqLzHhrA@mail.gmail.com>
 <ckimvttxjgx44xhfql3nov3qbf35y73nbu3p4m63nqbi22vh37@6p2ji7he5toy>
 <CALHNRZ-r_U+ByS0FWxamv9ozzjBWdkqAh2wJOt3s3cMsX6K_kQ@mail.gmail.com>
 <CALHNRZ8qyu6wsTTnmRWtNgYL4XWR8G7TFammqTFPfHH5d==LbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6l4odblvq33rzphm"
Content-Disposition: inline
In-Reply-To: <CALHNRZ8qyu6wsTTnmRWtNgYL4XWR8G7TFammqTFPfHH5d==LbA@mail.gmail.com>


--6l4odblvq33rzphm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 02:26:06PM -0500, Aaron Kling wrote:
> On Wed, May 28, 2025 at 12:41=E2=80=AFPM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> >
> > On Thu, May 8, 2025 at 7:48=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > On Thu, May 08, 2025 at 07:27:52AM -0500, Aaron Kling wrote:
> > > [...]
> > > > The devices I'm talking about are not yet end of life, so it is
> > > > physically possible for them to get a bootloader update to conform =
to
> > > > the existing mainline model. But I'm just one guy trying to do 3rd
> > > > party support for these devices, I can't affect what Nvidia does wi=
th
> > > > the signed bootloader on these devices. I'd love to be able to swap
> > > > out an open source bootloader on these, but the secure boot setup
> > > > prevents that.
> > >
> > > I've reached out to our Android team internally to see if there's
> > > anything we can realistically do about this.
> > >
> > > Thierry
> >
> > Thierry, has there been any feedback about this?
> >
>=20
> Reminder about this question. Has there been any response from the
> Nvidia Android team? Or do I/we need to continue pursuing independent
> solutions?

There's been no decision either way, but it's fairly complicated because
the changes involved here are fairly large, even if the impact should be
fairly low.

If all else fails, do we have other alternatives? I suspect that adding
some sort of shim that runs prior to the kernel won't work because the
EMC tables just aren't accessible from the bootloader anymore. Would it
entail parsing the entirety of the DT EMC tables and transcribing them
into some memory and pass that to the kernel?

Thierry

--6l4odblvq33rzphm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmXYEACgkQ3SOs138+
s6HgjQ//Wq70ma/AbloC7zM04ZqjcPnMjF/13IN4/L7/rw6UeabNQKXLZTQTf/xS
CC6ecCqWihM9jpUWZVRnWMoOFNQtiO/Jff6g1bYble4+KogUoSmO4mlYxAppDfi6
wImZNu6hbsebADpK+4rreDpF0W8nfbVsH1m36/CnPUuUx6rS+I3mUzSYkze/k4R1
nwtAirK0EBZn0C3EmDJ8P02dvhEA83qasa1nKscjfoTYKr3S8nGBTeU5EWs+vBJc
u6wg+r0FePzLSPMmQHroKTZH7/Yzyw6beq8DJj3uS9oTxXq2xjIoIgkav6MwqyJI
u9b/AdcdsBLrsP6Earlra2fiLyGxvpsd9FrZheeEJ6Af7IIJV6BAnE3lGe5U3DPc
XQlGPeDnORGxQldyz+8UAExmlD3etgP4zSG+fsTUzIqDINJkkCmtN5Hbt9bPSPUf
YdYhPZspYG/RR5662RW8xwpM9PPrWWLo5ZFKUO4A95+8KKjWkOojpt1hgFUHJBOy
GGcRq1wc3dTcdaV3SI/FwJHp0kb5aOpXnM++cmj+tcZ4MI6+/Tv6mwi63eSxR7+D
3N7MfrLzm0peznHTKx3x5o5wCejhFHTRs0bBv5WEAKMa2fMbEFD55k5tz0KemIL3
c/rITPc/I/5QtRShfj67Q+ZXTNBRfOwhrY1k6wrOAz/wsL0Aqsg=
=qXtn
-----END PGP SIGNATURE-----

--6l4odblvq33rzphm--
