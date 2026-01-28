Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BF0371052;
	Wed, 28 Jan 2026 17:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622761; cv=none; b=g2N+0Ng+EvB4PF4gWa6dNw28uMX+09NKtFGohTx+PLQzSK0ujCa3K9LcboWHu0VjAKiq3Onx5GcBIy8uS14e7YJcu+RBMPndgXScJksmB7+HNgiQiY2kb8GwmlV50vot2O9KYg6j/baIqyTVUBykeCIn1lmctdQwMr5pmtw1/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622761; c=relaxed/simple;
	bh=XEQPsWyDHH4+HTG1WC0QDgQ9yyTXvngO0nYtQ+3Vjzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMT+wYMoIkiNTgFw5zru2iHMI17FNWmU/0IGCGi6DCuhnCSIOVQpPt8LtC6SI/QpUj4iBxyZA2M3vHkEJVislYuJ6DCCtfQ41ncD6C8BFMoI5q0IjEHQRMwQRmdL0PcYGb7rwjyzFPGpf/6pOXrKo6cJkQIeHBVCuQ4UXk3Hk7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+yfKC14; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+yfKC14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6577C4CEF1;
	Wed, 28 Jan 2026 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769622761;
	bh=XEQPsWyDHH4+HTG1WC0QDgQ9yyTXvngO0nYtQ+3Vjzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+yfKC14fWwPdV7g+J/KGLXY87mhBRUpJ/ak+1/N625yx78Rch12jewfQ0gwMHBcK
	 ovZIakAPRzcAcDOp984b9LYSaRidPMNDUArgaVp+9vApsyhSMdNhnVWPY5hkjrxszd
	 HgzOX7jTj8ejb+M9Stga8V+skJLdrjaJ906BjAqO9JbcTc9E6H7q6E4+4xd2yKzlzZ
	 4/VYLsxFiZq2dsM8q0dwuAzuV6lo5l+sa941vcSmBHA7y+w7MHRXTIhdZl4YqIrl53
	 CTfnMEMGNGm0RF6lpe9/LyeXcHoSvP/iHvAkLlWf7chUN6thPKkUQvg6eCp+SZb/xD
	 DOu+VVfQQriXQ==
Date: Wed, 28 Jan 2026 17:52:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	robh@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: gpio: Add Tegra264 support
Message-ID: <20260128-unquote-rickety-be747dba1a01@spud>
References: <20260128085114.1137725-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1pt5QEbSxRp/Nz8B"
Content-Disposition: inline
In-Reply-To: <20260128085114.1137725-1-pshete@nvidia.com>


--1pt5QEbSxRp/Nz8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--1pt5QEbSxRp/Nz8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpM5AAKCRB4tDGHoIJi
0qJqAP9l+39/kj47Q3VMt+wM7hIA3JtPUk3Mfpl39ey0B0T6iQD/ecNk7fobn6vu
V2ECvgIA9vBE95BPWzD7M0XKcvPkUw8=
=dv70
-----END PGP SIGNATURE-----

--1pt5QEbSxRp/Nz8B--
