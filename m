Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB41A2FB97B
	for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277102; cv=none; b=LTesxNx5xv54ZOZbACGIo9nUGqqMGFGnb4Hg+m5Q8QYFEBFA1ZnOqP77Rj1u4EoSR+xjN/SWxsoT96EgixZERgk1SxYV8y0cqOAjCiI3yIFF6tlNdHJuDUzJ/SGa4/1yNu+yaSh8g1gNBcpqPF3+hOUwrjKD5oPq0fefO4uh0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277102; c=relaxed/simple;
	bh=xyp0T3rwdCJqiuAX0mvjuhhHaej8oPMAi/Y3gOHrHmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZSs5F239ZEEyc28+zum3eGKKhI43GRqv5G/KI6xA6KuIIJ3szEG0q9j/reMMShFv1grFIIvj0GvIRhscewYB1JK3z/PLgEff6XHHYqk8GJKBE78frv49gPqYpWAZVXvtLYPhDsUGJOL5rCrbzDt2GGeJSYXPzZ/fM+p2OGMt7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X6XaRz8r; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X6XaRz8r"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49544a80b9dso8377615e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784277098; x=1784881898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XH0I9nwpA0cGR0wCpMfCu0ayEp5O7V+QmAi1eEPB3xg=;
        b=X6XaRz8rE5osAX/kHUkZi1An2uFoIMVqW+ZpVVe1cYwolSYmYjVRRI5wzGQdpZnx7N
         j280sIUYrwWakU0Hr0qcLgGundHh8Kn8nkDKiq5ttVaykNqDzOSKnFiDViPn0r/3o8Qu
         Ho8iF8hamslRtnM7VLmbfTv7pbk219Hk9lKEeg5MkgkL49HPvoJirlfyvgblKeAYkPjM
         NBM6HdJFGhherrK7pgCtEWRTV/WEI62/MYmVezjmBvIoUZ3Xpwm5citZ5C4weQE/YTnj
         uvBRU72vujO6ST7PjF5/XaaRJNPj0fejRXWNm6g5fHOOlTK5C7pBF3AGdQp3OG+PekaS
         ijTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277098; x=1784881898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XH0I9nwpA0cGR0wCpMfCu0ayEp5O7V+QmAi1eEPB3xg=;
        b=TVee8MqU/5i71aMDMXieqRmdXnoQJI5WFxUiwTiMnXgcbFN4JLqwdN4UNBmxzWx8jS
         hdvbb1geWynCIUYgZpqbhcxopuOed4Fd0E3eAIEtmaHlt4lS/9a4j1ALql/EbPDOteEH
         szVBWtsohEyOzSo/AEIvjRZdD+S14LjblDO1hmIG7W4I5i+8aO2kG3v0azrXvq65BoL5
         bhrI+8hsMUvIJgKzTnexNM19Pb2P7gPNvNSAHOnD+QhdRqGmq5UcHx0kR4a6w9f1pqDI
         ohATXQpc0mN6k5ZDQpRTaVSNUaUIfAKDcrB/26N3LzzGj/JANEcVvK56sa1K+mxuH+XE
         KrPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5WrieLU3E6Wj7htEtLOqpVYdAsE2McCrQgeJ0UoUEAf5dMw5MWrUvS6rWKu6X2yrfRp4+VjA93zZqog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3dqd9y5HSxJqetiwp/GvXFCi95nUpnF3kQZtfdWIuH7J1zgf
	ZczDSYksudKqGrbI7iOCh39v0gk5f8YLn2ANu0gnIfuzopL2g1waP+SDiQ8//12Zlks=
X-Gm-Gg: AfdE7cnXelUxnjnJHy+XXk9EpZuCXr0ue1p/zk5D4k0nC/ysAYVzKNpTJ0WyR4q+xi5
	h7nXxVtDOWPkq+j3pftq04Gvsd6i8HDFbyiGLE+W3WmLIvQGwLVuqcGGcYrawvrum9OVJv+dvZk
	CzBEyDHcUs8M+/44uu4aukhJImkRWbD5hkMcYWNpIya+l22DWUM+H0r+CBPLyQN7WY7+nrVOXfA
	4vzigPLhZCdWrFAHDd8IfBAlxh1b7iQurUwyDmvkVeoTF11O/yOd01hJLPDr5fOa9QuWlEFDvHp
	OxsKoP9AItTmNbjTl+wUpMrLR4ZJLNyGjRtLDVZ/VXlRpp9pyD0gWbBImDXAMHGFF86K1orfFD+
	gzZITsJ7pFYWn1iFGqTtmiLdDgbZxMvXAyHM59xzNOy/BwMFdxPsx/vFM3ssRh1bEOO/GhoRaqH
	Lsm98AZSieUHPbEvb8FQxxw10pJqiJZhgneEJXQrkK7qRWVngsDgOv/vG6x4h1yalPmhACccOkU
	1Cc
