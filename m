Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CB23E3C6D
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778246566; cv=none; b=lCNUwmdasHvNwT5dPsi5etR9W4IEXIW1XUc5v6sJ7cqDqGUh979NCiKdTwdyllDUDoHnQkFkbqoYRjh9JrQOvWjKO5JyapclP0T9UJ0SgId/JWzb18B1nmFlBBt9H15N9DSQyrHsJMnS2B4nWkD3aNz2PPIsq5UWCXzecfqoNxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778246566; c=relaxed/simple;
	bh=fnk2WYtspGKK05+6RhoArWdO2sbLJKdVZlrbd2erSBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngBCTiodkZLRtQQcGnB4Ed/f3Dy8hbbnKEboEJ2ZArrDJYph5I33YzPdwPQhYspMRNRfJTGFxOykdisFzEKp++3KvcbukehJIL85POSzcufh6XBvU0IerTEmeXjOmgpKLDlIB9Ks9G6awvC2COGbEGdUEbjWYORNMKcv8SSfX6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOGsviu4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOGsviu4"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so17652961fa.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778246563; x=1778851363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1gbUobD+K/QE4KT+ICDeIySBZSA03dYWML/JHPIkeU=;
        b=dOGsviu4aCNrl2Yu6zXrYQjADBLVS207CfBKc+8aYuSeusLdUSK8hijh4AJpxLmHmH
         EAHKCxc6uWYlMOcwoYR1EH8W62msHgVfNZRabHb5Qf7Bdiuh6BxMq0cCs141k2KuBGz1
         HbZT8xoxSDO1GoYh/etCGdCvcYe61N0nCdLH6/HEDZFXFk4UcrqgC5VszEBU5K7yGh9j
         Ox6IbIelF2wXuOcWp2YI6TtNCnC2j78SRx1A0BDLSYmSI+56e9dVv8DTIGAkb5k6gerY
         XSs52ImH1dthaAm660q+weQFUqriDx0zI3hx8Sd3jg4mDFcoK17vWKS8KBzNyGVhXVh9
         COIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778246563; x=1778851363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1gbUobD+K/QE4KT+ICDeIySBZSA03dYWML/JHPIkeU=;
        b=BM1hCnA6hYirEzm595rQTG2cWbZHYCf28nwI+e7JjJBsw/f2obAA0iWyBS1lKTm8tL
         5CF+cGaS+eK2XP8LCwogaYTLTesImQJfTH03lVAt/9UVb1CpT31eLuhVTBvBn2Nj5IoQ
         AnuQaOiMk8SV9ExZKXxoZLz5pSDN3yqQh+oNLV3qSbbbyd6RMucoKy5vnkK2J7rBDbO4
         zdsF5LgI5V4ddfLM6u5z2n+9RtCt0oySHq0uOz4pqMnoBOQBW7bmSo0eNTxq4pw2ayMK
         8kpN5/j3SWZbvkbRlMjqXt4NIQfp3ENjzzBrRHnj0OFqRt1v7+NbKftEG+LwwvBPa6s5
         NF8w==
X-Forwarded-Encrypted: i=1; AFNElJ/sc3m+BahIVDoJxgAQIjQNt2Hatpdv1VPaKCPbRS7CEjakj4/T25jKkeGCU/FvIEwx5M9kti1OB9lU3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUAbFCG7RMLjLAu1D9B2o/I7Sms7ssrtC5Jb6ceqX62wV924J1
	ahVFMG47Clb+q3Vs6bXOIdXb531/buRS4zkS/M3hJU/8o98yTFq8VFOQ
