Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77F329C6D
	for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236270; cv=none; b=P6GNscYNTK6ZuYqkGUGD7Mk572JAO51OLdcg3P0QQihqLzNOCYtWbTfw8jqCzwadeJroL5ceRXdCtJ3dBbD69etqHK5LwK980R1walhrNCQVqsST6UsCMD1ST3WuzAhqNLMqn+FPom6CLKxnVCqd13zh9gPFKOZ1tly4Pl7tmnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236270; c=relaxed/simple;
	bh=9LmyuC/s7oRdVikZDSpF2fV1icZX6r5JHOPL1xkJJ0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIqMrx5pugB6XwziX/TT/ywlhZUHlcL92GfoUNCdM5eVW1dzYAHraNAMfWUY7C7I+WX09/68NTH3o6h3fcXs+lV9/kxk0TRlLKAoWYvjWt69ZfsfXt0tapKJ6Voh2JJvXF/XKgwsHUEFbiCAmsoLyyGvBELwzlnh/nmHm4Orl8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch5sPwdI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch5sPwdI"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b762de65c07so93434366b.2
        for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 01:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764236267; x=1764841067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qZLiNYJlfS3mb4AeFT1CN4qD2558qTiIMjfDrC2qtE=;
        b=Ch5sPwdI+AVfVw606YGZuyPmh6TWbcD02E0UsvrbZ3LXSeKv07As0YsJE9CNDLeD1o
         nBHSportX0v+q6/UmiJxUlcHrCIaUg9Yhux/1R2KRbp8ohIdnvdy86tUzN/jN0baqhjT
         xhIN58AYIVbYgy85rPfIFppGuBhZhhRUkL93Qbn0yox3DYxp3vxCqn7Dlm8FTrfuRZK1
         348lTRjs3Tlk9e8CWa3m9IeZO47aNE7wv3nmW/ej1VKv0803HwPe9nz5TV0Y+RXJO4GH
         dnXt340/YTpp106CDyOZE302Tydv/Phj5zE6Lo66xgjzcwtQ4Ioe9JAWIscc29l6iCo9
         S7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236267; x=1764841067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qZLiNYJlfS3mb4AeFT1CN4qD2558qTiIMjfDrC2qtE=;
        b=LLp8t4rmc9Rh1gYqq5KKA3KTJblfmtLmjjyN0QnAxL/vHsQGvKQUHpYQcLtX6JoC6b
         xhPXG2MyH7uUare9vmOHyz5/FLVDDNCsJ7prWGJtAlaa2bzlOah29ePBBazmdYzQTQuv
         t/4niN2Xe2VOUH+pkEeBoSaxCJbggHXe1DKrbV60o+tvcI8bBuCPrEH9q2ko46dbWXm2
         cqzGfEcFGA3wm9fMQPjjFjbj9xUub8tnz4UYFLCXLUPv1lSMVGmC9l5R6OmIPsD/eICh
         nkanIvzcSKE3Lvq7uekxG5YLfuWHcyatCs5PEMo5uVUOLLbACj+J/Griuuj41U2Unw8N
         xJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCUb0Smzvm1rxICJrIoKNBozACYHpxjf1GelssGMLtuuW1EteXbNwXxI2PcGOPWLLoJwGpEe/CEJS08ptw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2wyWTb+qW8t6DzL4uv2TaVRozHvDMKKrnNPzinLauXo+F+3EV
	xdOVKj/rKA+fzWi1nsi0nDVMCYZfmoWAmqw+2Nyq4lWFLoov/CBp9sy9
X-Gm-Gg: ASbGncsq+KbyDBuH33O4Hq005Ol1CVWBrFK5BIxzx5N/0hQJQyw5jsMJOGiPZ0DsVtG
	pRHD4KSBig2RAuMJcA21opQyTrQUboUJRqxkjK+RNDvuLOb4ccMeEf1AZAAJ31ZsWjfE4SVMw/5
	FcZGnct0VxuLRacaC8KKSPurNurseojIX/dw1+P1VkD6ug+JyJNga/R7DqqAafjVtjfmmiOhNXx
	3q8EuVc4mVB1JF6uWb5rs0XIqaIhWOxkbLtlvvJ7m8WCv3aMhdsOSpru3gIqwO4rNr3Ll+hzSi0
	l04VAMdyA0xAJePQGgzwXYAiRpmCL64o7dwFs9XqxJidOsyW1MGYf5Ka68OXv6hTMsCoHDtHxyG
	AWj6DNmC8g1pdWEi47MXnk9ffvXOzMWcDBC6QBRNmT8A9oHNg7P4OfJV1FgTSrP/AoXQK9kteYl
	YKZm/HqKxfi99sDF1/kJipZfykoPrKFtmbI/NGivWQbeC/xC3kfzXA855DxawPfjjp6bg52fb+a
	93Fzvq4Kyn2vG+A
