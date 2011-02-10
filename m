From: Pavan Kondeti <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/4] usb: host: ehci-hcd: Add controller_resets_phy quirk
Date: Thu, 10 Feb 2011 08:16:02 +0530
Message-ID: <4D53516A.6060200@codeaurora.org>
References: <1297228927-23497-1-git-send-email-benoit@android.com> <1297228927-23497-3-git-send-email-benoit@android.com> <4D52BA75.5010409@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D52BA75.5010409-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Matthieu,

On 2/9/2011 9:31 PM, Matthieu CASTET wrote:
> Benoit Goby a =E9crit :
>> From: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Tegra quirk: Resetting the controller has the side effect of resetti=
ng
>> the PHY. Only reset the controller when doing so won't also reset th=
e
>> phy.
>>
>> Signed-off-by: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/usb/host/ehci-hcd.c |    3 ++-
>>  drivers/usb/host/ehci.h     |    1 +
>>  2 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd=
=2Ec
>> index 30515d3..7afa345 100644
>> --- a/drivers/usb/host/ehci-hcd.c
>> +++ b/drivers/usb/host/ehci-hcd.c
>> @@ -275,7 +275,8 @@ static int ehci_reset (struct ehci_hcd *ehci)
>> =20
>>  	command |=3D CMD_RESET;
>>  	dbg_cmd (ehci, "reset", command);
>> -	ehci_writel(ehci, command, &ehci->regs->command);
>> +	if (!ehci->controller_resets_phy)
>> +		ehci_writel(ehci, command, &ehci->regs->command);
>>  	ehci_to_hcd(ehci)->state =3D HC_STATE_HALT;
>>  	ehci->next_statechange =3D jiffies;
>>  	retval =3D handshake (ehci, &ehci->regs->command,
>> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
>> index f86d3fa..8854491 100644
>> --- a/drivers/usb/host/ehci.h
>> +++ b/drivers/usb/host/ehci.h
>> @@ -134,6 +134,7 @@ struct ehci_hcd {			/* one per controller */
>>  	unsigned		amd_pll_fix:1;
>>  	unsigned		fs_i_thresh:1;	/* Intel iso scheduling */
>>  	unsigned		use_dummy_qh:1;	/* AMD Frame List table quirk*/
>> +	unsigned		controller_resets_phy:1; /* Tegra quirk */
>> =20
>>  	/* required for usb32 quirk */
>>  	#define OHCI_CTRL_HCFS          (3 << 6)
> Instead of something that prevent reset, shouldn't tdi platform have =
a=20
> callback to restore phy config ?
>=20
> And I think we should use ehci_is_TDI(ehci) condition. No need to=20
> introduce another flags. The problem is common to all tdi core.
>=20
> Matthieu
>=20
>=20
> PS : This may help to remove ehci_msm_run.

The reason for having ehci_msm_run is to configure some MSM specific
registers (not just the HC mode bit) after controller reset. In the
current code, there is no way HCD can register it's own tdi_reset
method. If we can have such mechanism, then ehci_msm_run() can be remov=
ed.

Thanks,
Pavan

--=20
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
