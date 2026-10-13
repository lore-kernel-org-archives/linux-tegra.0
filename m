Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E6A370ADA;
	Tue, 13 Oct 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907414; cv=none; b=kl6gpEPn6tgUVFZU5Mq0auFlNrUY3OlsnoMRFwe2D63XOK5U/Epmm7Uf7LO7it5UfwbNUpeDDLZg2hPlTbFx5QB9BMMJRinGH295MTVd7tJK5kPR9xej6GsOFnX1UbcMbVdlhxKC++Yttka3Nmh5ZiHvganIGSVgzcMuigC9fbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907414; c=relaxed/simple;
	bh=5WHoeUINkgZunqY8JUIYAZgXEPU5x9iKF8csd5FaLyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SN2Zu//SAimAR1OrwIdFykmi9VydW0zQJimE8Y032a+RNF7Lg7J/H7m8eT9yv1nwiApJ4wCOS6yhUe0h7tueCKQRsHLXX4kQA4z1LywQFZbjK+lBqLyyMOJ2b1Jj9MM7J6n/5cPiMuNCbTjlwS1ePnT6r9s6GJb8a9pDLN6URxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFJaatkP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFJaatkP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DED11F000FF;
	Tue, 13 Oct 2026 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907413;
	bh=s5v4uxkqBN5uEW7jS4QQBdALy0qidx9Gwm7FyQCTQOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HFJaatkPM8P3cKdqWx5HDHGyETlugYRtbcgnLGwDC6vfCzWcX5P0Po7bYmC/lvJ5R
	 PZA9DERac7C1khJvwdImHMR59mJOSfzzUCbSOHxZXw1zVeHgq3eFORAZEiFcFFYL3N
	 pEe2lR+ThCluEaX6c6zh+/cXTCL9Uz05YY+Lpubb3rfXYqzkf3Q1Tubij+K+H3lZni
	 du/zHBLyRt0FP2ma+7bHpzECLZLhtx4HhX/UbuT73M8ZkkVPdbHtltBAOWyXl0vmWb
	 IjRz6ptv0jI2J1ApjhCYWM8xCV4TE2GZxyKzG+DDHD6O/HdEYyCJX1zVMRUWtEmsKK
	 OmOs4EW6yLA3Q==
Date: Tue, 13 Oct 2026 18:03:31 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jeremy Clifton <deaner92@yahoo.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, Marc Dietrich <marvin24@gmx.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: use guard(mutex) in nvec_write_sync()
Message-ID: <as5WES_Ec2KGWQsm@orome>
References: <20261012171312.5998-1-deaner92.ref@yahoo.com>
 <20261012171312.5998-1-deaner92@yahoo.com>
 <b51c3755-a967-3de3-5f8c-3e4984d6e93c@inria.fr>
 <492e9a13-b50b-48cb-bd41-3114573c7950@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzewtzrna6tsl46x"
Content-Disposition: inline
In-Reply-To: <492e9a13-b50b-48cb-bd41-3114573c7950@yahoo.com>


--hzewtzrna6tsl46x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] staging: nvec: use guard(mutex) in nvec_write_sync()
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 03:41:48PM -0600, Jeremy Clifton wrote:
> Thank you so much for your guidance and feedback.
>=20
> It is the result that the patch will produce. All the unlock calls will
> be deleted and the out of memory path will have no braces, as per
> the style guidelines.
>=20
> The motivation behind the patch is to defer usage of manual locks
> for new and improved guards, disallowing lock leaks.
>=20
> This way, there can be no error producing path by not calling unlock.
>=20
> Shall I send a v2 with motivation included?

Not a big deal in this case, but you might want to read up on how to
properly reply to emails:

    https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

Thierry

--hzewtzrna6tsl46x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOVlIACgkQ3SOs138+
s6Ey4Q/9HeWRPuZBHvX53s52PXGTjx7DIALN1o0lQS3b1+MxhUlcETBj+3LrS/GV
zwtBFcTdqMirW9QE9n+dScPrkSoxRCuX0p5BBpMMccYd3f+S3yMCHGCQ6Sy33qQb
B59hayWYN/uxCo8LkZfeNgsOr+UDJ8nJuLehH3/OBz+ya86RJ1Jaz1kQzcDIBVEq
dHR0NPKdcdCOgJYTaq0v59GSCavBAAGepGfa/3HOEZUPf6d0u8iy4kJbGH1dQff3
JZbvseri/M6ONxcXq1DO0+TNMa99QX0gJMVXF6HCmsCot93v1/7s7iwlYdewjebM
00brAb7yX0PrtraFf840pKf4Fy8iQ2M4a3/PwYpjBSDKP3oBlV/aVXjBJLMTGFrR
qFN+mDTEGwt3Sz5babpmvXmWxchkwO05ayoTrOWxy4QJQ73blJbmx7l5EjQMl+8/
4lmQWug9/KfumoKnex73Am2YYNQDh+bkGks/FjvSsBVy617F07fX3j4TdN+n40ME
qn3GmAxFd31vK78lqASap7xG764Li9IBKn0Wt0LIzUfH5IJnMMb8weFM6VxvcI63
5IuEAoqCRgz6YaNw8NnNkjvvcM2P0neW3/FHAsjYZcr4rFh3izw/UhfV+fR7CXuf
j56BBV+TN8hqoNvtfgUcNXTHfWGwhmCxHcT7fw/BdJfgy6xFJBE=
=5cEq
-----END PGP SIGNATURE-----

--hzewtzrna6tsl46x--
