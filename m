From: Andi <andi.shyti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC 2/2] arm/tegra: add timeout to PCIe PLL lock detection loop
Date: Tue, 6 Mar 2012 10:38:12 +0100
Message-ID: <CANndwHav6JcqNOuOXcD1dSNUmVYAV=MJ+y+ud6202q6Dh42Vgw@mail.gmail.com>
References: <1331023544-6439-1-git-send-email-mad_soft@inbox.ru>
	<1331023544-6439-3-git-send-email-mad_soft@inbox.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331023544-6439-3-git-send-email-mad_soft-aPYA7nAdAYY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Mar 6, 2012 at 9:45 AM, Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org> wr=
ote:
> Tegra PCIe driver waits for PLL to lock using busy loop.
> If PLL fails to lock for some reason, this leads to silent lockup
> while booting (as PCIe code is not modular).
>
> Fix by adding timeout, so if PLL doesn't lock in a couple
> of seconds, just PCIe driver fails and machine continues to boot.
>
> Signed-off-by: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
> ---
> =C2=A0arch/arm/mach-tegra/pcie.c | =C2=A0 14 +++++++++++---
> =C2=A01 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
> index 14b29ab..ffdfdd4 100644
> --- a/arch/arm/mach-tegra/pcie.c
> +++ b/arch/arm/mach-tegra/pcie.c
> @@ -585,10 +585,10 @@ static void tegra_pcie_setup_translations(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0afi_writel(0, AFI_MSI_BAR_SZ);
> =C2=A0}
>
> -static void tegra_pcie_enable_controller(void)
> +static int tegra_pcie_enable_controller(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val, reg;
> - =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 int i, timeout;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable slot clock and pulse the reset s=
ignals */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0, reg =3D AFI_PEX0_CTRL; i < 2=
; i++, reg +=3D 0x8) {
> @@ -639,8 +639,14 @@ static void tegra_pcie_enable_controller(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pads_writel(0xfa5cfa5c, 0xc8);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for the PLL to lock */
> + =C2=A0 =C2=A0 =C2=A0 timeout =3D 2000;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0do {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D pads_r=
eadl(PADS_PLL_CTL);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mdelay(1);

why are you using an mdelay? If you need to sleep 1ms just use
usleep_range or similar

Andi

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (--timeout =3D=3D=
 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pr_err("Tegra PCIe error: timeout waiting for PLL\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return -EBUSY;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (!(val & PADS_PLL_CTL_LOCKDET));
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* turn off IDDQ override */
> @@ -921,7 +927,9 @@ int __init tegra_pcie_init(bool init_port0, bool =
init_port1)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;
>
> - =C2=A0 =C2=A0 =C2=A0 tegra_pcie_enable_controller();
> + =C2=A0 =C2=A0 =C2=A0 err =3D tegra_pcie_enable_controller();
> + =C2=A0 =C2=A0 =C2=A0 if (err)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* setup the AFI address translations */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tegra_pcie_setup_translations();
> --
> 1.7.5.1.300.gc565c
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/
