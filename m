Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B721B0F1F
	for <linux-tegra@vger.kernel.org>; Thu,  5 Dec 2024 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397423; cv=none; b=CB3itg8Hi30NF0elDFQP6aabGFhPsy9h5nSF5TvjLn9lsA6EaO/q/yqXPt3FyPp0c/aT6dvvS/TOquQ7sju3GxmMFTr+jOzmm/H/gUsdlYwP727kSaDns6xwkh11zDeVQCbd1nBNiphywm+1ZZojLfAoNrFaFp5e+buF6J4U/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397423; c=relaxed/simple;
	bh=vYxBTgMkY5k2/FPHRvsGno6lKPpQRWkZU5rC25n44Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dmz0vDEb6yJvdAE2mnhSmwf/dDpobiZtAum1nnfTa6YW660uC5qvhVxn7VsCOZJVr9QDhUZPmLrbdO78kXAgRaGSr8NMEAItey7Rrj04vcJVfVbl/7CIZg0bz+QJ2t9MRBZb64SYf/ubYvLAYpgHQSbb/E5ZvZa9PxcBCcJ395k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hygfsZye; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hygfsZye"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434aa472617so5401925e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Dec 2024 03:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733397420; x=1734002220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYxBTgMkY5k2/FPHRvsGno6lKPpQRWkZU5rC25n44Ik=;
        b=hygfsZyeKJ/qij3WOCMa//1JhG4y2GwSJ0jFTS6u9pjtnTNAYghqHMZnwqhFKOZk8+
         Qd5eInaK+pVIP6ZcMLpJpDSIhX1q6KI7+HsDn+HoXRjXYUqLCLFCrnY3h1bJGa1fpM7n
         qVRtyOvr3N7iz62ef+YXiE6bkCLnzunJiI1L3v5oqPLpZmJx95RRwV+IQm+FVUgHR1Or
         QTVfqN/0J/H6gzsnTyMyyvi13h5+sQb/LQcNoAUG7uKtCAXsHB6Mygp4ahGvMquEMbQt
         y3xNAR4qcG1WQRuF5jfvcbyUVk+TPH59USEwei/lxB5hhbENNoSOn4jxpitWvVW/wrYO
         asjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397420; x=1734002220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYxBTgMkY5k2/FPHRvsGno6lKPpQRWkZU5rC25n44Ik=;
        b=rsPK8VrxywB9ADTy+UBy2uCDy/S9YcuqFt1kNzBP9qUfwBouMscmikPMzNTHwnKxYA
         V4LvussKHzttQoBWiea5p4O/CiZjE6f/u1VXU7Y71NK/16p93ohGMuBCwtYbUf3NzFaG
         c2FF2+CykZNc2FT6Q+Dqk5rDRmYqQfKMoIwRoDraD5QqeY4jTZuD42Bp4+c3YuJQ5rEi
         3aAMQaE5R+grESi1xgZqyZzcEVhCuI203Mguuhh8EZSKXRiqXXNrXZXeB28pg5PmidIQ
         HbXr9i6U8wyZXgXf6Zi3Bt/cizawjptzBeIGh4V0uQgsgA03po4pkU46mjHJ2EGGTcua
         L39w==
X-Gm-Message-State: AOJu0YxTif8LO68i9G5tAVRPbgkCCodZMPNiUm02PThn0SP+T7nPJCu7
	H84Y6NDsYiEIzCjUJW9w8yDAI4e4Faq32kwV0Y4hVol5tGNTS++TEwmjUg==
X-Gm-Gg: ASbGnctafnZhuauyKxIuc/cPdNytVl+pBplbfqoKesnAkgg/5mDG+EqSwet6ZEwowyO
	ajMjpqWju5a7Z5796qE+Mwz9aqomSoUinIM5UvzC1y9LGegowzRdue6zlU1fDVlStJUDLrzNCxL
	XW8YSEGLVmRExNLmr9MfqCQLePTtHrarU5Rd3ZdcceV3x0l7UsTtCFceO3L9/7LYelJ6K3DGEmb
	teooE1cPur1SNm98ddh58AxedW7czHPc8FY2F5SXJX8EobH6D4KYDtL5z/AowldCr2kB/YenhdK
	V5E7pJD52EPZVfLdHU3b1SCgd8EjLa7Oom6M
