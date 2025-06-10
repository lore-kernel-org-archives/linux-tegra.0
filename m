Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7527627A93B;
	Tue, 10 Jun 2025 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546337; cv=none; b=sykGwlTnk+QW1rCCo7PwSwahUPTJ7LgUFPGpql5kdlvoJjZbBwk222kkJDOjFk8ZDDqdlDyjqlN8V3ZpnN85+8Lc8ct6AFYctoCbSUf74INWVTDHfQG4sTUMW5xUwR5YsbApI85IJJwQKfXr4gynVws9Y/9MSewO9J5FfzW0zeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546337; c=relaxed/simple;
	bh=KL/uDixEO0uqaMR1zfvj+/xR4Xa0bhl0UH5rBFHnnxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4UGT+QGTHX5282NofnWdoxvvWhUvGYVpOQHuwtu57za+HcYQkdsSd6ZwMkfkwBep2XVTVN0HiKGYt19yJck1vLE1z63WLcQlNQPueqQexQW6b1a+CWmWjEi74KSmB5Z0KH0eXmRJXcRnTfMGY6io0dcXIlYhMtaCRhIGx4xgy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVqR2yp2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVqR2yp2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso32414745e9.1;
        Tue, 10 Jun 2025 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749546334; x=1750151134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KL/uDixEO0uqaMR1zfvj+/xR4Xa0bhl0UH5rBFHnnxg=;
        b=JVqR2yp2SDWN0myPDvUjwtuPNiTT4kHpDDWibp8EQagdd2vyTvzIZ19A1g/obTepAL
         DSu1/d0EF9YJOnD3iU+Lb3sxBkoPHLSNHxG3Zzf9jdP5f444qun0SOYAI60pXmAuiDit
         3h9dtawFgpsnKJyines1NO2LPdytZC2GO4EtC53exKmHLZR61dZHc4jAKBkio7o89AUa
         W1K7+KgjIHgdBRVhlixFdKcA0MzWdmcMCp9l5bBUYx7K4hH/ahT1Qu5lKVONX5g1i/ZL
         ah2MQXTV+VSqQYlubwS26VQrPVUDGRugF3VbytzG+pp+RNiBXOBhqyo4ZUium03wH2t0
         btTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546334; x=1750151134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL/uDixEO0uqaMR1zfvj+/xR4Xa0bhl0UH5rBFHnnxg=;
        b=cMoXGuNxno0HyTUwvCYik5ld2gUQAGbQfxQ3CF4IVp946h+/Fvrdsux6tvb0l914PE
         zaJGhu/0BGfNPH6n6VsJEv711+NzHfEyHIIZ+3i+OE/pUtR6jxWJ78pFQYqgunBQpKkn
         GoDp8XfZaSM1M5j+XfFmDRvXMzsp+yTcjGKdeT0uIKhOJgluWk6mA7Wu8PleJm4zrojR
         Lu7NiB1HKopWbunDEhtf9nB6B8lEd92AD+LrQ8BuQYxZnr3uq8Kk1/Gyb3VkXN5WMa1I
         IF8gG3dUIB4wJdj0lQf9lqaUXbrIs+C3wweUdNaeMOFohMSo5Kurg+voShEDKDg684cl
         7Gyw==
X-Forwarded-Encrypted: i=1; AJvYcCUc7pWgiDvgVqfoA9l46iJTHREeKHMESN8NXFI+vN0AFBQfKi7dLqa9HtiTcTDkpaX2m8kUB9TnnhlItJA=@vger.kernel.org, AJvYcCX63NXIzwY5TrUwPiRGHPuHPquI7K9yfkv6+H2BEmNl0UpI+6X09myVM+J2p2hFqbDdDSZ14BmTyjd9Qm87@vger.kernel.org, AJvYcCXd6IP9VP86313KPF8dDlFbOeQpXWv0n8aH8DjT3Oi1ioc5/Ala9cqidRGh1eTWqOf6XFO6X6ITp9d3@vger.kernel.org
X-Gm-Message-State: AOJu0YzlVrwoFMWt4snihuqXeIXKv7JZLuqI5WptYh2eJ0OzXs0wkE79
	qFfwEIUyY8pj80vlwjv500a8SZ2uLus9b4423ioRDYkLPslQRY2boWoo
