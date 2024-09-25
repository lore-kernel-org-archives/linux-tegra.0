Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADACB84D3E;
	Wed, 25 Sep 2024 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727277987; cv=none; b=lZ4QhFdN3OYQ/YPfWBVvSRw75CATDnQ13OBcqys+96KfG3PnDoEqGqT5UuOfNVF5yZQ7ONl5GtAG/XhBT3Ovo80y9amP5MJh9qANGrbEEQWVZLd+dzLlR2oHBH2yG3C/0mEFiIqdn/q03hRLEXT8NoifrqHQCTdy7jE8ZHImLfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727277987; c=relaxed/simple;
	bh=qEG0K7cRPMsGhvUboE1KSLeaK8mPDj+86h7fo5KbQYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MA3aIcpLEyHgRirPMgercbaN8KKm3xNMnHy1Trf/LqMIK7cxdi1Q0i64KigtTiuQEwO47HRM1RkVusYaAjvsOG4QspjcngJST0WEkPWS2a7j2SdknZHd3nDVJk4ecFjsHMB5vtKrnNuxsui2XhUnNPILf8jmTWtFxXLHlfp3P+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZdVZTXM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZdVZTXM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37a413085cbso841893f8f.1;
        Wed, 25 Sep 2024 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727277984; x=1727882784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0WecV6bPhkREAXfXDOh9Dj7FHG/KlgaWT9HR1UJbw+4=;
        b=LZdVZTXM90GHuln9skunWMmxtBp2Ypr2QwOQVnpupfdAPwXGoQJNZ4RcJKD2w/ilPp
         mYzn0HaFzsA6E+kludzPpbeY/wd+DpXQOYVSH0kxmEeokKI1nm5DJKIqFqW6zrsNPeyU
         Nw7C2wzBSDdDqcwrHyp0sNgtuUUtYLcELw1pGWLGXC1zVRNEZFxi2bvGlSHp+WnvQyIQ
         3LzaRgJLPHJ9TR+eKHwe3cs71Zw4H67/P2dyGP891XWVTc21Mt+wv8gfJx89X1uVxIe+
         FN6s7fi1FsQTgDIeOHrnYsbWTptMs6EdwB+EX9QoUIS1vWsXCI2yOI39GgWfO4n3aBB6
         47Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277984; x=1727882784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WecV6bPhkREAXfXDOh9Dj7FHG/KlgaWT9HR1UJbw+4=;
        b=NzUlKvxVG7EQ+znV7LW8B/bv3XhW7SqlZ04Z/d24pfSbVoeElmulWYLeXT18TgcZuj
         OEXJWP2EwjQHSEVDQgEpv5DC/ETlQ4WO2WnDnzE0STXc3aS0P3OQUXXRqRt5pzxgkn5L
         MXaE05qmn6siCBDmbniTTbGUgSfa1PkFIAwtZjYKAl/YfG4SsXzW6WPr63hpAnVXK6yb
         ZOImGx4yLlSm4vfu5EWtXram6EEpaR7U3hPqIalbW4XOiOLy245euXfTopyw2SCUIY/V
         nzXhGkdimEonjEYb4lXvM5tT4CWkVHJU1jQYeFXF7tn/4Bfo3huMM5Oh3QJAg1Zv4gl8
         RjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNX3IHwOnRtcCl/GCPETpz8cj7QM/vDfXe9AHpVJjt3iuEj/A1wvgpROgM8UDGIoK+PeYFnjBEdRbv6r0=@vger.kernel.org, AJvYcCVi/RRbgyrSgx9nzZorXZrEURyxg7O6q3OYnE0kLFBnTiP1n3ZcfkZqPTuXLiB38BTrTIoImF6uu7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS327/tDw0CF1O5PQ7weeFDQyYUTKnPWrBvNrExAL1KwGOLNqN
	6047mR1eK083bm6bqZdFIO7gcWsqFSMNi8whFyNQkRXl1Eg/P+Ft
