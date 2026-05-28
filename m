Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4872E7386;
	Thu, 28 May 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980453; cv=none; b=oy54IscPYiCXCydt8nO/gozEDZ+qQRUOmmNuxrfDt7T4Eis8hjtDsPOuIoI4GmtyWQG7+BwmAHHCWWJLWicKP8rnV48kVC+ovpryTcXQ8pXV14BY3jRVA/bV8MxwphpN5Ba92JmlOaOui1JlQmMstNnMMIflMW+tWmvrvw1h+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980453; c=relaxed/simple;
	bh=C8+F947I1fjn97oClLWvSCKMl0BytmuZpN6zhPxCLVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkhsdZQG3ZztNK3MWWAznH6z/3kGC17EDAxPihqdGqanQ3iUMthjIBhmZYSILONEhjD3MZ+5qS11sUnqBrNYQj8xhAD86GR/uVK+DsdcKM+L12whqC80fl0QNtnvCBAhcLghpI/bKZIQIJ2D+mf6k3AnuDZedFhSVBfry/nOEFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW1cG04q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW1cG04q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609F11F00A3A;
	Thu, 28 May 2026 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779980451;
	bh=fEk+dJ1SWRk5UPrfJPRcYdVOwkCaI4AUWGG1t43aaCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CW1cG04qRzIGkj9JLdFQPGug9g7zNvY5LRdI0m+2XXVJT2Qf8oj/J9kFpv/AyOwf0
	 1WL59SnlbHEmdfCxW5X+Q8tN7+8rgFymgMB9xQqsnjcPK5/sGSz2XUvnV0zrff2xY7
	 NvYothYVyiTjK3S458314Vw92NC5OQMpvX3gYH7OtBXGG7bOW/ubJQlURntSeyMXpK
	 K8HlW9Z5uKWhkS/qLpno7Ejwm4nDgHygAzS9pg3yeINh6IRtuyxSOdJ2N6NN67WPmU
	 nqzIXzGSAv3pDDY6YDIXcqzMiNDk5NxeO2jS921eQJQ4qSduztXX02OH0jm5mgCwhU
	 NTVKO67WjEKhg==
Date: Thu, 28 May 2026 17:00:49 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	simona@ffwll.ch, airlied@gmail.com, mperttunen@nvidia.com, 
	thierry.reding@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpu: host1x: fix missing
 'host1x_context_device_bus_type'
Message-ID: <ahhYZtcmggWzUrbI@orome>
References: <20260123140512.609167-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rcnt2e3b54rlmvwc"
Content-Disposition: inline
In-Reply-To: <20260123140512.609167-1-ben.dooks@codethink.co.uk>


--rcnt2e3b54rlmvwc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] gpu: host1x: fix missing
 'host1x_context_device_bus_type'
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 02:05:12PM +0000, Ben Dooks wrote:
> The drivers/gpu/host1x/context_bus.c does not include
> any declaration of host1x_context_device_bus_type, and
> after including "context.h" it also showed that there
> are two definitons in the kernel, so fix those two
>=20
> Fix by removing the definition in context.h and include
> <linux/host1x_context_bus.h> in context_bus.c
>=20
> Fixes the following sparse warning:
> drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_de=
vice_bus_type' was not declared. Should it be static?
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> --
> v2:
>   - removed fixes line
>   - changed to include into the c files directly
> ---
>  drivers/gpu/host1x/context.c     | 1 +
>  drivers/gpu/host1x/context.h     | 2 --
>  drivers/gpu/host1x/context_bus.c | 1 +
>  3 files changed, 2 insertions(+), 2 deletions(-)

Applied this with Mikko's comments worked in. I also updated the commit
message a tiny bit and added a predeclaration of struct
host1x_memory_context in context.h out of an extra abundance of caution.

Thierry

--rcnt2e3b54rlmvwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYWJ4ACgkQ3SOs138+
s6EbGRAAui5Bi4kM6mv6rFbyz+VQwQSr4SaU3dU1ETZoZwUrXoJrh+hoXWMzTdGr
arc6oabXwYy4BA5279dtwqj05gOUo+x7KsKLFb7beRq/qXfM38hJ4EdU4cTBuREh
CLbhy2BUBxrsR+7G48hFOuXojejxLyB3j9R71BbYlGHV7NpZ+3LOooqF4ZOFMFUR
W4mFzxbcN6tM9G496+QiEQJnVaQQiNGH6Z/5lo0kxwQn9tOXAN7zRX9lI2ozbMLD
sJLkoxteh902M2r9UiYUP1gyGYzb1x72+i91euij20lXUd+4vA45NXH86xWryphu
ak6K9stgpQrXgkjJgriVw2iyIoQCX37lcnNfSllQn9g60JB9oJpaNW1OcDS4qT2m
RFsxkxBcGW+TF1KSh+yEgqeXC477muvnyay4spNqXGDkB3hGo06HUOSbELH7OyFK
OHAIus8aNSLgfSqrChy7lhWFEMIbuJWADqtEN6MfU7uGFWqjbyGzUPfZE589aYdX
HaxyFQXcBwbTXGeqG6UHE+CDRGzrQX7Sx2k6F2uVxPrUIh6yeCtqZmaxc57JSrf+
/ieAvyvvWChOOuyVDKM7Egb5h4JYjwhevnRD3yj6R14KcsL05TTdelxA+GLtcDf3
CKRCamoC8c+SeWf7xDfHaWPXNhihD2WAOW5jXsyxxZxcOUXVfFo=
=4YbH
-----END PGP SIGNATURE-----

--rcnt2e3b54rlmvwc--
