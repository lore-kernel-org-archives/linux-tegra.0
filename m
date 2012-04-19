From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Thu, 19 Apr 2012 18:25:15 +0900
Message-ID: <4F8FD9FB.3090909@nvidia.com>
References: <Pine.LNX.4.44L0.1204181640550.1149-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1204181640550.1149-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/19/2012 05:47 AM, Alan Stern wrote:
>> Those responsible for ehci-tegra.c in our downstream kernels are
>> supposed to be working on a plan to upstream the missing parts. When
>> that comes to fruition, we should be able to remove that Kconfig
>> restriction. I'm afraid I don't have an ETA for when that will be though.
>
> Is this patch compatible with the downstream driver?  It would be a
> shame to mess up a bunch of other work.

Downstream driver is dramatically out-of-sync with respect to upstream, 
and we don't know when we will be able to catch up, so if your patch 
improves things there is no reason not to go ahead. AFAIK nothing 
equivalent to what you implemented has been done on our side (i.e. we 
are still powering down during bus suspend), so this is welcome.

Alex.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
