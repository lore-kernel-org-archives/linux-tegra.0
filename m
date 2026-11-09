Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209277;
	b=jxHOlZkyQl7mevt1nVY7ajUT9nEXDa2k/ddDflLBMneTQQVhIsjfzppxmXFM1yofCvHA
	 QLlqNK6PiF7LgCE1KDP39Ov97FgNuodt20l8imX0sjlqwvhTVghSmyHgj4SB7+qbCsBrA
	 DGfMI0fN2Wwa/Ym2GenBmmlVcqrJ9vyOnVdXbSlMpEaRhhqqyF4Gpquai3/gfhUuHn8IB
	 KlE2aJyIt4/iLENB9tv+M8fNAkb3yxjM6RoPzmZAWtJCCs9AShFiajLTPYGFLuKN3Ilcd
	 fTDsbt4VqUr5/sIFM1YBdbKYxk+2mj4T1ql8TQ0t/1nFW6+ILS/gvVCAX0Zm3gPATVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=E3GSLX6Y3E8KleKfgQiE/C3m6qssnf8TIwA8ymgzC0E=;
	b=St2UfpF0ew4TKvaz11ax+Ir1/T1FadWCnXPXOTmi5B5F8p095hXskoDBMclbsj3CpsYJ
	 qsd35hgcKgq7RmsGbDcMU0SSycqbrjb4b/JRCKB8ktDfuVYvvwhecm003/hnoNdEPk3Ty
	 K1voM0E5yKbC9VcjUlw2mnNk02Labdzc8VZaQx5P/tUUtpQwuvUNcrCzZ66eXZErpmhGS
	 BfCEMBrTvoTWMQPCp/vWnPrUSvOUcYN5iGe2iZv9EAWJb2gJBoEKdejpWz6CeeP5V1Cy0
	 VlOegoBFYWwgYO2uyT8fUM02A9SUkrJfzn2iGN8+O+vC7vC7gp4GnuG98Ac1eJA1fzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YsJJzZWo;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67135606A326
	for <linux-tegra@vger.kernel.org>; Mon,  9 Nov 2026 07:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67135606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YsJJzZWo
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49134c8509fso427550f8f.1
        for <linux-tegra@vger.kernel.org>; Sun, 08 Nov 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794209274; x=1794814074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3GSLX6Y3E8KleKfgQiE/C3m6qssnf8TIwA8ymgzC0E=;
        b=YsJJzZWoS0kA6/sx8xVmsiX3lY7D97+g6vmXE2cme19Nw3wx1YjQMQmFrHMzY2lCsM
         XcR7m9yMzZZuswXowtmaazeEYerimzOcQm72n3THFcnV/ZYKFFf6o5aRdPpKzQ84woP1
         gArrQlhv7cd+czWvjDX7vYWw+Iv+PdDhH/iL+9VJJyFGW3b0yz3xrIDgC4vpeLAVcI16
         Nd8eDoPS9WHdAjw//uYc65it8yepxLbt+KEGnULUWt8eOKO3lMN+IEEcxxH521D1/plX
         v8inpkSfVYu6aOmd0+AK7zC7l8ZPue95LJE+R1FOMYQdj9TxgT3YDsVxvTTCMMvK3qRH
         RSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794209274; x=1794814074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3GSLX6Y3E8KleKfgQiE/C3m6qssnf8TIwA8ymgzC0E=;
        b=trlwHxT8oWyOi6n0fojxR3XDuoCVBd9e5AB543WmyawHFhN2jS2hM5tyB0B1+RbC4Z
         5nTALqCjZWY7OBqudHibbxyTn+poyVgDsfP1jc0IWiyUfEaBbxjhgH9pTBDOagkoGwL1
         Ae0dXZsXgm6hy9seI74ZX7TAVdQ0QAlFOWnMdIcscAfFfLO6aI6qthZRrmPITUcZ4J2a
         XgQFK+1RP9DXxWCjDOfIHAvvKRTE8fEDUDQ7BE7E+KSStWbk8iaGd3gHNw3cCQxVluKH
         5D8EAe0EnLeHA/p+HcVaiQgf8pkrTK79ZhPCYTbNX1lYOBy9xT5Vj500H6fmHqTU3Wpe
         f1sA==
X-Gm-Message-State: APuU4Z9wH6YH2axUCBGiAvb2UKEoTWW2I0IIS8xTyG2GLs6J0xbgA7NK
	cFlli+ZQS0zofUPHbHg4qp+b18BmkYz2P6SYwUwX1ssl64oaap4F5hXrsuBIdOBlKCfiRCAaBFZ
	AJalq9Fc=
