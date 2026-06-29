Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5C3EF647;
	Mon, 29 Jun 2026 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746477; cv=none; b=g1wVI1CjjKtL6fTctIi7BiXvw1qIWqOm5rM0/xPvVhOqGkUYA7CDdS4pzSh6+FUzWYUuLAjACKzrrHXdKVilXLPyN0QKKRRBENUCNbmuxryDgoELd5VFrkpUXWtQhATMlF+eccV0a+rJZ24eN/jLDatNRhuqX1IKnlrhhfSNVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746477; c=relaxed/simple;
	bh=wNio1yLMq99NcwrcTVnYEWhf7LC8jplmGfolKk7Hn8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKbEJSxP2kGeMMqG+hhCSZsvA3gmegx1oCXk2mMJMVDs2JbIJG2cuHXwa7Q1H4UF72ZknJrEBQhBpaqKcYt+QmyHwKG1oHUkNm1RnxDIooO5lzbuA8LILvsS0oPX9jT61w12U3gwlxjeksnZX9f3RMjFhx0XTE8V7R2TNiWEIG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxDCw+NK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxDCw+NK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF041F00A3A;
	Mon, 29 Jun 2026 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746475;
	bh=8JeIET6BIO7IAQ1VGFsVbdLpIFTiA3/rwieOpXwgEHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mxDCw+NKxACQINPLhkoDiHknZMmfP32yHsviw3jgAyjmVXAAG6DLBb+4HJdGvJ2XA
	 DVnomXBv5PvZn9EMPMbF2i5bom8RC2+9nPW/Rd52QBuElEFAf0rE9/WiHD4uLHA3bM
	 POMb019YotS0sS/0EOkrK/i4oU62mgKHgchFQR0mJoywpSHhzL5IltXPJU/MeIgCYx
	 ap0JwBevDgGf4ZkMMfnZfhPZuE5smna7fJU5Lou68n/gfmrNzTEwrD0k8G0Eh7J2pA
	 /8dbudFQQkg/dfFzw19Oz6oMBIhRdpH1cEVStTHfBdI9nrYiFHWCF11zI8gxqNuFfa
	 y1SH9IS6U/TaA==
Date: Mon, 29 Jun 2026 16:21:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Wayne Chang <waynec@nvidia.com>
Cc: mathias.nyman@intel.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: usb: Add Tegra264 XUSB host support
Message-ID: <20260629-primal-refrain-1eb04745384f@spud>
References: <20260629093406.1118594-1-waynec@nvidia.com>
 <20260629093406.1118594-3-waynec@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqDp6fcqM2UH+2oI"
Content-Disposition: inline
In-Reply-To: <20260629093406.1118594-3-waynec@nvidia.com>

--eqDp6fcqM2UH+2oI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 05:34:00PM +0800, Wayne Chang wrote:
> Extend the Tegra234 XUSB host binding to cover Tegra264:
>=20
> - Add nvidia,tegra264-xusb compatible string
> - Document optional USB wake interrupts for Tegra264
> - Document Tegra264 PMC wake event to port mapping
> - Allow up to five IOMMU specifiers for the additional XUSB host
>   stream IDs
>=20
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra234-xusb.yaml    | 115 ++++++++++++------
>  1 file changed, 80 insertions(+), 35 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.y=
aml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> index ec0993497fbb..94b1dbe2b02f 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> @@ -17,7 +17,9 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: nvidia,tegra234-xusb
> +    enum:
> +      - nvidia,tegra234-xusb
> +      - nvidia,tegra264-xusb
> =20
>    reg:
>      items:
> @@ -31,37 +33,6 @@ properties:
>        - const: fpci
>        - const: bar2
> =20
> -  interrupts:
> -    minItems: 2
> -    items:
> -      - description: xHCI host interrupt
> -      - description: mailbox interrupt
> -      - description: USB wake event 0
> -      - description: USB wake event 1
> -      - description: USB wake event 2
> -      - description: USB wake event 3
> -      - description: USB wake event 4
> -      - description: USB wake event 5
> -      - description: USB wake event 6
> -    description: |
> -      The first two interrupts are required for the USB host controller.=
 The
> -      remaining USB wake event interrupts are optional. Each USB wake ev=
ent is
> -      independent; it is not necessary to use all of these events on a
> -      platform. The USB host controller can function even if no wake-up =
events
> -      are defined. The USB wake event interrupts are handled by the Tegr=
a PMC;
> -      hence, the interrupt controller for these is the PMC and the inter=
rupt
> -      IDs correspond to the PMC wake event IDs. A complete list of wake =
event
> -      IDs is provided below, and this information is also present in the=
 Tegra
