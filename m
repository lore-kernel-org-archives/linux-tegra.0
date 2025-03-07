Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422421D5A9;
	Fri,  7 Mar 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362210; cv=none; b=eXtejKLMlUC6K/0OekKl5ert9NM3JNGvcTnW9g2KjQMOdZGFw23KBoLyt2gNLCTKhfRCPk92X8pu0Rwt5vx+T3vVDbkUfcp3csUVSQJWBlmHoaw0J9rM1sN6zlRh19uELzOc1C0xFBaO9pKghYfQZ9aUOddH016PbKRkDq+LibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362210; c=relaxed/simple;
	bh=a+kaCRHpRYg3WLMWjLXo8RTkidgD6rASEsPguEmyrIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwgwaTRlMu8hRMzkYCf6tio3ilHBhB/zYoOhjh0P0HSD/zvfkalh8JkPd/PKPEH/cK0VpZkwMgBStHjcs+b7RKSSybqtFgfhu+xJpus2+QsWQP7hJT0BTpp1gH8FmdxeXBwF7IRFzTJH0sAvy55r54odUTLTZIYmI+K42faEmhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtTEibuB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtTEibuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB71EC4CEE8;
	Fri,  7 Mar 2025 15:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741362209;
	bh=a+kaCRHpRYg3WLMWjLXo8RTkidgD6rASEsPguEmyrIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtTEibuB2IvO5CZCYyeTTlghNRh/jFgp1KqWRTUerr8UuKSEx8I5cjgUXuDRdJRhc
	 xq0iK8KHZFhum9u7mD1ZvV6CNs1rPxWRUFtff3Wce4CQLuUjgS6wJWvwEi4s5Yiiws
	 qZou03LXejjXDfE0r/8UWpfi2NQole1Zim2Si4eMpV/28n8xam1Yh7ZantYK+ttajA
	 fVvaMwo8LqWHJu4Lq0YjLZ77rKP6rm3lXY5tCgM99S3wyE7lj67Nbaa7E1VP/mFEWW
	 VAMZrymO/WfTwrX/20I58ODjhlYROGW6SYHuqZEQXeaIebN+2InfpBJbNxLdyCH55O
	 3JJReF5wo2mtA==
Date: Fri, 7 Mar 2025 15:43:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Document Tegra114 HDA support
Message-ID: <20250307-yonder-cake-ca135b62bed7@spud>
References: <20250306175931.2028613-1-thierry.reding@gmail.com>
 <20250306175931.2028613-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z2BN4g90Rnw4YIwI"
Content-Disposition: inline
In-Reply-To: <20250306175931.2028613-2-thierry.reding@gmail.com>


--Z2BN4g90Rnw4YIwI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Z2BN4g90Rnw4YIwI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sUHQAKCRB4tDGHoIJi
0uu/AP41t8jU0g0838d+euJJyxht0we99065j6GUIg7Vv4L2EQEA1EJXmYc/SYSg
tcgKyiObL4QKEIspHlDBvbLfL9ul0gE=
=B8DV
-----END PGP SIGNATURE-----

--Z2BN4g90Rnw4YIwI--
