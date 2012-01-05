From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V1] regulator: fixed: Move drivers to
	subsys_initcall_sync()
Date: Thu, 5 Jan 2012 13:05:25 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9DEC@BGMAIL01.nvidia.com>
References: <1325693335-1905-1-git-send-email-ldewangan@nvidia.com>
 <20120105055900.GE11867@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120105055900.GE11867-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> From: linux-pm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-pm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]
> On Behalf Of Mark Brown
> Sent: Thursday, January 05, 2012 11:29 AM


> > The fixed regulator is used to enable/disable rails which are
> > mainly controlled by the switch. The switches are toggled by
> > gpio apis.
> > The switches are connected through on-chip gpios or through
> > external devices' gpios like mfd, i2c based gpio expander etc.
> > The registration of the fixed regulator get success only if the
> > required gpios are already available in the system at this time.
> > The on-chip gpios are available till this time as on-chip gpios
> > are initialized in arch_init(). But external peripheral's gpios
> > may not be available at this time as they get initialized as part
> > of subsys_initcall() and due to this registration of the fixed
> > regulator may fails.
> > Moving the driver to subsys_initcall_sync() will make sure that
> > all gpios i.e. on-chip gpios as well as external peripheral's gpios
> > are available before fixed regulator registration.
> 
> I don't really think this is worth faffing about with, it seems at least
> as likely to create more problems with things that depend on the
> regulator as it is to make the regulator work.  Really we need Grant's
> probe retry stuff or something else to solve the init ordering issues
> properly.
Yes, I agree, the init ordering need to be done properly but this is how we
have as of now to make ordering.
I have the switchA which is connected on regulatorA (from PMIC) and the
switchB which is in the gpio of the pmic. The fixed regulator registration for
switchA and switchB are failing because it did not found the valid supply/gpio.
The one way to resolve the call probe of the fixed regulator only when pmic
initialization is done and it is in subsys_init().
The other way is to do the platform device registration of the fixed regulator
is in subsys_initcall_sync() in place of arch_init, although driver is in
subsys_initcall() to postponed the probe calling.

What do you suggest on this case?
