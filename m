Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FB722B8DF;
	Fri, 31 Jul 2026 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485181; cv=none; b=SiUev7vrC/7x25/jyG4sF3zek/tWvsOBAA4Gns3FLIrcS1AvpWrPcnFFqFmRjFZD4Y4W1wba57gF3GsKWN4bC22Fqif6rt0RvRuqMoUuhUbEK+0k1yzu5lkI8qaY2i4T2lp8AEuKD5zXP6PSBfCDZRWTtYupEZ82QMsZYys8tdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485181; c=relaxed/simple;
	bh=u37IhomDAQ0R/3F0TeRnDyOLckamW/tMn85NYrKYPHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFU3FIkY9HjpjGLZ4qOXVH3zzmRYEnZrsCocs0dYpMymwQ5Z5nTE4Z0xi5LhpXD8U/XrQXX9Van02tAcE4L6/BnTFphTbyuK7ba7t4T4W+39/PVsv8DHPmK2i61nrIgRte7vUWR1dB3wf5t2xMN9NLp+mQsHffbYV+1QjzVDZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjEwwA7W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjEwwA7W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CB31F000E9;
	Fri, 31 Jul 2026 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785485179;
	bh=KvwUNSUSfb/M4/F5xz+1QvBheNROeCNKI7esoEcKYI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WjEwwA7Wdcph7BUVyaIJDfSRb2ARTbTlKIuZLLyfdk4Koa25WUdSwad3bjakBD+Sp
	 +xa5J/X2be/mcyC/R/BsEGnakppOBkLBDvebmFK3ZZh43xQwCfwTiaqoX+kSzHzQMT
	 raDYOEwLB73clDPj9VJoSW/OoI6M5jsof54ybmdbILFQGomyKvF2IwLRG+i4BxxNb8
	 g+2sh1uTv8BeQ1lEZwF8GM/EL6bh+a0I0jkhVFHHjDOMwfsXyl53ikzq3QKVJx6KMQ
	 w66WKP3vD6ly5jE4FASEvvEm23siHoBHVUgW+Pykr2UHjPx9YmTYGHB3TUgXGKd6a0
	 GE7zr7/+TDF4A==
Date: Fri, 31 Jul 2026 10:06:17 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND V2 2/2] pinctrl: tegra264: fix DAP2 DIN/DOUT pin
 assignment
Message-ID: <amxXcVBCnl-PCNRl@orome>
References: <20260727141121.772110-1-pshete@nvidia.com>
 <20260727141121.772110-2-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a7ft3u4zfnwsefvs"
Content-Disposition: inline
In-Reply-To: <20260727141121.772110-2-pshete@nvidia.com>


--a7ft3u4zfnwsefvs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND V2 2/2] pinctrl: tegra264: fix DAP2 DIN/DOUT pin
 assignment
MIME-Version: 1.0

On Mon, Jul 27, 2026 at 02:11:21PM +0000, Prathamesh Shete wrote:
> The dap2_din and dap2_dout pin groups were given swapped ball suffixes:
> DAP2_DIN was described as ball PV7 and DAP2_DOUT as ball PW0. On silicon
> DAP2_DIN is on ball PW0 (mux register 0x6050, drive register 0x6054) and
> DAP2_DOUT is on ball PV7 (mux register 0x6058, drive register 0x605c),
> as reflected by the board pinmux.
>=20
> Because the ball suffixes were swapped, the groups were also assigned the
> wrong primary mux functions (dap2_din -> I2S2_SDATA_OUT and dap2_dout ->
> I2S2_SDATA_IN), routing the I2S2 data-in and data-out signals to the wrong
> pins and breaking DAP2 audio.=20
>=20
> Rename the groups to dap2_din_pw0 and dap2_dout_pv7 and give each pad its
> correct function (dap2_din_pw0 -> I2S2_SDATA_IN, dap2_dout_pv7 ->
> I2S2_SDATA_OUT). The register offsets are already correct and are left
> unchanged. This matches the board pinmux.
>=20
> Fixes: c98506206912 ("pinctrl: tegra: Add Tegra264 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
> - Rename the pin groups to dap2_din_pw0 and dap2_dout_pv7 and assign the
>   correct mux function to each pad in a single driver patch.
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra264.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--a7ft3u4zfnwsefvs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpsV3kACgkQ3SOs138+
s6FLjRAAryo5yUCe16ev9Hsp5w/uTh6I+6ZqQinCTL84ZWF2ogn8Qg5CicD2MSIa
vrHucgILo6nf7OK9xEeN8B45zX86KrOIKfz/PhDjNqq/zTuoO95++Z199ECEctbK
HGESN1vVagxuTLPAqNonoAiDPlMiL7N1H0eOEyOriASbPPEu72dmGktyqn19STIo
NGIq6BJNKKiqJl+3Td104FZynISwwIMS256jsBVMq46kdciYTYniEq5xYBLj/orm
FJcL1BY3y+/MuBGEKdBvhuI7WulQ9Kvi0xEdyi+aP7ZP+RSocH5z4dg5Wk/nVd6U
nFPYqgfMZfRvMHEm1PfDWtBm1fnHCbeLAxb/NKqDAHsVqi5LavFBiJRJXtegslBb
g7COhQPfkYje5v+zQTi7qdUru9XdY71PzdlXZuYAPmGgWfF/sK1fg+4XjPZ5DPnQ
QJo2UoPTd27DHf22LfoujCGIDD5tYPWvcGwAm/aHWcqiVGX7hUHaG2WWCEIrmsWN
bgH1HTJxkqTneZPvAsGBnAnvReHYNBmkSXcWnaSU+nHD5vv8LdcMvvQsmO2o72Yt
Dt+0xfDmYlyk6A32ex0bNbuVtxUECxBK4+jfpceJEGBvHz4DTArrWnyxRDxUPg65
I0BAEdeHLa6mMLzqE4sZIPaZq3zHcEyoipuDNdzwYZOaAAIuTzo=
=t+FL
-----END PGP SIGNATURE-----

--a7ft3u4zfnwsefvs--
