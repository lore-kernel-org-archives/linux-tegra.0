Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2582FB085
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 21:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763157518; cv=none; b=qV4IGjgEto8BWHlGktEwyLifVj/SVLs8BvBwEowsCvoHApTlz2IJ+HniW0IGkGChrusN06Ct6sNa9O8fBxZm/5RKVaVLzrCkdpFHcFcF7kgmNi/7dK41wPf71h2PhEgXWWgfHzaqQN70d7puYb77GllPeux37fdUGCOnRBfd4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763157518; c=relaxed/simple;
	bh=Syi8OifrcIa4Q2Oytg9/IzoAJQpo1OhcVXIfS5ioZy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAAvL/Irrl3iIe2Rem/kErZ1H/FUkGss+RWqu1g4HdNM9845hojQ5mWRhbC9SJUkVdHHKlq7l7RIC6nyB1zWLxwWgucoya4KSKx+H6vUyQ281ap9oQ68yqXH+DakrIoijbzHS+6fjEuUXR99VH93BBcFul0DvU46/HjHAr/ay6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLUMwhEM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLUMwhEM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47721743fd0so14196345e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 13:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763157515; x=1763762315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+u4sesX2F1ivMYBBZ+/x9GtDzSOlzU+Zz0YkP86DrA=;
        b=mLUMwhEMjUr1lAXhKfSsEGByPg546cOf3Hs032b+vcdJkqHvUXdVWWBXIQyVg9mem5
         OL9TwWpcxnP94htoQwQiAhhBJCp2bGjSiEZDMY76SBvs8iA4R8qbfejVK+yLJk7PUhbx
         OFMdz4PjAAKkuA3GFXcOftwNdQiuMsi0zybHwTnboyPpROzPxiw8ZvfPzSOz2+AvX+ow
         JNzVRBSr7ILmkpQZPUZ8TkvMdTAgdBlf+jv940K1uKKDb4q8yfhWJliZ3B75FXafVQyK
         D259kW62AWagtpGplCFk3olLvGu28nvNgF7Wa6uAX9JAJyoK2Ul07fjtFm45R0RwQ8Wp
         69mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763157515; x=1763762315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+u4sesX2F1ivMYBBZ+/x9GtDzSOlzU+Zz0YkP86DrA=;
        b=gQlJo4Clg5iRhsYAwwqYyuEBp229FtGUJYCR0eHt9WTTcmrp/Tx3/C8AieNI0aS/7Q
         m7r0TNeXz4cWmbxhmsd4EZ82EKB7vdMEcsLSzlKEEYnFr62hEX/MzIMX2lPZLA/VZ9LA
         LWx8WmTVR8uOyvQ2YjQbjbGG4fATu7yShsM9mGnVkg3h6vWUWCpwlukG7v6QYSdGUv1m
         67f0e0ZSe++UNyVhonp1AX6d2EmCZ+bWHBWmG9uxZiVpHOTUgZDQAMCmcK1z+EK7GPBx
         4yB+jCiPnqqYaFHKXNvbU4D8f5cYE6/Vc+uSaSHeCRczzEYNI3b7eT3oxxZjx2NiM6De
         /lTA==
X-Forwarded-Encrypted: i=1; AJvYcCVQKDXr2qr7YQJZrcM/dxTn3xlaDIDV3k5PzdMOKWWr/+trK/DT1IHPGp2ZDV0SKPVJZrrMuQtm//RUQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9uVv3gKBBbfV6a5rCM/Nl9ofa6ShMjgjQm+YUQf7mJBmpsbS
	d9KcZIOfZSKIkjSvLT3sHehTBsFqQpTN+kE7Fuj06WwA6utmG6kBru/7
X-Gm-Gg: ASbGncv5CMdIoUKRA01HLBQhai3NMxugBl0XLmlTCzGu09OPQEudlk5tTpkEn2T5hV+
	LkzThdgY3k/Wu2hL4s+42nVAzTmX/LlfBb+cbpWgQcG8L7J5uF8HzVj4HE5RGg5UedSm4D9QUBT
	WESa+kslk1/FiJZWzQjHpKO2coRcyNaYNbNh1uPAVUOaXBzBY1dHimKwUcHClXXXtfbAH0T9O3f
	2f4sXCQmOGpIdqiVqI6ODBomVNJH5h9ajDFP/fNZQ7rpz0EbNMgGXwrKDTtjLxaYVoDQnyNcKY4
	foV+Ov6Zd/p3AyToSWt3iMEVV+kgSnS+iTMDef3Ny5hgth5i6Jr48E1a7z8LsL57tPcN1t/2zf/
	QbA3w85bncnAGRG4U2Eeqf1B/Hn5m5qMVz/jam9nGoQKAISYSJq3yscf4UwVLL2fySDjy85uvzR
	eAjmJdI22fs4buiLDJmMPP2KC8u9geKBr2XkzpHnJOaz8Kq8ho0lZSP7nbSgtg0E4=