X-Google-Smtp-Source: AGHT+IHpFfawMkHKAG4rMiadAxaCEvc4Bj/4eGxqtpWGfZMy8ZdEP2B4rKRXZlUji0ozPBqTtJyqXA==
X-Received: by 2002:adf:f8c6:0:b0:37c:ccdf:b69b with SMTP id ffacd0b85a97d-37cccdfb7a3mr638423f8f.32.1727277983684;
        Wed, 25 Sep 2024 08:26:23 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2c2142sm4290615f8f.43.2024.09.25.08.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:26:23 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:26:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, 
	helpdesk@kernel.org
Subject: Re: Bouncing maintainer: Peter De Schrijver
Message-ID: <dee3wpp255qhhb7znfuqyarshhv6nueq6nsls2gikbzfscsmgc@6nrvnhgbvw44>
References: <20240924-dachshund-of-optimal-politeness-840d3f@lemur>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4z2p2jvh37gnjto4"
Content-Disposition: inline
In-Reply-To: <20240924-dachshund-of-optimal-politeness-840d3f@lemur>


--4z2p2jvh37gnjto4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 10:44:06AM GMT, Konstantin Ryabitsev wrote:
> Hello:
>=20
> I'm reaching out to co-maintainers of the following subsystems:
>=20
>   - TEGRA CLOCK DRIVER
>=20
> The email address for one of your maintainers is bouncing:
>=20
>   M: Peter De Schrijver <pdeschrijver@nvidia.com>
>=20
> There are several possible courses of action:
>=20
> 1. If you know the new email address for the maintainer, please ask them =
to
>    submit a patch for MAINTAINERS and .mailmap files.
>=20
> 2. If this maintainer stepped away from their duties, or if co-maintainer=
s are
>    equally unable to reach them via any other means, please submit a patc=
h to
>    MAINTAINERS to remove their M: entry.
>=20
> The goal is to have no bouncing M: entries in the maintainers file, so pl=
ease
> follow up as soon as you have decided on the correct course of action.

Hi Konstantin,

Prashant doesn't work on the clock driver anymore, so Jon and myself (as
the Tegra architecture maintainers) would be the fallback maintainers.
We have a regex that should catch this in the main Tegra entry, so one
option would be to drop the Tegra clock driver one.

Otherwise I can also send a patch replacing Prashant and Peter with Jon
and myself.

Do you have a preference?

Thierry

--4z2p2jvh37gnjto4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0K50ACgkQ3SOs138+
s6HU6A//crTi7kjrTD4qnJmaIzGI/oh8xFwOx+6By3dio1+rTmeAJIUO/8ePhVXf
JQZ2pUJRG3hzsK2n7maFRp8OtbuuKNw4ZvCkEX4eFhP2+Qs8hJXBUq+/mbBiZ2gY
9Wrb4Hnoi3wD6K7KvqNtMMQHJPg3rPnqBUhuyj4u6QCsTsUo3Qn/P+orrdbBendQ
FQ0gdTaRkOxLOcAp1OM5nZz/gpCgizu4JJs27lxNNIcYfbnQz0YFNRQgre+UlbI0
aUzs4r0zCXR1BKy4dcSfjAq9B7TT8jiaKAwqyGO/eG3F2CY+uysybBFnkh035DtH
c2sPRuB1gOSD28uwgMcKXVx0R6iBGolEWlb2Q+2iMYvvATOuajBOIK1Bp6HC+5RX
oNrI7m8Uu0ULv8eSqedGOvHGy/CrqyIivjtYFxzRxNONXRSkPP6f9PexX813BmU6
oIn1OqBIWetxQbCnqyIaM2POmvaK9hfS+CDSFBtB5IFqG+/dv3SfKp+ZPMef6fps
O45Dw0IOtklPRWMC0t5TBjGRmbey0r9GAwcztEKCW/dNuW3NdZykgP6RlOILO9g0
DWmGw3WPk+73v6uK2HEOye1hWo8lNQsXIHsaog5DqnSfGMFkkNe2zA5q2FdOVlXP
EZgkdiJCoAKLdsHoQZdonkUx2JJXYKqDo/JjU3NdpzQxxzMV6nM=
=isnH
-----END PGP SIGNATURE-----

--4z2p2jvh37gnjto4--
