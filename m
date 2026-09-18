Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16843A81A;
	Fri, 18 Sep 2026 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729800; cv=none; b=exG9LtiuFjBdmLX7+K0Yqlpik5M3rKUKtlOm+Q0V4+ycraQUhG8GiXOYjaGR10PNetJ8jzgcVd6BccIDjZAla43x/5DzNA9bDdzk6Zdl4tby7/+xDtQ0TpGehTSAPS5WDRFoBZa56nMROWvVkdLCsE09GrIMpojgOCDoK2YMFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729800; c=relaxed/simple;
	bh=pd+OS3tBP8CJ9F0+if3g0L9XTiTjKyDAlPFk7sYS0Cg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cgfcFJ9RjRbtnyxrL0qZ1JlMxeIPYy3330KnB3DtTGRVLJcnA+ga71QD811Y/ZLYUywfnQ7Fn/sfv5bAHERFQGCRmB9GNiNTWezJvRlPWwvq6FzuEdeQvUkC8425sHVSY3zAVT9rwG81bbk1pvY1SWSa4i50I/zAAAdxZSxny5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jxOa3RnE reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jxOa3RnE"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1D6B1F8;
	Fri, 18 Sep 2026 13:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789729691;
	bh=pd+OS3tBP8CJ9F0+if3g0L9XTiTjKyDAlPFk7sYS0Cg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jxOa3RnEq2/CNxX0bfR1kunUgikbVV//SkHNMNfoRZorxeiHSqlD/OAOpbwivtvav
	 Ss3ClSRi+SGjDqFsdOHunjq21sBvn+l6vcL7XA4PZJtbw/CIofCZGd9tP3WmyTqmZz
	 IcBATwYWqSR9FPPPmRwDQmdmq/LgcbVR0zFsmoos=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Convert to new media orientation definitions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, David Heidelberg <david@ixit.cz>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, Paul Elder <paul.elder@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Quentin Schulz <quentin.schulz@theobroma-sy
 stems.com>, Richard Acayan <mailingradian@gmail.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Svyatoslav Ryhel <clamor95@gmail.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Thierry Reding <thierry.reding@kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>
Date: Fri, 18 Sep 2026 12:09:51 +0100
Message-ID: <178972979131.1723501.9444120486527129452@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Kieran Bingham (2026-09-18 11:44:14)
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the qualcomm device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>

Sashiko has noted that there is another new dts added in dts/qcom since
I wrote this patch.

I don't want to invalidate the above reviews by adding another change,
so I will send the single update to the new file separately as the core
definitions are already accepted now.

If someone /really/ wants me to add the change to
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi in this patch,
please let me know.

it looks like this:

----------- arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi ------=
-----
index 945127dacc82..f86d3e0d51a6 100644
@@ -3,10 +3,11 @@
  * Copyright (c) 2022-2024 Jianhua Lu <lujianhua000@gmail.com>
  */

 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
@@ -571,11 +572,11 @@ camera_front: camera@10 {
 		reset-gpios =3D <&tlmm 109 GPIO_ACTIVE_LOW>;

 		pinctrl-0 =3D <&cam_mclk3_default &camera_front_active>;
 		pinctrl-names =3D "default";

-		orientation =3D <0>; /* Front facing */
+		orientation =3D <MEDIA_ORIENTATION_FRONT>;
 		rotation =3D <270>;

 		port {
 			ov8856_front_ep: endpoint {
 				data-lanes =3D <1 2>;


--
Kieran


> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index f41ad446a39e..e2b7f1bd05ab 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -701,7 +702,7 @@ camera@10 {
>                 pinctrl-0 =3D <&cam_mclk3_default>;
>                 pinctrl-names =3D "default";
> =20
> -               orientation =3D <0>; /* Front facing */
> +               orientation =3D <MEDIA_ORIENTATION_FRONT>;
>                 rotation =3D <270>;
> =20
>                 port {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b=
/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 218573a97785..3b5f6a29e969 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
>  #include "sc8280xp.dtsi"
> @@ -683,7 +684,7 @@ camera@10 {
> =20
>                 clocks =3D <&camcc CAMCC_MCLK3_CLK>;
> =20
> -               orientation =3D <0>;      /* Front facing */
> +               orientation =3D <MEDIA_ORIENTATION_FRONT>;
> =20
>                 avdd-supply =3D <&vreg_l6q>;
>                 dvdd-supply =3D <&vreg_l2q>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm670-google-common.dtsi
> index b4854801a5f5..7880d85b52fe 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include "sdm670.dtsi"
> @@ -460,7 +461,7 @@ camera@1a {
>                 pinctrl-names =3D "default";
> =20
>                 rotation =3D <270>;
> -               orientation =3D <0>;
> +               orientation =3D <MEDIA_ORIENTATION_FRONT>;
> =20
>                 port {
>                         cam_front_endpoint: endpoint {
>=20
> --=20
> 2.52.0
>