X-Received: by 2002:a05:600c:4ecb:b0:495:4c73:3d59 with SMTP id 5b1f17b1804b1-4954c733e07mr3843215e9.23.1784277098094;
        Fri, 17 Jul 2026 01:31:38 -0700 (PDT)
Received: from localhost (p200300f65f47db047d2d8b161e35ab77.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7d2d:8b16:1e35:ab77])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2eddb8sm60904455e9.14.2026.07.17.01.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:31:37 -0700 (PDT)
Date: Fri, 17 Jul 2026 10:31:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 16/21] gpio: Unify style of acpi_device_id arrays
Message-ID: <alnjVo8v-3qHKfg8@monoceros>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
 <bf617dc2c662e80833406bd3a3f23cecdde071e4.1784133987.git.u.kleine-koenig@baylibre.com>
 <alkXuxYdLKn14rKZ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wxcdj5w2heixxzid"
Content-Disposition: inline
In-Reply-To: <alkXuxYdLKn14rKZ@ashevche-desk.local>


--wxcdj5w2heixxzid
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 16/21] gpio: Unify style of acpi_device_id arrays
MIME-Version: 1.0

Hello Andy,

On Thu, Jul 16, 2026 at 08:41:15PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 15, 2026 at 06:55:21PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Update the various acpi_device_id arrays to conform to the most used and
> > generally recommended coding style. That is:
>=20
> ...
>=20
> >  static const struct acpi_device_id dwapb_acpi_match[] =3D {
> > -	{ .id =3D "HISI0181", .driver_data =3D GPIO_REG_OFFSET_V1 },
> >  	{ .id =3D "APMC0D07", .driver_data =3D GPIO_REG_OFFSET_V1 },
> >  	{ .id =3D "APMC0D81", .driver_data =3D GPIO_REG_OFFSET_V2 },
> >  	{ .id =3D "FUJI200A", .driver_data =3D GPIO_REG_OFFSET_V1 },
> > +	{ .id =3D "HISI0181", .driver_data =3D GPIO_REG_OFFSET_V1 },
> >  	{ .id =3D "LECA0001", .driver_data =3D GPIO_REG_OFFSET_V1 },
> >  	{ }
>=20
> Why this churn? It simply should be folded to the previous patch.

I guess with "previous patch" you mean "[PATCH v2 12/21] gpio: Use named
initializers for acpi_device_id array"? I didn't fold the reordering
into that, because reordering isn't about using named initializers and
mixing in other changes makes reviewing harder. And given that there is
a "churn" patch anyhow (which is "needed" because not all arrays that
use unusual styling have an earlier change) fixing the ordering in the
"unify style" patch IMHO fits better.

But note that for removing trailing , and spacing in the lines that I
touch in patch #12, I agree to do that there. So we're talking about
grey and subjective areas. But note that reordering breaks the promise
of patch #12 "This patch doesn't modify the compiled arrays", which was
the relevant reason for my choice when considering where to implement
your sort request.

Also note that folding cleanups into patches that touch the same code
area also makes it harder to keep commit logs up-to-date, which you
already noticed I didn't master even with only doing one thing per
patch.

Best regards
Uwe

--wxcdj5w2heixxzid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpZ6GYACgkQj4D7WH0S
/k62HAf+PYtdAseJZMD0aazehn/agW5wHVzfFHUdFO80Oytm2cH7ac1DtHBviDDv
C2Cs41Rjw7P8WB+uiuKDVdyAHtJKMORkpUQ+mTPyXOdX6Fwovbqu5SKMAoSyX8a8
rr98N4fuYpWE3/UvvWTpOjaG5EupzCSBeYLeo6+pAoTHfaD747B1zyfRty/Oc8AB
yqyF1E4h5HpNchnyKHvG2e20xidI2jxwqfjQ1++j6r5DQ9d3wyqFHHdsI0SUKNyx
v1A+i0NlAEQKtdNvgItJxQMnFsvlCZF1kvTyWB9xvrIlGjqM4FICZTF1dIa4cErw
44KNp8+uYGzylfbQlaj6iydcrcnBbw==
=WR0a
-----END PGP SIGNATURE-----

--wxcdj5w2heixxzid--
