From: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 1/6] usb: host: add has_tdi_phy_lpm capability bit
Date: Thu, 1 Aug 2013 10:05:44 +0200
Message-ID: <20130801100544.76233b42@parrot.com>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com>
	<1375292522-7855-2-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1375292522-7855-2-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: "balbi@ti.com" <balbi@ti.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

Hi,

Le Wed, 31 Jul 2013 18:41:57 +0100,
Tuomas Tynkkynen <ttynkkynen@nvidia.com> a =E9crit :

> The has_hostpc capability bit indicates that the host controller has
> the HOSTPC register extensions, but at the same time enables clock
> disabling power saving features with the PHY Low Power Clock Disable
> (PHCD) bit.
>=20
> However, some host controllers have the HOSTPC extensions but don't
> support the low-power feature, so the PHCD bit must not be set on
> those controllers. Add a separate capability bit for the low-power
> feature instead, and change all existing users of has_hostpc to use
> this new capability bit.
>=20
> The idea for this commit is taken from an old 2012 commit that never
> got merged ("disociate chipidea PHY low power suspend control from
> hostpc")
Note that because of the different register layout (see "add phy low
power suspend for older chipidea core" commit in the same series), we
should not set has_tdi_phy_lpm if has_hostpc =3D=3D 0 with the current =
code.

May be you should have change the ehci->has_hostpc to (ehci->has_hostpc
&& ehci->has_tdi_phy_lpm).

BTW Alan make some comment on the commit :
http://marc.info/?l=3Dlinux-usb&m=3D133701342028213&w=3D2

They may apply to your commit.

>=20
> Inspired-by: Matthieu CASTET <matthieu.castet@parrot.com>
> Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
> ---
>  drivers/usb/chipidea/host.c |  1 +
>  drivers/usb/host/ehci-hub.c | 14 +++++++-------
>  drivers/usb/host/ehci.h     |  1 +
>  3 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.=
c
> index 40d0fda..9b3aaf1 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -63,6 +63,7 @@ static int host_start(struct ci_hdrc *ci)
>  	ehci =3D hcd_to_ehci(hcd);
>  	ehci->caps =3D ci->hw_bank.cap;
>  	ehci->has_hostpc =3D ci->hw_bank.lpm;
> +	ehci->has_tdi_phy_lpm =3D ci->hw_bank.lpm;
> =20
>  	ret =3D usb_add_hcd(hcd, 0, 0);
>  	if (ret)
> diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.=
c
> index 2b70277..8044a74 100644
> --- a/drivers/usb/host/ehci-hub.c
> +++ b/drivers/usb/host/ehci-hub.c
> @@ -183,7 +183,7 @@ static void ehci_adjust_port_wakeup_flags(struct
> ehci_hcd *ehci, spin_lock_irq(&ehci->lock);
> =20
>  	/* clear phy low-power mode before changing wakeup flags */
> -	if (ehci->has_hostpc) {
> +	if (ehci->has_tdi_phy_lpm) {
>  		port =3D HCS_N_PORTS(ehci->hcs_params);
>  		while (port--) {
>  			u32 __iomem	*hostpc_reg =3D
> &ehci->regs->hostpc[port]; @@ -217,7 +217,7 @@ static void
> ehci_adjust_port_wakeup_flags(struct ehci_hcd *ehci, }
> =20
>  	/* enter phy low-power mode again */
> -	if (ehci->has_hostpc) {
> +	if (ehci->has_tdi_phy_lpm) {
>  		port =3D HCS_N_PORTS(ehci->hcs_params);
>  		while (port--) {
>  			u32 __iomem	*hostpc_reg =3D
> &ehci->regs->hostpc[port]; @@ -309,7 +309,7 @@ static int
> ehci_bus_suspend (struct usb_hcd *hcd) }
>  	}
> =20
> -	if (changed && ehci->has_hostpc) {
> +	if (changed && ehci->has_tdi_phy_lpm) {
>  		spin_unlock_irq(&ehci->lock);
>  		msleep(5);	/* 5 ms for HCD to enter low-power
> mode */ spin_lock_irq(&ehci->lock);
> @@ -435,7 +435,7 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
>  		goto shutdown;
> =20
>  	/* clear phy low-power mode before resume */
> -	if (ehci->bus_suspended && ehci->has_hostpc) {
> +	if (ehci->bus_suspended && ehci->has_tdi_phy_lpm) {
>  		i =3D HCS_N_PORTS(ehci->hcs_params);
>  		while (i--) {
>  			if (test_bit(i, &ehci->bus_suspended)) {
> @@ -788,7 +788,7 @@ static int ehci_hub_control (
>  				goto error;
> =20
>  			/* clear phy low-power mode before resume */
> -			if (ehci->has_hostpc) {
> +			if (ehci->has_tdi_phy_lpm) {
>  				temp1 =3D ehci_readl(ehci, hostpc_reg);
>  				ehci_writel(ehci, temp1 &
> ~HOSTPC_PHCD, hostpc_reg);
> @@ -1031,12 +1031,12 @@ static int ehci_hub_control (
> =20
>  			/* After above check the port must be
> connected.
>  			 * Set appropriate bit thus could put phy
> into low power
> -			 * mode if we have hostpc feature
> +			 * mode if we have tdi_phy_lpm feature
>  			 */
>  			temp &=3D ~PORT_WKCONN_E;
>  			temp |=3D PORT_WKDISC_E | PORT_WKOC_E;
>  			ehci_writel(ehci, temp | PORT_SUSPEND,
> status_reg);
> -			if (ehci->has_hostpc) {
> +			if (ehci->has_tdi_phy_lpm) {
>  				spin_unlock_irqrestore(&ehci->lock,
> flags); msleep(5);/* 5ms for HCD enter low pwr mode */
>  				spin_lock_irqsave(&ehci->lock,
> flags); diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.=
h
> index 64f9a08..d034d94 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h
> @@ -210,6 +210,7 @@ struct ehci_hcd {			/* one
> per controller */ #define OHCI_HCCTRL_LEN         0x4
>  	__hc32			*ohci_hcctrl_reg;
>  	unsigned		has_hostpc:1;
> +	unsigned		has_tdi_phy_lpm:1;
>  	unsigned		has_ppcd:1; /* support per-port
> change bits */ u8			sbrn;		/*
> packed release number */=20
