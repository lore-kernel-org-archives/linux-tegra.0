Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC45198E63;
	Thu,  6 Mar 2025 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284633; cv=none; b=E5fGkuSyBwVw1J6cFnp4Usdn5oETjYLv8K+QCQy/FZ3ZW3Vxjh9LCzhCnwuOG4AlNCz//deIC9G+ZFOb/eSOBp+jkKYwfmmDWt62yd4BxrIn6UNB14Q5CUsiZlV7mBlmiN2M2fOGAqf2kUjatbn1TEckbWEptZzdVbZ7x85ArOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284633; c=relaxed/simple;
	bh=NcAq6i4qXxy+DxuxjOPRBDxp4hm1V8cJt2FY/P8BQu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eh8/ZKdQdMcALRs+BpkKIe0npIDLfRHbCvJP/Cq9tICTtTYN1UnONKWOSNU4F5y1Lt7egDXlql7cIIomQnYTxiApX0LLo7cQ4RLaTczDZ31nEmtn/5sypOB3gi+ACGGt29XL28EEDUNWJ2qz5Xm6uQm/syw42ryxHzHIIwqBb1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b16oqkN3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b16oqkN3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so8557915e9.1;
        Thu, 06 Mar 2025 10:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741284630; x=1741889430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpJd5VEUHNYbPEkhKiiZjG6y1O0y85lYcNNjmNxE8CA=;
        b=b16oqkN3HyvUGYmSYYjemgsoqxc1JmuqFYKH4bw1G7bN7Hv4f2eRGvR5Y1sq4a6gLA
         3GheLpmjpbvEeb0awu0nj/boZkZsGlAj4AdHW0su0IOMovT7V8khWfMbDauIzjN5Tpd3
         tpDx5hDLcQye6tJV8awsAxoUPdaU4X9aSfkz7MEOXS6451H6uNzkJiHTWxLKCpcZqkQV
         obkIy8jSSHRlyLkicJ42TS4thQhOwfnBcW/BXk17FqpMwruE6T8+38OhvdXhv79IPms3
         aeWCu9ei3+geC/xH0I4UAcb0I9cosHvDFNX/mUKI3GcBOgh18sEPb5IvoJ/K+dp+IvC7
         T1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741284630; x=1741889430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpJd5VEUHNYbPEkhKiiZjG6y1O0y85lYcNNjmNxE8CA=;
        b=MP7wi1/27Ykh/HiLtftmm/z6ZpbFiuCPhVPei4asvEK8bWa9G0xf6Agx8agxF0TqHO
         Vl+soLp33J0ZKgll6qo2b61J51LeaZDhtAzeMxt+ZCbtdDAnDktSh76AauA30qQuUFeP
         LMNQO+JaKGkIuGyexRRMLAHmFOZgSlbm3dHtJsyRPHZDMyPe2ZTXzbHfcAjEPaq8SJZD
         A8av3oACVIyY4zY36gBFjBZIFmo8Nvo1IImuBhZZAxUA4qbo/7JBw5mFlrCYsi5gGilN
         dnaoW2cVG3KtWUp4X9dYPcOS34AQtXShJewwVrg/Ml49lFdyIIN+ccV3Mc30vnypNqQr
         LOPw==
X-Forwarded-Encrypted: i=1; AJvYcCV0djDDqZwlQJITTbdSilDlMA+O5MrMPUQ1pESADl3+HPiMl7t6IF8zbPVjwN86IA0TxjDd99JQ+7L5bv8=@vger.kernel.org, AJvYcCX0cCNQtjXd+vnX7EL6+vwzN6C0hdyWfTvDsiQEoyMfFf8oCFn0iSlTsMJS6YmpJhXMtnWa6DLOzf8b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8qtgdonX2qddrKRWSchj9swC8xFKbxwYVtyE/Vz5KC3tjxFtQ
	VCwLUeL/7CIns0lq9F7LTZHPsj2M9QsbDUh6mbSEmG/U1n1YDYem
