From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] mfd: tps6586x: correct device name of the regulator cell
Date: Mon, 10 Jun 2013 14:12:38 -0600
Message-ID: <51B63336.6000007@wwwdotorg.org>
References: <89e4451e14f324d8bd480f843fa5960b481e3188.1370894247.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <89e4451e14f324d8bd480f843fa5960b481e3188.1370894247.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/10/2013 02:06 PM, Marc Dietrich wrote:
> Change the device name of the regulator function to the one chosed for

nit: s/chosed/chosen/

> MODULE_ALIAS. This fixes kernel module loading for the regulator function.

Not "loading" but "auto-loading" (based on a match of the MODULE_ALIAS
name).

> Also change the name of the platform driver to make everything consistent.

In this case, not really for consistency; if you didn't do that, it
simply wouldn't match the entry in tps6586x_cell[], so even with the
module loaded, the driver wouldn't get probed.
