From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM:tegra20-colibri-512.dts: Change tristate status for
 i2c pinmux
Date: Fri, 21 Jun 2013 10:24:33 -0600
Message-ID: <51C47E41.6050609@wwwdotorg.org>
References: <alpine.DEB.2.02.1306202302210.11096@dionysos>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1306202302210.11096@dionysos>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Anna-Maria Gleixner <anna-maria-WyZXDcvM26CzQB+pC5nmwQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/20/2013 03:08 PM, Anna-Maria Gleixner wrote:
> The nvidia,tristate entry for the pinmux of i2c1 an i2c3 was set to
> tristate. This results in non working i2c, because the i2c pins are
> not actively driven. Set the entries to "driven".

Lucas, can you please comment on this patch? It sounds correct to me,
but I would have assumed you'd tested I2C already when you wrote the
original DT?

Oh actually, now that I look further, I see that tegra20-iris-512.dts
includes this file, and overrides some of the tristate values there.
What's the thinking behind that, and does this patch fit into it?

> diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi

>                  nvidia,pins = "rm";
>                  nvidia,function = "i2c1";
>                  nvidia,pull = <0>;
> -                nvidia,tristate = <1>;
> +                nvidia,tristate = <0>;
>              };
>              i2c3 {
>                  nvidia,pins = "dtf";
>                  nvidia,function = "i2c3";
>                  nvidia,pull = <0>;
> -                nvidia,tristate = <1>;
> +                nvidia,tristate = <0>;
>              };
>              i2cddc {
>                  nvidia,pins = "ddc";
