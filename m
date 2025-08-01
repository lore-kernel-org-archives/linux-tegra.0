Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAAC28CF70;
	Fri,  1 Aug 2025 19:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754076905; cv=none; b=YqHML+k3gUVqw+yOYiFGU1wqdX8U/Z4ZjCQrqMxZ8YFCX4DnjmQm/mwRMGCuBvIuGs9GTUVHHjiOI5CfVvlSfTocEyu6wxRE0GoJVN6oWZn0gpbbk/ApwTNPJBVf0k0ffCqX7hfInUeFAXpK2Hnpl41s6vNAcF6daTjeqdmy+d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754076905; c=relaxed/simple;
	bh=IJSAXcvh17DdROpZVcOX4dIvpsH4xqwZwXk4qGePwgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksJ8MelfchhxR7lXS2gKrd04/+rWty/5Asn/N6SZHglW9h0MeUIX+wJaquyp3R6TXRL87MEvSm1tlLyknCSm8xA+wWXfqi5eN0564IkONCGOE/fFYjT6VuCT35yFoSzZRophqHHULWss7UNP8hN0Fo0XsKo6LzWJe3dPM6BZd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lt2ZvjEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lt2ZvjEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E5CC4CEE7;
	Fri,  1 Aug 2025 19:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754076904;
	bh=IJSAXcvh17DdROpZVcOX4dIvpsH4xqwZwXk4qGePwgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lt2ZvjEPl7yj2gTknYlTaX51NOHCsLy+g5fuSqVaMJJf/I+8ObC+lXdyBBTnVp3WY
	 jEeGe0BKj9hwch/ZoRAanxaKbG7BUBwtZ/2foY6dAvSIxTGdrWAdIU25b6YzfLU3D2
	 Tq0PuTs3xrrkw3htHeMvIgbgv2DDDjBijVz0Bx/vT8E3P5jJy9jJwcw4YeEl0Cb9U7
	 oxcSiGhStLDepPLlfHue7sQ84ht/FEAJ2r+pRFeNIPzDwlMIdEO5HOpcYYvfkk3MIu
	 +yiBOilisubeD+hOFNPBDI+tK3WltNO+rBljSX5fXYMgcodSK1Ij1HeSG/Ly4e+tLP
	 W+G9w9yngdM1Q==
Date: Fri, 1 Aug 2025 20:34:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Haotien Hsu <haotienh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Brad Griffis <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	Vedant Deshpande <vedantd@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, Henry Lin <henryl@nvidia.com>,
	Jui Chang Kuo <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>,
	WK Tsai <wtsai@nvidia.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: Add wake-up support for Tegra234
 XUSB host controller
Message-ID: <20250801-blend-lyricist-e2b88ee1f7e5@spud>
References: <20250801095748.385437-1-haotienh@nvidia.com>
 <20250801095748.385437-2-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X8oP1zOql6xeq+n0"
Content-Disposition: inline
In-Reply-To: <20250801095748.385437-2-haotienh@nvidia.com>


--X8oP1zOql6xeq+n0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 05:57:45PM +0800, Haotien Hsu wrote:
> Populate USB wake events for Tegra234 XUSB host controller.
> These wake-up events are optional to maintain backward compatibility and
> because the USB controller does not require them for normal operation.
>=20
> Signed-off-by: Haotien Hsu <haotienh@nvidia.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--X8oP1zOql6xeq+n0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaI0W4QAKCRB4tDGHoIJi
0kltAQDiyFLBVNnXXpakSrzAUlPjFjlw68v7Rchf9l6RTNvK2AEA69U+MzqIyMOe
s0VHAdcFO5kUImxsdN2tIk7bvWDoMwQ=
=jXbq
-----END PGP SIGNATURE-----

--X8oP1zOql6xeq+n0--
