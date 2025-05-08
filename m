Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A8288C96;
	Thu,  8 May 2025 20:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737102; cv=none; b=uGlclUW6K3qfiaw7MYcmlizdFz6A2bVzql8R3ZMHPx8PzTXtw3sqQi918hyF5ETCJUFlw1frYJsm/BCFFwVj0RpqG9hR0JzY1ruJrIBRccW20XkyGYuaBHXPKwj8O2DWtT9rZGJzg1j/ocxlFompm2AvwBA6PZc0hEtILfzBZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737102; c=relaxed/simple;
	bh=DouCk8thK2P5zZ4AS87//vIXlGPgjxAOc78HwKw9Jdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcE900b1pQ0e/FHYQvcFl0NeFrbq+IV9Pf3wnaDhSETG/6emuZw1R5OXNkxNA6HOUWa+FQdNsDXyPMYYX75t/k/pKLXGtOpJpSl71VlIAhPlLpzsjDvzBdTFLuQHWXzszD3/TSxFodqX29Z/g+Ylo/iig9ZhRNh+vCJftFkQdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVi23faX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVi23faX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf848528aso11415005e9.2;
        Thu, 08 May 2025 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746737099; x=1747341899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=socg9X9NWsH5gVrrZlrt7sf1Or5cD/+VF6198Lz9YVE=;
        b=IVi23faXFbOVGNQOAyUnoLGS159czd2MSwTjGPXJPCqppwzzN0oBPRWln+yvhrGjTt
         UfO6J00x4EDia2zv27SXz+Q5IuS/MRbeuZFOJyxWKIdbf0vVkG+FXVndtfd4WUYIEFHh
         zbqQvV9AQ82iqvKdb5dWFhDgsIqWYl2jiCuIyyS0JwQhQVeVQMog2yeraek8QUHwJsb9
         Z6UeKpFsX+R+eHUY+iyAv/aAjga2kYiph9NXbt0itvjhG2e+WTaKd9od9fgQ397woHfQ
         KRkk8l+J31CAkyaFbqEfTC3Ew634xd19k11fdI3dsane8719YfC0rvyLOXaAF7px0N1t
         6/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746737099; x=1747341899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=socg9X9NWsH5gVrrZlrt7sf1Or5cD/+VF6198Lz9YVE=;
        b=URWseFBMcO3p4sqeGoD002q+eLsxOIDm28KJBwmYwUVwD6CPKB/7/Z9przSKZ5EJHl
         Z99N0YdkwsdeZ3U7h87RTackveTvbyPxxbinChBXjP7d5peUt9qPKWsO+4ddkeDFv6VP
         eEYGENmf82sYb5nVgTPd3PMv52kkSq7oxVjyXmcvVPJ6B7u2cVwnqCb7nbU4akDk2WlD
         YUO8EC26xQbcqNvFuu+gAQgB1/3JNRlYUu9ISgj6cvuUoxvCLXpcaO/KDgO00X4CNun9
         0R69xEZNfDyIqgq84rFcLDbU+qfaz9gnJpmsyVezVy7yCVdGHmAu+8X/uZrCKpWyWPab
         dJlw==
X-Forwarded-Encrypted: i=1; AJvYcCU9WpX/VG8fQ2Aek60i6VSoE79/eXjF21S4c78f8hfOoQap3vDdHmRZczLmOgHYcoiRUn3VWhDRf7JdD5s=@vger.kernel.org, AJvYcCWMiDFoQrTX4OUR8G2QrKH6bx78ACSHrX7P1h+7w9HnyA0Ldpkf8rEZzLXyu7poD7Cqz96qTHd5xhq1SgAh@vger.kernel.org, AJvYcCXqM+BCzZFx9YL+nxFPAigAcdXliCZ/rgqzDTQst96lILvjJ1GbTaItBD3i4tcP0us19X4u6f+IBGyc@vger.kernel.org
X-Gm-Message-State: AOJu0YyVFv+QKo0vmZXHnrc9PF0swDpixA/bHMDBg5VqJD93AKP1y6gC
	12XTeZCYh9zmA7vGCEtNymgF5TeZSeMnAUxiI698sU4nS+Nor2k9
