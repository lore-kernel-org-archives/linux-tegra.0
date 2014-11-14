From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] of: replace Asahi Kasei Corp venter prefix
Date: Fri, 14 Nov 2014 10:16:18 +0100
Message-ID: <2984171.bo9yu8oQT6@wuerfel>
References: <5398AB07.4040304@wwwdotorg.org> <87k32yd0bd.wl%kuninori.morimoto.gx@renesas.com> <5465BFA2.9050706@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5465BFA2.9050706@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Joe Perches <joe@perches.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, Linux-sh list <linux-sh@vger.kernel.org>, Magnus <magnus.damm@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Friday 14 November 2014 17:38:58 Alexandre Courbot wrote:
> > diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
> > index a1d4bf9..7f5cf80 100644
> > --- a/arch/arm/boot/dts/tegra20-seaboard.dts
> > +++ b/arch/arm/boot/dts/tegra20-seaboard.dts
> > @@ -405,7 +405,7 @@
> >               clock-frequency = <400000>;
> >
> >               magnetometer@c {
> > -                     compatible = "ak,ak8975";
> > +                     compatible = "asahi-kasei,ak8975";
> 
> Mmm. So does this mean this device was never probed because the driver 
> did not recognize its compatible property? I cannot find "ak,ak8975" 
> anywhere else in the kernel.
> 

No, the i2c bus behaves in a special way by matching the "ak8975"
i2c driver name with any "*,ak8975" DT compatible string. Both
of the above will work with existing kernels.

	Arnd
