Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74146263F2F;
	Thu,  8 May 2025 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695359; cv=none; b=VgG6YMdyxrOsLf4iH+tqnMZLWwj4qxJE9O3SJov5vDzhvwM1MPqIxuWgAhmHdG8U5aXgxmZxH/u3fhb7CBtbLXlniAkrPhiVD+vjr6mLBBOcMWYtvoav6QwkkuP9JXGlZOhvGZ8WStsO23lHbbhcyheguIuOWbagC5rZrjf/U+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695359; c=relaxed/simple;
	bh=5xJARQkGD6OzSwCc2dOa2nBAlpXubIp8vef7Mr3omBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgyjJK37uwi4+VuanQE9al51haVbkLJ9MaLnIiF7M76D/3uCHYX+cpa9UePmn90zn+0KGpt+CCAWh04J4G7QxqKdjmdq3WrUajauGm51aZgGAGkufLK7sVtyXZYFAh9zmMHR/KZgs8dZA6VFz6Esdbb1Qi3hPWU8KWsLvpp1/wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YssS/QQd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YssS/QQd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so4897105e9.1;
        Thu, 08 May 2025 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746695355; x=1747300155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5xJARQkGD6OzSwCc2dOa2nBAlpXubIp8vef7Mr3omBk=;
        b=YssS/QQdxOtGSpa9VBwE6M/b6UdC2EHVuB9xQICmITAavjqZV66pNgVALyaHsUD7ht
         0zJvYBpPPWsz+5UZha4YiuwqS6oWbwsdaF+8HqHiEwPP5t6TeshV1UCipUBY80DUlvae
         qkdne+TSlANCDwNjRMfKha9KV4WvBO68hF9VeJ2L1vQS2I1POUz+hqatHnSJMtaX+Xl+
         DOAwckwXKBV+adDFln67KuMyneQziJ3xXX6eyaKXh+Dzz2i4XERchTdVXbI48CaijK++
         RB9oB7A9Isv3cm/Iv3+b4Y2DDQSZRt7WRYNxEeTE3gVi9CAFzKT3zajJ4SfRowTC7Nww
         LkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695355; x=1747300155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xJARQkGD6OzSwCc2dOa2nBAlpXubIp8vef7Mr3omBk=;
        b=WW9noH8B/Yis4xIjJNIgWqqHaLvEF/MhsnmXngsltRkuJPDS/WjxkbQpJ4bvMITYOb
         IqINl7WeLl9UeoX0Z+3ktr6CAxFHc5rQO13e0I9B+wZALOAja5AE1uXjO3flllllMaEL
         Kqg/VdSfkBpr4JOfdGClolcwAxzG6oCwiPkqpwdeetW3V+sOr4DUmxlkZiS21w++ZttW
         Pt7X4Z3l5xO5nIe3jb1lEUPUjVopSycZAWuUGGCadZqroZCkucueMSYDu1HmQZkBC07H
         /qQ/3V5IqqOwUaBxTYSc+iibeJg7yRTxu+zVE7XcPwfSW8CEZ92iHyd/zfCVspMBEQin
         Sn5w==
X-Forwarded-Encrypted: i=1; AJvYcCUagYPJDWeB2bB58zyH1dhtHrHrLvSWdzxoD/BjxBPiSm4eX2qauhUpV3fWJ5H1dPotYKKd/srdvlMSNwo=@vger.kernel.org, AJvYcCWONCC9+eRkDfdU2r/M/0Ij4ii46081kfOGSyut+oKUfBOj1KlRQYkqEDDM88YPTAg1p89U/NZD3MFm@vger.kernel.org
X-Gm-Message-State: AOJu0YwW6NK1Zw+nsXzYQfV0G/eBKiVVDQrsN5pLuJPGa8TqO1z0A2dj
	gxCn2CXQeWTQljVaDxLo/aZtEqup/n/kGKtXNn9uuwTR8TcJ51amH4/LTA==
X-Gm-Gg: ASbGnct6ucb3VqYDyXasFvAL6OHwpZQWQbHAOWOp8aE9eYGfSBkgDSRPrMADdGXhdYA
	2tMTjxW3bxf5vXXgxgDk7p5uHzxDE29e04QMVOUS1CXhgXxUWQZyv9EL5eM7P1F8jlpKbEbekE5
	SoLzCvAZ0reU2JOuyMxbF74wcTOOGbbM+bdtJqTZV6CJaexyc0MqMMgB/Sj94R/U4FhU12VYqY1
	AzeWuaRsz7pCsPDsPUTuQSxJ43t+KNEWtUNX0aFwTQ7ORxHrc6z3ZB1Fnmj2R+wI3Y0UH+xrfrH
	+Bd/jauS6MyUzbDlbm3stz3/uU3Kclw2OBAuqYQxRGgUctV65F31mqTejUFrfbj3YG8EoYWGsVx
	PckNgJhIIVFUHtYVJ7MIgPh/Mwz0=
