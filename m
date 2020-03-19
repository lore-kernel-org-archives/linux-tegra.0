From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/9] pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
Date: Thu, 19 Mar 2020 22:37:19 +0530
Message-ID: <86a32802-709a-357a-9169-dc97112ae256@nvidia.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-6-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> Properly spell "Schmitt" in the kerneldoc for pin group definitions.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
> index 0fc82eea9cf1..520865979d4a 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -107,7 +107,7 @@ struct tegra_function {
>    *                     drvup, slwr, slwf, and drvtype parameters.
>    * @drv_bank:          Drive fields register bank.
>    * @hsm_bit:           High Speed Mode register bit.
> - * @schmitt_bit:       Scmitt register bit.
> + * @schmitt_bit:       Schmitt register bit.
>    * @lpmd_bit:          Low Power Mode register bit.
>    * @drvdn_bit:         Drive Down register bit.
>    * @drvdn_width:       Drive Down field width.
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