X-Gm-Gg: ASbGnct6+IWmtmGV8lWEotf0A6vcx7fCg6fC+yWmYoKXdfFWtadtYpoQraFBKZP5+wG
	3ZFRc0glm6LW/feJbssgNE1N+shHgM2/Ulu0jaRrwk9iYIM4zlSlNaUFKH+AeOY8LX8ISHpLXg7
	VDHd0/4h+QG7Dnlu+LnCJUBWVYnexu7qGzEbuEwUgKjIyXF+KbB9vQ5OlrsA1MIA5GYfty2gAUR
	+AA7KtLGKNTxcXynbU7Q0AEk37eC6lxmaNQk5TJjgFvs0SeNvaMzPSHw/srqTcQQ9u85ZMRlwZ+
	5eNdZYPik3bibYhudn6fhtTdFAaKejYHg6i0YtmoFmuFU5VszfZxsLLBkeHPK3HHz6j5ajPQ6lF
	SKsJwY4kNwg6WD2nc6ONl24jMd24QMMMyBZSQhzK9Auf/QPOQ
X-Google-Smtp-Source: AGHT+IEgPNecmjzb+Ctnp0wqP7s4JFIXLpI2LAR/XRW3fHpThmYO53BTNRvoSuaQcH3XtZR/LG9fTA==
X-Received: by 2002:a05:600c:1c99:b0:44a:b793:9e4f with SMTP id 5b1f17b1804b1-4520143724fmr122630355e9.19.1749546333563;
        Tue, 10 Jun 2025 02:05:33 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6c6csm135308205e9.2.2025.06.10.02.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:05:32 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:05:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qrycf46pmvsbxq6v"
Content-Disposition: inline
In-Reply-To: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>


--qrycf46pmvsbxq6v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
> Hello,
>=20
> This series adds support for the NVJPG hardware accelerator found in the
> Tegra210 SoC.
>=20
> The kernel driver is essentially a copy of the NVDEC driver as both
> engines are Falcon-based.
>=20
> For the userspace part I have written a Mesa Gallium backend [1] that,
> while still very much experimental, works in decoding images with VA-API.
>=20
> I have been using ffmpeg to call VA-API with the following command:
>=20
> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <=
input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>=20
> which decodes <input.jpg> and shows the result in the framebuffer.
>=20
> The firmware for the engine can be obtained from a Linux for Tegra
> distribution.

By the way, have you tried running this on anything newer than Tegra210?
Given your progress on this, we can probably start thinking about
submitting the binaries to linux-firmware.

> Due to the way the Gallium implementation works for Tegra
> the GPU also needs to be enabled.

I wonder if maybe we can get rid of this requirement. While it's
certainly nice to have the GPU enabled, there may be cases where using
only the other engines may be advantageous. Originally when I had worked
on VIC, I was looking at how it could be used for compositing without
getting the GPU involved. That's something that Android devices tend(ed)
to do because of the power savings that come with it.

Anyway, not a big deal, depending on the GPU for now is fine.

Thierry

--qrycf46pmvsbxq6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH9VoACgkQ3SOs138+
s6GCFA/9Gql524NDm3mA8nM/2jhyFLLx/IoLsmG28ioRNfL5u0WW4uB1jK5czjpa
tUJTMDIDovZi97kH/afurMgNdd9QYZCe1Zk50Jpx+wIMegsAhd1yW3/PLneWGRpw
nZU6D/Grk6sac7JLqC0M/WMf8lNjtL23uxeMzCbghOB9oNaM90cp8ueMJlJOBpWN
PNbZdCwnTxs9ov1zGqFyFZ+jjNDbOYE1b0Ltquglf4eUI+u8PXa3Xbc32z/Tx8T+
MP4fXcH+MFem2XcW+RDmoMD4FAkocbGPIYiv1755zwrzkuy8HwYr7bQsX9CB1mf/
ywoKbfac2tUej1uYT2ETVydHv7MQ8HX9Vb+ITOj/cJBY0qa5inVMN/6eEtT6Yig4
3nIbkCPW1alBcPYt1SIfIuixYIApDgexDMQlvhJBo3wNTeDcI/10hoAdD2E2A7np
i3bl9Vj+t2vCRhMwZt5dofNsgcQDc55prb59gLcHYdDO6AldIYtVpFRsT7YH+QW4
Bpy6+lWOCEvPLdbDM249AFTCzc7V+nzHALp9gjL0lDq6Jn6aqMFrUUubwIOHVmNP
MxlKFzv5aVqVwA9kPUCv80QGKksrb2DB7yEBTvL0H1V2V0QOMiO+2k5f/FFNpAVj
2LazjJB/ivKVWAkD/5TK8tLUpsGLSpNu3kf40T7PZ0CkWG5uMJc=
=0cjH
-----END PGP SIGNATURE-----

--qrycf46pmvsbxq6v--
