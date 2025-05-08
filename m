Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA72066CF;
	Thu,  8 May 2025 12:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708508; cv=none; b=HqM8X2vJeXe29p2+BwdjxZ2WOGS4E0kJGmwJCD+FJUyHr0GlPL45ysqWNGHijgBh626/bZ5Fesc5d5n2Yi4NVR/0Y9HLEEumT5ZQkd+XevUuGWB5oVpERQm01ckN0iAmgVnwlqxfZ8P7xCBjSgKWa4Cp0+4zko0At6bFIN5amns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708508; c=relaxed/simple;
	bh=K1JcDkyymVY9Ta8SYRATFg4KegkMDnSgEyDqpkv3p00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xt2Fg+xNlBBMQwU1kHXylyUTPkDpMSTN8H5M2BBz6OUDB3QOe8/yuep7IgA3W3JJpkozApflXS+HSlKQBRgX1dRQyfTQBLOckyBVbUQKKqE8CQhYsTzt6atjzkiJTZCbITJbsESBoHEogHsRQCDlZ6q4rYMaCtahyyXyak22sFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7CRbjQR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7CRbjQR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-440685d6afcso10734195e9.0;
        Thu, 08 May 2025 05:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746708504; x=1747313304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1JcDkyymVY9Ta8SYRATFg4KegkMDnSgEyDqpkv3p00=;
        b=W7CRbjQRlAfxEHN3J+Lhvatrn8mvYSExWgZ6ymQc4dT3OXXC+8Gf3chPOUbeRtuB4n
         pjXC+3oHZTgnzQXDAdKO5FwCar2xiHMjXoZ44lw6Hj4h+4JO2MjFXKIJRFwweR+l6PRn
         DsxhL5gS0tFSdYWi4dTmtJ2kwp4kI6z8RTJHqq+CohllObI88nA7HW6GEwIw6GaMvgF3
         1HKl9oKNbE0WAeigV7G/Lz0rymX8jnuY7QzSZkPL6rPaKixwHwhAp2IRqU7tbOVmNz04
         Ff+4FlgbPI/6bCmv8vJNGMpotaW/FqrvOilbpbby+Fx9gLUDV5MFIbejG3Z+kxpci/SV
         Kr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708504; x=1747313304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1JcDkyymVY9Ta8SYRATFg4KegkMDnSgEyDqpkv3p00=;
        b=W1tLAHTsxOzw85OfTr+7y7K7YG9RsMUYnchwuCTHCvZuKYeFIktJDpIx1tGWF3EIBm
         +svU5GP3SGIfEW2MSBXsY1A41pDhRmwsu5G2TspIYDQ09cMl3KpzaVwffVCgW3PZbxPF
         mL+vlXb+8jX0Y1RehR62VaB6CsWhmvMWwOPf1N3YYkOJnS/YQiD3ww33HUFmKIvQ+FIt
         aNo6ulGbYQ09W88GrsR+SmOuc1cB5Q/G+wwDnkhTY63qxAD842t4RgLiEYeWpmjm5xzK
         8pPuQ49WLAW+g60tq15OWBqoJfTEej8KGAgQ09j5jLExEotK8okwzLTyMz+Dy6vrDmoq
         S8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV+ol6BXYK/J4cPTyBECCx0Emz4igcz0UWxqNyHxEH07aVYw64ZhJVTuabmGsYDFJcTQAh7p/8EboelYxaJ@vger.kernel.org, AJvYcCVwdybWhWaKOEVVikaDAH+o5RPxB/esuCFM12ajl5vCNObqz0ZKBbI3Z8E0KdFUwqlN2OYdlfWHpGkC@vger.kernel.org, AJvYcCWP2FpB2lfYx/Mj555xtenQnuxu9VAFKBtPTZ04cOTaA0kJS5fvUnnku1L5QaojLffLOCb2FBwCq06kPGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYz8JkP9uGmhrk7yyRVxFbQYXO03MiloxTmV1Mr54cQ9vXO0FP
	897rt3j5Q+s87UeEx+G3Ihz3hVa1T1Td4ULS9Nts2vgzKrM87ohd