X-Google-Smtp-Source: AGHT+IG41S3GsRonhNn16HOEl/Shw3ERiMiNQ/XobV2dvSf8q7K1S0aIINLP6AhncWSbg+xfu/0/Tw==
X-Received: by 2002:a05:600c:1c12:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-442d034f0d7mr20647505e9.29.1746695355354;
        Thu, 08 May 2025 02:09:15 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0cafsm19788993f8f.19.2025.05.08.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:09:14 -0700 (PDT)
Date: Thu, 8 May 2025 11:09:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Message-ID: <prjmur3ih7kbf2hapdzp4vtbt5cd3coophsm24d2liykosvuda@nwxbvabp2m2m>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-6-thierry.reding@gmail.com>
 <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
 <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
 <f346c140-52f6-4209-b62e-53dfa2c8c7c4@kernel.org>
 <hitexxuelppvbdd3hyxf3qoncdizj6mvhiuhp63s7qpgkgqd6f@63xybk6n6dfn>
 <ca0680d6-f846-49af-8470-3fe10d4f8610@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2244kuj2qj42ob2v"
Content-Disposition: inline
In-Reply-To: <ca0680d6-f846-49af-8470-3fe10d4f8610@kernel.org>


--2244kuj2qj42ob2v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 10:45:29AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 10:02, Thierry Reding wrote:
> >>
> >>
> >>> how much more you'd like me to make it based on that. Do you expect me
> >>> to add the nvidia, prefix? In that case it would be inconsistent with
> >>> all of the 8 other Tegra MC includes that we have in that directory.
> >>
> >>
> >> Same story as for every other case, why this would be different? All of
> >> them - amlogic, mediatek, samsung, qcom, every soc - move to new style
> >> since some years, why this one should be different?
> >=20
> > Because we've used exactly this naming convention for more than a
> > decade. I get that it's nice to have consistency, but do you really want
> > me to go and churn all of these files just so we can add a vendor-prefix
> > and drop a redundant suffix?
> No, I want new files. Look:
> 1. Some time ago tegra-1.h was added.
> 2. Someone spotted that there was tegra-1.h, so added now tegra-2.h.
> 3. Now this is a pattern so of course next person, even if asked to use
> vendor prefix, will not, right? Because it would break the pattern. So
> we have tegra-3.h
> 4. tegra.4 - no vendor prefix, because you have already three cases.
> 5. You see where I am going?
>=20
> All of above - amlogic, mediatek, samsung, qcom - had decade of such
> convention. I asked to changed, they used the same argument as you
> ("decade") and then changed.
>=20
> Why this is different case than decade in amlogic, mediatek, samsung and
> qcom?

It's a matter of principle. One convention is as good as another. There
are no clear advantages of one over another. It's pointless and frankly
there are more important things than changing filenames that everybody
has been okay with for the last 10 years.

But then again, I guess you're the boss, and I'm not going to change
your mind, so renaming these files is what I'll go do.

Thierry

--2244kuj2qj42ob2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcdLgACgkQ3SOs138+
s6Hecw//a6tg8o5jcMdrG+ldzPKEF5pPQvK2ubj1X9EzTmzp1x6qUs75VFpMZUqo
mWDmGwcgEGmaYXKQy9nWEEgG2MC953NL1ErEXA9wi1+sgVTDkpqamBTVAcgl6bPs
QE3iStzAR+4Zu66o7Fxnecmz+V7mOa1vjFH4bhGyj7N1JktsTjA9bLaWYkVYmtjZ
2/A4TC53M4o9/UB9PN+9UFKxOgR4Flc9Nwd6uzsj5re2Jh06I/rPhUmDVtv9Bbd6
5ivOAzO+zNsukZtD2BI5gpM/jOeXXUXjbseXeVmT9E3LYWdMV3rfxWuBGWI2bDXE
3XMo2tBLeoDCBMGL6KmYnzhEWeeH5QWxLJDWMqMz0CgFPPoYdC0pq0nyD5VwIGlx
yfMvIZexKg7GviceW982pEzMINSSbjRWSlYJJ7HPB5SWccahac6dpGxI9oY91xAG
m14o9dX6KEDO1JfCzhj7GX7HbgKOMngI9scb5/7ufYw7UE2tI4PWCv4yIu5plYuW
IADBZCsh5pqIBo8eivFLv+vs+wAc7LLM2bAN0Q1cdrvDEHj+7hIYmDAFrHVix+5B
LZmzqVegE971iwGXfrtklVKVW7D0XRTu6utM8D6ZgcSmAB/sRk9PoDnlIjbR7j6A
Su5EjXum0fRALBLusADgQUBIJrfO1Dr0SWDyueSPk5L+meat4HM=
=sTYK
-----END PGP SIGNATURE-----

--2244kuj2qj42ob2v--
