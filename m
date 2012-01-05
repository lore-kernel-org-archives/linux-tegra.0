From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: fixed: Move drivers to
	subsys_initcall_sync()
Date: Thu, 5 Jan 2012 05:59:00 +0000
Message-ID: <20120105055900.GE11867@opensource.wolfsonmicro.com>
References: <1325693335-1905-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325693335-1905-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 04, 2012 at 09:38:55PM +0530, Laxman Dewangan wrote:
> From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The fixed regulator is used to enable/disable rails which are
> mainly controlled by the switch. The switches are toggled by
> gpio apis.
> The switches are connected through on-chip gpios or through
> external devices' gpios like mfd, i2c based gpio expander etc.
> The registration of the fixed regulator get success only if the
> required gpios are already available in the system at this time.
> The on-chip gpios are available till this time as on-chip gpios
> are initialized in arch_init(). But external peripheral's gpios
> may not be available at this time as they get initialized as part
> of subsys_initcall() and due to this registration of the fixed
> regulator may fails.
> Moving the driver to subsys_initcall_sync() will make sure that
> all gpios i.e. on-chip gpios as well as external peripheral's gpios
> are available before fixed regulator registration.

I don't really think this is worth faffing about with, it seems at least
as likely to create more problems with things that depend on the
regulator as it is to make the regulator work.  Really we need Grant's
probe retry stuff or something else to solve the init ordering issues
properly.
