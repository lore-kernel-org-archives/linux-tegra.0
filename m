Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6B535DA77;
	Mon, 29 Jun 2026 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746265; cv=none; b=K+3MXMB2quuLTVn0MPUWZyR7Z561xRliinMPA2QF2LCfLd8TQ1WuDhrs7sI9HZQn+9QmYsZCcAKjL/X6h2laQ91cmXVlVV9N50cadc4J/6ZjZ9hCpih3EG8RH6FAG+2p7UDsDLn2S25J5C/igXOPxR5RX73EASG0LeamHT1iXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746265; c=relaxed/simple;
	bh=gIGHcKYzuDzER8PpAwFARWA0X4WwazmdTre8Vql/Zt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6sFWDdanyR7iainGfeAmxlPPWp7mNG1BiaQehKoZ3bmtjzwDKJoxEkwee1Ow5WZAxYStFBSP6DIwFtWVwZUu8dJ5ZN916jx17la02cLsV3DBj1PqSGVS3EZ6s4awRR7A1oSu/OgVMZbXkNlCHHCW+laeRnS2ujJXRw6jhXtvgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PF4HhT5N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PF4HhT5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532681F000E9;
	Mon, 29 Jun 2026 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746264;
	bh=gIGHcKYzuDzER8PpAwFARWA0X4WwazmdTre8Vql/Zt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PF4HhT5NwMk7LWmT1kry9CbZXtpF65Fa8jSdGK6IdxwZX7dhf7/AZiwePV7ksGQPU
	 TMa1NySiZo3pjBD2mDhvlxs2ujFYMsY+OA0yw2mZ9IN2Bqm87Lh7NUNDz6XZtRv8Pa
	 +hXAXNOEhNwJF7F8UNff3AtfrhtCtcjXRhR8x5rwZ6HxhEHKyJ2+CwdMyyoHrcPQLj
	 DcnsPg48DT/KD0dcyJhAsAhSaR8KjOeEAeHyhwIVHGDUJegBttMvim1AsdfjHge2Rx
	 jJTV582Ha+yyvxnfmBpKEC4q2+CGYrdLFrH9Nz0q18mSURAnP+OCAl5cIY2F9r/Cyt
	 MJTREeIIeqx4A==
Date: Mon, 29 Jun 2026 16:17:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiqi Li <lijq9@lenovo.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
	robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	mpearson-lenovo@squebb.ca
Subject: Re: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70
 compatible string
Message-ID: <20260629-pug-hypertext-cb5ab3279e95@spud>
References: <20260629111104.645771-1-lijq9@lenovo.com>
 <20260629111104.645771-2-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kFWmdZcdnPgoHGuw"
Content-Disposition: inline
In-Reply-To: <20260629111104.645771-2-lijq9@lenovo.com>

--kFWmdZcdnPgoHGuw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kFWmdZcdnPgoHGuw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKMlAAKCRB4tDGHoIJi
0rX3AQDTd9JLkwCwf4y+iV0TGv3DVrHTkcZs9Todx+wFXNpDAAD+JnC/PImxSN10
hVHnIU9RxVjsdoUDmzyE6HcTWgLT7Qw=
=rdZf
-----END PGP SIGNATURE-----

--kFWmdZcdnPgoHGuw--
