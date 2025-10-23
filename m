Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC62622422A
	for <linux-tegra@vger.kernel.org>; Thu, 23 Oct 2025 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761236180; cv=none; b=UGOwg5ioIPDuuEl7bSbI90ICrumLXkia6SAmukU4PJqZ9tfH8MkHN8ddsCNUeRSya+K8pcc2DLIsi7ziHAL6fa0eVGxITciRHfqf7DIfFOOTSEPvOc2iloLPLJkD0J3qExVPEicBlmz+lC5enryeJonYwbHXWXQV2X9QrO3c2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761236180; c=relaxed/simple;
	bh=JeoLoOFDkGLH3tpNOyGwr72Phjp8ZAJBLXaKUeI5Gy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jezxgtTDeUvTDxchWSXIELfuNeZ3e99CEyENlSq9ZlVaBBOz7sS7sQTrnvnZtYciNbW1H4P+hlpBLTD25uQA6hdtf4h4/yzKYqkCRYnNcPeZn3SjlR1YJADnESRVj0zHVnwYK2Zwp6hMthzvVkO2SQL4mJspKQHVzlJA8BO30Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gEcvOoHI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gEcvOoHI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so6241865e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 23 Oct 2025 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761236176; x=1761840976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EKZS4xgdPYgUIvIsxbmjQo0qs6j5eqmB9Z+WVlamt2o=;
        b=gEcvOoHI8/Y4wwWpqSIfq/xpFmoQBJ8nWkNDs023LDlwS5hrAXm/pyLxYX7aAgvHaJ
         7l4MDAPHU1kKaD/kaC2OO1hmx+waguBgCrTL4YLf7ON/NJpXtm+xp6cDNJ2+f6KLexYe
         USvHZsq7dpMiim9vyR0Xr/5Sfo24JYGJ+4HBXC1Zf1HagWYoyEXKO5ADKUNnnqD2vhWP
         TqjY3gXsgzSR4ucxLk93Qw4SYjWDjt6AWchxiTiITbYssaOdd67gDfqSD1JFymA141bU
         ZbffolLcvxg1thiN7Jujm01KhCPmG3yi7/h7FqAGskH//+w91maIypSS9W4eakH0HP+t
         lL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761236176; x=1761840976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKZS4xgdPYgUIvIsxbmjQo0qs6j5eqmB9Z+WVlamt2o=;
        b=LE117BbYLzGSyzhMK3TkC+Dzrkp8WEzXx4utatzxgGRtQuXbxAo3TEHAdTv785kmSK
         WQYk9Ajh9ic63LNPFlu3iTAkllFLcp4kTZS+4LgFH5+9zz3scz7ACHDOs8hznY+fQOGe
         K0xnqHVbR3BYNj5WLrPLITZyEX/pUgiOp9u0snv4M7wpElQzkc3ADE3AOwZq1TrlmAti
         v/YJYqECoy+YC4MMnNZJMXEVnM7gfW4QZkaAG8qiU5L8dv7GKA+H2WQMKLJHqmHTon1w
         kJ4Tykvjh8+KUNhbfdbe3T6Rsu/cUe/fIDYKhxKU0/UwqXyM7CjeNKTTPVBaHHANLp5R
         T8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXji5es/ByolMgooOV4MO1di6HyzE/Mpq0H3mBzQcxe4TrW7QDycq25s9BBAtrEHmWkGTnzdfxryVSgPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5hwnYKQKQNNrOuJi5GF+cWdi+O7vf3H4uUF7+3LrfU9gleHlI
	ok9odK9oX5MggZe6dBXxPxMAME0HH1XMMUumqdj1pAg6Y3t1vFiv1RbhEfy1dwzcaOo=
