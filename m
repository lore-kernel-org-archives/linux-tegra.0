Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640BF3C13EE;
	Mon, 21 Sep 2026 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990687; cv=none; b=p4LCHkGW76Nbdl5wYiHGQBIiNhSFN1V90NXm3zVCDcss7j8t14X8CjxG4Yw6FIhvJ2z3TYWGmBefSjD8DBjTImjx08TCZGGxcHxzMydqTsWMmKf2arWyh93+s5N5AB7xy6DZzNHHykY5o5h2Yuq9wuNRKQADRDzU7z+WASVlBdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990687; c=relaxed/simple;
	bh=LKzXbI2kLcQJ7w35riUsFzshPNRq5HS2uht/PL7RcmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGP/8943CFq863spZI2My2h8fVMR77sfK1f6gn3rTwDEXgtxMkfSTMBLmUoKsi/LDH83T2tJgvdzUmlfyPcTZzf5iLKuUVg3aF5LIXd6PVc73oXo1wbsMaZnjifde6NgTi/pCpcFpl+IEYu0L8raRdz4TsTKeTdKoGMQ/6mL86Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxXvIXzW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxXvIXzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E1E1F000FF;
	Mon, 21 Sep 2026 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789990686;
	bh=JiJpxQysYV6fSk6CEK85PfNN5plE47nRat7u1KxeH5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YxXvIXzWmpbfn4wiGS/Zihc0Chst28a/ZInVrs25B36OOncqO1/xUqHXDA6NlTPmq
	 SHRHG5wJJQ9w9nNN6tBypN+1/DQ4BV7j39R7BNxp4GTi4OUaIT3uyz44t4/F0fceQA
	 oLO9kLorTHqkKKUYqOKe+O5MG/3zSYczteE88s6LjJ91DVF0kbPBkFV0UtHS3DAAeD
	 P8qgUQXH7JGTomS2tdPZajuOjgK2hUxKwnXCa3O2ck9u9U04CltSSHZJa138qER7UI
	 zs26QRTg+3BJF7+GgaL17gaiLhpOY94XoPBDpUemuejxXOOjzUWqDgNXc/bYr4DEv7
	 EWXdTYNa8fUlA==
Date: Mon, 21 Sep 2026 13:38:03 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] ASoC: tegra: Fix ASRC Stream6 input threshold
 control
Message-ID: <arEWz1DC2sg266Kv@orome>
References: <20260921085704.1248920-1-sheetal@nvidia.com>
 <20260921085704.1248920-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bnyufgwgkmpbjrmp"
Content-Disposition: inline
In-Reply-To: <20260921085704.1248920-2-sheetal@nvidia.com>


--bnyufgwgkmpbjrmp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/3] ASoC: tegra: Fix ASRC Stream6 input threshold
 control
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 08:57:02AM +0000, Sheetal wrote:
> The Stream6 Input Threshold control points at stream index 4, which is
> already used by Stream5. The threshold get and put callbacks derive the
> lane ID from the register offset, so the duplicate index makes Stream6
> operate on lane 4 and leaves lane 5 inaccessible from userspace.
>=20
> Use stream index 5 for Stream6.
>=20
> Fixes: a2df8c2d5b36 ("ASoC: tegra: Add Tegra186 based ASRC driver")
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>  sound/soc/tegra/tegra186_asrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should be a separate patch since it fixes an existing problem and
is not related to the rework in subsequent patches. It also shouldn't be
blocked on any discussion regarding the ABI change.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--bnyufgwgkmpbjrmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqxFxsACgkQ3SOs138+
s6FBhxAAwn7+5OArHzxwqtAvb9IGEm680jpBzw++Kd8hHuDox2MQCqMzIZrlutUV
w1ht9pDZwPfFp+46mnm4HDaVQMlFnG910O/r+2AFn7XLKzyYoc9257nL/C08fmuE
Qpku/MoJGC+Tdiknfxx9kqTgo1G/A3SM1GK1O7mTZKOhZFVGCsxBrMYBx1AXFNGh
SbOV3SrihaxIU5mCLvGGTLquDi1AjR+hccTJTLg9V6LlvamOiJAPDVwS7nfSZ2cv
+w9R9nRMDJNQ6UbZyt5szFtfjb9VMdv3KOhy7MoDqw39cA7vW5ZrFSaSaOZuo2Ee
hzA6ci5OlEE556y7oTYoA7CDm6NdFVu2zcBAlx20yuaPbHaQnpYoOL41mAwhuKKf
HRGxlVrnB0dndmp1Em94tYBL5j3NGirPoas1zLf+1RQF1ynb1tsZaknwi0LBuxyV
asnJBnVhgKB6LNB3fy9bu86lmNy6/0PKcCj//IzDHq3tLR4EJzpcH67nMQB/Vpq+
+eigGu6wQXVYs7IAcKWZZ/Y7MKVSnMgY7BP2x2kIjqAevrHVBx63rMgQdte+qUMT
+cZ4O4sNYZy1m9aIqtV7n3GYf39JFYa/z81KZtV/MsQ9tTYLU56oiMgt82tXZAC2
yb3G+2kt5ASJcCkHGl4+htvxRUxTuYKZfTGtIv3UAvHpNTnS1Jk=
=ibKJ
-----END PGP SIGNATURE-----

--bnyufgwgkmpbjrmp--
