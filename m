Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA7B198A08;
	Wed, 11 Jun 2025 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654798; cv=none; b=ARKY9bKmdxxkJF01balYeIVrd3e6C2s/d449mOUaVbL/RSjO74WBiurMoFKOI7s1ktd2J8PsdRArnrU/kijeRb5B0j1D/GPNRL/O3vGRLvrE5pfL3ah6nug8vyUe0iPah63652DiwlqmFhC8iH44+vMMXz1a/HguZ7isvtwTM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654798; c=relaxed/simple;
	bh=Owll6wTl1nxKA1/2Yq0amadzkuQR4ZDoqCMlkITuy9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTp0w0hst4Mv14vlfa5ek94w8M6ekcwf25/BWtkeiPHNEXKk6Fv8t3haTNX5jcmRcuvWLstUhXqJ2UykBfYtY/pswhHrvt8YFKUFDNjDvKUaiUAnU1pawmaRpWter2ohKXsfzHTwgqj+YBG3PrK1McMjg3mMAaT9nlgUXZIiMVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFxYXEgV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFxYXEgV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45024721cbdso58511765e9.2;
        Wed, 11 Jun 2025 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749654795; x=1750259595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw0ROdeFkh9FWMHJ/DqYZHwPq7uqPvziD7anVpTSv94=;
        b=gFxYXEgVTMH3Jo10Ll3hSKyniJB53N7A0nAGgO+RPuRmic3Ro00a0x6e6WDrwbdihi
         /gh7nhf7WNXyYHWacFKAFbgQsvLLIQOBtgGtSsONRKzvjSDJ0QRi+8CFEXj83kgZq6hN
         hB+KZfpbdI1FiSPPGlnc3+56txZ+OtT0o3+/BsC5QlN2fIILTnc3EZBWWBlt6aRlqXE5
         vI+TvgQ5QN7hcDRxcv36Ba3yWnfaiKueTwZpGu0VFS0LkCpcdWoUoVk9NYHZSf1p/Y3+
         wO2fqIm/NfMh577HzWjP1lsyI/mMPqqtFBP5Pdzzjg2Rtza5EnmI+phWeexcu76sA6tw
         q/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654795; x=1750259595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw0ROdeFkh9FWMHJ/DqYZHwPq7uqPvziD7anVpTSv94=;
        b=dRRylT1uoEzfirS4A4Bb1DhIX047+YR1km4U5+TZwGxDDr4NXFYPqgmWSQ6nc9oo4h
         Vnj2xSfg+mubnVFIfUOu6aCTckCBL85LrykV2kAWGeJJ+pJ1UwW59suvh8ri+bABUFYO
         /PqgcIG91S2Yqwtmn60ukEi5smliL/sJ+YLYBKbRql7GE2hvpnG0Jx4CFJuEAXKsWX8w
         j8qALDnVFY2MMtLTJxO6I5KgmWfbrK7KZOyBXihD4Ng4/TpjOUxtGgNKDee9qUkLQz33
         CyG27ukPeIE9ruJnZ4HVmXqyBp6Nt0Wg0woZ8Ai8uamJPqjw8NgDOEzFZ0S//c5XrCSO
         CY/g==
X-Forwarded-Encrypted: i=1; AJvYcCXlTvLMHWLFXUxyrnjyjSwFFT1xxIbTmRg4ysGAjG1CkmFS2E3QNWK+HLOsNdvhqqJx3et/1n5o3CSNFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydA10UhBTGu8kK/rb/dzDix6GjsnETnPbVzpGlViZWiHNeyCIg
	qz0OUTG/GdwI/1gnnTSFIj16+ojQFqt6PJVXJOMPwlcYwj9WOjNpAOnq
