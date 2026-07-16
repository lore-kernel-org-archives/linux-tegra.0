Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D72F3D8127;
	Thu, 16 Jul 2026 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227985; cv=none; b=Woyr67dX3XlVJHQpKOb1IcOUTcOellQjQsf8PYBe/Tb0DZWik/Lrhuu3gSVKIRPIQzTNzl4y3jaYNT+LciAxboj0ZliunpoGB0FUDKZ99L2OMduzxcR9iX3I+zVwd3ECONCyRe89LmkNIhBpC5ClXKnilbppFR6fclrdzuqEAWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227985; c=relaxed/simple;
	bh=dPnwI/m+/Fz+CEN39CZXQ/djkCzKjHz0mgY3rLZdNu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6so2Bnn04XFIPoMfmfUqr0hzic9VMb98+EaiYGkyksKQ2jqu3UP9Jxi97exW0f2XUu1CokAiCOXhk1JuqyX61lxUCRYufGAWv+C7gEVlPDLYAvZNEloF7GNFjWWTyfu+XIMmUbwJS12G/JLeTyfg7hG0yTst4y0aP2nqZlo70E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YU8sECwS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YU8sECwS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFCB1F000E9;
	Thu, 16 Jul 2026 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784227977;
	bh=LaeiMEfaT45OOnmGBDreJm+Fw+G19mb/94F2DFNupX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YU8sECwSod2VeXQiI1az1VlJihSIB40jx7JR84RC3pAtSkNFvZkSQtUbaFPq94i/j
	 r7Co4ZdkpVUWwqtws4Tkl+jNl5RJ1aCJfBFk3cJZu9C8CtlHcTixm5tV8jGzVnrL56
	 G7VdRIL99ihZ7fFuiV4sWMgNGUGll+XT0oMxnTjOrvDmvZ/eerIC0w93CIF+Cr9UxN
	 HVABdxD4dr9fj635Askh8LA5bCq65WplzfC1xYwoPQ/3luVCYwqcaGubBVpK50p0TG
	 nyDLQAg2DJwxKRG/dmAzPNkhxNMfbX0qqzrCuh6XC54MUEwiDTg1y5q1/KMg5OCKrt
	 oBuidGO5qPFIQ==
Date: Thu, 16 Jul 2026 20:52:55 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Miscellaneous fixes for the Host1x driver
Message-ID: <alkodFCXR7fqj_X9@orome>
References: <20260609-b4-host1x-small-fixes-a-v1-0-7c1131c0b3ad@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7plpwo6d7g5gq4wo"
Content-Disposition: inline
In-Reply-To: <20260609-b4-host1x-small-fixes-a-v1-0-7c1131c0b3ad@nvidia.com>


--7plpwo6d7g5gq4wo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] Miscellaneous fixes for the Host1x driver
MIME-Version: 1.0

On Tue, Jun 09, 2026 at 05:09:16PM +0900, Mikko Perttunen wrote:
> This series has a number of small miscellaneous fixes to the host1x=20
> driver.
>=20
> Patches 1 to 4 fix various logic issues that are unlikely to happen
> but technically possible.
>=20
> Patch 5 fixes a return type from unsigned int to int -- no functional
> difference.
>=20
> Patch 6 adds makes syncpoint value arithmetic explicitly wrapping,=20
> mostly to help static/dynamic analysis tools.
>=20
> ---
> Mikko Perttunen (6):
>       gpu: host1x: Wait for timeout worker completion on channel free
>       gpu: host1x: Avoid double device_add when clients already present
>       gpu: host1x: Fix offset calculation in trace_write_gather
>       gpu: host1x: Avoid stack over-read in debug output helpers
>       gpu: host1x: Change pin_job() return type to int
>       gpu: host1x: Annotate intentional syncpoint wrap-around
>=20
>  drivers/gpu/host1x/bus.c           |  2 +-
>  drivers/gpu/host1x/cdma.c          |  3 ++-
>  drivers/gpu/host1x/debug.c         |  4 ++--
>  drivers/gpu/host1x/hw/cdma_hw.c    |  2 +-
>  drivers/gpu/host1x/hw/channel_hw.c | 15 +++++++++------
>  drivers/gpu/host1x/intr.c          |  5 +++--
>  drivers/gpu/host1x/job.c           |  2 +-
>  drivers/gpu/host1x/syncpt.c        |  7 ++++++-
>  drivers/gpu/host1x/syncpt.h        |  3 ++-
>  9 files changed, 27 insertions(+), 16 deletions(-)
> ---
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> change-id: 20260608-b4-host1x-small-fixes-a-081cfea2c073

Applied to drm-misc-next, thanks.

Thierry

--7plpwo6d7g5gq4wo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpZKIQACgkQ3SOs138+
s6FPvhAAmH6nr3iKPdhnASwRHNyOJfSVLgLtKAlSbG0Db06/7cfH0uK3xpGOE5iG
FCNPQ9O2RxCtutWhSOl+Fy9OchoOe/JxVqenzoF3UL+8DirxZtGQzV1HZ1tC8FQU
D2FU2oDNjNHYom6f3teFhljrsgEfi19VOURpS1EzJ2SkNRqQmRWqaUaBA+7OtKDE
6P17AaaTuKGPftrFDGMmwMqEYMosmEYNp/n6GfSBEpLVSB5vnTmBQpPujl1Xj7W3
pLZZtlk+BH/WJhnk7kVUcjHzkpKcxJ6hzD5dOa4Q5KQsiA+lJNvqwXsM/mJLfGOK
dG2cuxrv8oz2MLyWX2NEJKLpjLPCmJoAKXN+xZGtwc++VfU3nmxwhrAqksL8FdKa
MjEKgQQf8h+qZbtN2sADG8JYOjt4aA9vAYZxHJxD8nBL7C6jMZKscMjU4xHynHx3
Y43Lz49t5q5L9EYvDRE0LPWqphk5qjC04kUqOCDGQiEp4RrJfLy/Rs7QN04JreuA
5iInv7xJW3OEt4xdTl6ojbzYgAd+JMHHYInmG77FX/5eqtmHGHHsLGLk4oFLZJBU
1nh5rbXScClpRAci9SQe+ThlR8zAeRmwa7UggWLVnPlzsFQadBe8XBIi9+s8yjL3
Frpu8FuitEIrf282M2Etc49tZsMJFrTN/9OpT/1uxp+A3IUwgZs=
=8bVZ
-----END PGP SIGNATURE-----

--7plpwo6d7g5gq4wo--
