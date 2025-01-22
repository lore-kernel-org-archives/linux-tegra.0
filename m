Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423A214229
	for <linux-tegra@vger.kernel.org>; Wed, 22 Jan 2025 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737561179; cv=none; b=d8tzpbu5gSCjnUEk84Hg66UP9SqyMakV1xU0/RVP3FVIIvYaowSwLhohtPdFFRTwshYqjgmwq9qMMV57iI6sJgYxt9ZlS/7s4WOpjvFlEGqaluo4DUIIMJgU20cIWfN+geMo91F+1VQPKlKS9gQWf2QDYRAIpwoGa2rLmp7ZsHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737561179; c=relaxed/simple;
	bh=MRLo2a6PUd9ElrLQhf7o5WXOfmmmOz5ITTU1mCg2mjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFUF3DlWJWqxH2N4fwHW+ybgkeRoc8WZDWztWuLuDcLuxSYv/ScKGUczPhCGbeKCUCWYE+0PlFJhpwIbuCcypWNwdykNHPyuR8NSBgYr+SlbZplIW0ceGMPuFG6W+RJmb9X9bpNyZAdnQb7ucHwOiayD2bFyejk0xqA5C3TOofA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLnKEzjH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLnKEzjH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361f796586so78213465e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jan 2025 07:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737561176; x=1738165976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRLo2a6PUd9ElrLQhf7o5WXOfmmmOz5ITTU1mCg2mjU=;
        b=YLnKEzjHTRWfeJTJthdxipXaXlVScUJvFWNg+14wD9xxcUhe7gLaazy9SuXnbF7oyH
         qyMJyzGIWjg3q48kGMixokC+GfjP1MnA7bHqMfEV9iljM7EigWxsLoCqlMSmOUgxjbcq
         I3Ut6hU8qhhyZ3VjOCvGHWzURHbjEJ0p+UwapuvCs1x5vhO4PQ9BkAFIynDG1sT0NwRI
         s7dfjFjgctuWRYHOkas7sR/zYlh0qd6uI3mXyFTg6YTlhQ4Mx6I8AGrorWqTgmgnK0QG
         ILKUPichJS8yb4QaZt333Ig1WZcyk7QsIUAXUiSFBmBrBy7BCvrs6LMPzMksqcuscDrU
         XKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737561176; x=1738165976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRLo2a6PUd9ElrLQhf7o5WXOfmmmOz5ITTU1mCg2mjU=;
        b=bv+1uPftBTdexGsGSKp/+QFiJxaUNEXp6Ry+pZXnPOeoX9dnXOvoF0OeP/iT9MUZsG
         p8PBsyXF0MGx/3mGGz7YxpzAFrxxe5XE7uhKubD3s7Lj58JeNQDTcKdvfgL33o+lm2xH
         btbuFV4xRQVhIQmPysURV7/W4/nuOiYYdirLECuTCM2FCbEZAQ9B1ufshVOJHcZZXR7I
         +GMzRKdcUg6mA/JwVAOlu5zUw02KdaX7dTnoKOsOncT+q9mP9V9KQ/GFGTf18gqbQqOS
         lZIVhzC4yodWrAoYdTRgMXwW9DXHvEol+d0TMKwJKwPdaPaZofOomg56DfCU0YamfluJ
         4WQA==
X-Gm-Message-State: AOJu0Yximbzp+J6QHEP9qG4lFjegAkaUK29pejLQ1BHhjGBTpAgWMuAM
	f7WHcFg6PvMeyWV+opwimcFE61QQC+cTIn4xPNXQaxt4yJAG7UOxfWs7Og==
X-Gm-Gg: ASbGncv56gYXY297RoXxrwT/ug5FnPgTwFoP0ILEzuCpVkA60qNE7OAnMpxNuiAYfle
	sqYfhVDFMj9sOBP61Ze8Hx7i+jho8N6Txl6W2Lv/pIWGIPb7CgUlUASEQPOaiGwrX04hPGYdGj0
	yfTFcaPgGWDP/+WMXOeUsFDbujKdgNGkhVEukcesEnLGqB+NFqk9NIgFdxF/TJk8kyGfREAPc8F
	Fj2g0zfS8FJWa3kUJAATC3K/+BBPorxL7o3GdsiO1Es9XSKwgAXAPp3s8QHnxkDYH0/PmmOwiPA
	RYEnZRt0PsU33YND4j8LMURLpUuG9cORVPRp/0aMn2M7jbYNoe2iqDz0
