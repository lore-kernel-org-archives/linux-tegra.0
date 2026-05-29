Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B713655DA
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068233; cv=none; b=pz0JbRc6zuqhdNIhpK3MTPTpxYDYD3HOq7mIEQIgxFHB+bcA7Fr4TRdwmFhXrrbMjZ5alEzWpWnq/dV1Ja5CZ1dWdbXdQWkww5Ju5/QL9V4LodRjxgECd21ORAoyHUWYrBZ82ocLW/vRoDZuefWaXQq5FigonZ42PSZSo+Xc3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068233; c=relaxed/simple;
	bh=MiBkhI2mDzZSe3LK7scfx+No/5aiHrTQgkdkU68eQZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUxyKRyt6h6LsNFikZdx8aESuTkHSI95Ig+dsFnY3RKKhx1A+wIejxOVyUBjOKyCmONwq8K5+XGyPQS/PcsN4j2jtS+t5DP4Z9Lj+E2vXDa2r3t01GWBkpvEJbAZwFefwliXIcRVXN1Q+FXSE4r15aUZhemVOOMF2l4gMQbqaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcpoJdrL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcpoJdrL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa4b131940so3344064e87.0
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780068230; x=1780673030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ThQUZuW5VRWez/JlJU4j6KX1teKKMbK4v4DvPnWcYsM=;
        b=jcpoJdrLJHRPkSrUn/YUsG9uVhEa5MVO3ee4eR8LUdtDkSUgddXG0KwjSUWXZI65+P
         Z44JvdrvYT2ZjdCXZw/LmppBUfEC3hwWz5y6BXbzA7JrsAlFFQpl95d7O/sslNJ+RUO2
         naljQuxc7vLmqqQT37RBNWx+/+GAbNfUR50EprIPPwvZINFGixu1+sSsOu25HdlfDAtN
         V6YJmK5yg8dEjPVL7BacqOfa/1GO05XWKzKIwJZE+mZ6ImT/ylBXQSXyFU4kE+dy3n9C
         DrIf3weQPm0maN8579vaSD/I/woEjCj4vT5mMTlX8ypin4uteRpkEPs8vm5GZUsTG+e8
         NK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068230; x=1780673030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThQUZuW5VRWez/JlJU4j6KX1teKKMbK4v4DvPnWcYsM=;
        b=Y1jxEac7S4D4rkjYTM7K3hFDYd16n+Z3LuP1LKUwQdtZBJvJHW0Or/UWH6pXDJZMHP
         hCCr74fxCnm5tvySGcBCZ1VV+5m5mxqs4DTRnvjPWuAlKCKZToLpTClwkgrX29V1USdu
         Kv7oCChL8aagm9+kK5SyY2QLWJkAKKe/RiRTeS0EhVzqc+2vos235M2BnKf51Cy8c0v/
         1ktZ4eutMzLxBhaJENXeLWkYJ10t+69c+mE4zCdwnt+1B5Evt64k1PAoDbpyU2S+f2ZZ
         MS22OREVSFURR0gL0AO3HsISH0JjRxZAlF82exlQCc5O3gDXEvR5yJ6PPIDAZbN4EfDo
         Qq7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Zp5vOEdCWb8IyPiw+kpkHKR1e1voJsGbldYOQOhxRJz/3jHvhyw4FvxFVG39iwfKcJSJh/nvZNdkoQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq2wrpmF8q6Um0HXx6H76VxaDIgz6oFEh7p9IW5X+yLZpFbT27
	yv/pVCUzSvTFeqUie8n3vOHr4GjOdmwj8bQIgbfMsulUF28CoGRc6czo
