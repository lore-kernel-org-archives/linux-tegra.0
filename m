From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/9] pinctrl: tegra: Fix whitespace issues for improved
 readability
Date: Thu, 19 Mar 2020 22:36:55 +0530
Message-ID: <c354b94d-fb30-179f-c3c9-8004b73b6025@nvidia.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-5-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> Fix a few whitespace inconsistencies to make the code easier to read.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra194.c | 33 ++++++++++++------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> index daf44cf240c9..d4e84530158c 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -59,6 +59,7 @@ enum tegra_mux_dt {
>          {                                       \
>                  .name = #lid,                   \
>          }
> +
>   static struct tegra_function tegra194_functions[] = {
>          TEGRA_PIN_FUNCTION(rsvd0),
>          TEGRA_PIN_FUNCTION(rsvd1),
> @@ -70,7 +71,7 @@ static struct tegra_function tegra194_functions[] = {
>   #define DRV_PINGROUP_ENTRY_Y(r, drvdn_b, drvdn_w, drvup_b,     \
>                               drvup_w, slwr_b, slwr_w, slwf_b,   \
>                               slwf_w, bank)                      \
> -               .drv_reg = ((r)),                       \
> +               .drv_reg = ((r)),                               \
>                  .drv_bank = bank,                               \
>                  .drvdn_bit = drvdn_b,                           \
>                  .drvdn_width = drvdn_w,                         \
> @@ -89,7 +90,7 @@ static struct tegra_function tegra194_functions[] = {
>                  .hsm_bit = -1,                                  \
>                  .mux_bank = bank,                               \
>                  .mux_bit = 0,                                   \
> -               .pupd_reg = ((r)),              \
> +               .pupd_reg = ((r)),                              \
>                  .pupd_bank = bank,                              \
>                  .pupd_bit = 2,                                  \
>                  .tri_reg = ((r)),                               \
> @@ -109,20 +110,20 @@ static struct tegra_function tegra194_functions[] = {
> 
>   #define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_lpbk,       \
>                   e_input, e_lpdr, e_od, schmitt_b, drvtype, io_rail)    \
> -       {                                                       \
> -               .name = #pg_name,                               \
> -               .pins = pg_name##_pins,                         \
> -               .npins = ARRAY_SIZE(pg_name##_pins),            \
> -                       .funcs = {                              \
> -                               TEGRA_MUX_##f0,                 \
> -                               TEGRA_MUX_##f1,                 \
> -                               TEGRA_MUX_##f2,                 \
> -                               TEGRA_MUX_##f3,                 \
> -                       },                                      \
> -               PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,     \
> -                                    e_input, e_od,             \
> -                                    schmitt_b, drvtype),       \
> -               drive_##pg_name,                                \
> +       {                                                               \
> +               .name = #pg_name,                                       \
> +               .pins = pg_name##_pins,                                 \
> +               .npins = ARRAY_SIZE(pg_name##_pins),                    \
> +                       .funcs = {                                      \
> +                               TEGRA_MUX_##f0,                         \
> +                               TEGRA_MUX_##f1,                         \
> +                               TEGRA_MUX_##f2,                         \
> +                               TEGRA_MUX_##f3,                         \
> +                       },                                              \
> +               PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,             \
> +                                    e_input, e_od,                     \
> +                                    schmitt_b, drvtype),               \
> +               drive_##pg_name,                                        \
>          }
> 
>   static const struct tegra_pingroup tegra194_groups[] = {
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
