From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 8/9] pinctrl: tegra: Renumber the GG.0 and GG.1 pins
Date: Thu, 19 Mar 2020 22:38:32 +0530
Message-ID: <eb619976-96b9-5b7d-a8d8-9cb629b1ab81@nvidia.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-9-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200319122737.3063291-9-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 3/19/2020 5:57 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding@nvidia.com>
> 
> There is no need to define these at a specific offset since they are the
> only pins defined for this SoC generation. Begin numbering them at 0.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra194.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> index 61fc7e680788..61afe5fe9dec 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -24,17 +24,14 @@
> 
>   /* Define unique ID for each pins */
>   enum pin_id {
> -       TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0 = 256,
> -       TEGRA_PIN_PEX_L5_RST_N_PGG1 = 257,
> -       TEGRA_PIN_NUM_GPIOS = 258,
> +       TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
> +       TEGRA_PIN_PEX_L5_RST_N_PGG1,
>   };
> 
>   /* Table for pin descriptor */
>   static const struct pinctrl_pin_desc tegra194_pins[] = {
> -       PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
> -                   "TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0"),
> -       PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1,
> -                   "TEGRA_PIN_PEX_L5_RST_N_PGG1"),
> +       PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0, "PEX_L5_CLKREQ_N_PGG0"),
> +       PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1, "PEX_L5_RST_N_PGG1"),
>   };
> 
>   static const unsigned int pex_l5_clkreq_n_pgg0_pins[] = {
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