X-Gm-Gg: Acq92OG8aBwDC/Nlc1c1nXp9VKTnxuciWFLAGG44GSfFTI1It0HaGjQXai7OsB9a6Lw
	VDKer/iLf7zHBlZvE7nNYrzy8T/9D8E+SBbIjt5wHq5xtpoGFxPfstKC4276oW6+2y+TPJw/6yx
	XKrzzDwaxNYWjzbOz+CyRhCEDFvhHr//kpXmBEfLVWGj3Rbl8kEyYDCnTOvcDR1pzbkHSRM6rzW
	HL4I4Pma/1bG22TEbXYHU9lzyO+vEVgwvDBkFI52Z/R4Y7o420qWwXupBqtSFzZb37XoO4Oyhib
	5B8lAJFz+AA3A1vXzBRzFnmQCU7dGFusNaVjHO5EPgLoTYIQEA4J/5Qu6+zKyz0U0wAIplpzMkd
	rJJE9gjSSX8icqiGGXPSmlEvSeg+g+E3HaMCv/cioZZr2JIVrR2lQ300QyqUsmJ2uGS+AO1cRYK
	XWJR93kkbdvBNiEA/n76fD36LpdR4xO0syULux0tsZ1ZmWVk69+PZ+WrsQ8KBkLNP4CSYArzwgd
	osXkFw56CbUAeTnqqwC/NPq
X-Received: by 2002:a05:6512:4055:20b0:5aa:5e91:228f with SMTP id 2adb3069b0e04-5aa609222b2mr64351e87.35.1780068229791;
        Fri, 29 May 2026 08:23:49 -0700 (PDT)
Received: from orome (p200300e41f1bda00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:da00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0726e8sm338501e87.25.2026.05.29.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:23:47 -0700 (PDT)
Date: Fri, 29 May 2026 17:23:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, treding@nvidia.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
Message-ID: <ahmuTcpUdsHYKTPu@orome>
References: <20260521140546.3023819-1-sumitg@nvidia.com>
 <2caba07a-511e-453c-8e1e-f2b07b84a096@kernel.org>
 <58ae92f3-3e6d-4f60-970e-76ee4d7dbd4e@nvidia.com>
 <2ba14e8a-1664-48fe-ba99-c81100de78f4@kernel.org>
 <ahgr7EevWJ-unfSV@orome>
 <ad3c49f1-044f-445c-a586-675252f157ae@kernel.org>
 <ahg5_Lm51AcfkQm_@orome>
 <ef3185ce-6a6f-4234-96a3-383480ba8216@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ryfbkxhx436xo7ir"
Content-Disposition: inline
In-Reply-To: <ef3185ce-6a6f-4234-96a3-383480ba8216@nvidia.com>


--ryfbkxhx436xo7ir
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
MIME-Version: 1.0

On Fri, May 29, 2026 at 02:55:35PM +0530, Sumit Gupta wrote:
>=20
> On 28/05/26 18:35, Thierry Reding wrote:
> > On Thu, May 28, 2026 at 02:20:07PM +0200, Krzysztof Kozlowski wrote:
> > > On 28/05/2026 13:56, Thierry Reding wrote:
> > > > > > > > -     mc->debugfs.root =3D debugfs_create_dir("mc", NULL);
> > > > > > > > +     if (!mc_debugfs_root)
> > > > > > > That's a probe path and you created a singletone. Looks like =
preventing
> > > > > > > async probing for no real reason.
> > > > > > >=20
> > > > > > > I am very against singletons and debugfs does not look like j=
ustified
> > > > > > > exception.
> > > > > > The singleton was added so multi-socket MC/EMC instances could
> > > > > > share a "mc"/"emc" parent. I'll drop it in v2.
> > > > > >=20
> > > > > > On single-socket SoCs, the "mc"/"emc" names will be unchanged.
> > > > > > On multi-socket SoCs, each instance will create a top-level deb=
ugfs
> > > > > > dir named with dev_name(). Same pattern in tegra186-emc.c.
> > > > > >=20
> > > > > >   =C2=A0 if (dev_to_node(mc->dev) =3D=3D NUMA_NO_NODE)
> > > > > >   =C2=A0 =C2=A0 =C2=A0 mc->debugfs.root =3D debugfs_create_dir(=
"mc", NULL);
> > > > > >   =C2=A0 else
> > > > > >   =C2=A0 =C2=A0 =C2=A0 mc->debugfs.root =3D debugfs_create_dir(=
dev_name(mc->dev), NULL);
> > > > > You assume this is fully synced, so you as well could do a look u=
p and
> > > > > then use what you found or create new dir. If you think that is r=
acy, so
> > > > > is this approach... How are other drivers handling per-device deb=
ugfs
> > > > > directories? Do they also create such in the top-level? I think n=
o.
> > > > I think we want a top-level directory for a bit more structure in
> > > > debugfs. But I also think we want to create that top-level director=
y in
> > > > the module's init function rather than _probe.
> > > I was thinking about this as well but that would mean your driver will
> > > create it on every multi-arch kernel.
> > >=20
> > > This should be then moved to some core bus (and there are examples of
> > > that, e.g. USB), except there is no core-MC bus code to do that.
> > We have a utility function (soc_is_tegra()) that we've used in similar
> > situations in the past. We haven't used them in a little while, but it
> > could be useful here. It's not for free, but should be fairly quick to
> > error out early on multi-arch kernels.
> >=20
> > Thierry
>=20
> soc_is_tegra()'s match table currently has entries up to Tegra210
> (seems only used by a legacy 32-bit ARM path), so it would skip
> the SoCs this patch targets (Tegra186+).
> Could we follow tegra_init_soc() in fuse-tegra.c. Only create the
> "mc"/"emc" parent at module init when a matching DT node is present:
>=20
> =C2=A0 =C2=A0 static int __init tegra_mc_init(void)
> =C2=A0 =C2=A0 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *np;
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 np =3D of_find_matching_node(NULL, tegra_mc_o=
f_match);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (np) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tegra_mc_debugfs_root =3D debug=
fs_create_dir("mc", NULL);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_node_put(np);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&tegra_mc_dri=
ver);
> =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 arch_initcall(tegra_mc_init);
>=20
> Each probe just creates its per-device child under that parent
> without touching any shared state. Same in tegra186-emc.c.
> Or would you prefer a different approach, e.g. extending the
> soc_is_tegra() match table for arm64 SoCs, before I respin?

