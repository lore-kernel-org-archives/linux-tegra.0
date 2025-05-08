Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1253D19D891;
	Thu,  8 May 2025 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708716; cv=none; b=qA97FJWJWEsHds6PJwhoqEpncTOtqWXCm+YVsaGYXn4VY+RKvMlRIx4hvlza+KQIuOro2Zk542wIzJ1PsLoyDQylBgSuD6F73Nym+YTTJQRmFY+OPf2PG+wCe51qUX2dBeYvfoiD+wkwdyghY7dmE5VNJ9kVKYrE5Tu4BhkvIVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708716; c=relaxed/simple;
	bh=8MGP45JkGa19y4sgjPjPpJJEAWH6I6I5ydA7OZ2VTbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNLeREvnaHAnAt5wtoBXNPalqHzGELfvM7TQk7biTPaedBSYXD6VCMJ11VIgOVxq/7bD4jfHu0b6uosIOCRiohkwPsT0n4askJJ0ubxVSUSoZTtyfbiDxncxy8mtlcTvXJ30iPEQx8rw2cR/ZgjlvvieRD+IIv/MM+lcD2QuFcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1Ko9XyI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1Ko9XyI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so69678f8f.1;
        Thu, 08 May 2025 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746708713; x=1747313513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9+poLtgRl3YswVuFjH83SYhzG62e+vyKcrdqXqme9d8=;
        b=d1Ko9XyIQl4uA6wirg8tjvH3LVy7FxFY07R6IaALzPd7Vl0rpt6c29tMmUvaC6t3eh
         8yTgsyRa4j4MpqEBBmXyzp//D7B0AiqsC3JLvys0Od6BR+7xvf+vrQmYkzRfdieeWaHb
         BOKyx3CTctVel50Rb2+TtR7SoukAF4qO06903xgQULuSj7Zgq51c/gRg7cFk9VwGxNM0
         ofEKAy6mEQDTJojOvOwQ+CdyU1iNtACtNBqpxGWGKf/yX38GaGZGrSLsuHcVTJdrtqy5
         svJyiEQqzPnaiROXqMVYRlgJmTChZol5ZeB7tB3IcOO7kMyY3IpAQPvgWFz7Ry24/riv
         81Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708713; x=1747313513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+poLtgRl3YswVuFjH83SYhzG62e+vyKcrdqXqme9d8=;
        b=VcwBNHw8uSlMD0s5Z3jWdIBOjhP+bSojdWS/WvIF88ZsMEuBTxZJM1QthQNNeXyQlw
         VdaQfj70zaFP85TO8IRJoGeHI8vnqTsvYBbqVwCzb8Bz3P+/X192GVNyXCRBbp9NO7NG
         UeLr9N3+oNze5J162OKx5Thnb1OMT0h3oIXqGksrZf0lZ0KMpI60JLoedm8rT6widcxw
         GmeMdxq8lXPY4l/HF93c/hJljGefwEDnQ1g3YqhpjMe9tREwjh1vwHJ0gBmN0iqM0PCe
         6ffMpAj811VhCKklxGDJzMa1ZqufmGYoX1XzuwhdzUkpSRzcQlyrfm2em9bFynWv5NIR
         k4sA==
X-Forwarded-Encrypted: i=1; AJvYcCW4QpT9BLThyt/JhKOFUjSb2MVUDDkiZQNbICtnS6+0IN7UrX8EHXBMsi0vwQm4cZFYoJtdtaQrqYhfvbE=@vger.kernel.org, AJvYcCWs9/muNRwngqHFEcpwoK+wqnDvyzjj8gRAA1Gpk13MBVVt58zt/dPFd0Mvto7SANY0HXkdMVo6KfVzOUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmML1AzHO93pOYmbg7cymz8ALqljOn/2W2LvQhGVYiEZQw3fgP
	vAIBO6eZG2WVFSvcl9SYHdF4VLuYdyI/DtZUbZX967KtpK8x9/i5
X-Gm-Gg: ASbGnctOQB727wMbCqxFMAO0XRm5pwjvk1c0768PHwlmei5w6wkJdkqK+oMbA5uR7vl
	x5Rt6s2mC6ApbEcsVSbH/kVMLG0CSNj3uQh3Qg00DQ5yc/xg52uYXwxrmbDdkrYLj2O94Ch9XOL
	u4dm3UV+cEnmPk7KORHpN7OjD0WQcOOwf3kEUSGcdjNVxFQH7fePhFY1NqP23gpkysWJDNDUHJB
	/AwuNJRZNtFbK9YdW02w7Q3CcnlK1T8Hspke/GLdgZjJowww9GAfDeP4CVSDQzknGxKS9Ys62tb
	X6iE/vunaH+4jJbuwNJkc1/64AbTw3599nCnJyMr+OcYY+y5h9/ixC1eOkmxKPlxg/2vGM5/Gr4
	s5hh8+ECn8ot5moB0EYuiKMaBXEc=
