Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C59B7E0FF;
	Wed, 11 Jun 2025 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654415; cv=none; b=WSobzUhMokwrVyBRn+ixWhBeTM5jgP0SYUhWeBO9Qk/B5/0n8xTnmB/Ipy0LeRpwrDNI1Y4RPcziGajZvXc2W4wzMmhBhV0Nf0I6vuGO6VtYCTtVmtAvhCp/wXuexLf4TmQfY6cNHJnAKb0k4GO6Yz9z4mrI2q+LtaDqPVcBckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654415; c=relaxed/simple;
	bh=rZvstCIx0930gy+FitWy2h9ieXUWIADy6nD/O8Xen/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkxBqDLCgkscW37zVslbE7/RSIqt1XJirtiSmBB2ot6DdUYEmxU7G/iraP1JpQcmLSpFiOvjoHlPJ7ompnrkOz/KdXB2AnhGmYDgn6GV9KDusdKihi9G9jlMQBxmqEXCK+s1t6nROAGOrV0HiTq+fpnWyA1Jt8vyueZkHK07qg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbXcj3Ey; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbXcj3Ey"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2828288f8f.1;
        Wed, 11 Jun 2025 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749654411; x=1750259211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rZvstCIx0930gy+FitWy2h9ieXUWIADy6nD/O8Xen/w=;
        b=VbXcj3EyokysKu81565iUWb7QAdwC0kM4Lmi+8rJ9KVaZwXNPRNUDmsM38C/9mVezO
         YrOAL4B5UwJEA0bx5gFC4yoPY/x9rK/MvCL8w/EJlIyIOxGZc2LChRdMhh52sPtysDKf
         jBiHvRWkEBOQwI5y6RGHpijLMuVnK5utbsdPUu7Kv2aAvMei47WgjFCt3sbqjrIFb6IP
         uWGvolxiwWuEFWOCzVlHCrlM02JBos/2AQIkPLsA3JXhsfXaOIMeJz5xWq0/wrxbm1rj
         s6+gKjbpccOcIaK1gelIg1Tk4TDoyCsyNHE6u5oA2EHasPj544kpnap+dDYgIvnigbsu
         Nqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654411; x=1750259211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZvstCIx0930gy+FitWy2h9ieXUWIADy6nD/O8Xen/w=;
        b=jNlTdYOW6pp2d0mEG21X9LAwfkV77wd4Evmn6F642dyz1xnQbxbzGUMNAiow3dTgHU
         Ist9uPtsafTPdg/2N2q0uIwYnXbfeRRLaJOEQlKqIxvaYa8nyi3PSBVEz7JsTDrK8yHU
         3wuD6AhF/eBtJ/V5LXkBkQeb+6goIpRUSyW0OkE2GZdHvwrohADVH3Fe5XMgN219PGdy
         ZqI2gmhI7cTccCrWlK4pZUNU7xg6024gBB3cYrvzi6L54pqjb1gzEMEzHexvMILneUUK
         ThoWun4+04Fw4Jro01FVvFOJNNgUkE9Xpn8qCIVXLwohwEM5x6AJ/f4V4u80mMQPJxzc
         r8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs4Vyun2t6sQdSdoDfMHaPV4XW+busURG1VBrgQeQCT0/8AQXC4N6cQnvqKQ3Xo5XohXdFO+82McKzhkRb@vger.kernel.org, AJvYcCX5ezX2xtnQNgRfZoaSaXwM+BLTVn3yKh2M4RJNsMNlrzkpZvEpgtLB4hQRytaAVwk8t70r+StfXIVw@vger.kernel.org, AJvYcCXNETrkC21f229r1PBcLpEzomZtMNJyC5IaZjg/A2S68sRemgWB3hjnk02/XbGA6VhMrDE7BR2BvXL3aGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMf+IF20mU7ZS5zl5nUSeaBB4ucMoL9bIbG3J8TLaaqElg3bpq
	zHSVlEetwxv26aaAaNRyKEheDAsY2frExDc8o0D4yHBVW/tXPylpA8T3
X-Gm-Gg: ASbGncuBFEGNo+NWQekDSxMbZBYFreK/CGSoIzRQQQ9WWzwEBSuPub5Mfnzv8Je4ajI
	/m6TPAbpQkGbvZWgDu4v5hI+1i639RsHU111ewAlqadT18mL8jbUIpJlrn+13/o7MNr+TwSYxVo
	cYbLc8tsx1WfxjDlZWDfD6zVn8HVVlgyf0nwKsxMKAaIP3mwGL7uNILKHwtLollJdeaZQv0AnFq
	WtBDfBAh8+e1sL/hqeLKLfmfdLqhn5exJR1RIQvdT97F6E63r242bZxZcYIiYkD3TyiNAcJyaTq
	LYYhg9Bq+V/jnBfMt/unffrODaJIcNZnswB0g9lyA2dXdhGtLHLWQFuIU9hoyvX+aw1eeljGPdK
	Uw02ewq0daZc8LgmmZqhyfpbiYFVgCfR30sILmf/UN4i8CS2e