of_find_matching_node() has the big downside that it scans the entire
device tree to find matching nodes, which can be quite expensive. The
soc_is_tegra() helper uses of_machine_device_match() which only checks
the compatible string on the root node and therefore is much faster.

Jon is working on a different solution for a similar case for BPMP, so
maybe we can also look at doing something similar for MC. It's a bit
involved because it adds an extra mutex to make sure we don't end up
racing the creation of the parent directory, but it has the advantage
that it's only ever triggered when really needed and doesn't need any
"tricks" like soc_is_tegra().

I wonder if maybe a helper could be extracted from that to make this a
bit easier to replicate elsewhere.

Thierry

--ryfbkxhx436xo7ir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoZr34ACgkQ3SOs138+
s6GkBw//b7KucljgDtehEWP8kwtO+ilxTKxK323qTsWHFKkt0u3kVFrLSjj64yYn
M+yFjDMe2lY56gJpdaKxfLlFHXK6jXUj9TKIDq6E58jsfTVFnkvsSMsfr5IPnxNW
6chINNJHYiIRP745G8dbUazYlkyxlIH/1yYq9GavgvEbpMcrMG0PY5nzHqlfYVcj
GFZY5/B1bEGc34t4uAVka2hLs0q5dKz6ewVIoVxnFNeYzqfJrJwciLeYfxFCb9An
yRjyFXRvww3oQSpmeCUT9XhScWvHr50W6d/L2+WVPNIrIR81z/Y/8jomQJbKVW1O
p1gmbdf6t1E8YfVN5UKEBbpoxr6ql68ZtFtCsf/6amAinRL5i0cBFbWtYgWt2OxQ
GroAhqyzq/eh8GMIvK3d67A7H3v8/Yq1+b8HNKX0cIiK/ww2EhoU8YxfXYGY4AJn
sh19izPzuv0S3OxzMC3pCEaF6KKA3rgyWwXGMZeenSys+40YcFvm6Bwcmz7ebqbz
QJ9bGYSS9ZkJ4EdBeHgEaFMTxfufUvTtCFyxgj6/k/8XCBS9Pd8qwNPXNCZPkj7r
fR9075OhwEbg5eH7LjA746ctI0XeTIyo4apHY1t08hPYVqQtyQPEJTb7kgOeRIGJ
RZci+tixbTR3JN0Gjk1DqAQYP8jHZRH+OuEuL4Afxa5lgf7AYhQ=
=FPjQ
-----END PGP SIGNATURE-----

--ryfbkxhx436xo7ir--
