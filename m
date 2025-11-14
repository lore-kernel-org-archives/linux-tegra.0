Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99801248896
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125979; cv=none; b=BewRtl+NNBEob/7buymdMEDEh3k6M7T2/bgES6Oh0K2syCaK/1cfjt0AFwXodAi8etuxphKPJBsUtWhM1EWSCbr4KYvKk4yXA78njMLhUD7MSK137diLMwukac1SgQ//gz91p24K5z6oyGOOFiuhqh446Rwp10W/X0w7x2rW4Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125979; c=relaxed/simple;
	bh=fiNxHJ+1t9jRy5tfY62JXn4CK9QS2Ve3oxBYjn2oCMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNEsSVH36f3zG6ed11L4wcprBLRY+2VRXlpBVeCuHQkaU6/8I6Hu/JQbM7JfZzmuxkYsZqtm/EvSbZvJOt+sExerjtzLLs/pIF5HW80O96TwM18dQz9BZnwB1h65VhMhmRbw+kbzqz1kzN5eFBujesYNFgyXg45JBfE6/eWcX28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nU0C3J0u; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nU0C3J0u"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-471191ac79dso21280315e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 05:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763125976; x=1763730776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9aiaRyE3KzbZU6jR11ZQbwcOI3+XogZwM7yC3xD5Qlk=;
        b=nU0C3J0uAlFW+LOJ22+Ek2nwrOxHqRHasPhYeoFgEx/YtI8uKcLcDKs4twm1QZl7UB
         HXkL0lGtTHb7HQiJaZPusQ8R2V1+Mpymq6v10YypiTUB9fDrPckj7FRwZ9U+6GeGNxLx
         rHdevzus+sQ/l0PDbDqs0vrzinJ+fG6Blue5In/3jS46+HDYHO33ECaHGwYMiRZYyDnM
         6BXjBTUg7inWqKmZgS/t+elsc4yl6O02boZXJ1Vx64+zbzK9txgldQY4kyv7vBSNF7lY
         tA/FMAdTFrRHEXdo3RWRARKvO/b7F8XB+g0btf2TfS8SO+6bsDb6rnf+S0d1WOtRiFnP
         hpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763125976; x=1763730776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aiaRyE3KzbZU6jR11ZQbwcOI3+XogZwM7yC3xD5Qlk=;
        b=hpiM5+arm+ewHDdFulFej5f/g9GZsUatl+N3eIdkDQukIwwh1sKy7dVUhHuKROp0w2
         sGkveip+QxofAzMeFdQVg9junRkm9dQC2eQwIwjb4wcIt+8RkorTktJuUW9vKCNgm4fk
         HNlMpHFr69cYMEb4NDfCwntfGbSOKVMxPqhTmt2rgJz99PVPTpma5HoFH4cDRM9JNLVz
         ZQ9E1Wv3WDXCinyIXenlKGlX86HFskZAQcNQSVZ+lSm6A1MGVPgt2UnhkKVK0+Lb74Oj
         8t4dqoIywDNQVlUmemfct+Ui1/TadtHqaybXgrcZzL/YpcQnIsPDglfFZMM2FjpEQyAq
         bagg==
X-Forwarded-Encrypted: i=1; AJvYcCXHKyMpSvUgtb0CDR1Q2+HYF0CAnOsfbmGxKT671YF+cLjEihEJsCFTSih8x1cMrxmax1s2SVIHhG6BEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDUG1BxdrkGyhD8uJWhxZyCZlh7InKbalj9DEv7tG0Xdn6gSt
	j2swbj3tPz331FmtSan0HnCOn2Xn6V6+zrSSltq+TrUY8eFB8raXRnqp
