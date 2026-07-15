Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC43B3898;
	Wed, 15 Jul 2026 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116077; cv=none; b=Keo7ynjXHEQVCHCmangbS+6C84mEak1HnnbQAHKKQUYJevcGufKNiJaEN9o3e6XTljTKUSUscXJH6FTrIQEoiCdlhD9L1wVLupunQRJTFybVXE1bTOEF4BpB2Kqe6VPMm2lTvGynuOg7iPURQnUBWankRc4CBsWc1sQBKC8YKi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116077; c=relaxed/simple;
	bh=TWeFy4un8Mxj1noHCfav9+BbNLlaBPXTVePyJWAmSvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O00AAqkR/A/mR/8qi8KW+qba3wuNRuZa2JJVzr4Xn+dxtxPwqCnTvfJOU8nVs1+lKaYhh6W1QT4eW7qAMIPKFFAzFiDUXfqBGiP7PsG8I1DvUjuwkRM6PYOLYxtjQZ4ZMeMAfi9D3uUWdK5YRfaqbG8F5hqeVBxiavmvRPXosJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3WRCChi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3WRCChi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28BD1F000E9;
	Wed, 15 Jul 2026 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116075;
	bh=Aq6x5/8BQiCJG5bBqzH8hQLVDVMGomrou9m682o6enU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o3WRCChi3jNRibfcyYCPBFQezshetJL+Cl/V1cXNiBETZ095/ZHFfe4z1nwSEHy0X
	 dt/6DwTvIAUx8CAOtDMDBtUIbj8kydzHJHnkqHViEqA32ThP627M+utfj53jSgiuOv
	 QJQi1sWY/0pZNFyZv0Uhbrd1C7SQ9iNxKtrhbJpt/hcgzl0jwa2WMfat3iOyrOM918
	 V2F3WPvjEeteceCGuSJ9U06SwldqkdNt/1YBzFAGp+eLx7OIeXX5rt01WC5Dz8ri1J
	 vcIbdMbE+ZaMRfXX784PTKl4IWexM3U4fnvRp5Qwu8NyE6qru/3UXXoQS6xlgFxI+V
	 uKk9F3ohA2Rlg==
Date: Wed, 15 Jul 2026 13:47:53 +0200
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
Subject: Re: [PATCH 2/4] ASoC: tegra: tegra210_adx: Return the original error
 directly
Message-ID: <aldzYg3fCJvf9rp1@orome>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
 <20260715051115.17385-3-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7gdaio6u3znxcfeh"
Content-Disposition: inline
In-Reply-To: <20260715051115.17385-3-phucduc.bui@gmail.com>


--7gdaio6u3znxcfeh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] ASoC: tegra: tegra210_adx: Return the original error
 directly
MIME-Version: 1.0

On Wed, Jul 15, 2026 at 12:11:13PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> snd_soc_add_component_controls() already reports failures internally.
> Return its error code directly instead of logging the error again in the
> component probe callback. Also remove the now unnecessary local error
> variable.
>=20
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/tegra/tegra210_adx.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--7gdaio6u3znxcfeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpXc2gACgkQ3SOs138+
s6Fdpg//XXhGzOY4o6FVeji6Ayfs3TArOLP5iStEplMf7gkXyHQe8plLRRttyrLI
R0jM2h/Cc3342c0e5qLgzUbb9sN/29PtoiCQvbc382Ey6jiBIBxO464EepJRReuZ
fgclGD/WXVCP8DJWFVrgP0yQjYscuXDHH8O+AJ30RN/6rIXfo+W/GPhTmZH1381v
UVDNZR40tsVWbcTJKr7vhMEYFHyud2cttfob+IuEky/3ri2QazfmepEgKzs+pDDU
BeTDAgtHH5hlvbRXH36rmDMKH651lj/afjmHtn2nH/qjzSy6km4NvcV9+FCtHzTk
FLIATMm4v0hoY4TefZ87TAQPY6+2he2/0wVm5DFSdJmHmX0gpTS+UKIBF79dgO4p
Gzyj00rLHOMQ12Y2qTALYKCbN96pzu1EHMVv+1/E38CDt7HMpbuhe71Gho4IKd/7
0IfLFuIQYY0eWRWRETc+MDEhOO9fCxYx4vduVY5ubCUMRNafMHIY3np0oFx+Gtae
VFP+Yw+k4fUZpdEBfefNiHknInM/WHSKNnbtgqIATfiHnmUVo0E4eEgjc1WTCd0q
vHh97v7a1oIiY1ifw403MuMEcwu8oary7SmdIK9bcnUeh3Ri3IDKPiir6qd1biFH
BvAJI18PrdAEnchCdiXl7T+2KfF6rOXqIQBPEPUEr25PdjuPE+8=
=QnsR
-----END PGP SIGNATURE-----

--7gdaio6u3znxcfeh--
