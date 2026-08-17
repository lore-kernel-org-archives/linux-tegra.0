Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52E721D3F5;
	Mon, 17 Aug 2026 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969091; cv=none; b=BrwHR0G+5EqdtoDCsnmMx5yveXHkqASdvr5x5fa5p0Xf2ZU6bAToI+cOpi4eiPvhHk+AB28i7ABVZLb0OsFoQ8+tGwXmXhtfcuQOZHvACbSvxsoyE6S6tQnQrHQMLHWvQmBzkXIEG4XotT7YUYGGb8U4GlIxEDifMmg0PeVc1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969091; c=relaxed/simple;
	bh=D3tfC2NKRHiIgBG/HX7FJVaIyWVPaT6OBvQOXMos+YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dq//ul3eiBaPMrHW/BOsp1hyHKHjoVFWwe51/CoTpmKODEp3dwCoPt5w/jqnPAt5x96X6RPP6YOQc46uGC8/DWANXwuGQ5nuQ4Q72NMLhlapRKLu5NwqGO96+gW37zlr+pHdGScgRcD+WfljDdMlxHUBUiLMEUweaipxykf+mmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKYTyFry; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKYTyFry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0BA1F000E9;
	Mon, 17 Aug 2026 12:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969089;
	bh=CGu7gcIHYDCNawoXc5YnpH1ljwtZKsdafzC8hmQTB50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HKYTyFryVLX+r6abyLXYSOyysN+tzWR80p3OhPbC0T8eHfK6MBWBfc7Or2Azfzur8
	 ACAHo8FSpGOhuOALKfvWUC+KxcPCUj/dlpmrCAFZUJa48Be3UOILBW1IGMVC58VWg8
	 htH3igvcI/oWcvRupKmGFp5m/ZyucbaoPWzNWRU0FAKd9FRppMvlDazdQf7mwLnd4p
	 ETCmAYHxwi+5o6ENMarWG92RBalFho18lxQmkPVlYmbYZC0Fc3sP+LIGF20zVp5yut
	 lklMJ14h6kxpfCGJbLG0X2/Svkk/T3Qu0sW62opUtZ5mO3nQcTv5JFILce3yukK7rF
	 AiwBtMtMjWs3Q==
Date: Mon, 17 Aug 2026 14:18:06 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
Message-ID: <aoL36TMH4HBZhLwh@orome>
References: <20260716212001.989872-1-thierry.reding@kernel.org>
 <20260717212719.GA2687584-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="genl67fh5yhofsyl"
Content-Disposition: inline
In-Reply-To: <20260717212719.GA2687584-robh@kernel.org>


--genl67fh5yhofsyl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
MIME-Version: 1.0

On Fri, Jul 17, 2026 at 04:27:19PM -0500, Rob Herring wrote:
> On Thu, Jul 16, 2026 at 11:20:01PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Being a DWMAC derivative, the Tegra234 MGBE supports AXI configuration
> > nodes named stmmac-axi-config and phandle references to them using the
> > snps,axi-config property.
> >=20
> > While at it, add the 10gbase-r PHY mode.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > This gets rid of the remaining warnings on half of the Tegra234 boards.
> >=20
> >  .../devicetree/bindings/net/nvidia,tegra234-mgbe.yaml    | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe=
=2Eyaml b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> > index 215f14d1897d..dc897e312c55 100644
> > --- a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> > +++ b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> > @@ -81,8 +81,9 @@ properties:
> >    phy-mode:
> >      contains:
> >        enum:
> > -        - usxgmii
> >          - 10gbase-kr
> > +        - 10gbase-r
> > +        - usxgmii
> > =20
> >    mdio:
> >      $ref: mdio.yaml#
> > @@ -90,6 +91,12 @@ properties:
> >      description:
> >        Optional node for embedded MDIO controller.
> > =20
> > +  snps,axi-config:
> > +    $ref: snps,dwmac.yaml#/properties/snps,axi-config
> > +
> > +  stmmac-axi-config:
> > +    $ref: snps,dwmac.yaml#/properties/stmmac-axi-config
>=20
> You should be referencing the whole snps,dwmac.yaml.

