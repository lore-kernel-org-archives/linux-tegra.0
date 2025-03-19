Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308981DF747
	for <linux-tegra@vger.kernel.org>; Wed, 19 Mar 2025 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742407849; cv=none; b=HuRtpddkhu62HNnVoO1FrIyBKiAVfndo2cTjYVlfMuPbh8NqJhfOGMEPEB4MDjhM01lZZhNGain2msqehawwfrFSBUR4xIi3zNfNE4xY2A9V1NwV0P6cfli9yYDZWRSoCG/H/33+aWFZ/gzFz1gKSRUjZE/vnea1KuGbdn8iwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742407849; c=relaxed/simple;
	bh=NRDBPEHgXUupa2eHopjm+NVMZxrKrUuYtULMiQNFxdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hliFUxqOqo5+5tLEZydLiCjoA0kMw7dkcqfppcLpRVfizYJbh6u6KolF3eirCOExl2ALBVyGKJMeNLJDPrTOev8iYcUI+1mpKik1Yx7Z/hYErn/4gkO5qgbzEwCF0qtF0A6QFdAhOW+8Q3yuwRgii8sSKxTnfTbajJ6TkP0GDE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5wpG7CM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5wpG7CM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so33018595e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 19 Mar 2025 11:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742407846; x=1743012646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRDBPEHgXUupa2eHopjm+NVMZxrKrUuYtULMiQNFxdw=;
        b=k5wpG7CMKkvIib2bwXMjx1UqdzGrgFPYWVcIhAS/E29Lv83swRQ1LSQ8guFnC3Pmji
         bCkaaw+1Udbb/YMalY4/Rp9ZDspo35hjJujsrFouUobTb+DqZ26S63vcRdp7VG4htL1F
         zbBeE/b/tFSrcIP/20jHMVE5l37XAcL1+XPhgaGaxuDeCDHwbpS4DwUHzw9d+lrZaW5z
         M1Bl537NJgp/6YR+Ahkq82YVKtU2pSoSZ/PnqhwjrIWgYeKcxS+3wJVj67UWGCDFbty/
         zA3pkwDXp/7xruw4AUH0oVOlY+DT7k7YZEOvClEIX4XYGPOIJGxSqWjf4vbxq9tBdYRU
         pT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742407846; x=1743012646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRDBPEHgXUupa2eHopjm+NVMZxrKrUuYtULMiQNFxdw=;
        b=FAIQY5L9L3A6e52AfXijomL5Rtgf+/KSvutBkpcLepzKHkb/ehfddWtUNr/vdFSLtl
         nsBZl6D7JIKXWlOlxkpi4ayQWsiYqrnET593Lo0tjwuu0XUCEpBxCMXnARatQLY0tDPE
         oeHe50F/VmJfwYI50eVWidqbLQGZrc1CtowBJOjL6AFv10d3W62Wldgy/346z6ei8cNO
         DrAGiYnnCmUb2Y9e1ajOTNxOLFCsHtJiFpxNaM7jt8WTW8E8gWSqmHhkTZ0WOHESvCg1
         k5amsOdUoDw28PSANXUYD8XDWatHxpJ43pzPqlWc0BjKxaG5R6hBnZasWj7KK5mV3iPJ
         A13Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnrFhfWvfTsozYLEiMGg4LO76Rw1iD8tNIurkGlkE7hZU+XgVVhSP6FGh0wC2WXkBBqMZ2reMa+T0TSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPD0xHbPGAssHyJ8K8XklilzNjS2KaOvTjzAgERMfCQuglnxgT
	RJ09UkF5j1HARiCkDDiB1bBdK+6OcpI728QSg5enaDJVjiyVyoCr
X-Gm-Gg: ASbGncvsF4HCAHb4/ne/SrcSdGEqmvXS3s41sCtlgtw0xe81WDcvc8f0ydmb8d2SEF7
	wKAsiK2z0oumBHlg1gIM1CASpSJIKZrbwEQjCH6/fKwf8RK6eCoK9+kq/qmrTEdoN3DTPvTwjxG
	fyTitUy+dPnk0JshsFpP80jdRQ6bv3690oycH40lYcfJHyQRRJJkwKPfPCw9gnfPYuLaCa0Fiaj
	ZYBS71Q4I3eXF0b4W3nxR37EvSGFP+mhcMuAnJI4yAqphRwSWS9OBihaDb4zyoi1f+C8IKdoIXg
	3W40UgCh8vVzSWOMuJ+44KT+Fv9hYMgji2fd2LYV/hNGSBd845fwDodDlQARZb6a3wOrhiotbVM
	t/z1jeuIEdD+O7sld2WGAIGj3jIaQGsQ=