X-Gm-Gg: ASbGncuZuWTfOUpD4ClTu577E04H7e4KA8QrDkPMtR5/bLsmSRqRc5I8CCPHhw4eZbO
	agCf/qBU1M5cDsiiCYn8bt40rCKBuvURXu6vkm8CD/2pqjUFYNCBcgPs4UvPYwTjMJGU1N7+J2Y
	xQZCrIvD+c6SnudkryWZqmX/cX6VPUZo2JZTpXUO1vlmfBbEC/OxITSektgpxbX8p3jisEw7K2T
	ns+i+OC8lUmFvDH+FBhXuy8PAG2rNoWfdGsf22ggfkT9xY/w8to4S0iAUzFP9Tyavt8NPlmyDX+
	VFsg2YMD9iGJ0Wywo+exTzMnY5hPjEGz6exOqI+GRxWRMtoLxyd73psfbmCyELwjpq3xX196cOv
	qHrjK9CSOERQuXe9E/vhQl9hqKUQ=
X-Google-Smtp-Source: AGHT+IHSVvOwM76//qmn73kAnoUTmj/CnRUBRA7zQwSUPHrkrhEv1jw1uHjVkLixP24yaZc89bJizA==
X-Received: by 2002:a05:600c:37c6:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-441d44c3933mr66198845e9.9.1746708504289;
        Thu, 08 May 2025 05:48:24 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328455sm37086045e9.2.2025.05.08.05.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:48:23 -0700 (PDT)
Date: Thu, 8 May 2025 14:48:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables
Message-ID: <ckimvttxjgx44xhfql3nov3qbf35y73nbu3p4m63nqbi22vh37@6p2ji7he5toy>
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
 <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com>
 <eba00bd5-fa1a-4cad-bb41-b395011235e1@kernel.org>
 <CALHNRZ_WPUM8wKSLcyyZm4jc9onBYiP3oLd=39k4=hoqLzHhrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7hulawnxj67g4v62"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_WPUM8wKSLcyyZm4jc9onBYiP3oLd=39k4=hoqLzHhrA@mail.gmail.com>


--7hulawnxj67g4v62
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables
MIME-Version: 1.0

On Thu, May 08, 2025 at 07:27:52AM -0500, Aaron Kling wrote:
[...]
> The devices I'm talking about are not yet end of life, so it is
> physically possible for them to get a bootloader update to conform to
> the existing mainline model. But I'm just one guy trying to do 3rd
> party support for these devices, I can't affect what Nvidia does with
> the signed bootloader on these devices. I'd love to be able to swap
> out an open source bootloader on these, but the secure boot setup
> prevents that.

I've reached out to our Android team internally to see if there's
anything we can realistically do about this.

Thierry

--7hulawnxj67g4v62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcqBUACgkQ3SOs138+
s6FseA//dsjUgo5pq8qp+c6KgtZoXZsobQIJS+p23RqDrJ0vTBDlP1gkR03kkOiD
o3POI2fzjsN2i90Ic+mv/N4R1w7Wwa/zjtdms+xLWNiHu4D/wCkHdiU/X4vd7MWX
cIMOn1AvXLsXuUbK3KJdp1LVYauqva5psI5JmJBlu/FppBFplY9b9chcgDVf+Foh
tMab7xWM0XeUHxoJvVCP+YD7XVeuX437wvhzT4pyIXm/Bl+YQhCzUBPiQetKX6Ui
z0a8hw1v9nMIoz4C0GWmDLNs4pnQ31s8RN+oVQurMZtDBveP4r31QRvZ1DGirOLk
mQ/iJOpJqHf5kbIEcHvep6BZKH3bEjotjF2N99YX2TYyHOgANUQO5OqD3Fh7ttCJ
WmmPlVCJsdYtQQMF2kBJiQAcRrv5r0+ZzHmKm7S7vGeFjQiMegLZVPLOm2X+0aUS
NCMPPiHG7+gKIOHHYsdyVF4z6Qv8ATU7BA+6ggR5UoqRLJ/Pilp3VKLj76nms/TX
T0GMmJJU5/WAmLBawlWswKuoGIAWrgiYsmwqpt+SMFrgIwwMNV/ToxfbyCu8L64X
I0IXCV0XDr8gvpitpAwA33GxP8VhFvxqSysvCr9BBgQkDmoITGhVAn4reJfoz6tj
F8Fizop1NQzBwNFJMAwl8aUfJZoh95P5hC4uPKUS75Xg/zRR0hA=
=YCXe
-----END PGP SIGNATURE-----

--7hulawnxj67g4v62--
