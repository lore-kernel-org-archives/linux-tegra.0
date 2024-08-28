Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F87A1A4F0A;
	Wed, 28 Aug 2024 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857860; cv=none; b=f3TWC7veeWHx8TYQVVJYDt/IMdcx4pZbSWsCG5Zmg388j6qDTKHU2MMfkaSzIqNxA2sj+Vvq9lhXoKc3O8jv9d2QrJjDX9bE0qk1Dzc+YiHmupHVp/ThYLQtzlqUK+jS0AW82DUfXDFDWBKiszPG0nRvLWVqRTgqNhjjPIEXC/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857860; c=relaxed/simple;
	bh=GcaH7q63yKV8Jf1ACDAwyehcMWJCw79Jz4JUkDOV9oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkZqseCfqKD5/Eoc93euzX48WBxySR8zPTnzbTNWpklq96UVfi5E9UkUpGZ7x3vNC0Ph4FvKu36iPDlvTgMziofII+uKiyQZDqeRqCRYotdLERSY2xmuv0tBLx1jGOnCg627ndk2uhfb55KadqhyHNB9zNNFzm224pbfp227Kjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Npan8ghf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Npan8ghf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42ba9b47f4eso3321185e9.1;
        Wed, 28 Aug 2024 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724857857; x=1725462657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ/4ajvZzaDOMDTKRC7CbsivFxEl/NxmaV5flB3XzkI=;
        b=Npan8ghfsrCLCTiywBPvbK36vCbA3sFbIRbzoSXh0mJYjc49UnIRtpHbJ+wwErl2cu
         O3xNLON8h62d53rtnp8kDCv5gqIRO5riacLCi5G1RqAVivW3U3VeAeeUbBtw432iz6uL
         JcHWb6A50V50iMe58hp1z/Hn1pPn39qFGG5IYoDb/KP0RDXcvNbQTeoA/UeOsQoiXSFw
         VDnulrXSuqehUnvJ4AgZmJA9VsNN5WKs6hfvStsR5nQl5XPW0zkSD6c6zEpVbyp63y3D
         6HmSxZv1lG2jGC1Ui/z9BPJ2X3EcSyqsA5qcHAGa9BcatUhiA33Cz47gR7zZr7ySoBKS
         KgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724857857; x=1725462657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ/4ajvZzaDOMDTKRC7CbsivFxEl/NxmaV5flB3XzkI=;
        b=DJgpXEZeMNEHSc9d1iS8Q33LWfPRv2Z9HFXyMl7gQAgtYHUuxp8DzQkXUtQQj3A8+p
         jwT9eluktvw3ELgvsx9eQCrg5q8eE7H1ejS4FMZTywFgXsV92hKGQyroWtRohjSdaVf1
         X+4iYOniltCQJApqHhARfoTkeEaq3qcU2/p4FiL0rUROqcXtU0ZbZ8YILV2LstHWVZ7P
         EqOJVA4fBsxOP+9ivD5VlVPJ+fCfDvXv/e9+7XMbUwhEk9QOgKczU53F/UdW60xjHej0
         o/tjkKTYF6avXSiyaZIG1stovHNS3vH8x9dTRoikDTiPO2dwsGhUIeM1pnlUqxtr7F0s
         9oog==
X-Forwarded-Encrypted: i=1; AJvYcCUDrGnv1RdQ0HBGsHw85MvyJ1MrtxjkxY2alQ/h6QAVEU4HxCabXTzMt6SpQGpD4Gm18s6n0uaESvvFtQg=@vger.kernel.org, AJvYcCUxBO37w70IFqT75wVD+0C2gul0MtcYjU+eHyJiw04xCMKMXb2jzEnBnR7r/5FMCwqKlilMjTJQrBWYZVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzKzZUeVltK2yAOkADDjzqLiOYCIRs5J+G0m3Zvc70SCyM2ow4
	+mAmPsxqJw8FXsfztbBS2kEW9U4UvLWHrcB2+DXp26VEGdo7UZi1
X-Google-Smtp-Source: AGHT+IERe5eLdpwONj/vwyA+QSmJxF++N7sdszwss1qO4IhBV+DuW4oYJY8dtC/iq1N1kJGp7tf/lQ==
X-Received: by 2002:a05:600c:4fc8:b0:427:abfd:4432 with SMTP id 5b1f17b1804b1-42ba5708dd6mr15087395e9.12.1724857856974;
        Wed, 28 Aug 2024 08:10:56 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749b36a732sm36538f8f.113.2024.08.28.08.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 08:10:56 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:10:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch, 
	jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: hub: Use fn parameter directly to fix
 Coccinelle warning
Message-ID: <ddh6votnreuhbylvk5wsiclep5e6qkcrdf66h3fvhsgsampwqk@w4a3p6n325jn>
References: <20240710210034.796032-2-thorsten.blum@toblux.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pgr6eujdr52sieij"
Content-Disposition: inline
In-Reply-To: <20240710210034.796032-2-thorsten.blum@toblux.com>


--pgr6eujdr52sieij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 11:00:35PM GMT, Thorsten Blum wrote:
> The function parameter out can be used directly instead of assigning it
> to a temporary u64 variable first.
>=20
> Remove the local variable tmp2 and use the parameter out directly as the
> divisor in do_div() to remove the following Coccinelle/coccicheck
> warning reported by do_div.cocci:
>=20
>   WARNING: do_div() does a 64-by-32 division, please consider using div64=
_u64 instead
>=20
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  drivers/gpu/drm/tegra/hub.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--pgr6eujdr52sieij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbPPf8ACgkQ3SOs138+
s6HgvA//eOkCBC1C25PldBUYerxsYMFxP6AxLd7fnvfyMD8k5v8A3NQfIC+v8sTu
k6YZU6S9UCnbQyAEpsyKu+t1VtRx2O+5oTW8NbF+l6z528RUIPRqVgNTMlRgg0PW
nroHFg1myWGSdOkjOy5R8HaZGbXPx0Nbzlztg/l2gwRqqwvOfvg505o+M7X8X4SV
x2+Ahv5HuoqtRMG1euwXIjX1LMclQP2j7QH5as7GMqA+Bb0Ax8ji2ydR+ShBwc5D
IUdA2SjHulB8HIxWf6itG7Ex+fO0iemuhIzyCcTKeWz3+38GrhuSM/e1BkHWc3gM
T1lC10aagiNrGS7vsZ0JRfWclfuHVqbXsqJLMkaCtazW3/coWX4TQnpNF9AtFMgI
BtGVRsBSt04kDxJpQ0CZ0wQ7wSlGBpK2ew03GHqFXnOTHraA9uxApjh+wYbdsf1z
9Dvudn5tiaL3nmhzzPjEWdjs+QT6omlYOJfKZyfCmIGhAFoEgHb/LiJL+5M0mMOL
z37sDn3zGYUEFNEjXLs7BCpcuar6YumRcg4S/ffYJ3tfmRAwVn0ajNOw1wMtDXMG
aMeOj93BVKflap7gM0YdsN0LG7bRE97YvuGW3aN04JjhZw0onogIZ62Ic+xyCIeF
Rs3gAVVUnSVzWWHb5VfRJiju05fOMzQmEXzFAVWLUiDEqfjSzKo=
=0GlK
-----END PGP SIGNATURE-----

--pgr6eujdr52sieij--