X-Google-Smtp-Source: AGHT+IEk0jrjtVCtY9dODLWkceFhAJ85ujdC9YYju0Dt7vxqz7ntrpnREsWUU5CrT0T5RdeQP281GQ==
X-Received: by 2002:a05:600c:470b:b0:431:5ce4:bcf0 with SMTP id 5b1f17b1804b1-434d09cced6mr88387455e9.15.1733397419361;
        Thu, 05 Dec 2024 03:16:59 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da118cdasm20113425e9.36.2024.12.05.03.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:16:58 -0800 (PST)
Date: Thu, 5 Dec 2024 12:16:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: Reviving Nyan support
Message-ID: <jzv7tpqtnuolbz7u2jp6jo567h3rhu6srcekt2rkqwak5tmkzy@3uardv4t6ail>
References: <20241108014603.219a0cee@foxbook>
 <daqxykyvmd445jtai6oyyz6p623bdhw77ml45463xrupwogptg@ub7mo5utl3sv>
 <20241204203045.487da970@foxbook>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rzlri6yqgo2fbkz2"
Content-Disposition: inline
In-Reply-To: <20241204203045.487da970@foxbook>


--rzlri6yqgo2fbkz2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Reviving Nyan support
MIME-Version: 1.0

On Wed, Dec 04, 2024 at 08:30:45PM +0100, Micha=C5=82 Pecio wrote:
> Hi,
>=20
> > > The kernel came up and userspace got to the login prompt, but then
> > > some issues appeared: =20
> >=20
> > Okay, that's pretty good given that we haven't had testers for a few
> > years now.
>=20
> I had some hopes because I saw that NVIDIA still tests new kernel
> releases on T124 Jetson, although I don't know how much is tested.
> The kernel seems to be in pretty good shape, save for those issues.
>=20
> I found that graphics are a bigger problem: X is dog slow, and I get
> black glxgears window and some 150fps, which doesn't look great.
> Do you know if it's supposed to be like that or if it's a regression
> or some screwup on my side? I have enabled Nouveau in the kernel and
> installed X11 Nouveau driver and xorg.log shows that it loads.

That's kind of expected. At one point this was working mostly reliably
but given that there's been very limited testing, it's not a surprise
that this is somewhat defunct.

One thing to know, though, is that the Nouveau X11 driver won't do you
any good. The way that it works on Tegra is that the GPU is used only to
render to offscreen surfaces and the Tegra DRM/KMS driver will then scan
those buffers out to your display (via X's modesetting driver). In order
for this to work you need to enable the Nouveau and Tegra drivers in
Mesa and then they should be able to work together if you've got an up-
to-date X server. You might also need a bit of luck.

> Are there any other options besides Nouveau? Perhaps some newer L4T
> release which would work with mainline host1x driver and Kepler? I
> suppose anything that works on Jetson will work on Nyan too.

Unfortunately L4T doesn't work with any of this. Both the display and
GPU drivers are completely different things in L4T vs. upstream Linux. I
suppose you could try and port those drivers to a more recent kernel,
but I can't recommend it.

> Currently this machine runs Ubuntu 14.04 L4T and 3.10 CrOS kernel,
> so practically anything would be an improvement :)

The plan was to get upstream mostly to feature parity with L4T so that
it could serve as a long-term option for people after official software
support was dropped. We managed to do a bunch of things, but there are
certain aspects that aren't quite as polished as I wanted. Hardware
accelerated multimedia is among those. You can probably get some of it
working using the V4L2 Tegra VDE driver. GPU acceleration is another,
somewhat unfinished bit. Again, an up-to-date Mesa and X server should
get you there most of the way, but it's not been tested for a while, so
may have regressed.

> >> SPI
> >
> > I'm not sure what the right way is to fix this. The values in DT are
> > clearly required to be nanoseconds, so either the driver needs to
> > learn about those or the core would need to convert somehow. The core
> > doesn't know about what the driver supports, so it can't do a really
> > good job. Maybe a good compromise would be to have the core expose a
> > helper that can convert to clock cycles (the reverse is already done
> > in spi_delay_to_ns()), which drivers can then use if they only support
> > clock cycles.
>=20
> I see that a few other drivers which bother to implement this callback
> convert ns to clocks, so options would be to copy-paste their code or
> put that stuff in SPI core. I have never looked at SPI before...

Yeah, that sounds about right.

> > I think LPAE cannot be enabled by default because it would break on
> > Tegra20 and Tegra30 which both don't support LPAE.
>=20
> Fair enough, it's not a huge deal.

Yeah, it's a bit unfortunate, but you'll probably want some custom
kernel image anyway for this particular use-case. Things are much more
standardized on 64-bit ARM nowadays, but 32-bit ARM had some wild west,
shoot-from-the-hip vibes. =3D)

