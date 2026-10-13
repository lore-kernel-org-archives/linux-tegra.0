Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548852ED30;
	Tue, 13 Oct 2026 15:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906420; cv=none; b=IHdwjrb+VJicbWreuzyuv8OMOk6aPAPOezHdpNzMx7cLWTDrg/AAB/ct2Vxi3gXpG+k/OmpmDJ+T0VSlclrUBtm26cNiAP3jtXTHmcVPq2LlmhxATsG9itMyrmT6dp9JvbAPNg48AZIf2y4xednqB7Tq9RzVsvY+ARoSITA2peA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906420; c=relaxed/simple;
	bh=B23L31nRXwSGz7un2PjEyk/lXVDXO2QexEoFL0fy/ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYLUZDtlCGU4r1nqRTxLa2ji3A2MrAtMkz7i05OGbAHGR5gkHnSVkYXhBhlnFPRQLC1cKUyRNKt/Pgji7plQ4sA0lGcUTdNm09MjJM3vQvFt9IucyXaHmFM8A6qoryVglvqlgntgQxhzNtZew2a8zl+H7yNwEpKxZDguaEYlTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdqC9gMj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdqC9gMj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB201F000FF;
	Tue, 13 Oct 2026 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906419;
	bh=zrrwM+OoTQ5n+oUmClj8UHVrIw8n458ireLa+GKP5qM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BdqC9gMjE6f5EWWl1Xlpzgq2aOqELdaPtElELJu1ZCWu54KCsQoAD9g8r5t2rDi4o
	 djw2jbEX0/MkPGgXpPDTCGuKmo24p0IuekQLxf6x1cuLJdDC3cunM45pw8Az2kWEfM
	 ePK9sXqi3/K6TN1zi7I0dicxeuCMvq1uXcQUYNiL1HyCx5QjqM9G9Dnajn4MMimxwt
	 JyEWcIJ1rbyqOG0SOgwVo+XP4LXaRm4mDWWNR/Agx7cClMcB7mcsuVYj4ZlED/P7Yd
	 murSJvxLGW7OiJnPcKNfmu+pcczAFox3+JODJeTxENdI/IH+xarXL8w2KS7H0NrGug
	 w0poGpFVwgbfg==
Date: Tue, 13 Oct 2026 17:46:56 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sasha Levin <sashal@kernel.org>, Aaron Kling <webgeek1234@gmail.com>, 
	Diogo Ivo <diogo.ivo@bootlin.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
Message-ID: <as5R_xrDv4eVPdtz@orome>
References: <20261013145210.103565-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nnyddv2boxnoq3dq"
Content-Disposition: inline
In-Reply-To: <20261013145210.103565-1-sashal@kernel.org>


--nnyddv2boxnoq3dq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> GM20B needs both its reference clock and the fuse clock while it is
> powered, so allow "fuse" as a fourth clock after "ref".
>=20
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Aaron, Diogo,

I'm fairly sure I remember at least one of you mentioning that GM20B
wasn't always working reliably. Would you mind giving this series a spin
on your devices to see if it fixes any issues you were seeing, too?

Thierry

--nnyddv2boxnoq3dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOUnAACgkQ3SOs138+
s6E07xAAhV16aE/vTmdXCWNQFDANmFHYGGkbT8iB51pQecVSkYApSpthdGshj822
8aL9r+P3JKo6enP2M0iITNX71JEw6W/s7btdKO9ur0lAmT7OQkZbr0cBbHFDkeek
Rx5fZYDM8M/Xf5t3/Yka+rQTJpmPSWwqljLYcqcQBChdPkG35VuWS/Df5PwTK5tu
9j+SWtpNRg1CPCNIvNiZzltE8Vdkp662vSrucQyzTp9UWws5DIgPI3qhPGTQlbjt
rZVi7cWLawCw2Tnl4WeXOlEPDS0s0sh+w9dmQhpgjeJWBGJYhTms06X7qX7lJ0fd
2ncmditmQrBk0JCu94YQFx7tjSxjUSXTXSPPw+HzZXDtPuHaRAp5+75jqeqg2wIg
zG6Tv3+QIpEONMXKZtdu72/o8cPJuXFnXNTWqMY2GITRFmBR+3zt+DnVgXXwvj7V
JHr0iYWp40CRIZTgq9lcNlQdMnqzjm1g8oV7g1RAXdhZHp3FU6RBpAoe0kUOmyFw
RAqb6V/lXF89WgzrZ0qlSG9s/8NkjmJaMj04wiU7YA3xLNCeBPw4rzR8hMNzteV0
VyK7BQeV8T39SBG+D1Muwyq4quFQO0QLHen6YmPSf3SMdEikNwl5JT2ZGziUGtKq
X/IOENvD1mK9kvYwQFnZ6YCdez2KwN45NDtWe+Tm6MFviXE0WNU=
=ovYf
-----END PGP SIGNATURE-----

--nnyddv2boxnoq3dq--
