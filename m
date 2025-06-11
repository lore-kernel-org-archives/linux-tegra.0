Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FE717B506;
	Wed, 11 Jun 2025 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654632; cv=none; b=WsIaJIbI7hHoajSUddGv9Jg1EYNNKhSxdu3Vl469JuT8CBhoFqlu/scWmpXCDxtu584YxQNDVWdQHpDKrfFJyDOoZ4vfA7hGgmc/JguyIwO5K8+Tbhp66aO6G+lPbKJCYhXUg5bj1myVlsD+GKFqBJLUsXJXCzMgxP5oR3I2E8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654632; c=relaxed/simple;
	bh=6S8PHrg4XjEfujkT1575VWw1Fek905U7Rjg8vUvSE8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgnzIeq0/aWIklhJB82FDe5UUnIEcOBoAw4e9S6w7piGkb8V5syKL1QbBI9R9fLhaC/aLnTZU9dxXNYrmvTMsXMnOl49QVYKrI8mZVKflIzUyd49uXAkebBFCli7/weVstLqhYxfomUGzW2Nw6gEIJaE+WZu4R4bdpZ+z2SjiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzTRS66C; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzTRS66C"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ce671a08so43850985e9.3;
        Wed, 11 Jun 2025 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749654629; x=1750259429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6S8PHrg4XjEfujkT1575VWw1Fek905U7Rjg8vUvSE8U=;
        b=EzTRS66CXZ0Md9I1dSFjRQKlavFqkIgk1ocAWA6iZX6rk95TLLBKbAiCPGeQeSr7Na
         w7BBPXlmIblzXIg93YCOUO6PNcIAyTk/F7vv/6C/6UUWjGW5LaplzbFp8FnC7JtamZst
         dLHpvbuftXF4RmfDC1pzRLi5ptzOQA66o/7LPWHRwrafWXUwDBzpNicI8d6Uquegfa6F
         V50jWMlLgemyjX7e0Ji76N3qU4rF4g1UP7W9B7XIppKd5busG9RvekfxL7DJCKfZNzjd
         y1JLOx6oRHH4tpHEwpmajL5Ut6m2d+07fZZPH0fzSuPIhRvBHwgYls28EPnB1yim0KIR
         AWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654629; x=1750259429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S8PHrg4XjEfujkT1575VWw1Fek905U7Rjg8vUvSE8U=;
        b=DOzPfqhatrjZa/g/0fwwkgiDbU4GKaHviys4I5ir/lJU37MvPJB4AsH+iGkq5AoU9x
         76A1D+npRUVeFOW5xSpqj3mFv4y8UdtOUTCpuv6mf30t7trxi7RmKexm/sIttlLGAiNY
         VeUj4sidgg+1iz9X0KB73qOZ/6/Csi+RawNf7hN6+4OTTEwCJRMpkARW0uXSpCrX9dM7
         aMjzjELRupuKft8JUXBcOcCynbicfd7uTUmXgHoMLRRrsKbTZu4CxmB+C2QxJznUxT05
         6rIPeaPqUy6+Kn+3u4ztXG66Clb2ZDh4z7J06WrGhPLABbDzAOsf8XHmNV66BPm05s0y
         zjcA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Cy+DHpvOIO/XC4qAKwW1JFO9bPhHRKgo5HUoN4wYHQvagZk9wpgyIMiwq11CjgZdDHUbb/+sWlY98awa@vger.kernel.org, AJvYcCVtpQh6wxiTWiECXAQg4GFvnoxpkGoNNYskWqIOQ18lyWFhvcQ3EW3lSUCq1yfF9MwBPrfIupr7Ecq3@vger.kernel.org, AJvYcCXoAJSSM7pE6VuD1zn7ztJMf+QiWahAE+hhtT+I3OmZq1Xs5xZ8wQiyWllH38uFQ616DIeHcA4RYt/iwLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQnPVCbO7lzW97+I9Jdff1NkH6ZhONZbnC3TafI9RVyTjBmzd
	fmv4ZJVsjkBkYM825zds33JR6a+WLYAtog+fMOHUXqtdOTuV/JCAPZ2f
X-Gm-Gg: ASbGnctZQ4ypcumodE0buoo6eegdISFZqDJHeBm1lWQFNEpioCZehfWM0wye4vNLPR9
	dbN4wt0uiUoN2E/9gEZ5Ou2ISsWEXp6i6tV33FJgU+vm2ezB3G7qmz4mP9/s83Sn1H67yqAzSCL
	19iLpkvwE91BZKgbkFmERAmYrqTSVlGoJynjF7Jl6/3JYbDWSM5rnFYnAEMV6JiW+w9tg64lVdw
	Ytp8Z5TaBDbOYKw7q2bm7vPw5NTnzefdhA7U4CMu36ada/9VRwuQUTSv1mxgHVhq4svhRzLBulD
	e+QsiVKgwiv/LNkThzQCcZSg98ON+XwBdNMXhPhceVTka6tcCyidMlHuZChbCtw1WwwMEOLW36l
	/9uCkSyKvlmL7s4Gn+73R5dYtHDNuPPPW4BfARfuuVM3MJq/L