X-Gm-Gg: ASbGncu1VOc//W/AaTUM+ZEJDVyLjB/R3DHW42u+xlNS32f9MEAOUTA9vj8DG6+k/g1
	9HXgcE6Gwp+pKKygRvGSOe8Oay0bEQ30pvbUmKaXsvVUD6qkkR38DIjdz4hA0iFCfXsxb8yhBU/
	83eegfrE9LvHxF/RLjFnu51Ph0adNIhfVvlmJMy00bZlORAzFtCOm8dztQBIVCD6gY2Ny6LdDku
	qw3d1pB1RSjjFokIgQPS5bLvbPSZl79LMZ+gczNb1jWdnvMOuQ+gGZ5QMHwyJCvRxkDAJZr4Xlm
	D2DxmmQf87fME80n8HlQ5e0jbmWnjKp5r2xeBI/RVC6NKijw9vw7Zf8vIPJNLGpqeH+rlW8fDIr
	pG1orgIWusK82UkWr5lgz1shb5yKuJ3RVI7dnlIA0ksu8XPIDUd+aQWRJxX1Jzwr4MzhFATl7OQ
	AqM+iHSWuY0trBvSYXcsJbTPvFfciUOhUnun7OM2CI4cRRq5bLBg4sBwUpft0iLg==
X-Google-Smtp-Source: AGHT+IE5Qe9IouXF3wd/woap6FmjLQyoL/fvr9fm0s/tYwr/PqlztetZvIkUyLfVIXDyEdY4GBMr0w==
X-Received: by 2002:a05:600c:8b35:b0:471:1b25:f9ff with SMTP id 5b1f17b1804b1-475cb065415mr23655755e9.39.1761236176026;
        Thu, 23 Oct 2025 09:16:16 -0700 (PDT)
Received: from localhost (p200300f65f06ab04686163f49efc790a.dip0.t-ipconnect.de. [2003:f6:5f06:ab04:6861:63f4:9efc:790a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475caf2eb9csm44694105e9.14.2025.10.23.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 09:16:14 -0700 (PDT)
Date: Thu, 23 Oct 2025 18:16:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bruno Sobreira =?utf-8?Q?Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, 
	Herve Codina <herve.codina@bootlin.com>, Bjorn Andersson <andersson@kernel.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
Message-ID: <4cm74dubx7lzn44szaw4f73n7icd7zsszucz3kqg5imzgkev5k@yso34szyrvn6>
References: <20251022174531.1751-1-brunofrancadevsec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ant7aysj5kaa6okg"
Content-Disposition: inline
In-Reply-To: <20251022174531.1751-1-brunofrancadevsec@gmail.com>


--ant7aysj5kaa6okg
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
MIME-Version: 1.0

Hello Bruno,

On Wed, Oct 22, 2025 at 05:45:24PM +0000, Bruno Sobreira Fran=E7a wrote:
> Hi, this commit resolves a spelling error in the tegra194-cbb.c.

Unusual commit log, I would expect something like:

	Fix a typo found by CSpell.

here. (Obviously replace CSpell by the tool you actually used, or use
something like:

	Fix a typo spotted during code reading.

if there was no tool involved.

Best regards
Uwe

--ant7aysj5kaa6okg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj6VMsACgkQj4D7WH0S
/k4giQf9HWEtod0hY+J4Y6GOFR7jqnQDvMN6LvbA/s0chjeOlInayQidq9D4rDWM
cv4WXXSmtIfmf41IlwadSo+MGmhWnV9C2T67SwKQkQoF5oGLmUmaqNRATI2/s3G3
JxcNrCLKQuk78JGPMEfuDpXG+NXIWWIRdYqgaMhDv8trpZzbaONgtjYd+AKVUg73
KX/iN4hTN/R04yQioq62AfOm6IlB0xVXnKfnNVlUGXU6sn+rJXM3yB2QGTR8A0iJ
PeGcKfC3Ow0gBlxdXeSTZ5lvCuqr8wu6lTA+56jR46vJCx7Qiv9wVrdipvrHTLkr
Tdma2wRxQW3Y5wH4fF9R05VQQFnJYQ==
=cwm4
-----END PGP SIGNATURE-----

--ant7aysj5kaa6okg--