> -      TRM document.
> -
> -        PMC wake-up 76 for USB3 port 0 wakeup
> -        PMC wake-up 77 for USB3 port 1 wakeup
> -        PMC wake-up 78 for USB3 port 2 and port 3 wakeup
> -        PMC wake-up 79 for USB2 port 0 wakeup
> -        PMC wake-up 80 for USB2 port 1 wakeup
> -        PMC wake-up 81 for USB2 port 2 wakeup
> -        PMC wake-up 82 for USB2 port 3 wakeup
> -

Property definitions should remain at the top level, with the widest
constraints and list of entries.
Conditional sections should just apply restrictions. In this case, only
one additional clock seems to be the difference, so conditional
restrictions should suffice.

>    clocks:
>      items:
>        - description: XUSB host clock
> @@ -96,9 +67,6 @@ properties:
>        - const: dma-mem # read
>        - const: write
> =20
> -  iommus:
> -    maxItems: 1

Same with this, conditionally forbid it on the new platform but leave
this here.


pw-bot: changes-requested

Thanks,
Conor.

> -
>    nvidia,xusb-padctl:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: phandle to the XUSB pad controller that is used to conf=
igure
> @@ -137,6 +105,83 @@ properties:
>  allOf:
>    - $ref: usb-xhci.yaml
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra234-xusb
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +          description: |
> +            The first two interrupts are required for the USB host contr=
oller.
> +            The remaining USB wake event interrupts are optional. Each U=
SB wake
> +            event is independent; it is not necessary to use all of thes=
e events
> +            on a platform. The USB host controller can function even if =
no
> +            wake-up events are defined. The USB wake event interrupts are
> +            handled by the Tegra PMC; hence, the interrupt controller fo=
r these
> +            is the PMC and the interrupt IDs correspond to the PMC wake =
event
> +            IDs.
> +
> +            PMC wake-up 76 for USB3 port 0 wakeup
> +            PMC wake-up 77 for USB3 port 1 wakeup
> +            PMC wake-up 78 for USB3 port 2 and port 3 wakeup
> +            PMC wake-up 79 for USB2 port 0 wakeup
> +            PMC wake-up 80 for USB2 port 1 wakeup
> +            PMC wake-up 81 for USB2 port 2 wakeup
> +            PMC wake-up 82 for USB2 port 3 wakeup
> +          items:
> +            - description: xHCI host interrupt
> +            - description: mailbox interrupt
> +            - description: USB wake event 0
> +            - description: USB wake event 1
> +            - description: USB wake event 2
> +            - description: USB wake event 3
> +            - description: USB wake event 4
> +            - description: USB wake event 5
> +            - description: USB wake event 6
> +        iommus:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra264-xusb
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +          description: |
> +            Same as Tegra234, with one additional optional USB wake event
> +            interrupt. USB3 port 2 and port 3 each have a dedicated wake=
 event
> +            interrupt on Tegra264.
> +
> +            PMC wake-up 79 for USB3 port 0 wakeup
> +            PMC wake-up 80 for USB3 port 1 wakeup
> +            PMC wake-up 81 for USB3 port 2 wakeup
> +            PMC wake-up 82 for USB3 port 3 wakeup
> +            PMC wake-up 83 for USB2 port 0 wakeup
> +            PMC wake-up 84 for USB2 port 1 wakeup
> +            PMC wake-up 85 for USB2 port 2 wakeup
> +            PMC wake-up 86 for USB2 port 3 wakeup
> +          items:
> +            - description: xHCI host interrupt
> +            - description: mailbox interrupt
> +            - description: USB wake event 0
> +            - description: USB wake event 1
> +            - description: USB wake event 2
> +            - description: USB wake event 3
> +            - description: USB wake event 4
> +            - description: USB wake event 5
> +            - description: USB wake event 6
> +            - description: USB wake event 7
> +        iommus:
> +          maxItems: 5
> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.25.1
>=20

--eqDp6fcqM2UH+2oI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKNZwAKCRB4tDGHoIJi
0mfTAP9A9GmGGdOGVMyr6X9sPpaTSh4nzhGwFvLGrU+wledLKwEA1gnN+c4MbrQN
c9h/2QDvCBQLEbB5tocWAg7MFq+CXAg=
=N0ZX
-----END PGP SIGNATURE-----

--eqDp6fcqM2UH+2oI--