X-Gm-Gg: AYBFou3DB9mzI/UzcWMUf9a3jiRWqwrLpf4lZoHemVqgywW1aXOUMvk1l7Y08PFTKlw
	0Epvus778JS6ViRhnuC9nnaEWemUUhErwRtoAH4TICteqxLRjsH4zrYUfTEhiOYCM3sPyER77XT
	g/5M+YnIcitIahaSWKnhFqoP9DbV85CXUlAGR6wVFBoyWa3Bt+R2gJy+rnfC4emdnkaE1ScTko3
	1Co62euaHNeGwjE3oWyBj3RozmiWMDpuXJN9SnEzptx2+/gCITK7QUcZZCpBhO8COdqeXKSPE5S
	xSpPMZG1fqVMmnebEJejuIV+7GLWmkCixq4nfD+rz7HK8xfZouoKtt7czgvAT0iLeQ5umwWVJt8
	br3KJNI/5fpYWVDj9iZQ5BxtXPza9Pyzw9C+5vbEOJTZYk2bjUqc29GCdYFwFP6TLnTTSBqa7c+
	620wAaPnoe4noIwBSE1Q+3OrUNKdmSon/NFocpnxxJXDzuq87yvtoEsdkPYdiJUFM0evxP9U7NM
	i0d7zD5UHRTyVDGyrj5c2GWnaFyNADx5Jvii/E9xfjsm9YXRF3rowu0YrQ8unbeezf5Baz2ofiZ
	UMcpm+bLlyHR0XWji+QyZVOM4NxspErqptP2eg/F6oalNc9QMaHr8h3FMIYDNFmlsC9ThJa5L86
	ee2fUlZxidHTxmQ4=
X-Received: by 2002:adf:e18f:0:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-49583ee2222mr5349721f8f.18.1794209273617;
        Sun, 08 Nov 2026 23:27:53 -0800 (PST)
Received: from localhost (p200300f65f19a904b11874a4d8ff21ec.dip0.t-ipconnect.de. [2003:f6:5f19:a904:b118:74a4:d8ff:21ec])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49592f38e55sm8523279f8f.4.2026.11.08.23.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:27:52 -0800 (PST)
Date: Mon, 9 Nov 2026 08:27:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target
 controller instances
Message-ID: <avF1aKFpDAnJi4A1@monoceros>
References: <20261108212458.275980-1-marvin24@gmx.de>
 <20261108212458.275980-3-marvin24@gmx.de>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkuwnclrflkupg2u"
Content-Disposition: inline
In-Reply-To: <20261108212458.275980-3-marvin24@gmx.de>


--fkuwnclrflkupg2u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target
 controller instances
MIME-Version: 1.0

Hello Marc,

On Sun, Nov 08, 2026 at 10:24:58PM +0100, Marc Dietrich wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> is good enough to provide struct of_device_id.
So please just drop <linux/mod_devicetable.h>. (If you insist on full
IWYU, use <linux/device-id/of.h> instead.)

> [...]
> +static const struct of_device_id tegra_i2c_target_of_match[] = {
> +	{ .compatible = "nvidia,tegra20-i2c-target", },

No trailing , before the closing } please.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tegra_i2c_target_of_match);

Best regards
Uwe

--fkuwnclrflkupg2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrxdfQACgkQj4D7WH0S
/k4pyAf+PbxEvdqRidzu2MVCrCyWxeamOnr6Hnxx7hAjskfnXnOBNqZ10n3JDJ+U
r8iXDCToc1hMFO1yCzKSbqVSYpwzA2BvUAJQ8wngzhF5IMv4bqBBCvl0Ce1NfPSK
xHHV+dFRjZ53sshblFCv1TBnDdovJZ5FLA+q57pP3pDyMnDPJFRcTQj4praFdVQN
GScZLPkhaJye+EdS/X9gFIaxZK2i9E+FONR8OD9pt09l+y+0B/CGwm3M3BsWw02C
bS8D6rJ1FxFFawAvo/38LXSGhShN1Z/xNjeC4015E1Xb2NWTuQgBM44jdQLzixDQ
0j1UHQnBBm1bVAdXXZkIosER7AEa1Q==
=o0wN
-----END PGP SIGNATURE-----

--fkuwnclrflkupg2u--
