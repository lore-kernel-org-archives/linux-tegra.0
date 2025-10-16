Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36352192EA
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760607925; cv=none; b=CaaVCgSd3G02JOe6Nm6NHZA/+I5QXT1MY9nfHThgST8lqfyqSP4oYkpj8HMMMLp28G18lBjN6Yp4wVq1wlXaC6efWdQ1ZLrgcDGXYsV0H+qxdWSQBHZxeYLn4BdjAkUx9CoB5cGSSlzB/R6pblzw2meUubIFNKezQxDge677mfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760607925; c=relaxed/simple;
	bh=Rq7Tue7rB04A5HvDcNDQCuYJBYqi51W3JG3UYAh6LNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLCWLxfo9Dw982n3c7Ikt1HZPSW5rJaiyvKGZD4/SBD9boGfRsavGuLjquM8B46XarY6DsiKgzVZWkCk2nkYHpEngoLkkjdzohnQ2z7Zk+bLsGpiebObcvIyBxCV/2+VBE+PjY9dIzECvKXCPNP7mNVddHBEhua8ZSwpbBJ0STg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IN4oJiaI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IN4oJiaI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47106fc51faso5922495e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760607922; x=1761212722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=luIr/Vz4PlSP2i+Z6QDY9rTd9c5ylDxv7QfHE0S8P4Y=;
        b=IN4oJiaIcOCRwePxmKQlhwsoHHkl3geoE/3vFkPvXd3hE0OXm1lx1fPaKYJb81Ow/c
         CM4s10yFTlrqcJD+9Wp5Hnv4R5eGdB/aTkLal2KU+eV1r81GuFHxkyjsNhdGE6a10VR0
         1DsKgF8WL6bs8RXm/2gpUuj35IU83I9W4coiPMbx5rYksyRIyEEVHSyR5gvrZM/Cun0s
         GJjG6HpNrE6gOynaidKtBYYbSlo1eZw7LsdezNkJt7LrjyzqXlv6nY5HCrATPNCGX6Ai
         1Blvfd0WS5UGcoDs/gzlMddmvqhCMf0z8CCZD1u4zz0H2sQh4Pi64Y/MgTHNWl9X72Ir
         zegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607922; x=1761212722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luIr/Vz4PlSP2i+Z6QDY9rTd9c5ylDxv7QfHE0S8P4Y=;
        b=qI78/Zu7I2PvknxNfEnF8I1FzQHldi5XIIfUjvPJze3DMGz6N47jeaIB4Lxjp322Z+
         ysC7ijSXd79EqybMhHsVnMel1Cxt51cbc37yyMYlEPeS2P18G7neqicP5p2eVXqSzmuy
         eE1GJ8eYOxnw8GrXpffL34KkMt99m7cMjPiFC2aG4P+IvaWR1uGpPTioZ0/c+KdmDqyz
         fR31zP3mhyB3d38FB24Q/YrxtsAuOij+TBDnHRe/vMUYEaeWoUUc4TpGJnQ0qvJ2vyPf
         UF4TF5Dj0OnF5bnOMDKA5Anh/EagroMGGF0Hv/kQAIWTcRzM9zQADZ7TW8fxCM6CXZm7
         b9vA==
X-Forwarded-Encrypted: i=1; AJvYcCWhTLutGzq2/Gz4cMjy/evap2cpQ706E4kLzY9aKB2ZIb9uyg1X/li566WsB7Xjo59usC6nV8UKtqDH4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YywFeAtXLfujqRBjYJvYx5wTHUiElpTpNIoZwSFPXl/2324xnAm
	K2h9M+nHzfbkXRf76/R4zZBwmC3n5dQvBQ3hGqkQTy6Yh6Gl+DR6x0ny
X-Gm-Gg: ASbGncsfWO4CNquk8VQLZFGy4C7tNh4V+KxkGH8Jlfn2tmepy7yrNFtOl5Mr7rvetGr
	hwfC+jte9MDM10QjQiRkeccuvCc9zlbFKR7+uNKGNLJXSWwsCevzkIrHCaQPnYtR9gmg+WaxobJ
	WUyHp6gdHwhmjSU8NhOcXlQF0YOz+504dCkzDHP67ZKCwIneDSqxSj8OZOpxX0CGySkEFZWktzy
	4FOP3M1dxFZWf9PJ+eNmZ23ozEQjZ9LeePSLZbNk2lhPqI8u/fh0SPpa3hXwSGMiPiIJu590zZJ
	jGDS0culphJNB0XNHSUINfsggCqUxicgPrkDVHwMG2Lmu7yfIsRKxDplLXlZvmPiaPDnaPMkxns
	wZ7uE+JLfSJfZ2kxxS94PA71w0YUCU+D9I2T+Pkfm1bx67INYv6qaeOV+fXNz5sQKaC88cOn6Qm
	g7JWef+XGzSNqoL/qbMY7BPY5CEV1iCunOyZtryp8TnSACWHJOKV9jyYg9ic7MwEg=
