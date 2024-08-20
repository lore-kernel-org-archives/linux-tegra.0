Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9D47E59A;
	Tue, 20 Aug 2024 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724171981; cv=none; b=Q3YwF/5yoOZoeuKiJtY0ipr5qzBs8CEf4gEa51rZdeGvxmKpcGKxBmlLgTqNj174tBZQHoqT6Tpa/6HcvKjKpRgyaYzJesxQmAFpPM5qXWnxZCz608NZ/d//ncor/l4JS13aDz8XYmW7/O2DTHvvvVICD5nzEM5kJkGEeiid/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724171981; c=relaxed/simple;
	bh=7ujyJpC0hYdLkubuK3IkuY7Lcz0E1ShtfUmG4HZ6BS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdHHEgwRvgySSAr3SoMin70v8Dsr/4oSv7KkmD4PB1SvYWVlJXXvTC2ye1BGFVZhkghPEXOcW1xG5woBrCOxHMPf11cUjBFAFg8uuqZsL4ijaXxDy/2Y5voAhZiFvGhUHoVguX4njW1FSUnf6U329522Bbcl3s+xwfiDtMUHbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqTAGX1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqTAGX1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2D2C4AF0F;
	Tue, 20 Aug 2024 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724171981;
	bh=7ujyJpC0hYdLkubuK3IkuY7Lcz0E1ShtfUmG4HZ6BS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqTAGX1NMfCSBBiw8N/2OzBXw+nYNV72vOKiuCX2719XxaKM2lV/3wlcmWExAgmvV
	 IfVV4ajvlZvhvNIeCtIWvVZQ9e4CzdZ9rpQ0M1A5mD2fEoch3PCqB8Z45tETfBN+YP
	 xzxVfgi5V6ObU0tGDu5pvNHdc2UC1ESjqvLIKr/KSfA/nMBiQvmaclkEB6t8YpnnQH
	 ZqNK5h/FMrDz4RgFlX1gW9mTug5ISBSRT1g3flGSrcOWjXqKJPJHdaw9qQMyx0jO35
	 3dISqm4NL9vAP2dydWjjRYnS/k34fQWgeRNXZxsOVkJhUtw0KisUwPv03Z+Hv4ivwG
	 mbf772JX0SMHw==
Date: Tue, 20 Aug 2024 17:39:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: i2c: nvidia,tegra20-i2c: minor cleanups
Message-ID: <20240820-freeload-brewing-53d949046c91@spud>
References: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kQsM/irqq+8Kr4jx"
Content-Disposition: inline
In-Reply-To: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>


--kQsM/irqq+8Kr4jx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2024 at 10:44:23AM +0200, Krzysztof Kozlowski wrote:
> Simple cleanups for nvidia I2C.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kQsM/irqq+8Kr4jx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsTGyQAKCRB4tDGHoIJi
0kFpAQDznwN3xsIZVneeZuSOan+jy4L4ujlmjJ5wZRCaF/NSfAD/Rfk0QPfDN2Xg
/j5/IBfLCUHHkYgXiSmP0iPMgOCq+gg=
=wOsm
-----END PGP SIGNATURE-----

--kQsM/irqq+8Kr4jx--