X-Google-Smtp-Source: AGHT+IH7gCL0A1jwyehirZD75wEUOdI2MNoMc6qGX53PjwOW0K3sU25NqW7e29pI1Cuyu7enpaum4w==
X-Received: by 2002:a05:6000:2304:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3a558689146mr2940381f8f.8.1749654410702;
        Wed, 11 Jun 2025 08:06:50 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532436871sm15373810f8f.49.2025.06.11.08.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:06:49 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:06:47 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <4cibh66elviiatataa45lsfcyeovkqyxe4fjvfh7uqddhsbe6z@svt2dgeafrdh>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
 <621a9459-f2dd-4b19-a083-0e62f1a42f50@kapsi.fi>
 <96b721cd-7223-4b28-a3fd-a4d92c9d5142@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ahdzzbv4aoxgwn2z"
Content-Disposition: inline
In-Reply-To: <96b721cd-7223-4b28-a3fd-a4d92c9d5142@tecnico.ulisboa.pt>


--ahdzzbv4aoxgwn2z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 01:05:40PM +0100, Diogo Ivo wrote:
>=20
>=20
> On 6/10/25 10:52 AM, Mikko Perttunen wrote:
> > On 6/10/25 6:05 PM, Thierry Reding wrote:
> > > On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
> > > > Hello,
> > > >=20
> > > > This series adds support for the NVJPG hardware accelerator found i=
n the
> > > > Tegra210 SoC.
> > > >=20
> > > > The kernel driver is essentially a copy of the NVDEC driver as both
> > > > engines are Falcon-based.
> > > >=20
> > > > For the userspace part I have written a Mesa Gallium backend [1] th=
at,
> > > > while still very much experimental, works in decoding images
> > > > with VA- API.
> > > >=20
> > > > I have been using ffmpeg to call VA-API with the following command:
> > > >=20
> > > > ffmpeg -v verbose -hwaccel vaapi -hwaccel_device
> > > > /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev
> > > > /dev/fb0
> > > >=20
> > > > which decodes <input.jpg> and shows the result in the framebuffer.
> > > >=20
> > > > The firmware for the engine can be obtained from a Linux for Tegra
> > > > distribution.
> > >=20
> > > By the way, have you tried running this on anything newer than Tegra2=
10?
> > > Given your progress on this, we can probably start thinking about
> > > submitting the binaries to linux-firmware.
> >=20
> > FWIW, the impression I have is that NVJPG is basically unchanged all the
> > way to Tegra234. So if we add stream ID support and the firmwares, it'll
> > probably just work. Tegra234 has the quirk that it has two instances of
> > NVJPG -- these have to be distinguished by their different class IDs.
> > But we should go ahead with the T210 support first.
>=20
> I have a question here, what exactly are the stream IDs? While working
> on the driver this came up and I didn't manage to figure it out.

Stream IDs are a way to identify memory transactions as belonging to a
certain device. This comes into play when working with the IOMMU (which
is a Tegra SMMU on Tegra210 and earlier, and an ARM SMMU on Tegra) and
is used to isolate DMA capable devices. Basically for every stream ID
you get a separate I/O address space. NVJPG will have its own address
space, and so will VIC. Each device can only access whatever has been
mapped to it's I/O address space. That means NVJPG can't interfere with
VIC and vice-versa. And neither can any of these engines read from or
write to random system memory if badly programmed.

For Tegra SMMU there's no such thing as programmable stream IDs, so the
stream ID is fixed for the given device.

On newer chips (Tegra186 and later, or maybe it wasn't until Tegra194),
certain IP blocks have special registers that can be used to override
the stream ID. There's also a way to set the stream ID via command
streams, which means that you can have different I/O address spaces (I
think we call them memory context) per engine, which means that you can
isolate different processes using the same engine from each other.

Again, for Tegra210 that's nothing we need to worry about. For newer
chips it's probably just a matter of adding .get_streamid_offset() and
=2Ecan_use_memory_ctx() implementations.

Thierry

--ahdzzbv4aoxgwn2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJm4MACgkQ3SOs138+
s6FNWBAAtJCLRWy3HnLpatC3L34V9NYYS65LIc6i75tLGDS4+bBBVllqqYZrDaMc
2QXib+yx+tG3P1z43Nq+Cp26YfjIRVdLqlOiQ89bURxrCas6jTBg4o8N8mYIkS62
s9p/Q+YO58bNDfPVGhXOfSLTLciU5i/ull7kAkJMYmAsI31Bt1HywLimUCwHwdlC
sSzGKK38fIZdwKYqR1yAEmtKzc04lOZGXN74/OW8o+h77WrLUlcwIpKb8mF3Q4Sc
wzGX3IJah5vmZHWBnWvWo3ans257qlqz7B6P6lEe3jgPhhs1yL1TD4ii7X8T/sc2
l6wHexytUYYPgWYOV+nIzqrL+F2SU+52YDVng4ADB1HtvdH4X/ransteUoo59MEc
9glcqy40Y6PCAwXwQGGizpQ88Tlg6ttBru0npckcN44iJuHksyca9JO1crBlWoMs
OiRpu8/YOzVGKHlolwhNfFdcJ77C1UP/UoHSnCndgVuTx14ZoFZVjhCpBqwlviU2
7luQxXj5LZdk3sxnlP+q054H8udEC9PDavNwwO4jpH+0mcFZH06lpSGad67nOVgA
dVTI15W89MocI4CDrbq8wLOlDJijKz5ztoLwm+e5V0BXgu4SrdvbuCvcnRlxvphV
wX0oNHG2ZZ6OZFZQ2eaWAxWniSkNKFfuV3lnVMlz7B4bR6hmD1E=
=pPIb
-----END PGP SIGNATURE-----

--ahdzzbv4aoxgwn2z--