X-Google-Smtp-Source: AGHT+IHYFWZdONoLhtaU63p45Xf9+bWz8YoVzEW+0yAcNTLY2gKQG7/aemrHzQVaMzVWmdFrLB4q/A==
X-Received: by 2002:a05:600c:348e:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43d43781690mr33983605e9.6.1742407846139;
        Wed, 19 Mar 2025 11:10:46 -0700 (PDT)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8881187sm21267993f8f.41.2025.03.19.11.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:10:45 -0700 (PDT)
Date: Wed, 19 Mar 2025 19:10:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	Mikko Perttunen <mperttunen@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>, 
	Jerry Snitselaar <jsnitsel@redhat.com>, patches@lists.linux.dev, regressions@lists.linux.dev
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means
 no DMA IOMMU
Message-ID: <vn6lqxfqvi6tbxomrvn6ct3ezvegx3y2q4sdwpjkvbehzzs3gl@ctek3pks5y3e>
References: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
 <19478509-5007-4a20-9512-b965126b7026@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3vs3sblqwnplgzuh"
Content-Disposition: inline
In-Reply-To: <19478509-5007-4a20-9512-b965126b7026@tecnico.ulisboa.pt>


--3vs3sblqwnplgzuh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means
 no DMA IOMMU
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 12:34:35PM +0000, Diogo Ivo wrote:
>=20
> Hello again,
>=20
> On 2/4/25 7:18 PM, Jason Gunthorpe wrote:
> > Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default dom=
ain
> > could have been left as NULL. The NULL domain is specially recognized by
> > host1x_iommu_attach() as meaning it is not the DMA domain and
> > should be replaced with the special shared domain.
> >=20
> > This happened prior to the below commit because tegra-smmu was using the
> > NULL domain to mean IDENTITY.
> >=20
> > Now that the domain is properly labled the test in DRM doesn't see NULL.
> > Check for IDENTITY as well to enable the special domains.
> >=20
> > This is the same issue and basic fix as seen in
> > commit fae6e669cdc5 ("drm/tegra: Do not assume that a NULL domain means=
 no
> > DMA IOMMU").
> >=20
> > Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
> > Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > Closes: https://lore.kernel.org/all/c6a6f114-3acd-4d56-a13b-b88978e927d=
c@tecnico.ulisboa.pt/
> > Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>=20
> Any news on this patch or any other solutions for this regression? It's
> not great if this falls through the cracks, especially when there is a
> solution for the problem.

Looks like I had marked this as applied by mistake. Thanks for the
reminder, it's applied now.

Thierry

--3vs3sblqwnplgzuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfbCKMACgkQ3SOs138+
s6Gc0A//TrzbaprQO4xc8Hgq6tcEIg3KdqfdbBdYgELgL6bY+60NkY0cm5wcsUaG
he5y3ZfuZLUBjV2rlhJAuyOdpScrjekO0lB12wmnTKypOsp/ugFDTgDnrdgIgQU9
Brs4DDAVu9AB/pjN8jHnQ0wOYpR5yXW69ZKGZuu+FAlscC8hVQ2SoyAUP9WDBcw5
cy2E5pZuVs7ti6MhF4MaL1hkFz4QjPnlupAxwBEMslsf/6vzJeTwVwAB9wq6aoj7
43NFJ2U7VLPMBQA0DfdPMI50gJGeAkKfBWuQMIXwRsH2XUT93uzXrJr0qKDWROUA
/s8z6kuKi1jnUZ+gbUUZauQyHFF9OT8sJAND9Tx2bnDUncfmj7ZSrP4MU0F6uYJV
PU13U30Dm76w6IV0X+zNfDUyRUoapVBAbpFRtlKX8yn+mGrZy5vMJdGiu+AUZJBS
hbuEAg5qW+DDcwwJsrjMpOTfIPAEWJ6Kxm2t5Qr/Jtd1WpiCmQD6pDrxud24yEBt
DQ897YMsOP7DT5UJG8B7IXFL95OTyDYTXcSFK8D802Il1tBfjh1jZnoteva8VhHd
wI0bHAyWDdND+KrX8WbtLeDzCc97vw9yJ4RfI7ZI9G2waRmQBdpWXTv1K8lt5gDy
03jmd6jX8CfULyXueikrm5+Br92M9afX66J+ubSq1o2QPn9R+UU=
=aAbR
-----END PGP SIGNATURE-----

--3vs3sblqwnplgzuh--