X-Google-Smtp-Source: AGHT+IHVSlhJMralJFr9IWaJ7jXu9jFCPuVq0amV8ZDacIm7OK3mc30KO7OC8MlMXD5l3NVwjuycLA==
X-Received: by 2002:a05:6000:1a89:b0:3a0:b334:6a9f with SMTP id ffacd0b85a97d-3a0b4a1cea4mr5607453f8f.58.1746708713006;
        Thu, 08 May 2025 05:51:53 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm20420127f8f.97.2025.05.08.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:51:51 -0700 (PDT)
Date: Thu, 8 May 2025 14:51:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Vidya Sagar <vidyas@nvidia.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org, 
	bhelgaas@google.com, cassel@kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, treding@nvidia.com, 
	jonathanh@nvidia.com, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
Subject: Re: [PATCH V4] phy: tegra: p2u: Broaden architecture dependency
Message-ID: <fun6ylsmdelzfbkkpwpwtosbqm6frfht4w3bmbz327n3ax45be@lsf263lixqv3>
References: <20250417074607.2281010-1-vidyas@nvidia.com>
 <20250508052021.4135874-1-vidyas@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wmto3kffev62osw4"
Content-Disposition: inline
In-Reply-To: <20250508052021.4135874-1-vidyas@nvidia.com>


--wmto3kffev62osw4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V4] phy: tegra: p2u: Broaden architecture dependency
MIME-Version: 1.0

On Thu, May 08, 2025 at 10:50:21AM +0530, Vidya Sagar wrote:
> Replace the ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC dependency with a=20
> more generic ARCH_TEGRA check for the Tegra194 PIPE2UPHY PHY driver.
> This allows the PHY driver to be built on all Tegra platforms instead
> of being limited to specific SoCs.
>=20
> Link: https://patchwork.kernel.org/project/linux-pci/patch/20250128044244=
=2E2766334-1-vidyas@nvidia.com/
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> v4:
> * Split the Tegra194 driver and phy driver changes
>=20
> v3:
> * Addressed warning from kernel test robot
>=20
> v2:
> * Addressed review comments from Niklas Cassel and Manivannan Sadhasivam
>=20
>  drivers/phy/tegra/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wmto3kffev62osw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcqOUACgkQ3SOs138+
s6HAlA//eAMTTH+0j8sG2MTK9y5u2xfSYDwexaFRibonLsN1IzeiFNRwNWwzRTF7
tyQbWEtL+NY/gVjBt8yof3kgqw6NqmLZl4jxZmuSVmUMEsu7PcnuxhQii785Nfle
oKd2ktw6GT23MXXPwLN4Mn8p1ZCs/5YKMwvVuqXE9+FpGLwOlErznH//s5BaSV7Q
NS4bLXbZ7rsWXEto0kOz6ChIjCVxDPCx8IjMZL+tPpG2TVTjfs4fA9pbgYBqIx3Q
mFTSm8848LJBD246+1IjplqkphF66gXhXAMBEHnb4HWXKexrjKFZagqs5p4etVE3
KtX9kOF9nm6IZgXqbAKYV6pwDDQqzi2cfgD3nQ9Q2SBs7KAwi/uuTbi8Lz1xa994
zmJ9pRek1ykr/HYzkK5Kt4EjLDr7sxL5ZI6UwVTUJkbiqplRsjIzmXsSKB87kDR9
Oekyiz2EsO8V+RTgE9IxKXCE16y62Kw8Wi/dMt/I+mOTeaMnG2EhAJIJCGQCZxS5
hx3QhlV/VZoX+RWlpvFC7jW+esPrcJqLrIpirwztd0jYrKi5Xuyqh8lL1T1PMARM
n6yuFi2KbMeBa3xR5PIzYodyozHwc5m90N59J7qYAFqfBk0oiuFiJWqhVjpw7whj
cqm9HGGQ2bPRbrYdKKfmPVezxiMNJfnfmpWXy075zTaTXunAHGo=
=ifgb
-----END PGP SIGNATURE-----

--wmto3kffev62osw4--