X-Gm-Gg: ASbGncuEZl8QQxy5Qtae23IZ2LpXOQFH9Pml47OoyrsDJPyB3/U1KX/fxIgslXilr2r
	AiAmD5DC1DooXdEmRFokh1crnhnZ6fpI+rU/UBhcMuPpQK0g2Xyw9hy6LDnWTxQ4n0+bwhS4WGg
	1M3T9IY12yRmdrnwNN8nPPQUHukV0ZeIgLnlHCxk7QgGTmXrx7apofxOhhKyUoURWY7yt9Ug1Bm
	Oq97UHIIE2ZjiqSDx/tjk+d36IQQJAopJ+l2EiQqH6HnVFy0MlXX179CffkKPPKSi2EbZnkVVmy
	IILZzrwbOtc9V1SQzusjnvIyDIvRZD3ovrOM3/hxxuVEStx4kckyw0hUJMsU4JEtc7Fzs3JIRi6
	f6iJWg47TU0GaGDmoeU4/q4hPUOJ4/L4=
X-Google-Smtp-Source: AGHT+IH+S5zj59HDoFuKbYrb2dXgsy9QeCurvzVrsLX6E8KGuh0NoTgRbe5E3X6IbYPUF7sH8P3l2A==
X-Received: by 2002:a05:600c:5117:b0:43b:d12a:40e4 with SMTP id 5b1f17b1804b1-43c601cfd31mr3871825e9.17.1741284629775;
        Thu, 06 Mar 2025 10:10:29 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd93c9b6sm26628735e9.29.2025.03.06.10.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:10:28 -0800 (PST)
Date: Thu, 6 Mar 2025 19:10:26 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Resize aperture for the IGX PCIe C5 slot
Message-ID: <nhswn2yxhjcc3e243uc5psowjnamvvj6defhvolx537go6tfvk@4y7w4bf6gkbz>
References: <20250116151903.476047-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2hzkjfkfueg5tx25"
Content-Disposition: inline
In-Reply-To: <20250116151903.476047-1-jonathanh@nvidia.com>


--2hzkjfkfueg5tx25
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Resize aperture for the IGX PCIe C5 slot
MIME-Version: 1.0

On Thu, Jan 16, 2025 at 03:19:03PM +0000, Jon Hunter wrote:
> Some discrete graphics cards such as the NVIDIA RTX A6000 support
> resizable BARs. When connecting an A6000 card to the NVIDIA IGX Orin
> platform, resizing the BAR1 aperture to 8GB fails because the current
> device-tree configuration for the PCIe C5 slot cannot support this.
> Fix this by updating the device-tree 'reg' and 'ranges' properties for
> the PCIe C5 slot to support this.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Looks like I never applied this. Picked it up now.

Thanks,
Thierry

--2hzkjfkfueg5tx25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ5RIACgkQ3SOs138+
s6G47BAApoksEhD78wSA6KByoc4j8ZKVamZPy97/H1UlmLiD6ZwlbhFDEsLz0O3q
VEBjkaQPng2xtniln9EWq3x5EAAd0L3HS5u+sVxtkM5qFpMSwg/tV8Lm/8Qw5y80
cCEdU74qeNWCPhJr+jDYynO1E3VXjnwElfjzXI39nyU7vGOlZS5zCgXHTtjoLhan
gQYNWwgk2f5FVA+tislUoqLxPlQPi3ELMd9skIizP8p+XUyMBNk1ToZVFAGpHIVe
rsuvC3SEXsMFdDTqwyMlyI5TRUw4D4VPV9o0A8P03wMQBLMg55EjzkSvJSRsBZY1
D9jRK4xm5LEzVMHjNIDU0teK6XtMf52d+uU8n2C5DEyGiHEcsmJKq4xQkQ+acicM
bMqqAHeePZV/n+XG4EXR1Bfdty9KBkEIlDUbTvB/tL2ILQ6w1av4W7VDzS7qARpi
jj56LEsqtyLb57635DQezsFu8Mo3YltoruU3qEbrNk9zGXCZL6HFsUQLJirA6kxZ
lG8Tso2y9gQxyiGAD8o2scnnHLtn0j55uBnzHvaWhLM69O+J1MZo2JCR94SOt7Um
XKkXBuYGuFycQf1P0G4XUpTgKDxJO2IdHg6NOwRpX33gBPPzIci0gZZvh1rKGDIe
RoGURjwUtfgS8iJDdUu2w3P7s/T4IIfGBji23X0f3PVlkS8xh44=
=3UW8
-----END PGP SIGNATURE-----

--2hzkjfkfueg5tx25--
