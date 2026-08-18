Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583713559CA;
	Tue, 18 Aug 2026 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052621; cv=none; b=X7Rv4oJk/GHJiWe1mYbz9mjZd8GWqp8RcDRag1WL/6x/z/3rBLxP00fvoe9LoahysZv1pcdgUJAUnXnZGkE1EAN7lSpngBmnzVS0zyjmPiMOI6FZqzRGl/zqKAE6OP6uP7LSfE5k/1GxlVoR1yWfWtapGh0NTV/e5abSnhg1msg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052621; c=relaxed/simple;
	bh=DvOl4SmIrNXyBesDRJim4Pakwy9PJ+ZCze/fbT3UOLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPwbBlwGdrNAIO09oDfHQ5Y1k5gQTwfSwWyFjflm32WWrwm/2sZiLvaw1ySqqBAoPYNiojc6QaCPhkFsMDBdjpikBS5XmRZYWz8AlI+VOTjE6vuJqkOEy6OcLhdIoBUCQ07JAi/1VWKyA3s3VHCk0csA9K1sJKMO2heInwj57OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQDm6Qq4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQDm6Qq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509341F000E9;
	Tue, 18 Aug 2026 11:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787052619;
	bh=bNsJXcKrOe0WH5qxBsUVCSZqy+dHuSR7UenlMjhG3/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZQDm6Qq4gr2ynb/PXGjY3F3JiIrnmfpj/kAabzThHjRiulSSTbhvRpBeuAEQmpOSx
	 7dTfkD3ILk1djtejv0OLffKhF5dEePNqvfC1fX/GqkrgsfsvFujiuLpqUfugO1t6YJ
	 e7CA6p8BYZ3Jc70O/3EtRc90tJ6u2JYTEJ/aFjFX0GMAsj3oslaRlBwnlSPY/YXqLu
	 E0HiU1DnFGDQejFe+6v9vq1MDJS5wrZBkRZM+vu9y0FagjQ/8orVPyVc9a1wu3dPM1
	 d0g1wUtAui1JfiFmQEv26tvFztzWEFEpKC/ApE4k/UuQK50FOgOmEQ9h9A+fx78VeA
	 TI0eGHnC8WsIg==
Date: Tue, 18 Aug 2026 13:30:17 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: tegra: bpmp: reject truncated debugfs
 entries
Message-ID: <aoQ-lEhC6ReM1eMS@orome>
References: <20260814080548.22922-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uc34rosdthk64rgr"
Content-Disposition: inline
In-Reply-To: <20260814080548.22922-1-pengpeng@iscas.ac.cn>


--uc34rosdthk64rgr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] firmware: tegra: bpmp: reject truncated debugfs
 entries
MIME-Version: 1.0

On Fri, Aug 14, 2026 at 04:05:48PM +0800, Pengpeng Hou wrote:
> The BPMP debugfs parser reads fixed-width values and bounded strings
> from a size-delimited reply. Its fixed-width helper currently treats a
> short copy as success, while the string helper advances past the range
> when no NUL terminator is present. The status helper also uses an
> unsigned return type for negative errors.
>=20
> Require complete fixed-width reads and a terminator within the remaining
> range before moving the cursor. Use a signed status result so errors
> reach callers unchanged.
>=20
> Fixes: f2381f652266 ("firmware: tegra: Add BPMP debugfs support")
>=20
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260715083726.30740-1-peng=
peng@iscas.ac.cn/
> - no source-code changes
> - rebase on the current Tegra firmware sources and tighten the commit mes=
sage
> - add the coding-assistant disclosure
>=20
> The bounded parser helpers and callers were reviewed statically; no
> malformed BPMP response was injected.
>=20
>  drivers/firmware/tegra/bpmp-debugfs.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

This doesn't make sense to me. The seqbuf_read*() helpers already use
seqbuf_avail() to make sure they never read past the end of the buffer.
We also leave scope immediately anytime we see an overflow.

Worst case we'll see memcpy() copy 0 bytes, as far as I can tell, and
that's harmless (even though not entirely free).

Thierry

--uc34rosdthk64rgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqEQkYACgkQ3SOs138+
s6H62w/+IjauN+ojTmNxphSm9842XN0w8yIvS4QB+29wH+S6H8x3g9fcGRbx1oIq
RNMDjnW8QFUPK1c9YtAuB9BLrdcgFMDBYk50F64xQH0VLkj9/siEcMMjGLIZJxVj
iKTq+OSxtvM6EWr7pIXAuTFuyaOl7UmAydTB4UR6mQtzRE30a1R8jUjABBkccP5M
OZjbqmkw6zLoYn1syTPpYpxWe1IKABSrZvKR4dQLf0LCk9gmIohjpWWtXa4Ca1U+
Fm3ste3ZK5E4Cd8k8Yurtr51k8v0DSDbLyv7QNXh1IbkxFcu6tlpKTLoIInn6KHC
GgDnFiETEPl4IIVaeo0bbDWP0hYRaDZvf6sOHvtnPJFeoG0Oj08PWm1GFNjnDQd8
l715ADwmXBaIWsuaCVrYx5KjsQwPFHkgLReKqZ6JZRZmOOcJ3YxxWQolRRHBbZsP
WDaCoz66BN/qOWc1+2UpxwQaMSAVTeLQNCNNypQsSniKBp8gu8nBjJranUJO5yPP
iQzDcf3cvaVoVtOFIjABEXc1bjrqcX9iQe/rJyVBEuHBAhamqY5Q3biUE8harYGG
/W1Q6ApuO1n0VY0TfukGykFUjZrGKGKL1dyy78Mv9O2bxfcdNKlhk9B8cGMyD2lf
N+yC1oM6cOcTvK7Ulj09NIUkP4+vf5kY9rD7Nu+vsjgulcTcu5c=
=qqHM
-----END PGP SIGNATURE-----

--uc34rosdthk64rgr--
