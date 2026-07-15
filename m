Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC07440D587;
	Wed, 15 Jul 2026 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116054; cv=none; b=S9rBkfj0sfC9xOhWn4sCvjpd398RZY+IAC33/xCln2mb/DPTZmweDfEoudYW4K71JdAna2ZCJvxPG9zJpmvp1e/iF81+6RRn2JL8waxwiioVA/Z4lZ/+brwQUmb/BSk8YpQZG5qOkiBVnW/oFPFUdWVOFKHqaOZ8WlCWUJSYHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116054; c=relaxed/simple;
	bh=eZlpWSHld5Rvrdk3/Ajw5tvn4ZhNaKEVyKVOhbAxjAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDAQ/Uj3dX3DBHRa3Y4Xkkgk9gPIMKRLuQa49rIE9cHqo6bB9etuqu+Qou8OqTFmGUYeFYsED2Zm5DLRRVoWWT9avTsd4CVmndnIe2wmBD2B3DI2qUQM4wa7YOln55/NXGVGDM/LzUVD9PW/MTXjoxcx3FTQKEXh4rk3ACFoTHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myuYFNRH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myuYFNRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE8B1F000E9;
	Wed, 15 Jul 2026 11:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116053;
	bh=gkin2yO+Dn6R1V4J+p7vT0Ru0bdex/UbOwzxkVt0Npc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=myuYFNRHQdwAwtI9s4sX1xUswDaDgQcjIQay9CfWS4Dr8tPpI6Q75SguhHo47mS4F
	 9mPEYyPFXRQHiaquzZkLNhwwg21ttUZ0b2iduUwI4B+V55rQYJySZY6JGym0P0w5Zt
	 PVBpyokBLkK//uWLKS+uH1Mf9F7QrDUioRlEWPHQyfVCe3CEG3pzcNdcejwBYGa5pc
	 YuJ6JOFU/v6eLYHpBLVXeJhupOQ+t+S3mleVHtUDrukAwmzhivJsM/8m25UhrIhMv5
	 IPpk8VSAfmcowWuaa3CJK0e7IKjbTVtuXtgZKz3etvUD2IoyMC3RhrEwtKAhACEogL
	 XfhqeDwdwpVuw==
Date: Wed, 15 Jul 2026 13:47:30 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Sheetal <sheetal@nvidia.com>, u.kleine-koenig@baylibre.com, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rosen Penev <rosenp@gmail.com>, 
	Piyush Patle <piyushpatle228@gmail.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: tegra: tegra20_das: Use dev_err_probe() for
 error handling
Message-ID: <aldzS_CKbV6quenh@orome>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
 <20260715051115.17385-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sph3sm7swibgi7gb"
Content-Disposition: inline
In-Reply-To: <20260715051115.17385-2-phucduc.bui@gmail.com>


--sph3sm7swibgi7gb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] ASoC: tegra: tegra20_das: Use dev_err_probe() for
 error handling
MIME-Version: 1.0

On Wed, Jul 15, 2026 at 12:11:12PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Replace the existing dev_err() and PTR_ERR() sequence with
> dev_err_probe(), preserving the original error code while simplifying
> the error handling.
>=20
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/tegra/tegra20_das.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--sph3sm7swibgi7gb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpXc1IACgkQ3SOs138+
s6G63w/+MtBc401WwKC9jD5yARIb+re9zlca4e498bPBomqC0MxRNkcIeJpeG4Iz
nxx/Y7qT+1RQZ5Cwxlk74+2SFD62xMR1+vbjSFRBSer/zp/QL4Y2MGN/804G5giZ
VYVBBo7oExXTiaqzZymrPY83zQQez4ojV7BMXmjAXcbcaEtst2hlIJSFtPeF7Udl
ApxtErZkzHdoV/ADLYywyV8xfZIa7RD12VgCTViuckaS4dXQzzQXGl5bSE7xtI12
h3Ej57zJcV4O+Q/COhVAYlfrzW76yXIJkTJmo5j0QdHOxiN2e7qvkXnESXRHsdJd
R2kpTKcOg0MSEjctgGuR9HpsEuwC2CIvEscClDW0NGrNTzl0gJS8uT+iyn5odY32
KYXcjXI9sNX12ADzcz6uGkim9eT3+dS1beIdPCSGzIIewJW37vhaeVemZQJlXJM9
CYVpEGB1xok+VEXN5MM6SQo9E96KkMiTncQmq8PSfR4dS+cGni/xsenU9MrapF0E
yJwgf6v7OIs8SHxI1OtRVqv6u7eHrgFXVNIr9a6o1tlBlUwebsDGUdhiSMEFTuTW
VM4qN30X4hNc3ncxmyZEudrzzMRe/win+D2F0/SFSE26ZE8dY/eYlB/SNHlhdYha
gy8aQc+x4QTq2b4FME6oYvkAbfIVZFfuIWROVGVIHn5q3q9MMiA=
=lA2l
-----END PGP SIGNATURE-----

--sph3sm7swibgi7gb--
