Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FA951DB04
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906983; cv=none; b=XyUDiNmhYh87z1/opS7ta20M+s7imZQTqf3b4bXtce3nfll2n8epKDnc4atKrhqDThWq5ZHRYjbK4kngZt3MMFH0ydonldNIsxdhDnLnZDhYfZsPCspEhKX/5wFPFnKFoyg17t0swcIZPW1qx3E81AL0qa57kjqZ05Ury2pQAi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906983; c=relaxed/simple;
	bh=Px+SYY6OQ3VwKAESTknEjRL2REhoUTrz34NNEU3Y/KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXpOVrZRY3+DE0jrJ+U/zMTyaUSi2m/gX+eESz+lDvTmTC2LK800WjGgbJQy09MfY6IqWWw7utJR3FFkGliWtNSDotfWWh7gv6NgeiGN2IkkX69ls/FOVryaf46auPcWcqgavDOTNoQ5nlH7VCp/tz79UAFhMOWWnKjuNzjkwhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmwDMNEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmwDMNEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0FF1F000FF;
	Tue, 13 Oct 2026 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906982;
	bh=rE6QkMfYCe+RrphLCAUELCRN9FLvMmyJTEZSB+tWcSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GmwDMNEKDA12CApBgXR1ot0gUIvy+8+b4kDD/XsLl7QrmK2Hu3gthqwBQyCBhAYKd
	 pPVTcXMtJYy6S1CzMCnPk4u3uO0p2Kz+4GgcqtO9WtsQAKc224iItkIpxHAqv/BrMI
	 qV4bgIu8d9iaA8/rzDX23zDyRFbjr6lRbt2tD2ZRJ4WRz1/2gA+LvFLJkyzkcdHlQ5
	 /Rh9NJMXCjbtxDdGzdsa9mz3uKdFQXAn8pvoen6rEZLhV1Qq40m8Qzn0Ac/enyfuwS
	 QgJkpnKuBedPcCFYLg0p8lbrAkvDfHHY5KcTtqreU3Soo8JdWT/bWWgjULiQF2KhXh
	 2HxUjPWWhwSLg==
Date: Tue, 13 Oct 2026 17:56:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Aaron Kling <webgeek1234@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
Message-ID: <as5UbMrupLKub49y@orome>
References: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <CALHNRZ8PcnQ7mHwpvJwk29N0FvTh2vqZSBhfE4ckf=78NkKEHw@mail.gmail.com>
 <aoQ4he4rBJSTPBbR@orome>
 <BMe1VOJ9Rf6tF74Mkc7tPQ@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7bf375a3chnjy7d4"
Content-Disposition: inline
In-Reply-To: <BMe1VOJ9Rf6tF74Mkc7tPQ@nvidia.com>


--7bf375a3chnjy7d4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 05:49:40PM +0900, Mikko Perttunen wrote:
> On Tuesday, August 18, 2026 7:49=E2=80=AFPM Thierry Reding wrote:
> > On Mon, Aug 17, 2026 at 12:17:27PM -0500, Aaron Kling wrote:
> > > On Mon, May 11, 2026 at 3:02=E2=80=AFAM Mikko Perttunen <mperttunen@n=
vidia.com> wrote:
> > > >
> > > > On Monday, May 11, 2026 12:05=E2=80=AFPM Aaron Kling wrote:
> > > > > On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek1234@=
gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierry.=
reding@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> > > > > > > > This was originally discussed on the freedesktop issue trac=
ker [0],
> > > > > > > > but there hasn't been a response there in 6 months. So I'm =
reopening
> > > > > > > > the discussion here.
> > > > > > > >
> > > > > > > > * Nvdec firmware. The driver has been in the kernel for ove=
r three
> > > > > > > > years and there's still no available freely licensed firmwa=
re to use
> > > > > > > > with it.
> > > > > > > > * T234 vic firmware. The driver has supported the arch for =
almost
> > > > > > > > three years and freely licensed firmware still isn't availa=
ble.
> > > > > > > > * Nvjpg firmware. The driver is awaiting final approval, pr=
obably
> > > > > > > > worth it to release the firmware with everything else.
> > > > > > > >
> > > > > > > > * T194 nouveau firmware. This does not have driver support,=
 but there
