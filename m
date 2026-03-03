Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627872459C6;
	Tue,  3 Mar 2026 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772564845; cv=none; b=WQi91dggM48RwDgHI4tJ5v0rJGAEr68bpBnKG7anPQPIJUvZdBo9cnKvunLuSrO/GvPqcUj0D6gEyhL2PEzysFs2eihoWW+Qvy0Srxo8XOlx/QABqUrmjN21liA1W4hUWJQv9kZpWjOwMjSPbZ1MautWIqdaE8MhrFWpM5W+/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772564845; c=relaxed/simple;
	bh=5ULvDVEqgQGDwaFAFPW0DuAG2LRnxp0XDjYdD4epkNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2iLMQwDUrQRNQAudDLSVrWe3IFHZ4Ef+FgPOkV8o+G31I2Oqd+AGf6Wgv+Hba02MdpwAzcspjqVKauh90NpxxGv48ypubX84R9BCdpJ94sTLbUyS8QJB3bEAFs+jb5bPItBp751VlArs1Jv0TkHPSFWgWkSoWGB7L8VNKqSOO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYVUjjYM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYVUjjYM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06798C116C6;
	Tue,  3 Mar 2026 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772564845;
	bh=5ULvDVEqgQGDwaFAFPW0DuAG2LRnxp0XDjYdD4epkNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYVUjjYM/FE2OyByy7fL8C43KXl9P3XqyhTKqyFWsmfpsvLtQvqQXT0wJJI2+lmd1
	 l+DXdzLI9RjQq4a24fDGWLk/nLqUbDAtnjbdyHCrHIZdJa/fyFgvZPytsj1U1kaukf
	 DufWxPcUnScPGAB6XcxIh5G2QuWx5lQ3Y3v15b13rXGXiY7jnQafgMaN95NXh6PZXg
	 /igaRvr7xwuoMYkX9cWyyHN4//w0SlAK1u7douHjItpFBMHC/IKHHfNeiZlCMXGMT7
	 mwSLHT4fS+ehmXYwepq92ne/zc8D0kyd3idnedg6mthBwDrHo8CrmWrtNImuxkYJKS
	 3K1ujQ0kbwo/Q==
Date: Tue, 3 Mar 2026 19:07:19 +0000
From: Conor Dooley <conor@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan kumar <mkumard@nvidia.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: tegra: Add compatible for
 Tegra238 sound card
Message-ID: <20260303-frighten-landmark-f345560d25d0@spud>
References: <20260303100249.3214529-1-sheetal@nvidia.com>
 <20260303100249.3214529-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eQybRr4RlYSyFv0W"
Content-Disposition: inline
In-Reply-To: <20260303100249.3214529-2-sheetal@nvidia.com>


--eQybRr4RlYSyFv0W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eQybRr4RlYSyFv0W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaacxZwAKCRB4tDGHoIJi
0nSbAQDT+UeupT7k5wMwJ7XmCVbs82Xikdgb8oY2XbPYEUbB3gD8DgUshC9QIAz3
7yK4Y4R7JwMrcvRlN5gCz+O+x2OImQw=
=bgj3
-----END PGP SIGNATURE-----

--eQybRr4RlYSyFv0W--
