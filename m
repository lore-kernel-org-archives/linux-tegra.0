Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC444EC675;
	Fri, 18 Sep 2026 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737621; cv=none; b=DTDmpsJwM8W6IwUpBvDl6xloC0k+C3vJpVFoXVu5A7OtknUubAY/Kn2r1cy7p4j8fm/IQTzLTTQTMrM1AHrKy1z4+EQRmG+SX9MWFm0wtgZIPOrz5O6dahD8r0VqyNIxafNjAdIBPnVHgZmtL1MbqkKLlGvOBlnJOsFWjvIe2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737621; c=relaxed/simple;
	bh=mOT+ZZhGP5ccEcxa5D9560p30Tzgnpb1fQq5rAFNPHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kg9g4YPCpPuNKNb/WXmpSPZe3TaO1JvpLZ6YX68MiRb1KP1Tk5fYTTcWW5gktmg3mS4Q6q1ssJbdsiuF6rpUGbKJd9/WITWYnxOSPyyF1ud/vWKWXW4p20RYf/5ci7rpEZ8QzSrj5YeYm4/PgevQPGK7nWaWwSCVzEwIqiGL+YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pVJEF3ze; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pVJEF3ze"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC89E4D7A;
	Fri, 18 Sep 2026 15:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789737511;
	bh=mOT+ZZhGP5ccEcxa5D9560p30Tzgnpb1fQq5rAFNPHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVJEF3zeBamo6zonI09xcQri3fYoyTjGlvpxKQvq8DA1lZUyrBmF3fmlNg0QWBZm6
	 afftWWvrHEmYx4GaVVvK1jDBAQ+k0yoD15sXk0zXSC/smn8d4sQ8kyFbgMtLr1wyOT
	 +X88e9xf8szv0kV8lYRCDNVlWSRE0OMtfHSWlm0Y=
Date: Fri, 18 Sep 2026 16:20:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Convert to new media
 orientation definitions
Message-ID: <20260918132013.GG59058@killaraus.ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>
 <178972979131.1723501.9444120486527129452@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178972979131.1723501.9444120486527129452@ping.linuxembedded.co.uk>

On Fri, Sep 18, 2026 at 12:09:51PM +0100, Kieran Bingham wrote:
> Quoting Kieran Bingham (2026-09-18 11:44:14)
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > The orientation property for video interface devices now has definitions
> > to prevent hardcoded integer values for the enum options.
> > 
> > Update the users throughout the qualcomm device trees to use the new
> > definitions.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: David Heidelberg <david@ixit.cz>
> 
> Sashiko has noted that there is another new dts added in dts/qcom since
> I wrote this patch.
> 
> I don't want to invalidate the above reviews by adding another change,
> so I will send the single update to the new file separately as the core
> definitions are already accepted now.
> 
> If someone /really/ wants me to add the change to
> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi in this patch,
> please let me know.
> 
> it looks like this:
> 
> ----------- arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi -----------
> index 945127dacc82..f86d3e0d51a6 100644
> @@ -3,10 +3,11 @@
>   * Copyright (c) 2022-2024 Jianhua Lu <lujianhua000@gmail.com>
>   */
> 
>  #include <dt-bindings/arm/qcom,ids.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
> @@ -571,11 +572,11 @@ camera_front: camera@10 {
>  		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
> 
>  		pinctrl-0 = <&cam_mclk3_default &camera_front_active>;
>  		pinctrl-names = "default";
> 
> -		orientation = <0>; /* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>  		rotation = <270>;
> 
>  		port {
>  			ov8856_front_ep: endpoint {
>  				data-lanes = <1 2>;

I don't mind either way, and I think you can keep the existing R-b tags
if you add that hunk.

> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
> >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
> >  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
> >  3 files changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > index f41ad446a39e..e2b7f1bd05ab 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > @@ -13,6 +13,7 @@
> >  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> >  #include <dt-bindings/leds/common.h>
> >  #include <dt-bindings/media/video-interfaces.h>
> > +#include <dt-bindings/media/video-interface-devices.h>
> >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >  #include <dt-bindings/sound/qcom,q6asm.h>
> > @@ -701,7 +702,7 @@ camera@10 {
> >                 pinctrl-0 = <&cam_mclk3_default>;
> >                 pinctrl-names = "default";
> >  
> > -               orientation = <0>; /* Front facing */
> > +               orientation = <MEDIA_ORIENTATION_FRONT>;
> >                 rotation = <270>;
> >  
> >                 port {
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > index 218573a97785..3b5f6a29e969 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > @@ -11,6 +11,7 @@
> >  #include <dt-bindings/input/gpio-keys.h>
> >  #include <dt-bindings/input/input.h>
> >  #include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/media/video-interface-devices.h>
> >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >  
> >  #include "sc8280xp.dtsi"
> > @@ -683,7 +684,7 @@ camera@10 {
> >  
> >                 clocks = <&camcc CAMCC_MCLK3_CLK>;
> >  
> > -               orientation = <0>;      /* Front facing */
> > +               orientation = <MEDIA_ORIENTATION_FRONT>;
> >  
> >                 avdd-supply = <&vreg_l6q>;
> >                 dvdd-supply = <&vreg_l2q>;
> > diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> > index b4854801a5f5..7880d85b52fe 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> > @@ -9,6 +9,7 @@
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/input/input.h>
> >  #include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/media/video-interface-devices.h>
> >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  #include <dt-bindings/power/qcom-rpmpd.h>
> >  #include "sdm670.dtsi"
> > @@ -460,7 +461,7 @@ camera@1a {
> >                 pinctrl-names = "default";
> >  
> >                 rotation = <270>;
> > -               orientation = <0>;
> > +               orientation = <MEDIA_ORIENTATION_FRONT>;
> >  
> >                 port {
> >                         cam_front_endpoint: endpoint {
> > 

-- 
Regards,

Laurent Pinchart
