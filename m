From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] dt/bindings: Add bindings for Tegra GMI controller
Date: Tue, 23 Aug 2016 15:48:25 +0100
Message-ID: <07157e79-a22c-2b49-24c8-3a2c266f899f@nvidia.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
 <1470512452-8322-4-git-send-email-mirza.krak@gmail.com>
 <901be576-a810-c630-9b83-de922e945df0@nvidia.com>
 <CALw8SCV9AyaAPKpRwRp72-dUz=cW2QZyywqjzS1noonTyGDYag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALw8SCV9AyaAPKpRwRp72-dUz=cW2QZyywqjzS1noonTyGDYag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 23/08/16 11:33, Mirza Krak wrote:

...

> Like we discussed I am now trying to implement this but without
> success and I am starting to think that it is not that simple unless I
> am missing something.
> 
> Below tree
> 
> gmi@70009000 {
>      status = "okay";
>      #address-cells = <1>;
>      #size-cells = <1>;
>      ranges = <4 0x48000000 0x7ffffff>;
> 
>      bus@4 {
>           compatible = "simple-bus";
>           reg = <4 0>;

I don't think you want reg here.

>           #address-cells = <1>;
>           #size-cells = <1>;

May be ranges here?

>          nvidia,snor-mux-mode;
>          nvidia,snor-adv-inv;
> 
>         can@0 {
>               compatible = "nxp,sja1000";
>               reg = <0 0x100>;
>               ....
>      };
> 
>      can@40000 {
>            compatible = "nxp,sja1000";
>            reg = <0x40000 0x100>;
>            ....
>     };
> };
> };

Have a look at some other drivers for example:

Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt

Cheers
Jon

-- 
nvpublic