X-Google-Smtp-Source: AGHT+IEcFTF/lyt3/noYj8bqdWfDVAl5uR1p9xxB9hzRb0mEciw6fjt8YGsyFYmpGWdJ+VcwLffP9g==
X-Received: by 2002:a05:600d:41ee:b0:471:152a:e566 with SMTP id 5b1f17b1804b1-471152ae95fmr4831675e9.13.1760607921776;
        Thu, 16 Oct 2025 02:45:21 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d015esm34572196f8f.33.2025.10.16.02.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:45:19 -0700 (PDT)
Date: Thu, 16 Oct 2025 11:45:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: tegra: mark Jetson Xavier NX's PHY as a wakeup
 source
Message-ID: <go7hq4kv2aryxf2jjjarsc2xdpwtz6uellfkoxwc7pr2vhh5bb@fgoxzhl74vl5>
References: <E1v93ne-0000000AmQk-1nHh@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bavjhyzzjjl25shl"
Content-Disposition: inline
In-Reply-To: <E1v93ne-0000000AmQk-1nHh@rmk-PC.armlinux.org.uk>


--bavjhyzzjjl25shl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: mark Jetson Xavier NX's PHY as a wakeup
 source
MIME-Version: 1.0

On Wed, Oct 15, 2025 at 04:52:26PM +0100, Russell King (Oracle) wrote:
> Mark the RTL8211F PHY as a wakeup source for the Jetson Xavier NX.
> This allows the reworked RTL8211F driver to know that the PHY is
> wired to wakeup capable hardware, and thus to expose WoL capabilities.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> I thought I had already sent this patch out, and I'm sure someone said
> that they had queued it for the merge window, but it wasn't merged. As
> I can't find it in any of my mailboxes, this must be a false memory.
> I'm way too overloaded to properly track anything right now.
>=20
> It's not a big problem. WoL will go from not being functional in
> previous kernels (and actually causing problems with interrupt
> delivery) to not being supported (ethtool will report so) in v6.18
> without this patch. Options are: merge it into 6.18-rc and have
> functional WoL for 6.18, or wait until the next merge window and
> have WoL working in approx. four months time when 6.19 is released.
>=20
> Note: the bindings update was already merged in commit a510980e740c
> ("dt-bindings: net: realtek,rtl82xx: document wakeup-source property")
> during the recent merge window.
>=20
>  arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Hi Russell,

I've picked this up now and will send a PR later on to get this into
6.18. I was trying to see if there's a good candidate for a "Fixes:"
tag, but since this will only make a difference in v6.18, I didn't
think it was worth having this backported.

Thanks,
Thierry

--bavjhyzzjjl25shl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjwvqsACgkQ3SOs138+
s6F1Tw//eOYfJcrsWjukPL3v5DcKcgiunqkywibKRZO6ss+7wlGQtNPzenlQQaxc
CtH7JnlbrpMu5qPdlHgM2k9qcrxLpj/v6mOpewjrmKMHSPWl1j4sVYKjPnUUjBPr
lkwZVeWerGTwzWooa9W4pdEsREEHlWtZzD1b3+ZqmCmLzASk6JCVWxhNnQNw3IvM
a2t4b+aJUZnALkfeRhVZhaUKcSlCKFr26vpHdg1vk5ZoxwREgsM54+j+L/ieGfDa
7hoWry4OLTBBUU4KQsY4+ABgVduCtOnNF0UBeLNBYY3Q9mt/2xUqHDCJj2Jy2In+
5xsaOBqLCQXm0u15xTLtxx+i5MNPWrVJunoPLDRMoy1XTn+up7ZJvASzP2+DM+9u
dUCDVwLedT9ZgA7Y7w3ilBrPMQdmTymFKnxQGvBzpa2eEFOXKGTDXGDAObEO9gUR
BpwNiUOUby6whlCBAzfDvl7vDmFAwHj/tvcwSPk/l/FBlSlZZH/0ilm4RpJFubth
OkOT4rY9uiZ7Z2wdXk5OlIG+du+PcB2McFl7rd7RQn/+ieSpFowePmquCYGea9LJ
4cW3E0DwRiwA7Qs0KkwnnDqs7wzSrUXRqAJqW22CUGeun+Tn3mCLe5iHjmFH0z87
flbq2neifmdGqSz9HAovy6D8hMXhjsUmtgz5RIIJjASuJlehRSs=
=z4EB
-----END PGP SIGNATURE-----

--bavjhyzzjjl25shl--
