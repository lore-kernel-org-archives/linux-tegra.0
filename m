Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E872530171A
	for <linux-tegra@vger.kernel.org>; Mon,  3 Nov 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762168029; cv=none; b=n7H1ivaS6Jjlprdx0vzPU3nspsfzA9mdbhuRo7KfFeX7KPff+RbiOU9vADsTcC1osBPGu5fSsJ337Y7ly8PiEKR0YucuKJ7w4vNT1QlYddvKn6yso3X5c/n+J19o67XglsnnYW51vRL3EC0LRxOoHIdQzghtGjcnJIVgtoQfSqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762168029; c=relaxed/simple;
	bh=q+/7P1zjDNlXzpHg/WHOYRPHMq1JrxDvGxq4KhF0LWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBpt9vtxIuViw3aOyKJj4kiICflIJQfs18HBV4a10aNysUkNR+9TMbYpJQborcBOige81Vdt6gjanmB4seetjnM+FF0RYrPAV4OOwYSTbeMYa+vQufHXHpsAWzDN45r3gpFPsBTtNPMyFlI4E/GNwrEyjVMR09r/CCeMjFO0yaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5XCUbDF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5XCUbDF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso27436375e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 03 Nov 2025 03:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762168026; x=1762772826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2y6g7iCZxSFCzS+WqvERQWzckHfYQBOBr5pYtme7K0=;
        b=g5XCUbDFVvMZDFMAZkg0EciVb6shPWDgLUFDgBsPBChVCp1VD1sgs+kXR/65HYChxI
         enVDu7+CF+3yGpvzhFWqC7y7y5PFkbnrFO5lysja/y3/NfcAYak/uylgb1r2Q7UXo/3b
         hhCU4cd5zbMRfoRccx4ISKtuMRLqp+XSTNvJV/Qhr/wbTCCv4Bvi3FCcPWusJTjYNYTM
         2qljBFd6xxgr7p21TekFvkZH3v18RIUqj3B8kP6ky9eKKvtH63IZMbUgavbAP7bWZG4W
         Ol1Pj62M0sEQTNqWX7Y7wz2nY+j2ERYsqlerVHQIBumT6PRC4uxAI/SU3vFeNwhXYthN
         XM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762168026; x=1762772826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2y6g7iCZxSFCzS+WqvERQWzckHfYQBOBr5pYtme7K0=;
        b=AbecizJjYxXdJZFLKil0CeQIb3611F4FLRK7w/RFrcIhoTjMraOpfoQtIz7ujbkxyh
         goOrewZwgMMqGCtJDnmt3bFEc7q2X3jWKV+aanDbB/Hs+o+YUsflod7EqQ7NSkr6vNVe
         qWo2YajlyDvgro6l4494MdDYTK6l+6SyPp0iECZdh6l1uNTS7GPMyhZPaMqBNz8PNlT1
         kW9os1HbcMWqRXmP0xBIDcdmR6NdfhAnYMnoJWg91fby3+YSNYWAIIYXOxJtDsT1KsYZ
         1qFX1gN9NjjJiqW9hA+XvSlXUj5VnRqB2j/fNCaaMMDIVY3j4oD4C7Sqtq/pZ/5yv/g8
         JbbA==
X-Forwarded-Encrypted: i=1; AJvYcCVn3hBNxrzYK0M577GuJD/kXAkdDYwBKHA13kdqC0ZlrXJSLZYF6biR0k+pIN2BNYrh0gDEfsPVC7LdRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY1KbVyvqS+9CPBHk3YyIVaZsl1Rk9rlk15+iEGA5SuxSrpgmZ
	nxVnoNONnP8EN22Xq46rQ2SbYdX/nD059RMPQEBHDHhM8/kcB/TGYtd7
X-Gm-Gg: ASbGncvhy6fZzer4d0/qOkngaEQbvh+y+TqO/gSMeo321IkqyPDsUaE3MJiEhsL/LiL
	kL/GHAth4d6wVsj84X0GUJ4qMzbKyTx5jcoMk/G7Mvade6icU68P7YRo0Ra6y7IPlUNF8ubeKO/
	NNIVnYEHo4kkAo4f8IoiHKQpyyoEWtmWuDZXwrJFGeks8DHRsMSwAYh10BMSy257iA/qV6QYvpc
	v5J1dYtIbJtXRWHdSI8WLZqFLjBiwdkTw5CDKu2sqb1+H69YdHlaumEbUuFFwL2XgQJzHcRT/Gp
	6CrdDLJsPKNJ1DdlQAqZdOZdwTByEejoRvGNjfZS93RM9QVBFVaXoiAXCietk6kiCpywZsT9LHa
	1lY5KErJRZo2NXJZf8OMLgCBy6QKo/K7fSi5JObQLo27HNcntjk24vhv5QJI7bVujQ7+TIv1gCz
	FZfw7rdg2kLAE40/6Fuv9xbhFXbNkyi2HmfjwOMaR0R3J9bm+Vu0KyuThkRPuvlIyqg/tUKYAns
	A==
