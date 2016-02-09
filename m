From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add stdout-path for various boards
Date: Tue, 09 Feb 2016 09:00:17 -0800
Message-ID: <aab6c81e6454cf1966d311e47bbe4beb@agner.ch>
References: <1455025920-21875-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455025920-21875-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2016-02-09 05:51, Jon Hunter wrote:
> For Tegra boards, the device-tree alias serial0 is used for the console
> and so add the stdout-path information so that the console no longer
> needs to be passed via the kernel boot parameters.
> 
> This has been tested on boards, tegra20-trimslice, tegra30-beaver,
> tegra114-dalmore and tegra124-jetson-tk1.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> 
> The only boards that I have not modified are tegra114-roth and
> tegra114-tn7 because these boards have two entries for console
> in the *.dts file. AFAICT we cannot suppport multiple consoles
> via the stdout-path and if a console is specified by the kernel
> boot parameters then this sets the kernel variable
> "console_set_on_cmdline" and prevents the stdout-path console
> being registered. If there is a better way to handle these boards
> via device-tree let me know.
> 
>  arch/arm/boot/dts/tegra114-dalmore.dts        | 4 ++++
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 4 ++++
>  arch/arm/boot/dts/tegra124-nyan.dtsi          | 4 ++++
>  arch/arm/boot/dts/tegra124-venice2.dts        | 4 ++++
>  arch/arm/boot/dts/tegra20-harmony.dts         | 4 ++++
>  arch/arm/boot/dts/tegra20-iris-512.dts        | 4 ++++
>  arch/arm/boot/dts/tegra20-medcom-wide.dts     | 4 ++++
>  arch/arm/boot/dts/tegra20-paz00.dts           | 4 ++++
>  arch/arm/boot/dts/tegra20-seaboard.dts        | 4 ++++
>  arch/arm/boot/dts/tegra20-tamonten.dtsi       | 4 ++++
>  arch/arm/boot/dts/tegra20-trimslice.dts       | 4 ++++
>  arch/arm/boot/dts/tegra20-ventana.dts         | 4 ++++
>  arch/arm/boot/dts/tegra20-whistler.dts        | 4 ++++
>  arch/arm/boot/dts/tegra30-apalis-eval.dts     | 4 ++++
>  arch/arm/boot/dts/tegra30-beaver.dts          | 4 ++++
>  arch/arm/boot/dts/tegra30-cardhu.dtsi         | 4 ++++

For

>  arch/arm/boot/dts/tegra30-apalis-eval.dts     | 4 ++++
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 4 ++++
>  arch/arm/boot/dts/tegra20-iris-512.dts        | 4 ++++

Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

--
Stefan
