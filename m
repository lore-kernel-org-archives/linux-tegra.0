From: Arun MURTHY <arun.murthy-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Subject: RE: [PATCH] video: Add a callback 'notify_after' for backlight
 control
Date: Tue, 9 Aug 2011 05:43:25 +0200
Message-ID: <F45880696056844FA6A73F415B568C6953FF062B94@EXDCVYMBSTM006.EQ1STM.local>
References: <1312856996-22452-1-git-send-email-dilee@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1312856996-22452-1-git-send-email-dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org" <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "jnien-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <jnien-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org [mailto:dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]
> Sent: Tuesday, August 09, 2011 8:00 AM
> To: rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org; lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org; akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org;
> Arun MURTHY; rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org; Linus WALLEIJ
> Cc: jnien-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org; swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org; linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Dilan Lee
> Subject: [PATCH] video: Add a callback 'notify_after' for backlight
> control
> 
> From: Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> We need a callback to do some things after pwm_enable, pwm_disable
> and pwm_config.
> 
> Signed-off-by: Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Arun Murthy <arun.murthy-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
