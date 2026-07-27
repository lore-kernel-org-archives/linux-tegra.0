Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD8141D202;
	Mon, 27 Jul 2026 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167905; cv=none; b=W8k04g6P6G2XmZAE/xIsDtJL4OuHznbVSpp/pVOGqnISh4+AywC0p1wH9podjU0D3n422hMphUJkaR0v/XquvCJbHE0n24N12x6WRrXSbyq36obYMvR3807aWRPGcZAxD2aqmq6fcXUuxBmUZLSGWTprNvG2Fb/dTxX9Vryuq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167905; c=relaxed/simple;
	bh=5p3eaphxU9EhTLrUu2sAuCF7Wg4reK+MR7/rz3J33Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lG0akCvPwrM1z5Yd3rl2n63QiNbJFVY73ksXKB4YQEr80tIKDtczRQd1bpIjH10c/U3sk2Os5ML7hcJPUzocpBR11PAFIUgEEyUw4ZdOrWIoczqmJL4Cz00apd2yjqmthMFxczHwYf5gSI6ccNfQ8b/sp11lWFBepbkWobbCCrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6cc4uYR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6cc4uYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409071F00A3A;
	Mon, 27 Jul 2026 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785167903;
	bh=LG6nBmSSjApXoo/jSzVAfEKwvSRC4xMRtG5lqY/DStI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k6cc4uYRr/JtfRQ7iSwfMXqJSHL3HL8ixWstOC4TV83uq/eu8gLYxClDtZzIm5Vhq
	 07+uhXvEDd2QCQ2C39bALdU1MZxhAX3vQsa653VzI/jrQhWArt9iO1PwTUOa7o6PYF
	 W1PG24aSSgh/eBmHbiOcgS24J9NvNsdKxOG0JNoJvy6Xt/le6UgaPnw3FvPQ4wa3mP
	 R7DSAC8Feoge1C/3+PWcazX+sD0cTAl9pdQukT2Im8AgwoJTr41KkwKX9AP1ZFGtqV
	 VmmyvkZGQ2SGQQEfgibJ/ktxDrO8dbacUwh/oz/MVIPCZ09lE1Q6+o0lZw4ut9PExY
	 uhjMjK7OBXaPg==
Date: Mon, 27 Jul 2026 17:58:20 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	marvin24@gmx.de, linux-tegra@vger.kernel.org
Subject: Re: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp()
 with magic length
Message-ID: <amd-EkmT_H1xlm7Q@orome>
References: <20260723161823.23921-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vmhzzluxhqqzyle5"
Content-Disposition: inline
In-Reply-To: <20260723161823.23921-1-iprintercanon@gmail.com>


--vmhzzluxhqqzyle5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp()
 with magic length
MIME-Version: 1.0

On Thu, Jul 23, 2026 at 07:18:23PM +0300, Artem Lytkin wrote:
> Replace strncmp() with a hardcoded length of 30 with strcmp().
> The bat_type string is already null-terminated (set two lines above),
> so strncmp() with an arbitrary length is misleading and functionally
> equivalent to strcmp().
>=20
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/staging/nvec/nvec_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I don't really see a point in this. strncmp() doesn't do any harm and it
isn't misleading either. It's just very explicit that it should never
check more than those 30 characters that can fit into the type string.

Technically res->length could be larger than 30, in which case the
memcpy() might copy more than those 30. Judging by the nvec core code we
never sanity check the length, so even that memcpy() could be entirely
wrong.

Either way, this change by itself doesn't look useful.

Thierry

--vmhzzluxhqqzyle5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpngBkACgkQ3SOs138+
s6H+Fw//Wmp1qIqT1zWam2BYIGXCmPAo4FTI6yde4DZ2lyxXncF94w1ijKRE4grD
ahPCG2WKTX1wbXyYfaXlpbJYrtDAEcio990FFfmbJHgAz+625Kj/XunCORuNY9zQ
jUlK53JdDlIGABEqZIpjxxclHwaGCu0fJeTZXKu3gt9lInyZKUChXqxpFTLTsB9A
lpF0kjj4ijneaMh3LSFZjmPrsmDdGTgogG4vgN4AkKiHuFdrojo9Vy6BjtCyzmJX
iYMgIxD3/1jcbryJ/TKNxwXoOXyW3ilNADy2hYmvkZeUxWOPBAtu35kLZSDKPyav
iooN167DZ91bsdKHyXbQdyL4acjX3f1JXZtDUurnRT1d4HwmTkdSuTjsrhrVUOdw
+UUq91jW7WBNDbbAsEsdn4zLlYzFsHRnKALv1qdlR/kRvBkLN35+bibEF+Ok8ni4
nFmMj94XomjvTCOiaJVojX1KOIOWTpKQQr5uKS9QU1Skrd7HInUchcjdwAaWEfu1
5RXhH6zPa+J8SEltRN6Kk7hdQWKKQ7nCMe0//agRBzGNa3gbgJ44wR29FcDX0EHq
wcUjgZ8/YTG/I5AIoptWfv+zlluHDjqU/qnhmEu00MbD0exo8ERLrUMW2Kvhq/NF
sPVvpVakkpnEP+MELHO+aeqvb0y6OPP/y7CnbcBr19jXTrRJ/5k=
=Mkpx
-----END PGP SIGNATURE-----

--vmhzzluxhqqzyle5--
