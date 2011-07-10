From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: remove generic disp clock divisor flag
Date: Sun, 10 Jul 2011 14:17:28 -0700
Message-ID: <CAMbhsRR2iF_0z7eP_vBPk90u=Xj9WPgthLzaKhtsmwJZjU7+gA@mail.gmail.com>
References: <1307498003-8550-1-git-send-email-rmorell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1307498003-8550-1-git-send-email-rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 7, 2011 at 6:53 PM, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrot=
e:
> Although disp1 and disp2 have 7.1 divisors, their corresponding
> registers in the clk_rst block are not the interface to program the
> divisors. =A0Setting the generic DIV_U71 flag may cause the code to
> attempt to program the clock at a different divisor, which will confu=
se
> any code attempting to use that clock since it isn't actually being
> divided.
>
> Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>
> This bugfix applies to Linus's 2.6.39. =A0However, since no drivers a=
re using
> these clocks in that kernel, this should probably just be queued up f=
or 3.0.
>
> It also applies to linux-tegra-2.6.3[69].
>
> Thanks.
>
> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegr=
a/tegra2_clocks.c
> index bb61807..0fe9b3e 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -2182,8 +2182,8 @@ struct clk tegra_list_clks[] =3D {
> =A0 =A0 =A0 =A0PERIPH_CLK("tvo", =A0 =A0 =A0 "tvo", =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0NULL, =A0 49, =A0 =A0 0x188, =A0250000000, mux_pllp_pll=
d_pllc_clkm, =A0 =A0 MUX | DIV_U71), /* requires min voltage */
> =A0 =A0 =A0 =A0PERIPH_CLK("hdmi", =A0 =A0 =A0"hdmi", =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 NULL, =A0 51, =A0 =A0 0x18c, =A0600000000, mux_pllp_pll=
d_pllc_clkm, =A0 =A0 MUX | DIV_U71), /* requires min voltage */
> =A0 =A0 =A0 =A0PERIPH_CLK("tvdac", =A0 =A0 "tvdac", =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0NULL, =A0 53, =A0 =A0 0x194, =A0250000000, mux_pllp_plld_pl=
lc_clkm, =A0 =A0 MUX | DIV_U71), /* requires min voltage */
> - =A0 =A0 =A0 PERIPH_CLK("disp1", =A0 =A0 "tegradc.0", =A0 =A0 =A0 =A0=
 =A0 =A0NULL, =A0 27, =A0 =A0 0x138, =A0600000000, mux_pllp_plld_pllc_c=
lkm, =A0 =A0 MUX | DIV_U71), /* scales with voltage and process_id */
> - =A0 =A0 =A0 PERIPH_CLK("disp2", =A0 =A0 "tegradc.1", =A0 =A0 =A0 =A0=
 =A0 =A0NULL, =A0 26, =A0 =A0 0x13c, =A0600000000, mux_pllp_plld_pllc_c=
lkm, =A0 =A0 MUX | DIV_U71), /* scales with voltage and process_id */
> + =A0 =A0 =A0 PERIPH_CLK("disp1", =A0 =A0 "tegradc.0", =A0 =A0 =A0 =A0=
 =A0 =A0NULL, =A0 27, =A0 =A0 0x138, =A0600000000, mux_pllp_plld_pllc_c=
lkm, =A0 =A0 MUX), /* scales with voltage and process_id */
> + =A0 =A0 =A0 PERIPH_CLK("disp2", =A0 =A0 "tegradc.1", =A0 =A0 =A0 =A0=
 =A0 =A0NULL, =A0 26, =A0 =A0 0x13c, =A0600000000, mux_pllp_plld_pllc_c=
lkm, =A0 =A0 MUX), /* scales with voltage and process_id */
> =A0 =A0 =A0 =A0PERIPH_CLK("usbd", =A0 =A0 =A0"fsl-tegra-udc", =A0 =A0=
 =A0 =A0NULL, =A0 22, =A0 =A0 0, =A0 =A0 =A0480000000, mux_clk_m, =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0), /* requires min voltage */
> =A0 =A0 =A0 =A0PERIPH_CLK("usb2", =A0 =A0 =A0"tegra-ehci.1", =A0 =A0 =
=A0 =A0 NULL, =A0 58, =A0 =A0 0, =A0 =A0 =A0480000000, mux_clk_m, =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0), /* requires min voltage */
> =A0 =A0 =A0 =A0PERIPH_CLK("usb3", =A0 =A0 =A0"tegra-ehci.2", =A0 =A0 =
=A0 =A0 NULL, =A0 59, =A0 =A0 0, =A0 =A0 =A0480000000, mux_clk_m, =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0), /* requires min voltage */
> --
> 1.7.3.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Ack, putting in for-next for 3.1
