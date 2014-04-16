From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: define Jetson TK1 regulators
Date: Wed, 16 Apr 2014 11:18:35 +0300
Message-ID: <20140416081835.GB30476@tbergstrom-lnx.Nvidia.com>
References: <1397516120-18220-1-git-send-email-swarren@wwwdotorg.org>
 <CAL1qeaF+Kha6bS27OLoWw-G2Tv6PzeB6=GcK6dM6s_hWidvLiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaF+Kha6bS27OLoWw-G2Tv6PzeB6=GcK6dM6s_hWidvLiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 16, 2014 at 02:24:42AM +0200, Andrew Bresticker wrote:
> > +                               ldo11 {
> > +                                       regulator-name = "+1.8V_RUN_VPP_FUSE";
> > +                                       regulator-min-microvolt = <1800000>;
> > +                                       regulator-max-microvolt = <1800000>;
> > +                               };
> > +                       };
> >                 };
> >         };
> >
> > @@ -1462,6 +1611,7 @@
> >                 cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> >                 power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
> >                 bus-width = <4>;
> > +               vmmc-supply = <&vddio_sdmmc3>;
> 
> I don't have schematics for this board, but I suspect you mean
> vqmmc-supply here, per the discussion in the Venice2 VQMMC thread.
> 

Schematics can be found at https://developer.nvidia.com/jetson-tk1-support

Cheers,

Peter.
