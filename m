Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7F43F0B3
	for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2026 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066004; cv=none; b=U0nXHyZH6Okq5hqeCI5wbIuo5F6nq67e+UFbI5CS52JaYlBd5u8k2GKdO9RKDYi4Ug/x0+P+r3Z0ZWqJxF1VUkXg+4BsyS4ptoP0/nyBkr1goWobY4osk8YOl9ZgnFzo0oFXBDNMCwUrK9hGg0fmIi5VbxP6E/evKs1FdU62n0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066004; c=relaxed/simple;
	bh=zEomBp/JAYre+ACaiHStIXFRKfBN3mk/YZOtMfOIzaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuJNa+wJF24j9Gld1f/UvMaG3RCef9u9kBPl2KWU0PDLUcA7NBMMTo+92cZ2xHJVX5CMerRLp7z/+xqWPpxXJxOieLgDggwn2a82luFvV7vkhtIRJ4Z8l1gHPEKruUSl8dvp5ze0cdiqjOgAwwWvdwl990VomjVZd0Lr7ERYwes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SDFVaqqZ; arc=none smtp.client-ip=74.125.225.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SDFVaqqZ"
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-482f633ece3so2944461f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2026 01:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790065998; x=1790670798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uU9EGsP0jhjlOuyY9ffTaiqx8NHl2A4tqCF5zEPkwzk=;
        b=SDFVaqqZfU84z5zv8A0dBFvjQ5ivbjNkUHmEJ7qXw4RP033lXmvKCIDV0XMZNXCfRB
         ui/pPwbTZABAxe3HFMjfc3b5p/QgarOU2p/jqEl4x5cmgAsvAXZZklTW3gw9MctW4B1w
         puOuBQA6N8M4qtoWTLlrbp3f7obYQIrRDVzCW/k8YGESOy49RuHBOzzkXtMA8z9VLPZr
         lh6zJXb11GaufjqWPGfATi+exGxn3U5GRs7jNkQNKNPc+A7Ukxr3e4UUTlTs6CseUm3r
         1yhGWo0otGrC67Y7qvaRzSed99ajmtn1bqBwcTF5aO4pohbI/xJBUDjj//vwpyALMepV
         U0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065998; x=1790670798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU9EGsP0jhjlOuyY9ffTaiqx8NHl2A4tqCF5zEPkwzk=;
        b=OMv6eAsYNDQMB78SQa5XQuhPZ6+Wp92uePLJ3dsW2tC45Ed/sDrPX0AoH4VXNnicie
         jTpAq7u2VliRJP0MXLEAPwlcMxy/9A0wjv5O/T+aWyE3bKbXg/oE7zeaXg/CysejFVH3
         UVY7cstwsWxbiiPXXxTwpgOpwX2kU1NalPcBV3OYldLqAgewbv9kxU7Rr7u9f0AU7EUx
         7Jr+wIziHxki6x+MpUnKqr0lEd0gsrNMCwyLBvm6F+2axuijXqjklPj92cZTcjmGS9fy
         6yj49+D91qDT+guG11hEJ+PxvMZwnk3GQnLgOuvBCm+lKPgX75ZPTzr9xs7+dmwYYUy0
         V8vw==
X-Forwarded-Encrypted: i=1; AKwUvBx2AlBJq9fUK/15Ph0coQ1dwT5W0y4onMQSwOy8Ls1xvXJUwK698SbTJ9QiFa5i9yWK3RZxbxxoueRYIA==@vger.kernel.org
X-Gm-Message-State: AFuF++kHVD232wqQdyfpNltRy+NDP29fodqgv0DtCPpEdpAv56HdRatx
	CF6fTetKRT1TWvoC3q9LUWt1kGE8GWyMYiFqgVlfNSGDS3BxyfCyIeeUV/eQCcJmVT0=
