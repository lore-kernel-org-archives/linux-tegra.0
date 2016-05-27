From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/5] usb: chipidea: Add support for Tegra20 through Tegra124
Date: Fri, 27 May 2016 11:16:24 +0800
Message-ID: <20160527031624.GA3034@shlinux2>
References: <20160526154005.11558-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160526154005.11558-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 26, 2016 at 05:40:00PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> All Tegra SoC generations from Tegra20 through Tegra124 have a ChipIdea
> USB device controller. This set of patches adds very rudimentary support
> for it to the existing ChipIdea driver and enables them on the set of
> boards that I could easily test on.
> 
> I'm sending this out as RFC because I'm not sure yet how to merge this.
> While the driver seems to work fine (tested by exporting a USB driver or
> eMMC via the mass storage function) I don't yet understand how to make
> the driver switch between host and device modes dynamically. It might be
> useful to get this merged before, but I'd like to have some feedback on
> this, because doing so would mean that we need to use device mode on the
> devices where it's enabled and can't use the USBD port in host mode.
> 

Chipidea driver supports many ways to switch between host and device
mode. It can support switching with/without disconnecting cable.

Most of cases need to disconnect cable (Micro-AB) to switch between
host and device mode, I just take this as an example:

Using ID pin which is at Micro-B receptacle on the board to determine host (ID = 0)
or device (ID = 1 )mode.

- ID pin connects to CPU, and ID interrupt and value can be get through
register OTGSC.
- ID pin does not connect to CPU, and there is a dedicated GPIO for ID.

-- 

Best Regards,
Peter Chen
