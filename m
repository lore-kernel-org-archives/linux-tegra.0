Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F3285CB5;
	Fri,  8 Aug 2025 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754668564; cv=none; b=dpcoPnxG3SgjnNPm9gapHbk5uRPh94MAuXuOxx1Xo3is7CpnccLl0pB2hyPoamsv0ndWzOQOF8FPkqNTytmQVMDWSftYA5uK4c3NAHNHJ4VdxpU808FTcHr+mW0jRdPoyg6t+uMKrDEzJTRG3vO3CyFYjz5YA/Qn+YyZCUUSyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754668564; c=relaxed/simple;
	bh=y5KfnsQwDlMkxnLrsRVmkOn2LPNwVS/kjqZXhaTNfeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbRmdsOpo2B9UI1mIRaYEQ650+/LLqI/lB4nts/mtxhZJIqbO0/CdXp++udLq8eRSrmMOaR6+Y8kQUL6QURnPcHi38QtdjvsgCECsFHsXOoynqsD1c7BRnpin1kSdT+onWznZKAKrSGgGQOi+PNW+lUX14XplnVk/g0DjOldJTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLhjdwZc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLhjdwZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B93C4CEED;
	Fri,  8 Aug 2025 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754668564;
	bh=y5KfnsQwDlMkxnLrsRVmkOn2LPNwVS/kjqZXhaTNfeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLhjdwZcOdEQRkz9VZYArfM7bh5azcQk9Kf62kvd0nddEn/YcBcFUC5nErNgloKD9
	 FhukwMR8nXXUWNhdX6DIZabbp+p8RDAzJnuNPdW8HUmi9V3+hjqD6wy6zDr4ZBaxA4
	 sBB29WJg7s+un54E9QKjS+ioAhLZSC1sQgNj93+duMGeL2Pq4A+lZcwh6CIVPL6Wmt
	 Jf+Mv+YxfVtaZP+vLbRlG0WadkFP8BVd1AnbxIrIl2IyuQrI96DHAciut3cQgPyzpF
	 C5y5d89A201byAtLgmDR/lb91g+i5dJ6HNcz+e5RX+eQ5EldyjWRGWAlioOXH+ikSJ
	 h8+PI1AyFT9zA==
Date: Fri, 8 Aug 2025 16:55:57 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Drop duplicate nvidia,tegra20-ehci.txt
Message-ID: <20250808-easiness-hankering-0564e4918545@spud>
References: <20250807214351.4172243-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oWA958WAWst5nNq3"
Content-Disposition: inline
In-Reply-To: <20250807214351.4172243-1-robh@kernel.org>


--oWA958WAWst5nNq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 04:43:50PM -0500, Rob Herring (Arm) wrote:
> The nvidia,tegra20-ehci binding is already documented in
> ci-hdrc-usb2.yaml, so drop the old text binding.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oWA958WAWst5nNq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJYeDQAKCRB4tDGHoIJi
0s08AP9b5WgxGtcx7OQUEmWcMlyEaVY4ZEYUBSXnXuqCX7YhxAEAvHojwRyjcxJ0
28688UkpuVxctme/7a4z1+BrApV6ag8=
=PpSX
-----END PGP SIGNATURE-----

--oWA958WAWst5nNq3--
