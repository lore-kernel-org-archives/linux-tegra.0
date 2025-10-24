Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706FC308F0B
	for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298110; cv=none; b=KaSjAMt8WYzEdd6vdsNwSUXAGVmRNS4x84s2wxvrWk7yY/hH7GcroVdZatQTgMtNYkL9CkwIe1+hH7P8uY52rnj7DvNFuA4rJ0DHev0nPYtx9/7DBIR8gZToJj05MBvgzfAPZ3uOf3A9N3ToSzUoZnTpw3TZuWSj+S3Q8/m0/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298110; c=relaxed/simple;
	bh=k1gJBxSFQTQREq4q1D3RYWBmddB3YpEygIebP8N5dbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPWnPdp4RBCmhkJNpZbKA+Hv4+XjUsahiCszsRKHCfV1mpBg2NYixFgctfTIaWDAHwRM5EtXDTVmx06M+82344tXDjh/rORhNwia4Z+PQaOVU6gReRfTpzmJab3DwpR5yvS0riq915p/bKkdoogp1Rz3IZOm0kIk/LwhXSrCrFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oMvewgqn; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oMvewgqn"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so373863166b.0
        for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 02:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761298106; x=1761902906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1gJBxSFQTQREq4q1D3RYWBmddB3YpEygIebP8N5dbA=;
        b=oMvewgqnXvI82ZdvC8ff6+pRaEe4yPjLnfjvw0PwkCYsPC0a2VfQvZ//pGm4HvgBZF
         0wUsZhGrrpIOm4FwTWmFNNvHhHhit/YW2PojtDFFM0r8oQAOxz3m3oJMF6zr6u8zwcq0
         yHat4xZvFjf64pcC0QxcLwGoi6NpnT6NHEFxX573OMLDH0lyTgl8XIV6s6fghEg7SjBl
         1GVV6FkVdZdrA8USalXV0oG0U2BlBxuGCi2nXVfEwdQ1KuIQvimKB4vdXbt0GogwHQuD
         Og4rv3m89+K5Aqcie1PJWoV5C4E/Zb95kZ1524aUJCIYiNuM+xVHKDTl44wIvPTNtidS
         ue8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761298106; x=1761902906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1gJBxSFQTQREq4q1D3RYWBmddB3YpEygIebP8N5dbA=;
        b=ZiBXNjV9EMs7Su2fMuZLfy6Q2QnetRvqu3aSF2ozxC65DibpYjTO2EIpRG/TUnC2SW
         3alu6WNpDbo6n8tEhqEDgo/RUtCGmmzPOKBgGWCQrE1jPfcOoRQkYElB+ssbv/DOmEAV
         tWnBPDxekgc8LPop05oTmdejir6T3yuwhLMN92fyVmbwfw96HblorMz0DRwezMpEJJxP
         axL8hjNrxAjFq5oBgydvG3kapV1uV4Hqsl5ftZConlgVQ3hg5V+96Xd1fEYH/WTIuVVn
         KGvv5tH7Mfq1SG0KiS9W5zTrApoUP8Ks3B4n+wMnsqujwmY5cbfAm4F6tObMLq9+HNxW
         muVw==
X-Forwarded-Encrypted: i=1; AJvYcCUBQM/mcmHHLc2DMgJ8Regu8d3a+fsKc68PdbDNNNZnm3mtKhl1mXP92BvuRZhiDVOfpMtR8oeQ7PJxng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT6nAjnrUZ2ERhPWEkZV3eRjQxs39+/t4+R3or3WPUab4Q5Vmu
	dGZF0XiPS0hQnAqCrPp1orv2DHNnPckz78R+Kd4kmiv1TBQBpO9zIroBLNArBP/0sGA=
X-Gm-Gg: ASbGncswvoLtFx7xGeLpXfXLBMlegsbem3ddeKFYFeF0pzN/EodJkme9b1AldYDcyMX
	QxDYK3QirLpJHmTYep/KmL14idszkbuKRILYY/2AWnHlKRoqOQXb7auTA+GRZcnE7rSqjUH0EWV
	GtNQby5uaHVpGhA5tjM6gznsYGP7D/v8pa/tQeCGpc/Kmca8j8AKYdJCefJ3XXlz8il1RcqJcA0
	d0cktNe9+TXwkjDTpxShHKP9sWLZVwaxtIbGOAj/iRJ10dQgtHKPCADwX/KBn6tZLWccnV+735s
	cmZZiqN6r9tPs+NZI/2+9+FjIYefNArGRG/T3dg50EennTOZoLVwFLlqGJ0OZKs5WYm0gE6ZM32
	JtIKU7PRtyyODmI4GI+ptzsSAuEDnDEL3vomO1OuElCAX6l1uD/25ZMGKzeuxaiR+bQiQSMH7q5
	yylAj9TGzxFAaI3i8=
X-Google-Smtp-Source: AGHT+IF9EY6G+N+VE+TZcRK/+/SKxHmucUwBQzWUNGYGyai0UIA4pAaQQzX7Eea7bL/sH0piJFkuoA==
X-Received: by 2002:a17:907:c13:b0:b37:4f78:55b2 with SMTP id a640c23a62f3a-b6d6ffa9094mr176871866b.34.1761298105676;
        Fri, 24 Oct 2025 02:28:25 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63e3f316847sm3884468a12.23.2025.10.24.02.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 02:28:25 -0700 (PDT)
Date: Fri, 24 Oct 2025 11:28:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bruno Sobreira =?utf-8?Q?Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
Message-ID: <o5nqueofdvsfkprzdthlaqmbkv4ym7o7bf6yx73zwbb3afl7e6@kp4d75dwupvm>
References: <20251024013528.1542-1-brunofrancadevsec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="anpogoywq2poqzak"
Content-Disposition: inline
In-Reply-To: <20251024013528.1542-1-brunofrancadevsec@gmail.com>


--anpogoywq2poqzak
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
MIME-Version: 1.0

Hello Bruno,

On Fri, Oct 24, 2025 at 01:35:14AM +0000, Bruno Sobreira Fran=E7a wrote:
> Fix a typo spotted during code reading.
>=20
> Signed-off-by: Bruno Sobreira Fran=E7a <brunofrancadevsec@gmail.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--anpogoywq2poqzak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj7RrQACgkQj4D7WH0S
/k5Gsgf6Aj1NH3aTM+mIgz7ceAGVrXoA5uajX8GtPGMXco1adpIzwwOoDv5f0n+H
nXCoIOOdXGIoqBawKTkSs9BH+DtbR/QIkuzYlqUYW3MsnNxmtEPVPjaOpGC06QS+
J7BFn2YWFFRTgwlFsQWwFYm6xU1DS54WLImOg7fA+gOS1Facb7cT05hEA3+fqVoa
gLRtkq93JnugHiJkWXnX0xmvRTA79AAa4E+SN5whV8qBi3cUmsi90AfvVp62SU23
LwJNiJcdGFlSqe86xm3sU+Qln+SiDoFpTFwj9po6lA6AVsb3jzPnSI1zqTt1M1Hh
yMAudg13gjggLVMxSI0SNnPYBSUtkg==
=Utdf
-----END PGP SIGNATURE-----

--anpogoywq2poqzak--
