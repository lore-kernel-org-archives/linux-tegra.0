Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE134B1A5;
	Thu, 28 May 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975026; cv=none; b=alp4s2y8Bos6alMJDL4t0lqkVshfRMBpVsa2LNlrVPZCNq1sejG9LjYHUQjZTB8fIir2Gaz37oQ/EeCF9eiE0ujn1IsZGenwcyIdhtsP8z4u6bWR5DRJqYZufIkvdkxUCSppo3qHLpakYG+pZ9j3fn43HU3J1sLItrc9OHsga+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975026; c=relaxed/simple;
	bh=rRjo9QdIYAFH2t17fWfm0YKt3nkBEeg2K9oJENP1rtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hq6EeozDsU+0sNHkrIAmTcIE9IS4p5/jX0PCE3462SmMB8m6XcblgnIdEKZzJqV8pd/U5sADqQhwlTLgEEvHUlQtsLuTKN6I8pOCG6NCHiZpcARW5ZmRtSOikbbKuWUlYCDKIvckpTLK8wh28UMosNGa9vPgMM9rROt5QrCLMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnk/Iud8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnk/Iud8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DC81F000E9;
	Thu, 28 May 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779975024;
	bh=Y8rVMr4dqWUmgMWiltbXDUURPAIIqisuvdyrjOXRRr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cnk/Iud8BGdfiTt92TmGHO5r3e9biuU3K+BZGLeb+21QwVCYmjH0a32VKX5ASSMQ4
	 iEqTHcGpfDVBpSgQAj5xH/CcMItA+Y/btOQyJ6QI3xhUroq1yoWOCR7umnUfDjyPxb
	 YUN7J57pqZhfO0yC87yng22Hy5EH342KYL2K4AqJAtJIFG0hVKXgpNV5rdy+93kMLu
	 1bTXp8UuXy1+JJJCmQS8gwtqTzl+7DiltAMg0Xmom3D9YOcpuiAqh1Ihn/e8qtimFe
	 5Q9rAeWCzKsaJCmIPw2sQjEk0xvWc/sZEM6Tho5MmKelsOl1HobgLjpfUHAHuh1L4h
	 r1Ak8b3m9LyQg==
Date: Thu, 28 May 2026 15:30:22 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: shayderrr <darknessshayder@gmail.com>
Cc: thierry.reding@gmail.com, cyndis@kapsi.fi, airlied@linux.ie, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] host1x: bus: Fix missing ops null check in error teardown
Message-ID: <ahhDR8dtEJ7Fpl3d@orome>
References: <20260517170456.84927-1-darknessshayder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4k3tk77o7e7dsbxu"
Content-Disposition: inline
In-Reply-To: <20260517170456.84927-1-darknessshayder@gmail.com>


--4k3tk77o7e7dsbxu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] host1x: bus: Fix missing ops null check in error teardown
MIME-Version: 1.0

On Sun, May 17, 2026 at 12:04:56PM -0500, shayderrr wrote:
> In host1x_device_init(), the error teardown paths do not check
> client->ops before dereferencing it, unlike the forward init paths
> which correctly guard with 'client->ops &&'. This can result in a
> NULL pointer dereference if client->ops is NULL.
>=20
> Fix by adding the missing client->ops check in both the teardown
> and teardown_late labels.
>=20
> Signed-off-by: shayderrr <darknessshayder@gmail.com>
> ---
>  drivers/gpu/host1x/bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I don't think this can ever happen because all clients do implement the
ops structure, but since we have them in the code above, makes sense to
be consistent.

Applied, thanks.

Thierry

--4k3tk77o7e7dsbxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYQ24ACgkQ3SOs138+
s6GE9RAAgvpcWkFK3LA0tc8S6Ay0mqVowCASm5wwnR7UQSfTyo7G4sYivZ5w3/vS
vgmt0mzoJf4KcnPlJXksA1omYKekaon2i2NLG9tMfARWw9yc5C89TwWElQnFuU7P
ebuJMqWwrAyZ/9ic7MSOcDtzjdn0sgFWU/NT47R+Yg17HFxPV72xYAca2Y19KwGU
0Lnw2C0xLEOuXzCqwv2RTG07Ko8CcXvR/AsqTBeAWPBTE2M0KfxFgR4VjxJ8COou
eCvnpg2eeJnTr8pMbOCEMv+DPbvA7U3myvSJx36a8td7jA5yNZpirnMHWmKlOE/L
LeHPDBkatPz/69IxYvoG7XT5gbi+1zUEX6wy3/w0jrU+o7h4yi9PUp22Q7bdtTnB
7In1zcg/Q/OeIyP2A7vQfu374Nzvdz+MuHQXaUF04yiONy6SDH9OYvjEIjcvDkAe
BnKKgy4r7/RVLBEl4BQDSWLDrG2nwLfagm+Wy2BXkzWcN8gNLJiB8MtZWLtZsKI/
V0NcfML33MuqSZvr4payRjTxLsyaj+ApoeQq5HhPQRXVYKnxuhisytGj0dk5Xdlu
Ix/l4VgcPLTsFl5h9Hz8cvGCPbqmUUCRFC5V4L+uZCAtc1UWJ9rhAp9Cj4S/Zur5
8rU/9CFvZ+ENmQxqiEo9+2Wt6aj9Ze55Yt4RQlWv5r8HN9jhibI=
=Z7YB
-----END PGP SIGNATURE-----

--4k3tk77o7e7dsbxu--