X-Gm-Gg: AYBFou3eJ2O9wBdByQbmUi/gmeZ5SmPQemjx+7bi26J65Vxe4HuqyP8Ym9yy6Seeg8X
	CIucN0jETC16gACMPr9riEoyUeQ3xVFPZzP0SVJGBCfXcHQxhReSwLpxyGu1v5QbeDlnp/yvOkp
	nd1bX32I2gwgjknS5a2Vj8du0sQFXDWYilo/75zhqjMxI3FjdpDlDv0mbgy09WdB0+BhPkbYIKz
	qkWk6T7x7wmM6xTey7baEtP7CbXhZeWviBTEvuo7pB0KHJsmphPJgEyfJfzvMOPqEZkihCQM8CV
	CBd5iilUD0yLo4CAocRL95CdUr9/tBWXdLh1dtmlM1um9jWTa+c20refxQYJn7vPDal9pMZhdPZ
	x7/JA+Cqwd6aWmxB6iOFOaB5dQhZh01fNGc/2E29E2gvwlCisKOnd6vFmWFqdIq2LtMt3Vdo15c
	o3UKYg7SvPY724nR6JEeGtwzCjrK1MIxbY9Y2Iz0de1ckHCb4LaniCG0m2QPuKdzZ8z3Lgs0rZk
	RysY58GM3+rSjuyNyAva3AbZUhibiCxBWiTIr0LWM1Efiby4a5ao2cmJy+bDw==
X-Received: by 2002:a05:600d:6503:20b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-49fd0876705mr70277975e9.34.1790065997920;
        Tue, 22 Sep 2026 01:33:17 -0700 (PDT)
Received: from localhost (p200300f65f19a9041d0e57515b2ea4c8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1d0e:5751:5b2e:a4c8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fdaaf0074sm32730825e9.3.2026.09.22.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:33:16 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:33:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pwm: tegra: Check for match_data being NULL
Message-ID: <arI8vXaKTvEJi-Zd@monoceros>
References: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
 <ed943d9be3b785514e0f65a5b8c13a78aba7a090.1789741839.git.u.kleine-koenig@baylibre.com>
 <arD7N6A6ncBNR1Jk@orome>
 <arE-s0zbTUn14aIr@monoceros>
 <arFYGka5NpcgJ8oQ@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rspyuoriyu3xbsxg"
Content-Disposition: inline
In-Reply-To: <arFYGka5NpcgJ8oQ@orome>


--rspyuoriyu3xbsxg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/3] pwm: tegra: Check for match_data being NULL
MIME-Version: 1.0

Hello,

On Mon, Sep 21, 2026 at 06:24:39PM +0200, Thierry Reding wrote:
> You're probably not wrong about opt-in being the more natural choice,
> but looking at commit 3d713e0e382e ("driver core: platform: add device
> binding path 'driver_override'"), the intended use-cases are very
> generic, so it would probably lead to a continuous stream of patches
> needing to be added whenever a new device wants to be supported with
> vfio or something.

thinking a bit more about that: The use-case presented in that commit is
about

	echo vfio-platform > /sys/bus/platform/devices/fff51000.ethernet/driver_override

. If we had an opt-in mechanism on the driver side, it would only be
vfio* that would need it, wouldn't it? That sounds handleable.

Best regards
Uwe

--rspyuoriyu3xbsxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqyPUoACgkQj4D7WH0S
/k75uggAjU66rIYhxOlgu7NhEO7xA565YwhTBJeloD4bUMm8+0W08iZNphhaGPvO
uXNwj8m6MCl1yFVzOCumzKhF8r2ixYGsKW+vmyn59m1b/DAoL0KnjJjPyjkwizOX
eyNlZMnvMwp4Y65HaziLW9s6eTtc0fNMmGsrCVKvAjtGlZDsrzBZbRnun/Hd2pg8
J/lYgKQVwTDYJZZnxauPn5Qyq7pZ8Acs5JDvOi7dBto3YRcG8w5OFbnRL6HYAhgr
neCLHai/wCMyehrQVakEyRkwfYJmyiAMIIv8g0/uUlUF/exQR6RKtaJpd88gX6vT
X539Y2bk5qA9iu35MHWrmN+RXfuKOQ==
=XDmF
-----END PGP SIGNATURE-----

--rspyuoriyu3xbsxg--