> > > 3. Some more warnings about bypassed regulators and missing touchpad
> > > supply (but the touchpad is enabled and works, per evtest at
> > > least). =20
> >=20
> > Not sure how much can be done about this. Unless you can find the
> > schematics we'd probably have to do this on a best effort basis.
>=20
> I actually have the schematic from some shady laptop repair website.
> IIRC the touchpad runs from some major 3.3V rail which is always on,
> so I didn't bother fixing this yet.

Yeah, if it's an always-on regulator you can usually ignore those
warnings. It's always good to describe them and that'll get rid of the
warnings, but it shouldn't be necessary.

> I also learned something new, that platform drivers can ask for their
> probe to be deferred, which was responsible for some other warnings.
> At this point I'm not sure if anything serious remains, but regulators
> are another subsystem I know practically nothing about.

What kinds of warning were related to deferred probe? Normally the
related messages are debug level, so unless you've enabled those (which
is probably a good idea for what you're doing) you shouldn't be seeing
those.

> > My first step when debugging suspend/resume issues is usually to pass
> > no_console_suspend on the kernel command-line. That's really only
> > useful for debugging consoles and it probably doesn't work well if
> > you've only got the framebuffer console.
>=20
> I made zero progress on this, and frankly didn't even try. Serial ports
> are only accessible by soldering to the board. I suppose I could try a
> USB dongle, but it will go dark as soon as xhci is suspended.

You could always try to see if you can prevent XHCI from being
suspended. Not sure if there's a standard way to do it, but worst case
you could try commenting out the code that does it, see if that gets you
anywhere. It'll probably still break at some point when interrupts get
disabled and such. Or it may break earlier since the USB subsystem is
probably not designed to stay up until that late.

Again, it might be better to check with a developer friendly device what
the status is with suspend/resume on Tegra124 in general. I think the
tests that we run periodically would've flagged any generic suspend and
resume issue, so it might be something specific to Nyan (possibly
display?). Have you tried poking the device in different ways after the
resume? Does it react at all? Does a network ping perhaps work? I could
also be that the system wake isn't properly hooked up or something. One
thing worth trying would be to use the RTC to wake the system up from
suspend. I think that's what we use in the daily testing. rtcwake is the
tool that you want to look into for that.

> > > 5. USB is power-cycled on boot, which is a bit annoying as I'm
> > > booting from a USB connected disk. IIRC CrOS kernel 3.10 wasn't
> > > doing it. Any suggestions where to look? =20
> >=20
> > Is this really the power going away and coming back up? In that case
> > it might be a regulator that's being temporarily disabled during boot
> > and then brought back up.
>=20
> Yep, this exactly. I have fixed it already.

Excellent!

Thierry

--rzlri6yqgo2fbkz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdRi6YACgkQ3SOs138+
s6EcUg//RatfIdKaLAmw0q7ViJucp/iowvMvRaBw7o5rnfDfP2kfx1B8R+bLtSi5
hWd0tJS8A6ZEUESsrAHviXCBOLun2/53VT38ascolkhsYxwSAjmgZSWPdtuuE+C6
m04/hiqSCN2nVhiLsUcpBHcLYecOk1R38N/EMRnDZzD9mueaC9rsHXmyhVI4MWmb
JE94vvu0EnCy49Tr3ztvUuiGvQ6LQL7jvDJvWlpLsh01zis97XDZSyNXK56zE65r
gGsbw1+8f40l+IZ6VM1K1yb69jdsDch2++Tur4ODoEFVTvb8CdYz2+5rtHgM9sLy
cztladd/8mCXYQ1rCMerK42h4bf0UThza8Ytr8hQrS3TLA2InEhX2Zj1dk2aPPcl
eCUdpMDbY8bkuUFr8odTdlgzcSaSM/hF6nKLDqoaIc0cB/8por6twM8mPp7o/Xki
cv5jC9PX141xfYNXrH/KTC5o8I8L71Wvrz5EHeKD8Y+TaU0T86kQjX/mWFe60dzz
9dxsH75Ng429RROzuhwdG0aUqZp4XUPhtkaTPuBFtACgzSImh+9zJqpTFI1a0iv8
/y+n34dNJL85x1B8iYrhO1XEAEMeXFKDDKyATPWEZRS7jY587zaghwKYBkM8ca2r
+ADjaU0OeRG1FD3Y/YP0ZFHCuG/z+lEomQmfp1fNBiEzojqF1EM=
=oNzq
-----END PGP SIGNATURE-----

--rzlri6yqgo2fbkz2--
