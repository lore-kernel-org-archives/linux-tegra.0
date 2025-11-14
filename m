Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B11F75A6
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126688; cv=none; b=SifP53eTZwsjTgMwi0DRH9hIuZR9kOlMdxIWNZG3pYI7N9G10eav6uuQ4QRfQghJrDc7/lSe0PLc75zmrnzuU+90PHp7uF4s1n8jG91Mux3RVqVUg7NEb0tbGoTsGO2JWbQwBcVzvR4eS/B4VEHCqTEaDX5a1Mzurc/aWU121vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126688; c=relaxed/simple;
	bh=/MfNmCaMbBpwAOzkjJvB9GOQKWmOcsbFnthRP3WrP4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEfN12U8S85jkacYrDwaCDhfTfIYZJasGqURSkvjCeIZTluaIiOnM+nAPJgFJiDj3vMUUibWLhAQV/CzXbbBhMOxWsSAfcDkYYS44PT4OFkwCEgCv3JJF3KiQJAoyB1z9x6OrVPN/NNfTTfR7TTlOAXAbOOLJmFTFBVYMeJtVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=An0Ki4z5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="An0Ki4z5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso12271325e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 05:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763126685; x=1763731485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=;
        b=An0Ki4z5M41xmXqsKse7t1kP32LyH7afmW0YlcG9Klz4WF2Qx46YDfpOj9RcO8CIW9
         f8efAj6aNHro8mPQWwq81DAj64i0kZRyu87XRwFl0qsvaDUW0vE7DzGLHl7CTqkpF8cB
         RBuTx/0HmQ+ZYpJotrbnDXqLaCZFTiycAX58s0n649VTxK2Lw1+OmXloblDS4EynSQeh
         zYKoVclD7t4CU9KkLLfS4mJ4oK49bGhGV6eIqqTlPrKW/uKBy3IvcxdrDTU1Mc6NblsK
         ByrgavWKyOE8tH68P8SfojNr4pMgMWJrBUDZjexZwzoxjXBw2o2kLowBzdJ/f4HwwtK3
         SFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126685; x=1763731485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=;
        b=LJ842+YYQhWnj5KiNz9C+FuHlojVQ6Em5hopyuT4Kd8/ar9/xiknEblwWzc/jJFdqX
         AUiZkJlAuFWihw0NGWW0Hk8kZoDMkBHPxACR2rBMPPK5J7FVomEl+BO21HxJWdeYMZ3A
         U7wX9sDfF765HU29hN24n7CCxnnnvamIbvRD+1h3wGtQp5oPCDqy0oP9GsftZbQaJgQn
         l4dRais4X2QYixs4Vc5ohQdeMuAUR8TWmlBhKJ+VuOSFv3gs4NYrwV7FezOFgt9J/ZNc
         S1M3hbKyWzuPBqSa5UoelWBwwYuwkn3OqFcSJi5zV8A+AvYTaz41/KzpVtn51x6NULUA
         AO/w==
X-Forwarded-Encrypted: i=1; AJvYcCUGgTfESfRf0g8idQXOhcOnlwm/J3t/vbEQVRRU2f5E9sfgkAJ+DvE3l5Yc3veglIMYCfSfpBlZXkbZ5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwedGoiq5ZHK7UvjIkqIVHfLYp/EMwBpO9B8FhjOzhuvTMPD4Dp
	zJ89JfO9R/aG+HVyz3O3T70ODiSi1fDxNN881gSVUQ0LZeu8kfIwiSus
X-Gm-Gg: ASbGncu2uUJNQixSw+VTS69DlLwBj6NluLHU0WC4XqcqCpqB82h48RFvAosHVYOj6tA
	WQZ/dw6jIi64Eu0/nsP/CwAvA8gK6/hjwnGzCzSo6yI6VtDp3YuewTZRgZPX4sCGH7CepmeinxS
	eIu9hEG8c/vvV1lEoHzTx9U8uzgnXB3GX8j5Hnotx0nUXsQ4XmiQY95HsfSdBZAD75qgpx5Oc47
	Y6/JImLURlTzisMx2nDtkUQazArMs1tTMRxgLrwdRqTV4C3XSvGfx4d+sIr0s/OjT1a6i9G8NvK
	3elDYGwW4JsVeqNgCKxd6XfLjmoYFGKhgvJioNrVsNeX/iir3+anegHmQKBPlMdQSCnbV6leYxZ
	RAY12quM/6mt7rSmK2qTW9hy/3MgbtTt4KkTP3mlDniQemYfh46k5K6i6SrlNsBAzelIvjwkgtc
	Ssy/0cYllhmhDz1+sE2xhPnzx2Wri4vtv8uLECVco0dypakAQxJ+BgfmHXU11eexPO+yYLJKb9j
	Q==
