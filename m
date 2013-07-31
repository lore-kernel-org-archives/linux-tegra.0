From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 1/6] usb: host: add has_tdi_phy_lpm capability bit
Date: Wed, 31 Jul 2013 14:35:47 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1307311435340.1546-100000@iolanthe.rowland.org>
References: <1375292522-7855-2-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375292522-7855-2-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 31 Jul 2013, Tuomas Tynkkynen wrote:

> The has_hostpc capability bit indicates that the host controller has the
> HOSTPC register extensions, but at the same time enables clock disabling
> power saving features with the PHY Low Power Clock Disable (PHCD) bit.
> 
> However, some host controllers have the HOSTPC extensions but don't
> support the low-power feature, so the PHCD bit must not be set on those
> controllers. Add a separate capability bit for the low-power feature
> instead, and change all existing users of has_hostpc to use this new
> capability bit.
> 
> The idea for this commit is taken from an old 2012 commit that never got
> merged ("disociate chipidea PHY low power suspend control from hostpc")
> 
> Inspired-by: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
