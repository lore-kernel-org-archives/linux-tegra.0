Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778F192B75;
	Thu,  9 Oct 2025 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029276; cv=none; b=WYsUpTe7Y7Z/ER7B8+s96r6JoCLDQyyqM/frtcWnuiy5h+1BX5OkLnVpR0PbX06ILqaAVROwtFrKprtllAEV9aZe2nEBsIJJnil2Oh83eBxka+rLigAb5GfDGXGktf0WOoXjutpCawBCQErukgd3UDssSmvgjXpoKgFpqgHnR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029276; c=relaxed/simple;
	bh=aMf++jwj8QFA9sKQnz+f+0P/SV7dw4FDOkJnsMu2xSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDyI6fbcWrPUXUW8XMaflEwB6Ou8tShSjWbO/RjXQoxi/7rEo5khOeH7uUQA8DhuOi/vE7e19Z1KLHJzYcZGXUCOF2qqyNZhrCja6VNcsnv4I+PolEX92ZrbV8zV37M9aFOMqIY/61wGzfxxXPaGqcDPxnXfoVViaz3ETcru6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCCETPWS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCCETPWS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3E3C4CEE7;
	Thu,  9 Oct 2025 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760029276;
	bh=aMf++jwj8QFA9sKQnz+f+0P/SV7dw4FDOkJnsMu2xSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCCETPWSyIoHtesMP73HgaIIM4lNd5BH3mpIB5GbDos26H+m8xNIGbTfmG4NP42nM
	 oy7HC0QVrtmSjLArjLpxhFD6r0L6NHCpJcbrsjCshygAsmPm2uFwKQAMQ1+7HNJsFx
	 2aYHPAWl3nyidOB4zC6516LLapqfSdJnJ8uYySsBoBSmJ2Bd1GyCzrPYPPgKKIOF/p
	 tTxcbZzE6+hiScv1UdyFHMcwrVFvxfSd7P4Zvh4PjnWL0ZrBeNp6yM+ztDFXu3AlnU
	 09lnoXeYpN/odoVBf4AukdPCkeZfDaKdfcyqZkktPw7owr9xD1dywyFTdTpJ04ZjSl
	 vwYtHinJwA0dg==
Date: Thu, 9 Oct 2025 18:01:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
Message-ID: <20251009-primer-speckled-7071ab2b0b0a@spud>
References: <20251008082800.67718-1-clamor95@gmail.com>
 <20251008082800.67718-2-clamor95@gmail.com>
 <20251008-safely-reach-9274474a2ec8@spud>
 <CAPVz0n2pbAS3Qjm9WQGvcuJhkNnyjGCyJtVi=VMuUgPoQNE+wA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XkuHu91RJ5hQ906D"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2pbAS3Qjm9WQGvcuJhkNnyjGCyJtVi=VMuUgPoQNE+wA@mail.gmail.com>


--XkuHu91RJ5hQ906D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 08:06:20AM +0300, Svyatoslav Ryhel wrote:
> > > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070=
wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > new file mode 100644
> > > index 000000000000..0a82cf311452
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> >
> > Could you make the filename match the compatible please?
>=20
> Filename matches compatible, -XXNN after lg,ld070wx3 indicate
> revision.

Then it doesn't match!!!

> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: lg,ld070wx3-sl01

--XkuHu91RJ5hQ906D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOfqVgAKCRB4tDGHoIJi
0tm2AQDRbBchJP6yN1cz4q5/UPJ+qaCeDoWF6fS6DznaqyPrbAD+NiGhOdJxJ+6d
6IzdZBjXu637FUo5ZnafwHCz1p2rXAs=
=7uMp
-----END PGP SIGNATURE-----

--XkuHu91RJ5hQ906D--