X-Google-Smtp-Source: AGHT+IF/UVgvMjdB+KUKiW+HjXKxDlZdBOQy/4DVqhoiv1NHoHtHvjilqqvuAhJ4hwIhw2OcyLYXxA==
X-Received: by 2002:a17:907:7e9e:b0:b71:1420:334b with SMTP id a640c23a62f3a-b76c546da4bmr892897366b.8.1764236266421;
        Thu, 27 Nov 2025 01:37:46 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f4d533f2sm120777866b.0.2025.11.27.01.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:37:44 -0800 (PST)
Date: Thu, 27 Nov 2025 10:37:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 0/6] Updates for Tegra264 and Tegra256
Message-ID: <rf7m5rwnz75ft65zxy27fmndoxo6cc2hckbgzfltzyz27zt24u@n6hmqstpp6pk>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4pnpg6sftsfo7qr"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-1-akhilrajeev@nvidia.com>


--o4pnpg6sftsfo7qr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 0/6] Updates for Tegra264 and Tegra256
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:14PM +0530, Akhil R wrote:
> Following series of patches consist of updates for Tegra264 and Tegra256
> along with adding support for High Speed (HS) Mode in i2c-tegra.c driver.
>=20
> v12->v13: Update has_hs_mode_support to enable_hs_mode_support
> v11->v12:
>   * Added two more patches to the series which are needed for Tegra256 and
>     also cleans up the timing settings configuration.
> v1->v11: Changelogs are in respective patches.
> v[11] https://lore.kernel.org/linux-tegra/20251111091627.870613-1-kkartik=
@nvidia.com/T/#t
>=20
> Akhil R (4):
>   i2c: tegra: Use separate variables for fast and fastplus
>   i2c: tegra: Update Tegra256 timing parameters
>   i2c: tegra: Add HS mode support
>   i2c: tegra: Add Tegra264 support
>=20
> Kartik Rajput (2):
>   i2c: tegra: Do not configure DMA if not supported
>   i2c: tegra: Add support for SW mutex register
>=20
>  drivers/i2c/busses/i2c-tegra.c | 304 ++++++++++++++++++++++++++++-----
>  1 file changed, 258 insertions(+), 46 deletions(-)

I really like how this looks now. Thanks for seeing this through.

Thierry

--o4pnpg6sftsfo7qr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoG+cACgkQ3SOs138+
s6FrPg//ZV7UbYm3KX7weTtDnjK2YaMsOBxQEUU+TzHDukwCuR73d73aIyLSetza
KiB2X44lMt2ULvw5aXTlXrC3+ysJk0HjSDlzFZQptP8Yt0r4B2Gd/yZlGYsgT0BJ
+ftmSXDG6Hza2368SYj3qcpBSeD/HMSoUzZfqSrPmpCGnjHmoxCuTl+J/RMVJFk2
vuAqBvY9KNJYZq93KRE8pjE9yufLiZeBlmM7b2Zng5l6f3WcEzmJ2joEB4h98TVi
0H9gLPC3GZnNrFGocFRj3mRLjkINoR5x9ft4SM3CsBCsRLzqdaODn6qSL8SlliBh
HZ2L1mX4U6dqzgwQuiHnzr5nZc2pE/lr9/bHFhWxDs8soBFot6HLrTYMj+ddZlcB
0X0OvVU8aJEgBjI6XSvCnJB37686lyXrgA7pVr7Zj3xLhUB0so2du6Hp3dVpoHAr
TkNbAMpmoLn9KjQ/o2+RZITvFM/3Ji26Ct+l/IWJ3f7Mz4Lakh7kicl7xDW3KtD5
fo1kt20i7qdEOUQWadsYhbM/DgmjciZEzIKSb9GFp9+kY9I7stsbyD9WnEW85h4K
s8ZYydzo9BwhkMIRaB4DtaY87uqSJHqxHPHFCbErFMxza2hp0h4fh2Xu8736SYzn
3MISZmXLIFGG0GUbjfTavCKNf8ybTTdkT5QK93z0+U1zy6W1sVs=
=kflr
-----END PGP SIGNATURE-----

--o4pnpg6sftsfo7qr--
