Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FD0208994;
	Wed,  8 Oct 2025 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759957890; cv=none; b=lTZQUZjKx/xQbWCMmJBwv3RxdfVpX8GVshooZwgcIDo/oBG7DVcgSrqxxxenP1VYopTv3iys6tXo5YzZL0J4VFDs3W04IODO8SCGl0RMR33XMKun7wok2TDHho3x5wmIovMLJ97eDs+a41Y+JPKygUo3qhJhESp+DqKU39OUQ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759957890; c=relaxed/simple;
	bh=ydFtpo6dhi61s4kQmCQFz/+cR86DGUMPR5XGUXkkB6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rByBK8DYZkyc8116m7fyRcj1BONxh2+elKvNsdxul7nzlhW0L53R5Jdl38XWoxuXciXDR5jT1gn25jzWwtAlSUHh+/I76LR8plKjzDHk97aqr6oYuddXsJpASps9+GtX1ZoqyPQeLWy9FyhOSmvlUILV7Ho7gCInH+vLBBnnbtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rW3m53ug; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rW3m53ug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF188C4CEE7;
	Wed,  8 Oct 2025 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759957890;
	bh=ydFtpo6dhi61s4kQmCQFz/+cR86DGUMPR5XGUXkkB6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rW3m53ugZgeXGhdMiJOyM/Nn4cAr/stSD5us2KKk76NyxJf4CNpfkGw96c+EssgpE
	 P4ckMojIWnOxwDBQd/riR8lOK2fn2E4gWCN/+XUEw2hRgZAjRZG0jStHjranbYjRnw
	 f/Vb5vLiw3yAPUJqQ8mkE208jFjLiC9HZ/f94BSHJlp17FjajFqIDLWosr+CEMKCNb
	 FJWkR+XhRnG8AtywVXx0D8Dmmgsttu60pi6IruHA58tfgQTFE/wCjkyuJxtxMM8APQ
	 wa3iNXXOxCopSU8dBgaIbKIEd1r7/FqUanP5eKfXH8Bx4GC5yUl4L1tcocXI6lE1Kk
	 /7VHMRJiypVhw==
Date: Wed, 8 Oct 2025 22:11:24 +0100
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
Message-ID: <20251008-safely-reach-9274474a2ec8@spud>
References: <20251008082800.67718-1-clamor95@gmail.com>
 <20251008082800.67718-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t0NOkuCq/S/rhM4m"
Content-Disposition: inline
In-Reply-To: <20251008082800.67718-2-clamor95@gmail.com>


--t0NOkuCq/S/rhM4m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 11:27:53AM +0300, Svyatoslav Ryhel wrote:
> LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which it
> clearly is not. Address this by adding the proper schema for this panel.
>=20
> There is only one user of this panel binding in the mainline Linux kernel,
> which is the Nvidia tablet Tegra Note 7. Its panel is broken anyway since
> it cannot initialize properly if the bootloader does not leave a
> pre-initialized panel. It also cannot suspend or re-initialize properly,
> since no DSI configuration is set and it has a loose regulator which
> relies on an always-on property rather than being hooked to the panel
> where it belongs.

I think this is a reasonable justification. For my own enlightenment,
what happens if a new kernel uses the old simple-panel devicetree?

> Tegra Note 7 device tree is adjusted as a part of this series.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
>  .../display/panel/panel-simple-dsi.yaml       |  2 -
>  2 files changed, 60 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld=
070wx3.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.=
yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> new file mode 100644
> index 000000000000..0a82cf311452
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#

Could you make the filename match the compatible please?
With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LG Corporation 7" WXGA TFT LCD panel
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: lg,ld070wx3-sl01
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +  vcc-supply: true
> +
> +  backlight: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - vdd-supply
> +  - vcc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "lg,ld070wx3-sl01";
> +            reg =3D <0>;
> +
> +            vdd-supply =3D <&vdd_3v3_lcd>;
> +            vcc-supply =3D <&vcc_1v8_lcd>;
> +
> +            backlight =3D <&backlight>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint =3D <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-ds=
i.yaml
> index 9b92a05791cc..f9f1e76a810c 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.ya=
ml
> @@ -42,8 +42,6 @@ properties:
>        - kingdisplay,kd097d04
>          # LG ACX467AKM-7 4.95" 1080=D71920 LCD Panel
>        - lg,acx467akm-7
> -        # LG Corporation 7" WXGA TFT LCD panel
> -      - lg,ld070wx3-sl01
>          # LG Corporation 5" HD TFT LCD panel
>        - lg,lh500wx1-sd03
>          # Lincoln LCD197 5" 1080x1920 LCD panel
> --=20
> 2.48.1
>=20

--t0NOkuCq/S/rhM4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObTfAAKCRB4tDGHoIJi
0sbPAP9ETzchfCEkgEW+0XNFC12oWkarcESlSeMmYHZJP6sHnAD/XuI1z+hb9MER
rys8wD8HxNJLhaDCclO3joS0zYisJQ8=
=DFYj
-----END PGP SIGNATURE-----

--t0NOkuCq/S/rhM4m--
