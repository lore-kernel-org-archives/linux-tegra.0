Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F44399CFC
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350258; cv=none; b=nFUKQiTUq2NnzSYFw5Vb7RjJVWpWu/9v7il/zgmHkpMuj+Zq8jr7+GajOVMvraM1dnX8RQ0J7e6TkYDY+4XXSyPMop5cklhjbljmCRvkgdG2mkplOAgepB/auCWgUjm4PNeg+y0fDdYcZbsV84gRhb4xvpJM9mVnRqe+nrSFAsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350258; c=relaxed/simple;
	bh=01uWqmyLFzd8H4CBvINTSYaToSHFeAsBFz1Y1xtMczw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGIBFy921w408M3LPPvQ+K//FY53Ts0utEcgoEBttzXh9Vzm9avGlRbexuYXval2t+QYwKUsn8LeQMcQiXyMD+yLRQ0pXCKpZrHkpfH/4Qfj0aYYmvq9Q9hlbJnOgf6OCoeGqR3Z9deNUQngCM6bkrmOPp2eFL48uUgUQU6gb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQOH2x0O; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQOH2x0O"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45e7c636e74so3064760f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350253; x=1779955053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
        b=OQOH2x0OZmEHxHHry4BcFu9isGLq7beTOFb9yC45lwiqzRwafosbDvCQccvcpI4Hxe
         eNbwvw1744HGpcNiJAsDBkrw0MOq6sGds1NNjqKKdU7XNpyaBOBKjmtpsUX6V4wjZR5k
         Q6cOhRbs/2kg7mNG7JGrw5Mv0KyRQWrK0BBill59rSboOl2hNYGNkFbj5C1VgnaY/O71
         6h9qm+zQaGuSOpXX61yXVpOm24hFxKD7lHIZx8i8qrG4CTHkTNB6DjkIkfahhE9yQYdC
         fT/M6Md7fplyvntgzvkItb2GO0f2QUjGrMGYcskzmZdYFpJSrhLb7NDmnIMIqlEa7t0y
         k+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350253; x=1779955053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
        b=Px5YDx6/oUl/MTzn5STtURH9JtsFJ+T+DJu26meFPRUPrduDI59ikI2InrTBX4hPd5
         aMb535qT/EepQeq8ogAzJ2sNv3OYz8FcUZmh5xoMn5lvgXEJDuXg/lfXL/ekYKbsvJb1
         0jtZgGprkiyRwCY3Ii6If3/fmeNDo5xn8LbxzZ2Rt9/N8SkDs5oQM68ImevA5JMnZtA9
         9t1MqIP66UMsAq3vt2jig+LQuMf4vSvsQ717QK5fB9CVXFk8o5LJQEr0HYD02HPIhS0p
         YCOJ2eXPTh8MKmhE18TEe5jjNV8cGaXwA7PJZuwZ/nvJSQ/BhGzD0PJ1qJxa0QSzsAFP
         A9+g==
X-Forwarded-Encrypted: i=1; AFNElJ/MLg6edHC5pezpxqqKdCb28uJ4BSPJKAMAcTK9Sn/iqNcBozIWYkQE0tUBTvX6kb8VfJlCgk5+SU/0Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznSICwQJ8mP4/XV4Ny6xf/48lUulWYYoV3pReMcuk+5R0J4Ihw
	ouBM6rNH48sQjF24++kGBpms5OoywFmhzuwqoDHsj6gPRtcZGB3/5JgB
X-Gm-Gg: Acq92OGjnIc5Z0vlQV3z/cIiv1YQ4BDuAiCiUniUMXUwCWt3u1tWvqycMG4EnXgWmOP
	ncM4DSjJn+h6D+hnmDjnc0ZnFP32naYz9z7Mje8BkNehHQz/5x8kyAENxCNPhiUltwgV9NXFDnD
	JRc1VXAaXD8Tg09ESZhbaT7FGjk1xaxNtJXA5IcAJSO/5r2kH4OZTW1oDp868PC88AzEM9ksdpq
	Qf0dR5AyuNif0+LfEUZrquEyZTkPjeo0l7a7P3XKnzg2GHWh5h0Ig7nc+YX6FwfsrFbcUVfErsk
	FCa9uw0knVe4b3Wdp50ySuwZhyMNcHYf6dKH2TP1UvTfUwHX0KzN7D/W8B6L0AkX+Rl/FwRTh+E
	RI+j+tGxJ7O/45jroVictPm/EeAR3LMrS2XrMpYuVDqusb5tmuiW+6A8Q2mKVS22jVKNa6CYKKj
	qmbIQTLu3WJafyZLs6GxzbmjgRMOHEJlvK7UC4by9p4s0KVxuqAQleKbZJg+hyOzFI3P1niTV29
	lEGgxOc7sq4GA==
X-Received: by 2002:a05:6000:2583:b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-45ea4141e17mr2803411f8f.38.1779350252817;
        Thu, 21 May 2026 00:57:32 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd50asm821152f8f.15.2026.05.21.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:57:30 -0700 (PDT)
Date: Thu, 21 May 2026 09:57:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
Message-ID: <ag66qZ6rLOeUTWV7@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufnilbb7pbo55sdz"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>


--ufnilbb7pbo55sdz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/vde.c | 15 +++++++++++----
>  drivers/media/platform/nvidia/tegra-vde/vde.h |  1 +
>  2 files changed, 12 insertions(+), 4 deletions(-)

Hi Mauro,

would you mind providing an Acked-by on this so I can take it through
the Tegra tree? That'd make the dependency handling a bit simpler.

Thanks,
Thierry

--ufnilbb7pbo55sdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOuugACgkQ3SOs138+
s6FbKQ//aRQbgwr4ztzl8XykZ3VwYpBsUA5hzUjDURQkJFNdwnkt6k1kBPuF6tMI
joUObtuboDDZBD6T1W1CWvCKqzBPwDlmD5hdckRGlbau3ug5Z4HYFpTEoO2VPhr8
kW6mO+oE+5Jq2I4kEfCg9WfotOOP15ehuSzn2JRbKZDLC9l8/Fyo/7nglXyjmoJk
qgD47vfx8/zgrE/Fv9M+eGdeJzh0XxvRrqWYxe6wJqlFCETYNH38hb+CBfIWa8HR
Tzoa0rmTS4YRP2+p6yeckAN5IWgSx7ZTbCMLLoJfyjEbCUf9Y3ymi7DNWHey2gi1
SY1ue+l/i2UNavChYqtuBV9YOfSyM0PWRQja4YeSMSIK1M7mLfta20LOo37A112O
BN5tR5zmtwiKW5ZnAReOMcWJFLobWu9+ZlbkiyQ4yiONh1truDHgwBOssPfCK+/Y
ejeJGgdzWnlgonVwEp80tLQsNZN4Nccrmnn5JPaH1maEC+eJBtP1Y6V+io/28QFP
YE+W8gXUwm2BK81TcpIw6qswfWiBu8WdGeCx9j5X+mbo/jNWboIo2l0AQxtbCyGm
LiYJV+w1iEWO3WWQKymgmwRdhT/QfeS4VcUikTrZG/NrcIEpVwuVk4syKobUx9Cx
DuSlIPt97hHCjwAaF6HZwg809a+jTrqXPBq4VlYvkjefZNJAiMA=
=2vYi
-----END PGP SIGNATURE-----

--ufnilbb7pbo55sdz--