X-Google-Smtp-Source: AGHT+IGGro6Ab6Q6hQTIcaBq7Nzqv7eihH1X2JDeRvd7W4sKRsUWsSzI35q89svHlSq6wH7pBHiBUw==
X-Received: by 2002:a05:600c:1c20:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4778fe4f635mr29777265e9.5.1763126684877;
        Fri, 14 Nov 2025 05:24:44 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb454a6sm46271815e9.2.2025.11.14.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:24:43 -0800 (PST)
Date: Fri, 14 Nov 2025 14:24:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
Message-ID: <kqtjfqkzz3lfnpg7lo5m4dctowsxqxtlcdtktoatpze3hr3tue@ku6p25skb666>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <f949c2a6-df24-41bb-aac7-f5567d03c5f5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntn2juw5rgeaer4c"
Content-Disposition: inline
In-Reply-To: <f949c2a6-df24-41bb-aac7-f5567d03c5f5@collabora.com>


--ntn2juw5rgeaer4c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
MIME-Version: 1.0

On Wed, Nov 12, 2025 at 12:52:48PM +0100, AngeloGioacchino Del Regno wrote:
> Il 12/11/25 11:28, Krzysztof Kozlowski ha scritto:
> > Changes in v2:
>=20
> Note:
>=20
> Looks ok based on code and based on testing on the following platforms:
>  - tegra: Jetson Xavier NX Development Kit

Thanks for testing, but Xavier NX doesn't run any of the code changed by
this patch. soc_is_tegra() is a legacy function that we need for DT
backwards-compatibility and should only run on 32-bit ARM devices.

Technically there's one case in drivers/soc/tegra/flowctrl.c that runs
this on Tegra210, but it should probably undergo the same treatment as
the PMC and FUSE drivers. The code that needs this is only used for CPU
power management on 32-bit ARM devices.

Thierry

--ntn2juw5rgeaer4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXLZkACgkQ3SOs138+
s6G/cA/+IgP1K3OXIF03hJ/xSNn2a6/dnr1TTFLAUI6Ge13aBNVPxKCDqoxLZCAt
pN2vtjYNWX0Z80+tnCpGdf961hS6OY28OJmABKNotQvlrnzBSn8ggsZ64UlAka80
SRr74Do7F4bWqWrBHEDD4FRjlYR0OVy2/s0i5Zcavhixa1bqN/F9gTWT+kKItZOE
TcV+O8gQF/op9NSShu+oXIZFRcPKdugCNN8w77cE/9B/0o1iII9DzX5uzFYK0Au4
M7rAxBiHHh71czN3ts79Mcyinj9kcC3zGq9wtusv3N18sDRqwZCp+mPP3Y8Up0t4
OotwMzxf59FsoSpNDUh/FgkCNoDoDXbajVzHTig9OQspb/nNis+P5Pbw7FIZb8Q2
3jq8uRvMP3p8gc2pB7nnyQoC6ToofIcHlnhbW0oi1Fi0HovauoN7Vb8/gsJDWY6c
hBe4ABpghzhh0VXFf8CM0vK2MonZYPO0BTyDguUr4nx6QGrrLnBG7S/B2wvaIzgs
UeyUPjbgEhQVdyWALBKf6aK9IXi/Wp+s9w0XJ7qG14q665MqwxIXXIo0ZOIiIe28
e+Ajuapyv0juG6x+mVb44mHgWqZ6bquDTegdCr9PakfF4rDYnDKAcdzOM7/y8/UX
FXAgwJiScvxp/LO7D70bNXMPtYPQ3TVxDJu2I5128N5iNtuaxgE=
=vxrn
-----END PGP SIGNATURE-----

--ntn2juw5rgeaer4c--