X-Gm-Gg: ASbGnctuWBo4bp/woJuaHdRATvaGWrkfSX2G25boFG1nu7JoJQ+5ca1kurUzhny1cd3
	6XtqZ0VlRGje9fgBaIsigoJI+VsjWTabrvH2vC08uYck4WTbyprgkO2irnFblMMXAOeOugubv/n
	X4DJNI2WCON8KBGn2GxWcYcxVp2erAQiW4cLr2Wy2qKiHd/Sbs8r9/oCo1UISsNprNUXlY6RafT
	NjkLH/MQpoFBagMpy15bMAzGs/UnkjY7wo7Ju7NlPrMbPLEQYmlIh/VD3EriLhd4f+SjgeXoBUC
	KEoBYvLVQTM8WaYRV0d22bqU8RRr2Fng1arEVQRG8Dg05uQWnSn4Dj7/q6SUmxTQkvnLBXwepDh
	Z3JOY/HVGZOV8QqMYEWm8MQGimiNjQ5/8gySbRjiVnDIBb7HX1LOTtoFgETZJOu2K45M79zajrg
	hYyRxb4AMUSHEhRmlV+qrbYCpKBaDoEXvF7QSUC5rVaNSWyCIKAyIC+6iRT6T1ywxyuR1VF80A7
	A/+9jiwVKHN
X-Google-Smtp-Source: AGHT+IHOpWHrHqFphSBVI+F4WpyTTKMUMPqtOPB7RmuTO3vcOlkBc46UawWS9SYWEbgllEpctm9RBQ==
X-Received: by 2002:a05:600c:4503:b0:45b:80ff:58f7 with SMTP id 5b1f17b1804b1-4778feb23dfmr27934765e9.36.1763125975967;
        Fri, 14 Nov 2025 05:12:55 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e846afsm9878614f8f.13.2025.11.14.05.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:12:54 -0800 (PST)
Date: Fri, 14 Nov 2025 14:12:53 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Dmitry Osipenko <digetx@gmail.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] PM / devfreq: tegra30: use min to simplify
 actmon_cpu_to_emc_rate
Message-ID: <o6gkgk7tp42ye2nrbw2jiowkopaivzy47qhmuo3yjiomkkzarq@sha2bsxwelam>
References: <20251112172121.3741-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p45begdea6uxenuw"
Content-Disposition: inline
In-Reply-To: <20251112172121.3741-2-thorsten.blum@linux.dev>


--p45begdea6uxenuw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] PM / devfreq: tegra30: use min to simplify
 actmon_cpu_to_emc_rate
MIME-Version: 1.0

On Wed, Nov 12, 2025 at 06:21:21PM +0100, Thorsten Blum wrote:
> Use min() to improve the readability of actmon_cpu_to_emc_rate() and
> remove any unnecessary curly braces.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--p45begdea6uxenuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXKtUACgkQ3SOs138+
s6Gngw/7BmbsbDrrjYNv97Qt6va/Qu76bdimMjs502sFuMJ6pCBLuqE6o7hZ3Ewn
/FC/B00xdY3e66GXNtNLxV7C5JcWE9RJhvW7x+mGLW5YP0XUonmkpNzKiPZh/+c4
ulf/wqWZW42WuvZ/RZWi+wUh/rwzv6WTp6RYDyruAKiWRmp/ZWmo60TRrMj7QOBz
kVbXpFNUZ4o7RzCE8APvk+UoNQeKMA8fyg5UqdXwy/HvuOVxNGGzJEKCKTbPya6d
B0mfWFEkGR4J7tNDjKvYkbNuRuv0cVcivRpTwvXrg8d/NwvS4zlo2FvScetKuepS
kUVCNGW+/UQJF61kfotPGzttWdia9DCiqfE8yf4g663h4JokOqma7ocNulxMnNu/
+t4zrTq03rS951b6yfB3EV9m/EdCEQdOYvCIyhSuxbdwhIUcW3XmQRL515cOXKq+
IG0QawfMEjy//ArLDgESqH6GUeuT5Sf6GkMS0KELJH91AVmVSJ9re3A5xZFVVgT9
QsLjJE0x+2myGIJk6uVNcUkIr9cQP3oIDt/APi1EFXRTgnffAm+d5iNAOpZmASgK
6lTwF63Q62hbpZLdlvhi8NgWhtOj/e6detpyyQqEvCsxQl11Mw7RhoehtrXMCHmQ
tVqom2vrYOfBETXAimB3fS7XTLO1ce4XpLosYX1eb/ehQs40eKI=
=gjUv
-----END PGP SIGNATURE-----

--p45begdea6uxenuw--
