From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/3] hwmon: (lm90) add support to handle irq
Date: Fri, 5 Jul 2013 12:47:28 -0700
Message-ID: <20130705194728.GA24946@roeck-us.net>
References: <1372924670-16355-1-git-send-email-wni@nvidia.com>
 <1372924670-16355-3-git-send-email-wni@nvidia.com>
 <51D703C9.1060607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51D703C9.1060607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-kernel-u79uwXL29TZX6JHB/w77yyCwEArCW2h5@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 05, 2013 at 11:35:05AM -0600, Stephen Warren wrote:
> On 07/04/2013 01:57 AM, Wei Ni wrote:
> > Add support to handle irq. When the temperature touch
> > the limit value, the driver can handle the interrupt.
> 
> > +	if (client->irq >= 0) {
> 
> 0 isn't a valid IRQ, so you can write that as simply if (client->irq).
> 
If I recall correctly, it is valid on some platforms.

Guenter
