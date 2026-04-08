Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C002325483;
	Wed,  8 Apr 2026 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670548; cv=none; b=PIh+3KmpMimnTguTUUVlXwNsyxmW09DHOnK9DV58Nr2kmcRzEUMZ0lGzEi/cuPA9411aMTxQUlsCJyxJzJPsRozbmvCKGm73zmfPFnqP9MfxxPAWwGnaIhYnrvkozIq8FDDVVwU2rMte+kg17R9z4xRybAjwQ/1BTldCbjovmBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670548; c=relaxed/simple;
	bh=y1C9sKBLh0BII3lAyxD7NZdAehWq9IGiHty9aFRmQPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l95G06sOEgcvS77DdOkIkZquEVEbB5pMUxaXzepRRYLSVrIZ737pJdwq1TOWw+4fp2nEGmAXpcChLwAavcZs3wEM4/zYNC8kUZvsiZ44nbKj6VC3+iqDzAj9lBALJgqcucCHsItJKoOnpDO5haVDEi8772ovCM9PhrGoXWATEBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTFsSHeh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTFsSHeh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF30C19421;
	Wed,  8 Apr 2026 17:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775670547;
	bh=y1C9sKBLh0BII3lAyxD7NZdAehWq9IGiHty9aFRmQPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTFsSHehJ58HylEyauB69ZEjKqXYOwRvVTt3PI0vAWSeYS3xwPBQjcfZLSLmuecm+
	 n5hsMrMg5wyX6lMg+yc3WFcStuPcS6kHeNHakuDTzbm7J+c5I60EkZ3iPpSxPAscBH
	 J0nHcJGIu59EekzcRRP5hICOIwnLRUlBJbeWRYP5QEUFk3xbOLxC25rx4Eeie+lGeY
	 ZwIkVCoT2EeuvgjOCUxyzJ/uWw/+VNbuTNSmqmxyasQPvckZWVoq+kvVglCn/CBrzy
	 hXYuI9Nwr6n1DuJ/4/YQAmrrynj0c/0EuictKvylGuvNKbtfkYjZ+GJmP+pQo228ct
	 WIcJ+vGKL57dQ==
Date: Wed, 8 Apr 2026 18:49:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Sheetal <sheetal@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: tegra210_amx: simplify byte map get/put
 logic
Message-ID: <dd64b4f3-ebb4-4299-9d92-78576619b285@sirena.org.uk>
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com>
 <20260408170818.70322-3-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="50lXXv5LztKTvnyt"
Content-Disposition: inline
In-Reply-To: <20260408170818.70322-3-piyushpatle228@gmail.com>
X-Cookie: Often things ARE as bad as they seem!


--50lXXv5LztKTvnyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2026 at 10:38:18PM +0530, Piyush Patle wrote:
> The byte-map controls ("Byte Map N") already expose a value range of
> [0, 256] to userspace via SOC_SINGLE_EXT(), where 256 is the

Similar issues in this one.

--50lXXv5LztKTvnyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWlQ4ACgkQJNaLcl1U
h9Bz2Af/Wo8f8G/a2TXQrCYM1lD9Q40bU6oZ9dmxF+OPytDm6mvBE4lxcqcmPhiW
UVwXaDVb8s0pJsDNz7nZBFq6PQ6phAE15RA4R3xiMsl1pTzknwmOG/HGNlR4D6BW
g48KkSvTFlNG06Dbv0QJ4PY/QQcxwHkHpYpuTmu0fj6+2Q0U2/l7O9z4nVIT9F0z
ioNYRg/mGVa0IeGlfMJY5uwsoJMCacIZNfoQtNI1SOHMPvup6M0jAkbRwBDH3AlE
wtWG4JPtrRhztY9xm37hF7MhrWZNm5RxNrStb1s17sDvj4FfOwIq2UD/QfOjNgUG
Y05MEFshdfj4gjnwHb3pMHGjL/xeFg==
=/Kbw
-----END PGP SIGNATURE-----

--50lXXv5LztKTvnyt--
