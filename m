Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E603AF650;
	Mon, 23 Mar 2026 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277442; cv=none; b=QgC2uCRN65+9aj5AaW+03ABw02cQTo8xO6nBj9VuHgZpMIe9m8ad5OAKptyk+In6KQNyJyj23afdvPEKOY5x6LHgCiqdgIJGkLm6z+VkNrcZPdQ9uZNP9vGdTKw4dS29ze8xntT0HkGP1GV/5W4XbVYaHXtjUpsztvqX4bNsaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277442; c=relaxed/simple;
	bh=ehbg8HPS6362nMu+j0Hd5mbopVoMGAXtYn0Wlok42rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwT51IpzZsJGXodOovvZ7I+1Aq7yfSmP77R4610httGnPnH2VPJ2hmWsLCwOkdHUMoEazbuhj1wBhl+XrSmKcaBJsqd4hJAt8L0Z8uGnq5TRXYU04vNx/yk5AGIGw9RG8r6jLFzdbfG5q2QdEI2j1fXUi6F/LFrF5p0izSzI8dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEhwfr62; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEhwfr62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F466C4CEF7;
	Mon, 23 Mar 2026 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774277441;
	bh=ehbg8HPS6362nMu+j0Hd5mbopVoMGAXtYn0Wlok42rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEhwfr62+OwxVb+93lTkiVMlBx4o8+dxnbmDBCvtHE2NkKXrVK54iLoF0aILs/V2I
	 BkgbhS2e4J+jxASz10+YMc3YPHG5zzFElvsPkAljdY4YoKyM6zLRSPizPvbWUGQLwE
	 YcBCDVxqesaQYrQntbCHKFzTedfN3v7LD3WnB1BW9zw2cYPrsj1JQ3ofdEyhIkNSXg
	 w4SfW2kS6q4wAPUmjL8fZ7bE0vlT45LOV7yiBU9U8ExkJehadqHxddyFbnSgE3JxKv
	 HOKVJ8GI8IwBxqCPp3uT0DHAH7a6OUvSnWtNXLbALIYJHWpjjg6wA9krHiLhHzWuEE
	 is8kyGU1pAsZw==
Date: Mon, 23 Mar 2026 15:50:39 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
Message-ID: <acFSL4r47VtoQx61@orome>
References: <20260320234056.2579010-1-thierry.reding@kernel.org>
 <20260321-lurking-courageous-centipede-5e82cb@quoll>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jujgdga2tvi4uh7w"
Content-Disposition: inline
In-Reply-To: <20260321-lurking-courageous-centipede-5e82cb@quoll>


--jujgdga2tvi4uh7w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
MIME-Version: 1.0

On Sat, Mar 21, 2026 at 11:49:08AM +0100, Krzysztof Kozlowski wrote:
> On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The PWM controller found on Tegra264 is largely compatible with the one
> > on prior generations, but it comes with some extra features, hence a new
> > compatible string is needed.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>=20
> Where is the driver patch? Why this is not being part of driver
> submission (see also submitting bindings DT in description how patches
> should be sent)?

I don't see anything in the documentation about a requirement for driver
patches to be included. It does indicate what the ordering of patches
should be if driver code is included, but doesn't specifically say that
driver code must accompany binding updates.

Nor do I understand why it should be needed. I do understand why you
would want to have driver code to go along with a completely new binding
but in cases like this where we're really only adding a new compatible
string to an otherwise unmodified binding, I don't see any advantage in
having to put both together.

Thierry

--jujgdga2tvi4uh7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnBUz4ACgkQ3SOs138+
s6HBkBAAsPt/GV/t2d1eetOs5YtnZFiIL1LuJEJeGNFqYDNjzDSrEUgYmP/YRXFi
ubl2YVaPnSoL4PP2dqpe44CImlQOs5Jh/vOw3WrAIDHWedJC2m68DiNu9NOpK6rE
YIQPIYXubBtLmna7qau4XGheysIjYIqQ5KuUzPFApMleyiLsRLzr4yEj8HCTTbjQ
6fpT11JqKrYoQ6SrrZs6s6GH4q83ahmoHeaTPDkW8xIfjUvr6PNBBpwf4ciXTIoo
5JcPO0O6GtQUzoQyO/IJYuZGpb5dVBfwXFsWX5rnZoFKXosw70jEw+yXYpKVcOpd
HxZBAO0dKaRNs2zCRW5qJQzHxxX/nodGGH1QUD7pLp5a30/6wASNPk3/rqxNIJcG
v47y7AOxdFXxoynaTafN+akHMey20RHB66A5CsX1o4daYSAyQMrvtDaWzeHJ5MmE
eXZOxgxghuiORGONNUL22Hqhi1nr+ZkDfq+/KRBQ46mEN+H9msaeKcXDchKU7KXa
AKOsLP62apQmeQjGqWnNku6jw6nmS5NJ09rcuoHPGg9z9SOlfwcerGzkTGjuLL3J
pB/xFiXNtqjxaP8yCZuNKPrq+XFaTu4oG5tpF6mqEDvbpvEz3qSEpu/MI8kwPIal
nUWy0PTIkVlFe1doLh+Z+uYoeNx18Fbth8rfxZ4kJ2yidPLRi8Y=
=V30l
-----END PGP SIGNATURE-----

--jujgdga2tvi4uh7w--