X-Google-Smtp-Source: AGHT+IGV2tevVvnQ6RCHD0iJmFj1JTxfJOLQ/4g1Cwf7cPMViMXWr9d2Vxgox5m5bmrvt0G7XLIM4Q==
X-Received: by 2002:a05:600c:3504:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-453248d3739mr29788245e9.25.1749654628570;
        Wed, 11 Jun 2025 08:10:28 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ad0c4sm15684910f8f.30.2025.06.11.08.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:10:27 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:10:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <c3un5kjfepprcjddchqmecik27huepuxejs6vckuqb3dshrcba@s2jcf23au62n>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
 <00f678ae-0b66-403c-bd53-6090e5920b1a@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eounn7ro2a5wiyxy"
Content-Disposition: inline
In-Reply-To: <00f678ae-0b66-403c-bd53-6090e5920b1a@tecnico.ulisboa.pt>


--eounn7ro2a5wiyxy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 01:04:14PM +0100, Diogo Ivo wrote:
>=20
>=20
> On 6/10/25 10:05 AM, Thierry Reding wrote:
> > On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
> > > Hello,
> > >=20
> > > This series adds support for the NVJPG hardware accelerator found in =
the
> > > Tegra210 SoC.
> > >=20
> > > The kernel driver is essentially a copy of the NVDEC driver as both
> > > engines are Falcon-based.
> > >=20
> > > For the userspace part I have written a Mesa Gallium backend [1] that,
> > > while still very much experimental, works in decoding images with VA-=
API.
> > >=20
> > > I have been using ffmpeg to call VA-API with the following command:
> > >=20
> > > ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 =
-i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
> > >=20
> > > which decodes <input.jpg> and shows the result in the framebuffer.
> > >=20
> > > The firmware for the engine can be obtained from a Linux for Tegra
> > > distribution.
> >=20
> > By the way, have you tried running this on anything newer than Tegra210?
> > Given your progress on this, we can probably start thinking about
> > submitting the binaries to linux-firmware.
>=20
> Since I don't have access to other Tegra platforms I haven't been able
> to test this driver there. For this I need help from someone with access
> to more hardware, I can send a version that just adds the extra compatibl=
es
> and we could see if it works.
>=20
> As for the firmwares that would be great!

I think both of these are things that Mikko and I can help with.

> > > Due to the way the Gallium implementation works for Tegra
> > > the GPU also needs to be enabled.
> >=20
> > I wonder if maybe we can get rid of this requirement. While it's
> > certainly nice to have the GPU enabled, there may be cases where using
> > only the other engines may be advantageous. Originally when I had worked
> > on VIC, I was looking at how it could be used for compositing without
> > getting the GPU involved. That's something that Android devices tend(ed)
> > to do because of the power savings that come with it.
>=20
> Yes I think this is possible to do, it mainly has involves properly
> handling the Gallium driver initialization. I'll take a look at it
> before submitting the MR for the Gallium driver.

Okay, great. But I think it's definitely something that we can defer if
it's non-trivial.

Thierry

--eounn7ro2a5wiyxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJnGEACgkQ3SOs138+
s6F92Q//f6SU6icZGjpZAWYgaEic9DvE0zJTrIzfnl6VwUmSUi/tSCoe374MyNK/
3onpN91p6PgcJbZgg93wbSc2hSgThPrn3Wxr6xVaAaCbEQ2cP3bzNTCI/q+oFrQn
FaqjgYpSO0rSzqtTlanIqpPWJ6NEBvb411fmCycBR8sreSMGqDmyvZBgzRVhLWAb
Pc93qJMc+fp3VjJ/M5tr0ffv7DimWH2f+9RyR7ydoYNZYvv+bHlcA03qNvkJZCPM
ssDQ2pOwB7Ubg0GarzpNHdpoyeh+LfxViRowTvCtbeB+wFjeZyINSO2a6c1wYzzp
rnov9B+i9akVFGZaHLkADP6FlNS6LQelzklja4Je9DPmptrtYQXFdQ+MawtH9slk
ZTm8gSpA09Jq6HdNL6J9+pCRvxlVibGf7n7acD52dFAhEx779Si+8fuNMd3KQ8/O
1+pYSGJEij/ZSuvwIEae/XNlkmXJhmDZ1vIek1bA8/JeYI7h0UmKy/x8lKsH8bz0
J6RJehIvilKS5D9J8dTp3B9Xh6p2cfx3NWX9Pwzn+4SUbQ5pWnweoT3jErTpuJmM
RwEzn2QCmsEGj32bn0v0iPj5IRlhGwlR/9SO8kZuRY0mf0AMRRS7O47wtfvbI3y8
fxsJpInNhbqBw2tPhgHb/fDt+pjd7uS2NprQtm8IldzR7o4JpWc=
=kiwA
-----END PGP SIGNATURE-----

--eounn7ro2a5wiyxy--