X-Google-Smtp-Source: AGHT+IGk/+fNIDU5GS9Y0bSDOMPL/NMDFiVPvFYi1ymJ4WbTOeaX7Ll11twoeCz4N6itkrGu72//OA==
X-Received: by 2002:a05:600c:3511:b0:476:4efc:8edc with SMTP id 5b1f17b1804b1-477307d9920mr99026625e9.15.1762168025714;
        Mon, 03 Nov 2025 03:07:05 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c2e677csm149805495e9.3.2025.11.03.03.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:07:04 -0800 (PST)
Date: Mon, 3 Nov 2025 12:07:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
Message-ID: <ehkwvvmvk4mddxtcmne5jrex2rfq4phqsa5zifxdslrpvdl2ir@3zlwejmx5f5f>
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <20251101-tegra194-dc-mmu-v1-1-8401c45d8f13@gmail.com>
 <CALHNRZ_QrQHCmF7f1z29tAmuNR-=rG1SgYJ1sssK3VXiQqURYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rhigqaftdyzecuql"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_QrQHCmF7f1z29tAmuNR-=rG1SgYJ1sssK3VXiQqURYg@mail.gmail.com>


--rhigqaftdyzecuql
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
MIME-Version: 1.0

On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e12.
> >
> > Mmu is now being enabled for the display controllers.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra194.dtsi
> > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa1d8eedcdfbae=
1fdde1374adf40337 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> >                         #iommu-cells =3D <1>;
> >
> >                         nvidia,memory-controller =3D <&mc>;
> > -                       status =3D "disabled";
> > +                       status =3D "okay";
> >                 };
> >
> >                 smmu: iommu@12000000 {
> >
> > --
> > 2.51.0
> >
> >
>=20
> Question for Jon as the author of the commit being reverted. The
> commit message states "we do not have a way to pass frame-buffer
> memory from the bootloader to the kernel". If I understand this
> correctly, this is talking about seamless handoff. What does this have
> to do with enabling mmu on the display controllers? Seamless does not
> work on any tegra arch as far as I'm aware, but Tegra194 is the only
> one that doesn't have mmu enabled for the dc's. But enabling mmu
> allows for better and faster memory allocation. My initial attempts to
> enable this didn't work because I tried to attach them to the main mmu
> unit, see the related freedesktop issue [0]. After noticing in the
> downstream dt that the dc's are on a separate unit, I made it work.
> And so far, it seems to work just as well as Tegra186. Then when I was
> packaging up the change to submit, I found that this had been
> explicitly disabled. But I'm not seeing why. Am I missing some
> additional factors?

This isn't seamless handoff to the Tegra DRM driver for display, but
rather to simple-framebuffer. While this does technically work, it also
causes a spew of SMMU faults during early boot because the firmware does
not properly pass the SMMU mapping information to the kernel.

In a nutshell what happens is that the firmware sets up the display
controller to scan out from a reserved memory region, but it does so
without involving the SMMU, so it uses physical addresses directly. When
the kernel boots and the SMMU is enabled the continued accesses from
display hardware cause SMMU faults (because there is no mapping for the
framebuffer addresses).

That said, we did solve these issues and this may not be happening
anymore with the most recent L4T releases, so it may be okay to revert
this now. We should find out exactly which release includes all the
needed changes so that it can be referenced in the commit message. I
want to avoid people running new kernels with an old L4T release and
then seeing these errors without any reference as to why that might
suddenly happen.

Thierry

--rhigqaftdyzecuql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkIjNUACgkQ3SOs138+
s6EPdA/+KQRZ+i4hpf5+vNtlPCdkDropF79/cCV7LCIDkl2R/QE3dVZfnEYL7cv+
UTq5OQ8ht9NdSGNKqWLqHc+z0SupjcZSuI7740Fb3eiMVft9CbyHLzJ+W4B4FkHF
pWfw47jVEeUhkKs2Dwt37DiMjw58qml70Vuh9iaCE5uN8zNcTosJEmM2pqIDTGqP
7inkRXmegFXW2fd+l2cCtu6hK9xJ/B5SajKs+njoUNfXnIGUPqJwkv5WITl4LQNB
m/0ZGC/zsaD8IihEZtOmcvSeBS7silmJeJW8FSbbbxFn4LsiRkV9KudKukCsnAgy
eiOsspNAjkgzcwW7pKaF558ZxGUPsQqRuc7CEju575amijmUeDJI+B/y+MW0mKGw
urkXpl+4OiTth7E3I1eqY8xr52AMwMDWr9VpzukUVr4z+J5ScY2ENTz7hmCgVRMD
IzCrRSPrKvD0NJ+0+aI6CSLAlen3Cd8wiGQ5vzj6zSuA9cXG3o8vBNB2w5tTGfm1
zUckLwcEfNgBbQ5q2zXfCa7Ky5tAyLqiSN+wMVE3h/BjVVsG6vbzSZOxWbQ4rqJA
lBITs1fe5pJw2EdlbMenggIzUQ+/G2s6Eg+b3ihwLEaxGaBy27qooXl6PKwFY00P
8JmPOJjjgVavEzsPBml5Lx0dfSDkCMvrcgCGa3Vpk2vELUFjADc=
=BR5A
-----END PGP SIGNATURE-----

--rhigqaftdyzecuql--
