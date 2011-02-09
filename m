From: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] usb: host: ehci-hcd: Add controller_resets_phy quirk
Date: Wed, 9 Feb 2011 17:01:57 +0100
Message-ID: <4D52BA75.5010409@parrot.com>
References: <1297228927-23497-1-git-send-email-benoit@android.com> <1297228927-23497-3-git-send-email-benoit@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297228927-23497-3-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Benoit Goby a =E9crit :
> From: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra quirk: Resetting the controller has the side effect of resettin=
g
> the PHY. Only reset the controller when doing so won't also reset the
> phy.
>=20
> Signed-off-by: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/host/ehci-hcd.c |    3 ++-
>  drivers/usb/host/ehci.h     |    1 +
>  2 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.=
c
> index 30515d3..7afa345 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -275,7 +275,8 @@ static int ehci_reset (struct ehci_hcd *ehci)
> =20
>  	command |=3D CMD_RESET;
>  	dbg_cmd (ehci, "reset", command);
> -	ehci_writel(ehci, command, &ehci->regs->command);
> +	if (!ehci->controller_resets_phy)
> +		ehci_writel(ehci, command, &ehci->regs->command);
>  	ehci_to_hcd(ehci)->state =3D HC_STATE_HALT;
>  	ehci->next_statechange =3D jiffies;
>  	retval =3D handshake (ehci, &ehci->regs->command,
> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> index f86d3fa..8854491 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h
> @@ -134,6 +134,7 @@ struct ehci_hcd {			/* one per controller */
>  	unsigned		amd_pll_fix:1;
>  	unsigned		fs_i_thresh:1;	/* Intel iso scheduling */
>  	unsigned		use_dummy_qh:1;	/* AMD Frame List table quirk*/
> +	unsigned		controller_resets_phy:1; /* Tegra quirk */
> =20
>  	/* required for usb32 quirk */
>  	#define OHCI_CTRL_HCFS          (3 << 6)
Instead of something that prevent reset, shouldn't tdi platform have a=20
callback to restore phy config ?

And I think we should use ehci_is_TDI(ehci) condition. No need to=20
introduce another flags. The problem is common to all tdi core.

Matthieu


PS : This may help to remove ehci_msm_run.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
