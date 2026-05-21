Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305C11F3B87
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350475; cv=none; b=CGEQSFrps17exkoJVIkBG0tn2GyQLkRQx22jV3WaNKJLEDs24k68iiNor6nV6C97QhEQgfs2e5zs7cySYHeV703xvP+TYttgUWu2Hu17WglujUexS4qGKrkILQ57o8YEqL8TB8uMAORpFe7YghQZYJJ8Bz7xsBNmBcObV/+yOvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350475; c=relaxed/simple;
	bh=jyOUkIh5U4Jq5jhU7z2i3GFpsJ91ALGPm6dGho+irzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo+v6ibhMfZZTjYonEgSY1nDiXRdm+qxle236jcnXqlDz7U98th2DmntwrgjE3MWu3woIavwwDE08MpAKl/NlF1H2XhlVNTlJJawztNyTsmUDDYmIVEd/oCkUqBpW55VVN5D5AzU2Iiy8grDGDlj9qJ6TqWpCH0kF5Y7S7sB1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVVZVySJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVVZVySJ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so2370974f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350473; x=1779955273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAGm6nF0wdUN0d2423OYPWZUGqBbg4/Jc7nYqxEaHM8=;
        b=aVVZVySJmrn+BiIUydUWCsvJnn6a2TM2YIuYb+LCOieUVpvOeb0wc/HgC4X+OOfb1l
         4X7TvEc8NUgKRZo0/clcD4HSJqeHKAVzXEYEnBEGIQD8xVukvmQiBdZYzynxEi/pe5io
         dkLIryFeUlDfay5yyqvkWMXfgaOFGUgnaMx41QN5ELuUSX4cah4ZRJkmD7I+RQTcpJz6
         QXuwfYQ2viteGe7II2zP4PLcX6IYIyfbZCdcDa4AvCn9iDSzgaFloCgsYd6XLFLMYhoO
         KZ1aQpB8kMYHpES4DrfitPYK/VocyYbb92atSwL/dHiHtSxBZadQ5T8qRHjtHe0coGmU
         4xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350473; x=1779955273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAGm6nF0wdUN0d2423OYPWZUGqBbg4/Jc7nYqxEaHM8=;
        b=lvgO8EkaJn8e3HX5pmEBt+/zXlp6NgJApVqI9x3FlXNeC1uIcp35sqJruh0D616S2d
         zE8uBJ76zyD6PRFjFwpG0oCd9sDEvLBkPsU9xmMpZZKg0Biau0exc3whemJk6JadqRAj
         LgOhMwlIsTcuzJY2qOvZkqJv3SNMB7MjmjSDN6B+gK+f0IxLY0v1TQsD+kdL++ZBSdzw
         Fj3MzXVU5U2bkq4SzERSGjl5btQbjMWh94Z748P0BpPS957hZKbmWLo0p/Mw/vF4E69Z
         Fj7w7DwrEa8SutGMinb2ECJeYQXtZgnvTv5LErRWi8b+BrEWTa4p+I53aC9o+E1SoGrn
         wx0g==
X-Forwarded-Encrypted: i=1; AFNElJ9/p4ydG4lNcNAWsyhjfzr8z8iN8gKlI9T11rVtAb2XaElsIUu3asodPGCM+P/sNLsG9RZ4EMbSCYcksw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF57XUCiPMqjeRw7kK4nP84Wyix8E4IDY8tivg6FTITQ76tboT
	DDOTns2ki4/wXJnY4oYdfzdGYKR2nko0TcZodUh4UkD2t44k0ZQ1UFWh
X-Gm-Gg: Acq92OEHmT2YbNiWYmIFq4EQNQVhsCKgaXybn259rRTllq6BKoXFuU6ETCWUXqQ3r8t
	/rleWZiIi5yy1aNiJSXHZ9EZRnO0unTGNWJA0mUkrEi2NDxACwvEeoGb23m+2k/yOwyACAdy9X+
	dSyQVpp+BGEzt+PFeMhwkK7NcFiGwsvyDJpWHVerEqc8F4lfejNbtoMGmtSCDqD9PSTpfErWqn+
	6xNiwfu28mXIEE1aWYjMh+fKRUw5UWQnI5Su9KfUIYGqW2FO3QxmEYoXTSbpsNmzAF1ZBTkqMJY
	LcGYLPiraqxeRcaP+YaN4j8ukiYV/cuovdsBunwT7fQB5kpUSlgvK79hY2p8TZySmT/K7t3IXem
	KA7RMJcqiLHal0eWbFb7ciUTl2EoC7W91599Ql74tDZjTTSaEr8up2JGWO1VvNLlg9BsNmmHqnR
	gcMuzRgmr5d5rxQvibjbVld0YnNcYKtrCW+HyajKZ22jQObBcSkgDXR/AhqZSXNK4QgYAJQzp70
	0KSIz/w5I+bXhp2CllhSP6Z
X-Received: by 2002:a05:6000:4027:b0:45e:a0ab:8bc9 with SMTP id ffacd0b85a97d-45ea3dead2amr2513624f8f.41.1779350445635;
        Thu, 21 May 2026 01:00:45 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd9e6sm857662f8f.16.2026.05.21.01.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:00:44 -0700 (PDT)
Date: Thu, 21 May 2026 10:00:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
Message-ID: <ag67dmFtSDBC6aPK@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5oal4jl4ykfwr5c4"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>


--5oal4jl4ykfwr5c4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:53PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  | 2 ++
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Danilo, Lyude, Maarten,

would any of you mind giving an Acked-by so I can pick this up into the
Tegra tree with the rest of the series?

Thanks,
Thierry

--5oal4jl4ykfwr5c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOu6kACgkQ3SOs138+
s6FK8BAAgs0A7wFYJOVZxTTW6MNa4zXSjm64uXobpTYaWzKll6wOHDvn6C9dcp/v
MLtSLfP1p1SW/dO74lgYcFcwNaDIZdDsJZmNba+3Jf6PpFLkFdvor5IxklQDCq7p
CTff6BCXl8nTZkHm57wdzn9MMiduUUlKEc1foNpP34dKfb148QjLYdxi/2hFY/ap
VNo3Lr54eMkr3RXicgdgDHq5TXk2gKfSdy+Tve1QiUcemkc36olxR3tcgVSLxPJC
Q66EiKj9g3bjK+fEzB7hA/GeAQOfpuUIObaCdcASbPeCBTyZJY23WbYAF5XMMRDs
LjCs2r/E0EtZLwKY0NGBEZjwzWxF8PddUoqi3TngTTfv/EJ4qx3QzqvAf2DIVKsA
xJgxWd1rDD2HclOQ4GojKyO7CYLt4Xa8hWXPt4V7ajU03l8bOCvKOBNmg6hRD5jp
vHxVRmM/KOteKe7c9VJCMmxmo1oi9lE3e6BCB/VAGm7tzXHK9/43ug3tlh4A4Yk/
ad3eKm3kJxNa4FvJor3dadP6+6C0HUwZkk40TGgkYubsdPfR2kyGI3YZlr1J7cBI
jdRqcYoo/S+HmsreQgBpPXcTUhKqLsTU9/eqQ7V+9SItN6mvX8pPWmUaf+UexFht
1fkm9VtVD/H5bQ0QeOiRpJMXOe/ozNGH0hUKOEywfy7W8syQACc=
=YTdM
-----END PGP SIGNATURE-----

--5oal4jl4ykfwr5c4--
