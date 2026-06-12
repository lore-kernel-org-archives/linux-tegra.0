Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866583A963D;
	Fri, 12 Jun 2026 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281048; cv=none; b=HgA8yPR1hN8uiPMDsxpDYQ57/eKpu5EW277pTMD14xHagVKh/Ch0R4eGYCRd2nFOqpduZcYr+htoT6H6VLLYW/fQvA2+K11kssa54wvRKdVze5eEtypfnahpQC/faoWMTz3h6+XSTtulAsT1R8JTB/Wyp+HyNLoyN86CJVIKeDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281048; c=relaxed/simple;
	bh=OWWbZyIFi19j+EWcZCzS4VusckZ01Z7f+4v5sT4JcJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYGNKUZg5ibVdzp6EVao2PF9Wd+k1Po+lr988qa9oqTZQRmP8+yGepFiRoSX8VsC6HQvMGJOY3EOL6IEVgNMpTIq+YI+ytmr/btkLvTFhhPGHkXGbT2PL+mzmyKkf96YP1sx0UVGK7IcEMT1cC1eQAOnUNaepyODEbM0Xzpi0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NV7E1ihB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NV7E1ihB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D731F000E9;
	Fri, 12 Jun 2026 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281047;
	bh=OWWbZyIFi19j+EWcZCzS4VusckZ01Z7f+4v5sT4JcJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NV7E1ihBEgQoUF0VMyMDi2wAShusL7TC1KCRP0r4jcUX/F5/9WSt/uiaeRDSeVvDB
	 dvY2nOIbWPeWDgTZ+HWN7uhWEYopFVZzguW3Xr0HXNryg1o/vNl8nxqhajKVLau+B4
	 UT1WrNW4G7e5XvJYBkBlja85oHNAgeHLaU2JIkVF46RGcd/cdiooi6kHWzgIt9rR99
	 FsH8dHAfa5oOItPyCNUqroBEla3CtNYmClXujG+vZnwFUkrEp7ZVC6PXVP3eSbcnkv
	 IFFnapDmXg3gw059fJB0xiM+anU4vfkZJwz02NNlbUBjOCbL1biKelP0vC7gZQHqhl
	 jJ6nKdvnsikZw==
Date: Fri, 12 Jun 2026 17:17:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: display: tegra: Add Tegra264 compatible
 for VIC
Message-ID: <20260612-ascend-bonsai-d330bcda91b7@spud>
References: <20260612-t264-host1x-v1-0-8d934987de67@nvidia.com>
 <20260612-t264-host1x-v1-2-8d934987de67@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o0OMdNtSGtGTVJju"
Content-Disposition: inline
In-Reply-To: <20260612-t264-host1x-v1-2-8d934987de67@nvidia.com>


--o0OMdNtSGtGTVJju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--o0OMdNtSGtGTVJju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiwxEgAKCRB4tDGHoIJi
0v83APwMmQtkExjlV1rXRIJAdC8veFtoH4XlazZaj20VnWSx1AEA1HO1dn5W3+Fn
I6+TW43YwKhtZHoR7HaENzMU53R8OQw=
=r/jw
-----END PGP SIGNATURE-----

--o0OMdNtSGtGTVJju--