X-Gm-Gg: ASbGncvvZRmfacGRKgj7h8mWmxqdKOnSn/RmKaN9nbURx8St6xW9KwAEfQHVYSEety+
	MNThIGQtd65bBWlEoOPi4RRNZMMVFQ4on3vJaCUqFsH3fos+dDk9jelf7PzXTZcXRrNEhxN0pf5
	10+UPanM46gX7p3cvbLo7V1VeLx38qnS06+mFidV/eeuNKVsximEH89rconDjm3qIiL2VES+mPL
	gX3hE/vp7uVYEWd1jazsN0Vt8uH7xWaRAkeJao7OZntKeZbg7YcswvcVljw8WurJ8kBF547jpsf
	Tfks4Uu1JwqHDhdTBkrQ4JfKzGJZYi6CfnW8WHuVNhi/G18YsPST9dw+1Md3LWSmFiy4Qy9LXQ4
	Z1ZEiyCIvRB8x9ovec+GjQjrgngE=
X-Google-Smtp-Source: AGHT+IESDRX2lvASSErkuZb1xuJH8GXgYTQGA4pljvU+gcfPosWeExLiSPBN5Fmc7jrrId7UTlwePw==
X-Received: by 2002:a05:600c:8708:b0:441:a715:664a with SMTP id 5b1f17b1804b1-442d6dd9d8cmr5184285e9.20.1746737098584;
        Thu, 08 May 2025 13:44:58 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm47260905e9.33.2025.05.08.13.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:44:57 -0700 (PDT)
Date: Thu, 8 May 2025 22:44:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maxim Schwalm <maxim.schwalm@gmail.com>, Brad Griffis <bgriffis@nvidia.com>, 
	David Heidelberg <david@ixit.cz>, Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ARM: tegra: Add device-tree for ASUS Transformer
 Pad LTE TF300TL
Message-ID: <rtb2j3ch2sbxdcyenhjz5auqbs6lcjadstbpnhtd7m66q7ewl6@q7injesdjpnm>
References: <20250503102950.32744-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rz77sh7gaqyro4cb"
Content-Disposition: inline
In-Reply-To: <20250503102950.32744-1-clamor95@gmail.com>


--rz77sh7gaqyro4cb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] ARM: tegra: Add device-tree for ASUS Transformer
 Pad LTE TF300TL
MIME-Version: 1.0

On Sat, May 03, 2025 at 01:29:47PM +0300, Svyatoslav Ryhel wrote:
> Add device-tree for ASUS Transformer Pad LTE TF300TL, which is NVIDIA
> Tegra30-based tablet device.
>=20
> ---
> Changes from v2:
> - optimized the schema for Transformers
> ---
>=20
> Svyatoslav Ryhel (3):
>   dt-bindings: arm: tegra: group Tegra30 based ASUS Transformers
>   dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL
>   ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL

I've applied all of these. There's a checkpatch warning on patch 3/3
because it doesn't seem to understand the pattern compatible defined
in the audio card bindings.

As for the warning that Rob's bot pointed out, those are present for
all Tegra30 boards and there are patches in the works to fix all of
these, I just need to find the time to get them merged.

Thierry

--rz77sh7gaqyro4cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgdF8YACgkQ3SOs138+
s6HIAg/8Cb/Cd9nfoTiJMaYigAi1lwexoOzOB5ndbUzHxQyHapn3eUkOcKa72Xqd
Vok7+pCBIqG31ShlwjpVQtausHs9N3kMbY/LEM/wpiwc7FHbnkXl/nu7yVCXKot4
lG8WK7SXNNXgfQcJNHdLiGzDRcx/6e5Oto2C0JC4zE8CTKJJdRkMRr6dMSitJJ4e
v8lrXv/7VvMn2k+e/1193kyIXGsJ/3xv4NjeD7+wQDUmsi9d1Ld2lNROAMxt+o5u
iqeqKEIVr89snyGKnxnrtrzn6bdWZcC5Ib+sKHu4AH8qz5GwOXjp2IXSUFsjAcCi
hSrsx//ht9oIRWNVDyjtxnCIVSSCeKS/d4Y39kZPbVRQsnK0h6/u7+B8wVa6CQ6u
qGnHTyHHPH4AlOfcZ9m/7K9yxoG37lXdcPxfi784ZvOwbW/uicpOVGwGYsgb5DBC
FY53l3Gs/yhI+IXN2l3oCRx7+74sk6lXVktyHsbI//Bl+FB/6S4lKqAFOhm+hoM2
l3j2G5JRk9s8kRzaQbfJgsPd5est84Pnb43bnR/kg4MDKC7n/YowXLI1m9ao4quO
E/Hhegnn9QxzIWVq5y/cPy4k5hiwXZ9t195tEN3gCOyGuoFJKRiA84T/T95Ka/td
k8Qk7uPFlCb1no5ZRu1Lpccr8AY26jRXHaxELUNqAppiUKZFJlg=
=VRUZ
-----END PGP SIGNATURE-----

--rz77sh7gaqyro4cb--
