Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579F63A783F;
	Mon, 29 Jun 2026 06:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715946; cv=none; b=QzL0WDIWZ8oyMa1m55UcNlialROIt+oLbKyoGf2HJT0G7uvrqhcEYWCaLD6NNUlzsIaHDxAzHkzwuIwP1OwAZHEqd2tFk75fp1z5KFY3BW9GjEFBmNkdefjfu0nIJvs7JMjScaA1WzK+A8dT7IBRYtnPO738mODuLW1qGotA9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715946; c=relaxed/simple;
	bh=rm47+tpUCXXjsY0MFCWIxazlAwj+ph7QsUfZlbraD0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lGKAz4gfeih5Qzjn3I3d258EZjsRWGepf/Hjad5Usm6ChAFeQJDqZzQF8tomIzLTjQTJjEm2x78ykfUZWRHoXL+QSHUwxvDcWu+llR49xMFkT4RoSbW5VCdFe/a5ojdiBLdjAdcQ7hyyCncJBIyydQ2dHg8symz67JWRuQknW1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BkwvXFAQ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BkwvXFAQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rtnYJeteQp4s1E1MicQfJts/ZAxcW/7K90s6vct7pZE=; b=BkwvXFAQ6smfdrg/nXRoimRlhb
	q+XJB34lgmHXEC8Gc04TJb++TYjB5dpPnCgEjvkjZATQ7nKxqtAthdlz6+NwW+CiWh+gQsbkiNzkP
	EGtoTvfpqcFbQH76bolFuh845Qm7/6bRu9PO7FgwXPyCwYpUtkPrYeCjKMTMlHtcPvJM3QDFRjOlX
	LRz2BpOLtYOndWFxfD1aaEb/AdT4fMIeoWG8nTU3Z2Lm8Js1iK6Kc5sKh+V+WDG4H871/gc9dpTSa
	0Kn2N5bryTAu9rosMW5+PA0sRjn5aSD20u50kMfWVHh9LTx0osU3EMex6taYd6y4QhrzTgA/EjlR5
	32PgrGcA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1we5ql-000KPh-1o;
	Mon, 29 Jun 2026 08:52:11 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1we5qk-000Dff-0L;
	Mon, 29 Jun 2026 08:52:10 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject:
 Re: [PATCH v3 4/7] arm64: dts: freescale: Convert to new media orientation
 definitions
Date: Mon, 29 Jun 2026 08:52:08 +0200
Message-ID: <2840219.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20260628-kbingham-orientation-v3-4-4ed92968aff8@ideasonboard.com>
References:
 <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
 <20260628-kbingham-orientation-v3-4-4ed92968aff8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28045/Sun Jun 28 08:26:16 2026)

Hi Kieran,

thanks for the patch.

Am Sonntag, 28. Juni 2026, 12:22:19 CEST schrieb Kieran Bingham:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the freescale/NXP device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso      |=
 3 ++-
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                      |=
 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314=
=2Dimx219.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras3=
14-imx219.dtso
> index e5a2b3780215..7b44ae0f19b2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219=
=2Edtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219=
=2Edtso
> @@ -9,6 +9,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
> =20
>  #include "imx8mp-pinfunc.h"
> =20
> @@ -47,7 +48,7 @@ camera@10 {
>  		VANA-supply =3D <&reg_cam>;
>  		VDIG-supply =3D <&reg_cam>;
>  		VDDL-supply =3D <&reg_cam>;
> -		orientation =3D <2>;
> +		orientation =3D <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation =3D <0>;
> =20
>  		port {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mq-librem5.dtsi
> index f5d529c5baf3..178cfad93483 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -8,6 +8,7 @@
>  #include "dt-bindings/input/input.h"
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include "dt-bindings/pwm/pwm.h"
>  #include "dt-bindings/usb/pd.h"
>  #include "imx8mq.dtsi"
> @@ -1116,7 +1117,7 @@ camera_front: camera@20 {
>  		vddd-supply =3D <&reg_vcam_1v2>;
>  		vddio-supply =3D <&reg_csi_1v8>;
>  		rotation =3D <90>;
> -		orientation =3D <0>;
> +		orientation =3D <MEDIA_ORIENTATION_FRONT>;
> =20
>  		port {
>  			camera1_ep: endpoint {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


