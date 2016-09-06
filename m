From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/6] dt/bindings: Add bindings for Tegra GMI controller
Date: Tue, 6 Sep 2016 11:32:14 +0100
Message-ID: <a3a2371b-5d98-db2d-b7e4-be6d08cb7271@nvidia.com>
References: <1472045838-22628-1-git-send-email-mirza.krak@gmail.com>
 <1472045838-22628-4-git-send-email-mirza.krak@gmail.com>
 <de2fb909-829e-6c04-4f6a-442cbb9171c9@nvidia.com>
 <CALw8SCVcPymDZ8NyUbeanRF0TCT1TZzL6iRDticYA42FWrEWqw@mail.gmail.com>
 <20160830170636.GA8741@rob-hp-laptop>
 <CALw8SCUYQGWXn7=Jpn=uvFvvPRVFQGrtSNot+-tVgP73yAEEOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALw8SCUYQGWXn7=Jpn=uvFvvPRVFQGrtSNot+-tVgP73yAEEOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 31/08/16 12:22, Mirza Krak wrote:
> 2016-08-30 19:06 GMT+02:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:

...

>>>                  nvidia,snor-cs = <4>;
>>
>> NAK, no custom CS properties.

Ok, so ...

> gmi@70090000 {
>         compatible = "nvidia,tegra20-gmi";
>         reg = <0x70009000 0x1000>;
>         #address-cells = <2>;
>         #size-cells = <1>;
>         clocks = <&tegra_car TEGRA20_CLK_NOR>;
>         clock-names = "gmi";
>         resets = <&tegra_car 42>;
>         reset-names = "gmi";
>         ranges = <4 0 0xd0000000 0xfffffff>;
> 
>         status = "okay";
> 
>         bus@4,0 {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges = <0 4 0 0x40000>;
> 
>                 nvidia,snor-mux-mode;
>                 nvidia,snor-adv-inv;
> 
>                 can@0 {
>                         reg = <0 0x100>;
>                         ...
>                 };
> 
>                 can@40000 {
>                         reg = <0x40000 0x100>;
>                         ...
>                 };
>         };
> };
> 
> Have I understood you correct?
> 
> Also wanted to verify the example case where you only have on device
> connected to one CS#, from what I see in other implementations it
> seems OK to put the CS# in the reg property in that case. Is this
> correct?
> 
> Example with one SJA1000 CAN controller connected to the GMI bus
> on CS4:
> 
> gmi@70090000 {
>         compatible = "nvidia,tegra20-gmi";
>         reg = <0x70009000 0x1000>;
>         #address-cells = <2>;
>         #size-cells = <1>;
>         clocks = <&tegra_car TEGRA20_CLK_NOR>;
>         clock-names = "gmi";
>         resets = <&tegra_car 42>;
>         reset-names = "gmi";
>         ranges = <4 0 0xd0000000 0xfffffff>;
> 
>         status = "okay";
> 
>         can@4,0 {
>                 reg = <4 0 0x100>;
>                 nvidia,snor-mux-mode;
>                 nvidia,snor-adv-inv;
>                 ...
>         };
> };
> 
> Jon, to be able to handle both cases in the driver we would first
> attempt to decode the CS# from the ranges property, and fallback to
> reg property if no ranges are defined. Does that sound reasonable?

Given the above examples that may be supported, is there a
better/simpler way to extract the CS# than what Mirza is proposing? For
example, from the node-name unit-address?

Cheers
Jon

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
