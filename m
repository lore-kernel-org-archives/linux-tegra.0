From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: Correctly check the supported
 configuration
Date: Mon, 2 May 2016 10:46:36 -0600
Message-ID: <5727846C.1090309@wwwdotorg.org>
References: <1462199330-1536-1-git-send-email-ldewangan@nvidia.com>
 <1462199330-1536-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462199330-1536-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/02/2016 08:28 AM, Laxman Dewangan wrote:
> The pincontrol registers of Tegra chips has multiple filed per
> registers. There is two type of registers mux and drive. All
> configurations belongs to one of these registers.
>
> If any configurations are supported then <config>_bit is set to
> bit position of these registers otherwise -1 to not support it.
> The member is defined as
> 	s32 <config>_bit:6;
>
> So if config is not supported ifor given SoC then it is set to -1
> in soc pinmmux table.
> In common driver code, to find out that given config is supported
> or not, it is checked as:
>
> s8 bit = <config>_bit;
> if (bit > 31) {
> 	/* Not supported */
> }
>
> But in this case, bit is s8 and hence for non supporting it is -1.
>
> Correct the check as:
> if (bit < 0 || bit > 31) {
> 	/* Not supported */
> }
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> I think it should go on stable.
>
>   drivers/pinctrl/tegra/pinctrl-tegra.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index fb00129..cc117f7 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -417,7 +417,7 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
>   		return -ENOTSUPP;
>   	}
>
> -	if (*reg < 0 || *bit > 31) {
> +	if (*reg < 0 || *bit < 0 || *bit > 31)  {

May as well only test (*bit < 0)? Same for your other patch.

It'd be good to add the following tag to the commit description:

Fixes: e4c02dced975 ("pinctrl: tegra: use signed bitfields for optional 
fields")

This patch has the potential to suddenly catch more invalid 
configurations than it used to, and thus break some boards. However, I 
think this actually is safe; any errors that will be caught after this 
patch would have been caught before the "signed bitfields" patch above, 
and briefly looking at the (subject lines of) patches that have gone in 
since the "signed bitfields" patch was applied, I don't think we'll see 
any new issues.
