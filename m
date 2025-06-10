Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4AC28B4FD
	for <linux-tegra@vger.kernel.org>; Tue, 10 Jun 2025 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549210; cv=none; b=agq8Kt0zrjC8EjVJMLzAFmwZvYzDrc4NSibcHJXKsL1iDK9Q6Qu6hPR20lM1zNri08VpVepBIcbAuMN1cBZc1OtIlae7WXVOObbVcphTT1FetCfM6JkYtUZLbF9G8GKiMEMxJME9sYChV7jgvltp2+hUHuzYo1WPJjZu8pd1yKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549210; c=relaxed/simple;
	bh=YmsTgiwWpHWvrWlkYScp/25qE9Zm0x2xShBrVv7CupE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7xkxPQPxM4ojh4yJruye00OXvHgQLrgCU2WYHZVa+GF8w7Zi85+VQiIbm7niKuVgR//YuOT0n2YIq46RYs4flDmsO630cdQHRVysmZjz4rFYwFkwT72hemK+vcrloEM2qJW4c/Xe2OkA1cjUKKZQVnBIKzBYMF94UpvOmLKkvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjRNfVZf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjRNfVZf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade750971f2so115421466b.2
        for <linux-tegra@vger.kernel.org>; Tue, 10 Jun 2025 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749549206; x=1750154006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ynyqhKwfprNPUGA4lTvvfAnYi3kIYj6o56wh0qfwUuY=;
        b=TjRNfVZfoG91tM559MBKs1AWGXl1D+Eq3lckfwElqVncKn+zbxwa75toHSeIGhOOId
         c5+eY4ry3CirsZnY2NsNPezjPIr0/51DkXFVNHEQWxaWkabl1UoKaBRmXI6eCZ94jr9M
         CWzyohbpWzvB7fd06T6OFKAa3tx8BfoteNP+VQdmrRstQYFiphm87guYbg4azViVDK5e
         pvVtX27J1bhJwFfFol+IjLjAfBvM4hQDkBof4XEl60m6am7h7A+FjmfmE2mynReHPwbZ
         CEIuDjmWZBlysnlQnKRlcdAF64z9RhYBi9yK1VCte2EaNwLnV0+K7EORRzScSPxu470d
         HQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549206; x=1750154006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynyqhKwfprNPUGA4lTvvfAnYi3kIYj6o56wh0qfwUuY=;
        b=egHe+ZgVuDVeiCO9Agdn8GJaMSjH3tWiwDcl9N/u0xnENQtSMecCbyOq1fu9I1IrFP
         BHOf4SThJ1OU1i3PUmkc3A/hJrd9/MnOwGmKPvEUBT3scXHtk/KUhryPtLr0HqMzS+wu
         FCRVF5jTuytsM2mWC7Z30bTIZmu7FEuulGQI5BZksaAf3OFlwVV0e/O8C3r24+4y4rra
         mhBEF4p876BfwuXI/hCYiUR73jLW/LnWX3sAb4sM+BYyPe2CL78wLM66lvAIICBrJcuO
         JdDf9HaA8zeI1uboqiMcIY/c+QmUc3mp4G6XOvXH5nuPAt6+8xSE+hFKqnhPwSYFUl3S
         aFkw==
X-Forwarded-Encrypted: i=1; AJvYcCUArXa2wLv4bKS9nQUjO4gMtJ4GiydbC5+xicDva49yq7h9skmI+L/8VlczUrJeG9iku6lED+ENLgx+GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQpD3P2Y7IPzrY6F0dCTeb/6hRqSp8W0hEz4qsFGx4HNiFXe4
	AEEaD6u6MjKQ3LmQJei7eXCNHRM1xefy8LV6ZiEKaHTVd6dZfiWUIFFC
X-Gm-Gg: ASbGncs477x860d3+JjT8Tw1OlTdBIcAfNUP4W0MpdblwR96cd4wtudyxH6jcSIXVWf
	pRqU5eTL+0H5c7ekXPra3oJaZgpOsu4r8aQO9cwntnY0OsDo/QJPxlkwXAuRZctLswNUcBo3w41
	d9cFbSt9SqkNuXu0/MqTM7zW1kqlctUXK5oVyR6Hc+yWiTYK/TWM7bXXYTDlZaA3vuUSHS8gmyE
	BT7v3SALzmrWrS/UwoIcB2RMvdf2IaGA6hzgsLY7kJLTSjE11CZM/p+LCGnOQOn//AIC7LUOpUb
	e4UPDxdUlIGePBOd3b4miAmBIaaAl5GmFrjAsBx3uGA0nR6SNtbbokzLIjNAPoQj1KaFm+1xgOP
	VCGDTE0v4g8xOUBSfNY3jZKBDxYomJOuH7e17bz0ZG80FR9vn0bD3hCqlQME=