X-Gm-Gg: Acq92OG0iCyFAyUIrdl7b1WzwpRDO6uIpR6CSllQ3OVWxQd7C7YtvyHjqOlS0VO3qOB
	nnZlYtYllqWvG/HvT7ecnSB30CNKgl4ptuuBTTYZys+3AkdPd1jpel/sZG1VsvfurV+FV4LZ2sv
	KqmQbSc2ekIKRtitPXvmXPTihVTJDOeKBOuyOMgEBgp5f9x/Fmkuc2eYOyev+4YjK3zrwh239G8
	QZyUqgv24AeVz2RuRyabTgWRSKoZx9+FImop8PnqNMBPxMlw6hQ7LLLzbs5z8BKnMKk1yI/mTGM
	SMFJaAaJLYFSXa7kXSjXyVfm9psBMMe62efKofwNuOxrn/jdoU2L4UqZi4YfD7v02OgZmgl1S64
	eD3nzA9AzcN7nhDdJF/pnvIMn+E2+qhUYE1Sb9ujEruqUG2LQ8DUqT4GrdNVPV1NnpLhZG7dVgS
	RtGAspAKVbLP0p3RGmfaejWQU5NQo6bNDjSHl6CWsOMwMn4EUyIRKspx4ncBeujrcObJ65w+n2u
	stSWATwHXW2Dg==
X-Received: by 2002:a05:6512:3195:b0:5a2:c4f1:2635 with SMTP id 2adb3069b0e04-5a887cec51cmr5030150e87.41.1778246562820;
        Fri, 08 May 2026 06:22:42 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9565401sm503421e87.57.2026.05.08.06.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:22:41 -0700 (PDT)
Date: Fri, 8 May 2026 15:22:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit
 division
Message-ID: <af3jjg4z77TIpFeV@orome>
References: <20260507232131.438589-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6e4xp2knzxedgfuf"
Content-Disposition: inline
In-Reply-To: <20260507232131.438589-1-rosenp@gmail.com>


--6e4xp2knzxedgfuf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit
 division
MIME-Version: 1.0

On Thu, May 07, 2026 at 04:21:31PM -0700, Rosen Penev wrote:
> A MIPS allmodconfig build with LLVM fails during modpost:
>=20
>   ERROR: modpost: "__udivdi3"
>   [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!
>=20
> tegra210_mixer_configure_gain() divides a 64-bit BIT_ULL() value by the
> fade duration. On 32-bit MIPS, clang emits a call to __udivdi3 for that
> plain C division, but that compiler helper is not exported to modules.
>=20
> Use div_u64() for the inverse duration calculation so the driver uses the
> kernel's 64-bit division helper instead of emitting a compiler runtime
> call.
>=20
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/soc/tegra/tegra210_mixer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--6e4xp2knzxedgfuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn9454ACgkQ3SOs138+
s6G3sQ//eW7jTS8DwLqJPErEu/uNx+44KbrkCa6KCZ1CuzzSJGgTtCgkI/TqPto2
sBta/eSpFQWwWl8w6SDvdgtpZK4Dy+0cB9C9yfwLH0UcvcG//rA3znW8SmjclGMu
T3zD7HwyNtJfSMxbLBc1oEw6PkvNMuDVXD8L5X+PR0Yj9mUVNIEzyY2Tp0EDl8ra
u1nwej+8rDpXokACkmNLnnTOfRUQT/gbVwpIpl7+ekcf0GGdAJtfxCYA35BteE/F
fws6hCqz4i1Bjp6PWuHvhGuNqAP7yMlY+L7HOAOykKJAs7vOF6GTYyiJJKXQMQRh
u1o3BVQJsrrNY3gpXc5xcoXuDYmL35q+7spqMaYHlAvbzi1uDcmXS0ZOnM1NnQod
9S0DOZejxA2dIO94sSrelz49K0MkJpBxRWW+YAStC86OwfEjetcoitDbJzrCLIhB
uKGfKQe/8kfdY9An8BipfIt/B+jussJ1x73KsuTjACqiAWnC846iACtEUlyE8tu5
Jv5MJKGpE/sJS78MKigEGdg5Y4Dako0Dq1bkM/QV1v2JoCR5NUPASNBfz4cBXx0r
NQD3++YOCtD0onHPk8NNZ8/c3p7bDWBWB3VgUeVPUrngLDuuh74FrP0cfRDnWe3R
+WQF2Il5x9IjK0LbghmnCD7hx+uMvg7MCaWlL+Pricc1yTOqMLo=
=dCDE
-----END PGP SIGNATURE-----

--6e4xp2knzxedgfuf--
