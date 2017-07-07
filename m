From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/9] Support UDC on Tegra 20/30/114/124
Date: Fri, 7 Jul 2017 09:12:53 +0800
Message-ID: <20170707011253.GB21909@b29397-desktop>
References: <cover.1499273075.git.digetx@gmail.com>
 <b5c54655-ccf4-2d4e-59fe-4a9e4609605a@wwwdotorg.org>
 <c8d9740a-7792-87d9-9466-8d3a45280403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c8d9740a-7792-87d9-9466-8d3a45280403-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 06, 2017 at 01:13:01AM +0300, Dmitry Osipenko wrote:
> On 05.07.2017 23:31, Stephen Warren wrote:
> > On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
> >> Some time ago Thierry Reding sent out patches that enabled UDC on NVIDIA
> >> Tegra, unfortunately they haven't got enough traction to get into the
> >> kernel. I've rebased those patches and added a fix for the Ethernet USB
> >> Gadget on Tegra20, Marc Dietrich tested UDC driver on AC100 and Nicolas
> >> Chauvet on TK1. Like an original patchset, this series adds support for
> >> the peripheral mode only.
> > 
> > Does this mean that the relevant ports no longer support host mode? That's going
> > to be a user-visible regression, which doesn't sound like a good idea. Isn't OTG
> > possible instead?
> 
> We are going to switch only AC100 and TrimSlice to use the UDC driver. Do you
> know whether that port is working in a host mode with the tegra-ehci driver on
> these devices? That should be a micro USB port. Since that port is working in a
> device mode by default, I presume that switching it into a host mode would
> require some extra 'dance', otherwise I may drop the AC100 / TrimSlice patches.
> 
> The full-featured OTG should be possible, it could be done later if desired. I'm
> leaving it to somebody else to implement.
> 

Full-featured OTG? Do you mean it is compliances OTG spec, or just
support dual-role switch through ID pin or external connector?

-- 

Best Regards,
Peter Chen
