Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2E4F93D1;
	Fri, 18 Sep 2026 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738428; cv=none; b=C/DlHPWs29Fk9jSyHMtDS0JYrMVPPQB7gTZ44UxwPFps92abzfejGY3H1wzvEvSfrkbxr2LEexTVAlrEETTQ0rIDY1eYjXSAO8cNv1Z6iXVr1UGX52HIi/PI7njvHWXIUlcg3Ts6PCKilfoAcPbRJkwZEMlhGcOr7ksS9aGjY0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738428; c=relaxed/simple;
	bh=82Mn9uZcABYJuJY9Ja/otiQ81SD5L074KXYkhdIuJ6I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=c5Gmy+AJUX13j5mSiiQf/6taRQMakU0omPrgseKgEJpWx9tysnWzjylUxcnbMjWiNyFconW0h+UlF4lqCyomkAHd9gt2zxok+w7AkS52XgnYmV1weXtlI4/dXFdUr1UjnJAqZhxT1yhQJSaJEoJ3zkVS+N7nvKgxuZuF5wHhEEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sSs1i0F9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sSs1i0F9"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AD234F05;
	Fri, 18 Sep 2026 15:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789738313;
	bh=82Mn9uZcABYJuJY9Ja/otiQ81SD5L074KXYkhdIuJ6I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sSs1i0F90LIHx/AZUsiKA+YnwsGpLmBo4KVoj+4PCYr811SKW5YYmJfzvEQ+leTOG
	 VCaTQT21x5BR83STKDA30U4LByAcaDz/jNhdEjxPUk9zaNjq9ie6lUfcemA34CJvoF
	 NZ/sE+F0CEFUVp37+OhHkPGXGNYIHHWb0YThntK4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260918132013.GG59058@killaraus.ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com> <178972979131.1723501.9444120486527129452@ping.linuxembedded.co.uk> <20260918132013.GG59058@killaraus.ideasonboard.com>
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Convert to new media orientation definitions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, Paul Elder <paul.elder@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Quentin Schulz <quentin.schulz@theobroma-systems.com>, Richard Acayan <mailingradian@gmail.com>, 
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Svyatoslav Ryhel <clamor95@gmail.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Thierry Reding <thierry.reding@kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, David Heidelberg <david@ixit.cz>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 18 Sep 2026 14:33:34 +0100
Message-ID: <178973841405.1723501.9051265194315500867@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Laurent Pinchart (2026-09-18 14:20:13)
> On Fri, Sep 18, 2026 at 12:09:51PM +0100, Kieran Bingham wrote:
> > Quoting Kieran Bingham (2026-09-18 11:44:14)
> > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >=20
> > > The orientation property for video interface devices now has definiti=
ons
> > > to prevent hardcoded integer values for the enum options.
> > >=20
> > > Update the users throughout the qualcomm device trees to use the new
> > > definitions.
> > >=20
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: David Heidelberg <david@ixit.cz>
> >=20
> > Sashiko has noted that there is another new dts added in dts/qcom since
> > I wrote this patch.
> >=20
> > I don't want to invalidate the above reviews by adding another change,
> > so I will send the single update to the new file separately as the core
> > definitions are already accepted now.
> >=20
> > If someone /really/ wants me to add the change to
> > arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi in this patch,
> > please let me know.
> >=20
> > it looks like this:
> >=20
> > ----------- arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi --=
---------
> > index 945127dacc82..f86d3e0d51a6 100644
> > @@ -3,10 +3,11 @@
> >   * Copyright (c) 2022-2024 Jianhua Lu <lujianhua000@gmail.com>
> >   */
> >=20
> >  #include <dt-bindings/arm/qcom,ids.h>
> >  #include <dt-bindings/media/video-interfaces.h>
> > +#include <dt-bindings/media/video-interface-devices.h>
> >  #include <dt-bindings/phy/phy.h>
> >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >  #include <dt-bindings/usb/pd.h>
> >  #include "sm8250.dtsi"
> >  #include "pm8150.dtsi"
> > @@ -571,11 +572,11 @@ camera_front: camera@10 {
> >               reset-gpios =3D <&tlmm 109 GPIO_ACTIVE_LOW>;
> >=20
> >               pinctrl-0 =3D <&cam_mclk3_default &camera_front_active>;
> >               pinctrl-names =3D "default";
> >=20
> > -             orientation =3D <0>; /* Front facing */
> > +             orientation =3D <MEDIA_ORIENTATION_FRONT>;
> >               rotation =3D <270>;
> >=20
> >               port {
> >                       ov8856_front_ep: endpoint {
> >                               data-lanes =3D <1 2>;
>=20
> I don't mind either way, and I think you can keep the existing R-b tags
> if you add that hunk.

As noticed by Thierry, it will also impact things depending on who
applies this patch and where.

It seems like the headers used appear in linux-next already now that
Sakari has merged them, but this hunk won't apply on
media-committers/next ... so I'll keep it separate until we can let the
dust settle.

--
Kieran

>=20
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.co=
m>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
> > >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
> > >  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
> > >  3 files changed, 6 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arc=
h/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > index f41ad446a39e..e2b7f1bd05ab 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > @@ -13,6 +13,7 @@
> > >  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> > >  #include <dt-bindings/leds/common.h>
> > >  #include <dt-bindings/media/video-interfaces.h>
> > > +#include <dt-bindings/media/video-interface-devices.h>
> > >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > >  #include <dt-bindings/sound/qcom,q6asm.h>
> > > @@ -701,7 +702,7 @@ camera@10 {
> > >                 pinctrl-0 =3D <&cam_mclk3_default>;
> > >                 pinctrl-names =3D "default";
> > > =20
> > > -               orientation =3D <0>; /* Front facing */
> > > +               orientation =3D <MEDIA_ORIENTATION_FRONT>;
> > >                 rotation =3D <270>;
> > > =20
> > >                 port {
> > > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.d=
ts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > > index 218573a97785..3b5f6a29e969 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > > @@ -11,6 +11,7 @@
> > >  #include <dt-bindings/input/gpio-keys.h>
> > >  #include <dt-bindings/input/input.h>
> > >  #include <dt-bindings/leds/common.h>
> > > +#include <dt-bindings/media/video-interface-devices.h>
> > >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > =20
> > >  #include "sc8280xp.dtsi"
> > > @@ -683,7 +684,7 @@ camera@10 {
> > > =20
> > >                 clocks =3D <&camcc CAMCC_MCLK3_CLK>;
> > > =20
> > > -               orientation =3D <0>;      /* Front facing */
> > > +               orientation =3D <MEDIA_ORIENTATION_FRONT>;
> > > =20
> > >                 avdd-supply =3D <&vreg_l6q>;
> > >                 dvdd-supply =3D <&vreg_l2q>;
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arc=
h/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> > > index b4854801a5f5..7880d85b52fe 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> > > @@ -9,6 +9,7 @@
> > >  #include <dt-bindings/gpio/gpio.h>
> > >  #include <dt-bindings/input/input.h>
> > >  #include <dt-bindings/leds/common.h>
> > > +#include <dt-bindings/media/video-interface-devices.h>
> > >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > >  #include <dt-bindings/power/qcom-rpmpd.h>
> > >  #include "sdm670.dtsi"
> > > @@ -460,7 +461,7 @@ camera@1a {
> > >                 pinctrl-names =3D "default";
> > > =20
> > >                 rotation =3D <270>;
> > > -               orientation =3D <0>;
> > > +               orientation =3D <MEDIA_ORIENTATION_FRONT>;
> > > =20
> > >                 port {
> > >                         cam_front_endpoint: endpoint {
> > >=20
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