> > > > > > > > has been some interest in working on it. Making the firmware
> > > > > > > > available, even if it isn't merged to linux-firmware, would=
 be one
> > > > > > > > less blocker for someone that doesn't work at Nvidia to wor=
k on
> > > > > > > > support.
> > > > > > > >
> > > > > > > > Aaron Kling
> > > > > > > >
> > > > > > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> > > > > > >
> > > > > > > I will continue to look into this, but it'll not be high prio=
rity. Too
> > > > > > > many other things going on.
> > > > > >
> > > > > > After some discussion with nouveau developers, it was pointed o=
ut to
> > > > > > me that the gsp on ga10b doesn't do much and the setup is more =
like
> > > > > > prior tegra gpus. And that it wouldn't make sense to support ga=
10b on
> > > > > > nova. So I would like to expand the request for gv11b nouveau f=
irmware
> > > > > > to also include ga10b. Perhaps not directly pushed to linux-fir=
mware
> > > > > > until they can be verified working, but made available so driver
> > > > > > development can happen.
> > > > >
> > > > > It has been over eight months since the last response. Nvjpg driv=
er
> > > > > support has been merged in the meantime. Has any progress been ma=
de on
> > > > > any of the firmware releases?
> > > > >
> > > > > Aaron
> > > >
> > > > I have the multimedia engine firmware files on my todo-list. I'm
> > > > planning to send these out after Tegra264 VIC support is ready to s=
end.
> > > > Unfortunately there have been some delays in that.
> > > >
> > > > Mikko
> > >=20
> > > The Tegra264 VIC series has been picked up into -next. Is there any
> > > update on the firmware release process?
> >=20
> > We're still working on it, it's just taking a really long time.
> >=20
> > Thierry
>=20
> Firmware files for VIC, NVDEC, NVENC, NVJPG, OFA, and XUSB for Tegra124=
=20
> and later are now in linux-firmware:
>=20
>     https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa=
re.git/commit/?id=3Dbdeb9f0f93f18d10b281217e66e81838527ce55a
>=20
> Thanks for your patience. I was about to lose mine a few times.

Thanks for pushing this over the finish line!

Thierry

--7bf375a3chnjy7d4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOVKMACgkQ3SOs138+
s6HdlA//RmzCXm6c3tqJ+PpkKipsXDp/tKTaF3DV5jtzyEzZI5UU2DZegZBVhJXG
elz8L4HXCWDlHzpG4QbKHmmLd9Ejk7xJ5h2MGu1SHAAyaRZ360274d1s3WGapS4f
1PZyc9NNk7aTD4vg7ebrBGeePvlvqCjMJEykGwD/OTbEiOGVDVzRYGppLYq0y6iY
rja8M4rtNlXGEnTfQgEG3Dx8LvrDz0pR5hyjIRglmOGFPY9kbcvrfzxcuV2iD0iK
tDgtNVNCDuJoyF+taO2DQuKB8WrmcDhpxxC01g2z4PAq8lkt2lPwtk2XItqEpA+Q
TS7DjVGnBW+cqdzMLRBfJVLumWp/nBWJT+XJm16tRMJZkjrKt7F7atQzzfQeZ4up
3Yrfm9+PuGKCHAWRiyeB4GbuXP1Hut3Mu8q1U32PoqJsz51TbAx6gPKnNjjoMONg
dBMd/dUP9p8Hgn9tAaeKadlAqLaE7cUMLJSdPlpFLgyBYlD/8LTcFQT7Zs4ntCdV
WXJngq3tFDsmB3QMRCv7W+w3MpVsAWkD+cIajDI1CWuwujjPrj4/u4TmhAgsQmqX
vYFeB7njVuwyDs+eqFyfb+cZ7gko0YoJ3oM9TvSFF8YtSY2DO9PAkUJEiW2jxMgv
M66oJV7Q+QK0e6JZa/wSpA2zwYiS6gf7zMS3pkS9eFhx0YRT1yg=
=SZbm
-----END PGP SIGNATURE-----

--7bf375a3chnjy7d4--