X-Google-Smtp-Source: AGHT+IGe0qSd+CguPpuDw/vWQmo+8UBgL9eF8vO1hXeva+H8aYcdbH0HcR/1Tkn/Fb7c2OknDpbnIA==
X-Received: by 2002:a17:907:7b96:b0:ad8:8efe:3205 with SMTP id a640c23a62f3a-ade1abc5a39mr1482183866b.55.1749549205928;
        Tue, 10 Jun 2025 02:53:25 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db5784bsm688003166b.71.2025.06.10.02.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:53:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:53:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Joerg Roedel <jroedel@suse.de>, patches@lists.linux.dev
Subject: Re: [PATCH rc] iommu/terga: Fix incorrect size calculation
Message-ID: <ymj7mvy7ezlbb2t5jrv47qdrxg557q424g6d2vlnc4dyav4vfn@smwgn5d4av3s>
References: <0-v1-da7b8b3d57eb+ce-iommu_terga_sizeof_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xtiiprxlyuwuxuqc"
Content-Disposition: inline
In-Reply-To: <0-v1-da7b8b3d57eb+ce-iommu_terga_sizeof_jgg@nvidia.com>


--xtiiprxlyuwuxuqc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH rc] iommu/terga: Fix incorrect size calculation
MIME-Version: 1.0

On Tue, Jun 03, 2025 at 04:14:45PM -0300, Jason Gunthorpe wrote:
> This driver uses a mixture of ways to get the size of a PTE,
> tegra_smmu_set_pde() did it as sizeof(*pd) which became wrong when pd
> switched to a struct tegra_pd.
>=20
> Switch pd back to a u32* in tegra_smmu_set_pde() so the sizeof(*pd)
> returns 4.
>=20
> Fixes: 50568f87d1e2 ("iommu/terga: Do not use struct page as the handle f=
or as->pd memory")
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/62e7f7fe-6200-4e4f-ad42-d58ad272baa6@=
tecnico.ulisboa.pt/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--xtiiprxlyuwuxuqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhIAJAACgkQ3SOs138+
s6F98Q//SCHTzZhRnxaJm7hof3jA2KxWVvS+Xsgu1tWVrea5XhXWm6wz6BoupZPk
zLdS9MGapHHxrsqVfddKDGsBW08GqDml+oFxuYV6gnX7sYpcHyjFYbqOkR2+6Z9W
wl2jRJEhDaU0woCj7NsVqqBABMSJhQxsZLp7tIOACNXNUIQ0clz4uwXCfnBDEhFI
BB6Bm9pdOy5BovIq0JeQnus8S32W84Ptn0OXB7ZCxhBHr1kM3kuiz3YU5Y2e69cb
hM5jcuNKIsp2xFEoC5dnfYA2lyH3aO+/+6bcbU16ZoHJHohByREND7XaKnZFe8pW
I1VfWSl7A3jC+Ti6q4Q43jUVAdPsOh02umxDzMZvXebySC43YE5dxoHWbBJCTf7j
1P0C0Sv/7vhUfaW8Vb7ocvEMFufBreVryrgGs98HW9LRYQ80J/HsQGlOG4z5nbqr
ljLk+nq9WNYNFgKb/KNwhWodGehQh+oR5fkBxjoRaqUwlSl3QDx/jXfvK4ihsdmr
0wC1/hv/wVgJ4bcWEVi1nbMb+Ryoij9QVwp0c/ETLqNVjwag+wjDwW19IPHtP+kW
Sos6hV1fcwOo5/+g29MLLNJEmokgaVw6O4XzmDcgyOAp7/ZQrwYEV1frSjYOIdNm
DnLfkT6xj+MP1vXUxNJEBTKlkIJjJo51zRseJiAWfKc/HJkbmds=
=CuHx
-----END PGP SIGNATURE-----

--xtiiprxlyuwuxuqc--