X-Gm-Gg: ASbGncslSkfQYGgHhQHfqlUfkesL3fg1pZboD/i0dIvvPx0S/s9Qk9+LbMdk2liUb7v
	IhVuG9b8Fu8HstgVpKtBRxjY+neFURY3h/tfdQuYUCscva/ZbPnaxoj/GJvQwRcp+0I3HHIP1hD
	y5P9knQ/vgD5gIfZHWxeNicv53KDtFecvS9CSWdVrF1cMoOGJvGtBXmJpfx9TyBiZnFaOlo5Vdu
	jlFcF1/VveZ4pFTPdKPOWuXm5/aLbeL5QS/1UrvRziYePXc8+Snl7cHoJPFOirg0hz7WsiUN/im
	4z6Ik7k8GwA0TWBgQbIbLaQTZ63nBQTvY/f2COxWpIxSyiU5xbqAGvhIp4uIu/nGLr3/FHX2gSx
	B+7Hv1zxLs/Ots2nQyw1XNIcaNYcdbpf36oPyBf36tA8W6das
X-Google-Smtp-Source: AGHT+IEDVsHtC1GbgmVXkrBhi7qP89VRSAHqsPRw+3TK8NgfPIpRXp3HCwEkAPPqvPVqYIRwks0NVw==
X-Received: by 2002:a05:600c:3b1a:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-453248cfda0mr30513625e9.28.1749654794417;
        Wed, 11 Jun 2025 08:13:14 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325171412sm23865525e9.17.2025.06.11.08.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:13:12 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:13:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc: Use dev_fwnode()
Message-ID: <nrukbxvov3vgyqtanxqldtnovzhhijpzamxhj3bqrouqbx3tlf@3stf2h62h56d>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vwrysg6fi76oazm"
Content-Disposition: inline
In-Reply-To: <20250611104348.192092-19-jirislaby@kernel.org>


--6vwrysg6fi76oazm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc: Use dev_fwnode()
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 12:43:47PM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>=20
> So use the dev_fwnode() helper.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
>=20
> ---
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/soc/fsl/qe/qe_ic.c | 3 +--
>  drivers/soc/tegra/pmc.c    | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Nice.

Acked-by: Thierry Reding <treding@nvidia.com>

--6vwrysg6fi76oazm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJnQYACgkQ3SOs138+
s6EVqhAAwl9x/C2bZ95K26Ya7KjGd12r+UguN2KE+Ox5oVvGiXJqH01jlbLNQQNd
e2dWs7Ab/Pm6GDWPizV/3GDmtAjl/VTosIk68fHIfgn+lbOuPCIbF1357hby0EoG
EsiZkTH37DPAHssGvu8HQvc2dcdrIAY0l8CMDF/02q0rEudONhfR2IdYuUrdQ+2s
nTXWdU3WyJhznnB+a0RZMZTjqzR8uac7xkAJxoflrCBBfVlJqibqzFqqkjQihAQC
P+/YoQ6k5S+E2PHm4hpSsYKlgT++RKWIhiWM/TfWdwRqUv8FRQVdGzfh/NrnVJB3
2/QClOh5C5d+V5NOJPsuZLt/aJNoAcOaHcEP10hxmM4uR7cyKMz6mcB5mxVQ/+eJ
EQLIhUPtBQQjUO9438neInn5zIv3ASFpLodyMuZQHGuHbD/kcifBX1sPqrFa21yC
ifK20ep2CQugVVWYR7oYtcylFXLdWtjag46oGtMikG7ym4t/5mEeNhhuh9FmiJ1w
uYS0ei+jnJSb6fQsmwlZyxvpqBS0XIakoHL+/ZTA/UVMwUenRcQ+mJGI83k6m1IR
ajr1OdeB9FR2D95Tmi3WlQFsiO/vhi0D0Hg4leYelvUtwrN0y0PCuqJbF6A4lUNi
i+n2VZDdEsaQSWTwn6S4FRhScCYlb3AALXE43F+jTwR6xbEIXQc=
=w/HU
-----END PGP SIGNATURE-----

--6vwrysg6fi76oazm--
