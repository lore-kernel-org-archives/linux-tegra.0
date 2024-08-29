Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA50C1AB512;
	Thu, 29 Aug 2024 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946509; cv=none; b=HfDtqJ+1HBDNG74a2P7dAFu385i+8eaN3zUYBumv/CadT4n3+ZSPN3dOsTT4Ps0n8I9/HF5kkY6NH4IbtollahgORsXDIAl8xF8m7lY3wuXK1i/Ew6KPkJIsCKECkRaWO2bgVldYtW3KC8jUA7UNRK8CrmpWWjafA61FtpBDcCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946509; c=relaxed/simple;
	bh=jGZZqTWQLlQS7zdXBaSb3hal0F8Dbilk+yGJqrIgH9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o//GNSVaC4WrDE6MOqg1356fa0kMi+wgQfSg0UcGf6ckWkxwtUoMORTw42EntKb50fP5LAKLR8CX95Kv2Q/ChGPSGgStjF6Pzhnl942d59DuJPi7vctpDQruHaJhZ9/ASKHRdSTUPhKrFUmrnFlyoNbotPv4IcnaamyYnIWFwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoYQSrCn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoYQSrCn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371bb8322b2so547731f8f.0;
        Thu, 29 Aug 2024 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724946505; x=1725551305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XRpLyEmngmNsO1BlLrJr9uLhRTF0emdGC9GU+ntEPy8=;
        b=XoYQSrCnP2aqjUR7JNuEQ/Af6gc8oK/uXjhggehM1uG1dfO19ZUpmzplxsEy9F4f+j
         Q3KzYBnL/EYMvKBgEyOUi+TXZT3c4pp/FftPmrAWKfCsT8eCrF6eiQxeB17qAuOZYAKW
         Mpo0uXnLfQ5Eu19AbfkDfKKSEzZr1HKXbRUYJkDe/be9IrmSqSUv9SSwSyX8ExG9ygXg
         CxI1yhqK6ww9Gr+BWQoBCS/hZ3W/t/qM6t436+zKsxEA0nnY5OIrePGv4f2diAdNF3hA
         UHI9XRkjuFcBsdBK090dKZGeyZ1Ist20F9MmTDhmdOl9nNhfOqXzemMMGBkWXcS5NzYl
         1ZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946505; x=1725551305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRpLyEmngmNsO1BlLrJr9uLhRTF0emdGC9GU+ntEPy8=;
        b=FXgjC2vEjC7L23ZvB5k9X1Z6MJOT508/Wj50Mh4aRTxCOM+RFgU+b3skTrFWaI2Mus
         RA7Zd+byXnXhK1eGoyhT7yccA0pBDi7ZuV+bn6tyVt8X3LzhB11t4EP1JJPllMhC0z5H
         /QyriW4Chm3B3+hVCqeC53SbgKmQRTUIzWNZ3QOLZYu4IV3KKWHWSgSp6ypsgi5b0FSZ
         qjKtKWJLv7Y2LUrgAB9Busu9dbe3oMIWdmcWKmKRigCgMddgThyDBENZmmY00c/5i4Bf
         2dSKS/zD+CEbyPCI7fz0MVFFmbr0TT3LsFsCAFBM5RBdBEVTdYiZBo8lUluEtqo67OAG
         48rA==
X-Forwarded-Encrypted: i=1; AJvYcCUZhN7Tzr/gzPJG+0Scg0owDRQ6oC4xZBLetQ9vwjzfX6fyhM0ce4dnZ9fn40UGixXgW5pcWRukZ/vuZso=@vger.kernel.org, AJvYcCUdqNYmQ6XP5OnXPmWptz4FWc7juiuWNcJ1YiR7PDGwluAAaZTKeNyzSqExOBpXoMJ/0OHtuWrHlkOOCA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2vtRPFGut8TsCibF0sbOrwiHuuVxPZ0pwFImHoWVgm+P2fAvQ
	sWts8Fkid1mDfReM8Lpjwm82voERc8AH1guf7V7y7C4T4LGucB81
X-Google-Smtp-Source: AGHT+IGHCUQwA6BDdTVYfWxrUiljUYvRhArRrCkCd9PaG0NPrjy8Vb6jJpV0ZVxb4oWoGgNm4GroJA==
X-Received: by 2002:adf:f302:0:b0:362:23d5:3928 with SMTP id ffacd0b85a97d-3749c1da581mr1592529f8f.17.1724946504464;
        Thu, 29 Aug 2024 08:48:24 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abe97sm54625005e9.24.2024.08.29.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:48:24 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:48:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kunwu Chan <chentao@kylinos.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] gpu: host1x: Make host1x_context_device_bus_type constant
Message-ID: <7lfoxxbtscgfsy6rttfea2vfmv6nf3xzzfv3tczd5sd27utwyv@vmrhr5j4ng4f>
References: <20240823080724.148423-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5discxhm4f5xyvaj"
Content-Disposition: inline
In-Reply-To: <20240823080724.148423-1-kunwu.chan@linux.dev>


--5discxhm4f5xyvaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 04:07:24PM GMT, Kunwu Chan wrote:
> From: Kunwu Chan <chentao@kylinos.cn>
>=20
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the host1x_context_device_bus_type variable
> to be a constant structure as well, placing it into read-only memory
> which can not be modified at runtime.
>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>  drivers/gpu/host1x/context_bus.c   | 2 +-
>  include/linux/host1x_context_bus.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--5discxhm4f5xyvaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQmEYACgkQ3SOs138+
s6EysxAArYfkVMvVVYkvw+kpGNUhX00DpSW9J4CclmMg2h0PH57jkGiYPx9H5IGF
m/WyoeY+RVH12s7H6BOhnEKRcNKxurXUBztLZt9R3KQQVwiLt+EqhoHALqGp6C+N
vpZGnCUpSkUa7tHz3iAaxd8H1GRLinlmnLK8zCDSXnYNcRc4M5S2CjmOYK2WKyaF
KJFtrn4WVQqH1zqQCX2bINPlnVq5lw7S5Lr4qMwHjwM1CvnmHfuEgH8tTLT7AllG
6N+nxtnvgKol4ETOSFMvFk85wiIyrxsQqgg51xdfp0cFDRzdyBmV7ogyAlOI1p07
9h7Jd5l4XuaTGPBhEnpnShUutL9YQoDOylHI+ylC/ZObe7HDj/gj1O1ORae43zRe
G5bi6fG6Cmi03WnKQSjRniTl+ROLBdodVkfx8xqDhiixC8dqxAbV3HK9jJb9c0Bs
PBV4Pq2B47GFSF73Z5YpsU3y6jfzLPX5ySV9KRWLBCatnEMpcg/GXHeIh+vNoTNf
eiS644a2C6Zln+b4zaMMlQKjp0pknEFc1JCCW3TUzSmvegZkhLVkewNub624iT0b
i707owNNxXf1jx7qQ2YPUSM1JhDFiiJ7VcaD+LrzHmjxQTde8kd0+7laEGpGFxSB
yaMY0hd+mDtshIqzv9WLfJQV4+9wyzqW1Zkoh3fMztdeJCkgfGI=
=kU8E
-----END PGP SIGNATURE-----

--5discxhm4f5xyvaj--