I initially tried that, but it makes things a lot worse:

    Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb:=
 ethernet@6800000 (nvidia,tegra234-mgbe): clock-names: ['mgbe', 'mac', 'mac=
-divider', 'ptp_ref', 'rx-input-m', 'rx-input', 'tx', 'eee-pcs', 'rx-pcs-in=
put', 'rx-pcs-m', 'rx-pcs', 'tx-pcs'] is too long
    from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml
    Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb:=
 ethernet@6800000 (nvidia,tegra234-mgbe): clocks: [[4294967295, 380], [4294=
967295, 377], [4294967295, 376], [4294967295, 381], [4294967295, 357], [429=
4967295, 248], [4294967295, 374], [4294967295, 379], [4294967295, 369], [42=
94967295, 361], [4294967295, 373], [4294967295, 375]] is too long
    from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml
    Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb:=
 ethernet@6800000 (nvidia,tegra234-mgbe): compatible: ['nvidia,tegra234-mgb=
e'] does not contain items matching the given schema
    from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml
    Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb:=
 ethernet@6800000 (nvidia,tegra234-mgbe): interrupt-names:0: 'oneOf' condit=
ional failed, one must be fixed:
    'macirq' was expected
    'eth_wake_irq' was expected
    'eth_lpi' was expected
    'sfty' was expected
    'common' does not match '^rx-queue-[0-7]$'
    'common' does not match '^tx-queue-[0-7]$'
    'common' does not match '^ptp-pps-[0-3]$'
    from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml
    Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb:=
 ethernet@6800000 (nvidia,tegra234-mgbe): mdio: 'compatible' is a required =
property
    from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml
    Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb:=
 ethernet@6800000 (nvidia,tegra234-mgbe): reg: [[109051904, 65536], [109117=
440, 65536], [109707264, 65536]] is too long
    from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml
    Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb:=
 ethernet@6800000 (nvidia,tegra234-mgbe): reset-names: 'oneOf' conditional =
failed, one must be fixed:
    ['mac', 'pcs'] is too long
    'mac' is not one of ['stmmaceth', 'ahb']
    'stmmaceth' was expected
    'ahb' was expected
    from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml

This is because while the underlying IP is derived from the Synopsis
one, the Tegra MGBE is slightly modified and has different clock inputs,
interrupts, etc.

Or, well, I guess I don't actually know (does anyoen?) if the licensed
IP is properly represented by snps,dwmac.yaml, or if it's just a set of
values that happen to apply to some set of derived IPs.

Anyway, the easiest would probably be to just duplicate the
snps,axi-config property because it's only a phandle. stmmac-axi-config
not having a vendor prefix doesn't throw an error, so we could probably
keep it as-is.

I suppose another alternative would be to add special cases into
snps,dwmac.yaml, but I don't know if that's a great idea, it's just
going to make that very messy if everyone starts doing that.

Which do you prefer? Or is there another option that you think would be
better here?

Thanks,
Thierry

--genl67fh5yhofsyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqC+/YACgkQ3SOs138+
s6HC8Q/+NT1bOKELxtFaaA1pi2GJEibe/v9S0HEtanKn6/i4voLp5M3xTx25/OaM
+dsUt6UcUnwNt5Su7uBPh3wXKQ9Bi6yRTE4k3ywkQUpBDBXTkeaBVoSIlrfJ1TVv
0G/YKAT74a03XQTQ9waoWaVX+R4XPuXQYXPF50eAKAZh4jLNzsO5BrfWeitvXilb
bNnRUSXepuRt4w0JUyv80JgOiYP4LGBLyn8UAWznatvMFtI5CfjhWIEouk9BmTGC
eu28WcC89UO8glLy5BqgB6pev/1Q3wfTcK/HHFrB2LN1E9YtQX4FBHwjncWoLxOB
VhSmydS87z1fXpqkX6sKMGf2rvcFRx5kygwYi40Yn7FD6b+H97uKAAFlVpNM0bdr
HPBk4JLWlXS29/tTgYEL2dT8T4suXq6rQBqnkDS8ivWVd/ZWk+sOr9Itcq6/6aSZ
zajppvG9/lX66XuY47Xqqeiyj578PNgtFe7ie2YryN/JJl1FiUMFalB+JgNLbC7b
kQ4I11G0O6TLtGypq7OUj7OBVb8+4+s3x3l6Ax1mJL8Us8o9eXAHWQjWnTzFO9lO
tudJSNZUaLvx62Hj7XlwZ2reZmNaKRwDg/1M198yt86vTBrbwJWb03EGCl55g+Fs
LwyGyowtlfVvznQyrErUtmhmjTsxnTqy1SzKDl2HsxpXl5JpxxA=
=oc48
-----END PGP SIGNATURE-----

--genl67fh5yhofsyl--
