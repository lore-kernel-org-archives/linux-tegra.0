Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360E224CC;
	Wed, 11 Sep 2024 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726082196; cv=none; b=CEMqCI/3g20U/UR6ngJKiesOjdumjhwUQSnYihRRaWWtks75dvLehUsfeXzMciU/ALOPxEt2jkOLdsqWHYG7M4NQCtmVmslbd9cO6Bgc5S05iq8suouzB1P1wuqOaOwsGhcPsXhZ60DQDC0L3rO9PGbvfHcwtC21DwPI0QnUqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726082196; c=relaxed/simple;
	bh=mnSn1KcuI5tuURsTA+zf9AKHe3vSHhXFiSDFloCrciQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3GnvHEZaP7UHD2m09hYUfVJ/SfoBzKF0fVwEyxy8HYfWX1HYJ3wEoMOT98pF+10RJgvfDH9pAaIe0jAWOvL/JMHhOm1hO6lYbGoKh/HY1Wfe7sYlfHHwUOfIxljtSOr8nKBIhDknS65OAEa/1nDkyottRM4/dPiX+jFKO5k0Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLwm5e2+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLwm5e2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19128C4CEC0;
	Wed, 11 Sep 2024 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726082195;
	bh=mnSn1KcuI5tuURsTA+zf9AKHe3vSHhXFiSDFloCrciQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLwm5e2+osoIb5680mMwvvHkT9CKoXHcpUhlc4shfRh3f8mXBkxpPqKW0OR6SbwpX
	 YXwe5kUg+twt0M9s2T9idQiYyC+2lJB9IMZ5axaOEkQdMk4kiY2kMkTO5oN+r9tJ5E
	 OlKcahmXUYY+mNNJ6CMPsis3s2tbcOH7XowNSSjYCYU6YFiESnQ8n7kV2FYanTqUt2
	 Cgsb+NYy9nN1A3lUU/PSP5ubPlJ1b3ZF9fs7szzs2bEr5G7Y9nVk/4EaC14JRsPspZ
	 OQELb+Ihce97lyZ2w/pok3MOyC7IWjrhdaG2A9NixLH0vr7V1lWwcxmA/6VpNJzhlr
	 ZbQZARpiDgGnw==
Date: Wed, 11 Sep 2024 20:16:31 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpu: Drop duplicate
 nvidia,tegra186-ccplex-cluster.yaml
Message-ID: <20240911-rudder-liftoff-8480aa8cf7ef@spud>
References: <20240910234422.1042486-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aIzx6lmwYdumY0TV"
Content-Disposition: inline
In-Reply-To: <20240910234422.1042486-1-robh@kernel.org>


--aIzx6lmwYdumY0TV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2024 at 06:44:21PM -0500, Rob Herring (Arm) wrote:
> "nvidia,tegra186-ccplex-cluster" is also documented in
> arm/tegra/nvidia,tegra-ccplex-cluster.yaml. As it covers Tegra234 as
> well, drop nvidia,tegra186-ccplex-cluster.yaml.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--aIzx6lmwYdumY0TV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHsjwAKCRB4tDGHoIJi
0mMAAP0WZd3jCaeo0oh7fhohOy5plQO2w9O4TH1h0HY3TV2hTQD/SCfJ6v+6upGq
C5oQpxx/p1+9XAUypLiTLyl0wxsWtQU=
=ISeB
-----END PGP SIGNATURE-----

--aIzx6lmwYdumY0TV--