X-Google-Smtp-Source: AGHT+IFiaMZ58B55vi9u64uCvnsSPqkvnvQqbvHQS4sxytgcEOqkF2Eov/l731LFekJ8vKo2nNneiw==
X-Received: by 2002:a05:600c:8b42:b0:477:942:7521 with SMTP id 5b1f17b1804b1-4778fe683e1mr37311375e9.14.1763157514789;
        Fri, 14 Nov 2025 13:58:34 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bd11165sm54720335e9.6.2025.11.14.13.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 13:58:33 -0800 (PST)
Date: Fri, 14 Nov 2025 22:58:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: tegra: Add CPU OPP tables for
 Tegra186/Tegra194
Message-ID: <z76e63y4ixlsqelhjzwldyjbne55big5zxkflrdjrmilnewuni@ouuf77xakco4>
References: <20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com>
 <CALHNRZ-uFJhMjyyV1vUS6ye3q-nNVPT7Ab4vuO41ziHqg8MOvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z24zjinrywe7h3jf"
Content-Disposition: inline
In-Reply-To: <CALHNRZ-uFJhMjyyV1vUS6ye3q-nNVPT7Ab4vuO41ziHqg8MOvA@mail.gmail.com>


--z24zjinrywe7h3jf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] arm64: tegra: Add CPU OPP tables for
 Tegra186/Tegra194
MIME-Version: 1.0

On Sat, Nov 01, 2025 at 06:21:40PM -0500, Aaron Kling wrote:
> On Tue, Oct 21, 2025 at 8:13=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > Bindings Dependencies:
> > - https://lore.kernel.org/r/20251021-tegra186-icc-p2-v3-0-1a50b526dd40@=
gmail.com
> >
> > Logical Dependencies:
> > - https://lore.kernel.org/r/20251021-tegra186-icc-p1-v3-1-7e6db3b070c4@=
gmail.com
> >
> > Merge Strategy:
> > - Merge all patches only after all dependencies are picked up
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v3:
> > - Split series
> > - Link to v2: https://lore.kernel.org/r/20250909-tegra186-icc-v2-0-0941=
3724e781@gmail.com
> >
> > Changes in v2:
> > - Use opp scoped free in patch 3
> > - Cleanup as requested in patch 3
> > - Move patch 3 to the start of the series to keep subsystems grouped
> > - Link to v1: https://lore.kernel.org/r/20250831-tegra186-icc-v1-0-607d=
dc53b507@gmail.com
> >
> > ---
> > Aaron Kling (2):
> >       arm64: tegra: Add CPU OPP tables for Tegra186
> >       arm64: tegra: Add CPU OPP tables for Tegra194
> >
> >  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 317 +++++++++++++++
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 636 +++++++++++++++++++++++=
++++++++
> >  2 files changed, 953 insertions(+)
> > ---
> > base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> > change-id: 20251021-tegra186-icc-p3-3f6454da5ec4
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
> All dependencies have been picked up, unblocking this.

Unfortunately the headers are only in linux-next, so I can't pick these
up into the Tegra tree yet. Will need to wait for v6.19-rc1 so the
dependencies are all available.

Thierry

--z24zjinrywe7h3jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXpgMACgkQ3SOs138+
s6Fo9Q/9H5rEpI64Ske74TuL5FhSOmri9aytKKyGeCojYE0IPIc+Sc6IZNqZtaVF
9a7pcUSFD83X0EYruiXVNZnaJzkvzXFmrvc68q4yq2O2redaFFPEV+BwOc2FzQ4N
lv/Z+SOM5E+1OIOqbEN5hSCmxGQGQDerCgqU3/jm7ep8CgsdHLx6Osw2HOJ3Bdz/
OIVdVEaEIGn2Te4csBy9zUt4WQRMo3fS1uAg9K5p2PWoad4bWclS6FRimbPpReZZ
Gf5906MeRaGruSd6lLQrmFoPNf05Lg7y0BDP778ZDxnFToO0xw8uxju3q+MvcJsm
zbJsdtWp25JO9m46tY15dgztgwPKvsVCmZlvZxDBTPwHPp9bZ82qqbgDX6xQXznh
WOk8ruBF2iniva86OhpP74mz/CQrHkhn4mfpET+tFcfxNWRIPhfvIrPxTgvmZlum
ma7KhnU2Sao09A+JFpWulGZYzH6E6xETJM3ieUPOdw4f71fZUvCburAgyRtjZ5io
C7tUt/gP4RB2gL4egOZAc/nszFOKzyTT6Cn7i+inES9tT0X4mG/i9IvaDikScu6Y
RBWIskimVqOhM898Rlh8Xzel90KPDTkFtKE+r5zbewbkW8SsDHX1FbrE7R/FGhdU
MfsfV0IfmmwTho0se+f38smJGiI3dYdfEzPGotuIXjvSHkSvmck=
=bN5S
-----END PGP SIGNATURE-----

--z24zjinrywe7h3jf--
