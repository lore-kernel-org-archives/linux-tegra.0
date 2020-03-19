From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/9] gpio: tegra186: Add Tegra194 pin ranges for GG.0 and
 GG.1
Date: Thu, 19 Mar 2020 22:36:22 +0530
Message-ID: <bbc13e00-d7e2-6233-fc6f-3708b7d1980b@nvidia.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 3/19/2020 5:57 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The GG.0 and GG.1 GPIOs serve as CLKREQ and RST pins, respectively, for
> PCIe controller 5 on Tegra194. When this controller is configured in
> endpoint mode, these pins need to be used as GPIOs by the PCIe endpoint
> driver. Typically the mode programming of these pins (GPIO vs. SFIO) is
> performed by early boot firmware to ensure that the configuration is
> consistent.
> 
> However, the GG.0 and GG.1 pins are part of a special power partition
> that is not enabled during early boot, and hence the early boot firmware
> cannot program these pins to be GPIOs (they are SFIO by default). Adding
> them as pin ranges for the pin controller allows the pin controller to
> be involved when these pins are requested as GPIOs and allows the proper
> programming to take place.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpio/gpio-tegra186.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 1086c1fcaf49..79b553dc39a3 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -839,11 +839,19 @@ static const struct tegra_gpio_port tegra194_main_ports[] = {
>          TEGRA194_MAIN_GPIO_PORT(GG, 0, 0, 2)
>   };
> 
> +static const struct tegra186_pin_range tegra194_main_pin_ranges[] = {
> +       { TEGRA194_MAIN_GPIO(GG, 0), "pex_l5_clkreq_n_pgg0" },
> +       { TEGRA194_MAIN_GPIO(GG, 1), "pex_l5_rst_n_pgg1" },
> +};
> +
>   static const struct tegra_gpio_soc tegra194_main_soc = {
>          .num_ports = ARRAY_SIZE(tegra194_main_ports),
>          .ports = tegra194_main_ports,
>          .name = "tegra194-gpio",
>          .instance = 0,
> +       .num_pin_ranges = ARRAY_SIZE(tegra194_main_pin_ranges),
> +       .pin_ranges = tegra194_main_pin_ranges,
> +       .pinmux = "nvidia,tegra194-pinmux",
>   };
> 
>   #define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)     \
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