X-Google-Smtp-Source: AGHT+IEjEGDORdKEIF0lRwyO+cOp5dpd0m3c8kEKTPeDFzfD++IRjR/NwGtn/vwPyCW0ejAjqKW0dg==
X-Received: by 2002:a05:600c:348c:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-438912d7c1bmr235519805e9.0.1737561175645;
        Wed, 22 Jan 2025 07:52:55 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31a0f3csm30437845e9.9.2025.01.22.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:52:54 -0800 (PST)
Date: Wed, 22 Jan 2025 16:52:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [BUG] drm/tegra: T186 and T194 don't report a primary plane
Message-ID: <otcdf5ssdifpjptpdpqaf25orbj7cfgwybijstsgkf4hzimgkq@hpmxui3saqig>
References: <CALHNRZ-ocU5WWtLzePvUF=4jD45Xvfp0hHsD9AMRRitmyaQ_qA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6j2kl5ylymyfb2v5"
Content-Disposition: inline
In-Reply-To: <CALHNRZ-ocU5WWtLzePvUF=4jD45Xvfp0hHsD9AMRRitmyaQ_qA@mail.gmail.com>


--6j2kl5ylymyfb2v5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [BUG] drm/tegra: T186 and T194 don't report a primary plane
MIME-Version: 1.0

On Tue, Jan 21, 2025 at 10:05:03PM -0600, Aaron Kling wrote:
> A section of drm_hwcomposer [1] fails to find any primary planes on
> t186 and t194, while t124 and t210 work as intended. This was observed
> on the android common kernel 5.15, 6.1, and 6.6 compiled with clang.
> There have been no relevant changes between the stable kernel branches
> and the corresponding android forks in regards to tegra-drm.
>=20
> I traced the issue back to the shared planes creation and reported a
> suggested fix for this use case to the tegra-drm tracker on
> freedesktop [2], but did not receive any response so I'm opening the
> discussion here.
>=20
> I don't have a non-Android based test case to verify this issue. And
> am unsure if this is a general issue or one caused by the compiler
> setup required by aosp. Is this functionality verified by the
> regression testing setups?
>=20
> [1] https://gitlab.freedesktop.org/drm-hwcomposer/drm-hwcomposer/-/blob/b=
f13180ffc69446262af666bb8d3c32869572214/drm/DrmDisplayPipeline.cpp#L74
> [2] https://gitlab.freedesktop.org/drm/tegra/-/issues/3

Hi Aaron,

I missed the original report for some reason but I've now responded to
that issue you filed.

I don't have a personal preference for where to discuss things. gitlab
seems a nice place to help keep track of things, but email works for me
as well.

Thierry

--6j2kl5ylymyfb2v5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeRFFQACgkQ3SOs138+
s6GtBxAAnaoC6q8dI5OrT9CBbEFgMOCAWny0xWdaZnDDWa/MG1NrBHTK/BGM0m8i
xq9ztMOHkOOMooHlF94h33Yciv51edXdrSm6R35bNGYR5WCvQ3CF1l0oqPjsL1NM
EZ1qVzq1lcW4xOkCkZakQa649LGGMmmvkb5UYQmvFgo+wHnprUeP+yhSnQZ4g97H
gi1rtMwF1wdWH7XE5tW2MSFJb5WDJE15wEkXf1gqRTrpgqTwPfYzM7ykPTiYwysa
PnWQCxUb69dJBlBFY2mtf2rNKlzpGCXjgdM2ArOvX0cztDRphWW5hZ96g+Uo95lo
lDkrpKwir+ymqZIXfZZpZ4s5OBzKKjX4oxYI28BHjn9YQ06Smlo7vPM8ljz+vutT
qsCta5jkTze3OBESywRbMyy+uluelnuFZtB+jzDY0WFm3v2/NFBFQNoO8epcoRgL
pHSbb5E1gUsB2to+jYUZ8l7MozZ30N3p+su+QxbHodCJICiCLbuo3RkuVf5Nc8eC
lvhoUq+dmnuxNRg/dfx4feYiqiAfyv5eEV3Gb+UK2b5h1O0fsTyaclDxhQQemn5N
OaRg+m8vVgAn2d9mRUSCp+gRIPXzbWY/fHTRb0irFX8CyKRSbqbdUygEBp8gFKh+
0dohRpCC4Rk5wFGeO8qXc5pz1CVp1TkgCQBZvPgRVXVjeAsmnhk=
=B/U1
-----END PGP SIGNATURE-----

--6j2kl5ylymyfb2v5--
