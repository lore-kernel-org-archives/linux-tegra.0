From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] video: Add a callback 'notify_after' for backlight
 control
Date: Mon, 8 Aug 2011 19:12:58 -0700
Message-ID: <20110809021258.GM27748@morell.nvidia.com>
References: <1312855525-21464-1-git-send-email-dilee@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1312855525-21464-1-git-send-email-dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org" <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "arun.murthy-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <arun.murthy-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Jordan Nien <JNien-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 08, 2011 at 07:05:25PM -0700, Dilan Lee wrote:
[...]
> For example, GPIO backlight_en has to be risen after pwm has been enabled
> to meet panel power on sequence defined in panel specification.

I still think this information is irrelevant/nonsensical here, and
should be omitted entirely..

[...]

>  	unsigned int		lth_brightness;
>  	int			(*notify)(struct device *,
> -					  int brightness);
> +					int brightness);

Please don't change the line above; unlike the one you added after, it
was already lined up properly with its argument list.

Otherwise,
Reviewed-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
