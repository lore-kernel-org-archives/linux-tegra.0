Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B331B3B08;
	Thu, 29 Aug 2024 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946625; cv=none; b=R0bjRwH7WtbZquhkGIuhaYY8jFoZmo+uq5Tq8N0G1bVQeYwPNJ4mqjFEnSlxvXkJfMn4pIw4aPeXhNQaaH/jToADPSkHpRWDv9OJezpDqIgvDjtBeWi7iK8EUsTV48uK8yyBovhoOCPFxyTy3DV9XplW2qpZEUxJI4FTCQEb4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946625; c=relaxed/simple;
	bh=rJ1E1FSn9EnVE2v1a7jxMaJli1rgUUJqDUz/uJFASzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bell4FhJpZdC4pinHJFlUUn7O+92+f4QW0cleqZ3ajoSebgIlqKliB9gdVetKmnJ6COlbtZQvqMB2FYi2hyLhzf4u3EMb/0vyKo+4PCmGlbf/WwXRf3Gw2XjB9VHRh7qCsVYVerox7Hvz4Ni7c6wsBhaxEHTdFWYp0H8wREwRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEERQ3TB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEERQ3TB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3718706cf8aso523373f8f.3;
        Thu, 29 Aug 2024 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724946622; x=1725551422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJ1E1FSn9EnVE2v1a7jxMaJli1rgUUJqDUz/uJFASzk=;
        b=ZEERQ3TBYHlBY35Xt5aO0MzDOWnJPNDRkwxPafp+fSKDYeREJ5TPfgachm0wUqJVER
         ppGkODxAHGN0OSKxmYad3mwBJ7Tumigt4oeATp8qFRQDfCyxLbmFnM5gdIY629OFhi8S
         d7WW4nnDoTo+a04F63mG1uRl/DqjyxDgxnCfjnUGZ6y2Q7DKiYH91/gmgP3dzx2R4Q00
         Ry52vjsGsoKQCO5HnAlO/fhOBKLesfvZ8SB+msG/ozkf/gGgbq/GaXu+8jmuicmqUepG
         hjpEfCv9wU5RhxD5D6YX7CGvLGhVq+HnuS1TTxxDP5hFzND7bOgamzTBBy1DWmHlq5v9
         fR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946622; x=1725551422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ1E1FSn9EnVE2v1a7jxMaJli1rgUUJqDUz/uJFASzk=;
        b=LTUP1pVEi77w14hf58t+7qW8XhkjxBHww3p7LqE1UWIOXbmfCr23lbcJ6ybpPqxyGc
         l5c2X9K3gdEPFQQLWjvn+98sHw8cHDY8m3zPcq8PNnYmeJpS58/3WyM/BZ5BoOAbNazB
         7OmqhjhohrU4g/LPcuRC82RdQf7tus/VysqmqlnltJL52oDVefFqq1KocoviwIH3Ginz
         g1QJTQupR8U+z/QVp2pFYDx8li99JxDLIeiVqCW4HSBBQTgcHqabERhzTZKlbGp2uejy
         EwvP8uIF6WLt1YNu0lpOsBx6SKX+iUbwC0YeGAP/u9mSMxCMsE9WN0lwjjkVx8nckPmM
         G7og==
X-Forwarded-Encrypted: i=1; AJvYcCUOvj+wGiPveXvfO29XBcyfHaE9TJud84Tdf/h+CJhqiwpyHg2YOiVlRv637q/B7W+aX8/pG4WL2bfI4wiX@vger.kernel.org, AJvYcCVhxH8kyINJj0r82RGhKp2XrujxTXfOWQk9BfcKW5uwXp+fW1IFLs19sObNRT0UvpBRnW8GIPk7HhRdUlREXog=@vger.kernel.org, AJvYcCWffVnM2dipQseiMFhDNlihelmFZdE4uELjtYlrdJVOiUUCfXr+0V1iN1M4ibTKzlaarpsz+N0svVRXuPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywosx/ACv2o1aw3wUw5hO+q2w+02fvEl48dWU9C/2eyN+iJCVQQ
	UeI8YWw+JTkdjPokljuLgPkLoxNGC047lE5keymsh4ZDUj5g+uod
X-Google-Smtp-Source: AGHT+IHgyWOmnBMDml/2WKTJlzLj30pI0kYETJ0C99Zz7zJftAy4vldU6h2q941Ku1gU8wLUpksIgQ==
X-Received: by 2002:adf:e005:0:b0:367:9088:fecd with SMTP id ffacd0b85a97d-3749b52e4b2mr2618324f8f.7.1724946621184;
        Thu, 29 Aug 2024 08:50:21 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4abbesm1737641f8f.23.2024.08.29.08.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:50:20 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:50:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/tegra: hdmi: make read-only const array
 possible_nvram_sizes static
Message-ID: <a3itbzv4hhkbpa3lhe7w42qtyxwiuwdsdntemtzn25uj27skci@trg63xzeh3dp>
References: <20240822205047.642845-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ql3tpfeuhs46rjeh"
Content-Disposition: inline
In-Reply-To: <20240822205047.642845-1-colin.i.king@gmail.com>


--ql3tpfeuhs46rjeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 09:50:47PM GMT, Colin Ian King wrote:
> Don't populate the const read-only array possible_nvram_sizes on the

I've changed this (and the occurrence in the subject) to reflect the
actual array name ("freqs") that's being changed here.

Applied, thanks.

Thierry

--ql3tpfeuhs46rjeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQmLsACgkQ3SOs138+
s6HAGRAAmGbYekDkE+fSbWHiAQEEEopvqtwfi9pf3qQhWrAvTkWHJ+f84L0f97+X
ZDp2Xvbycz6a5d5XP7OQr8yVRFXw7IQ54dG4tHSi3GkOF4aJt1PxXFAQG9tmxNKf
b4Vog6rC5eqi6v2S5GvmBhoXVaiUNIhSlIf5g9S+WfY/JnbdIvDQuOfH391oiQVz
3+ZfpT5Z8BFaiPxJSNv6OeVt98mudHfonN0WrhIWT25gchR5P0+EQjeXfd07f3a5
LGxa21LsVoObmD8s614dVO5zGcWdrszWisAmT+uJplHBMYjxXPEX2U6cfyLHFoR3
Z3RSky6J3IHfoygAsFjR6BI5yujN65oMx/DydwoNUpO0Uh5zqEi4IrBANYWMtiJw
wV4d6ExLkLlPMYCxcENGsStaxy7MkPYFv23desCq97RGiqn5gsS05bU4VmDxpvnF
WRCwmX7vqBrJB9cIotcywXvXS8Wouc6WMLh/qQ7J8nonPO3QNLRypt85oMpzEOLZ
kSjxidNri97ooAcQDOL1BKpcsf9C+X0EESQ7HU1cDOM3Q26pe4fsqLlRK6lAeozD
Ex+g1S499nkWtVAqK+Ace2MqqcJWeQPaAmJ+gXVL9OebQSyPihRQyR7qR6+BCBQq
k6p7S4BIqDgxRcmuWzCq52UtYgRYW6ZIC4NQOzr+DaZWoD2QhRk=
=Ba83
-----END PGP SIGNATURE-----

--ql3tpfeuhs46rjeh--
