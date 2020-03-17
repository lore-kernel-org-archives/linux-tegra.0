From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [GIT PULL] usb: tegra: Changes for v5.7-rc1
Date: Tue, 17 Mar 2020 19:58:35 +0100
Message-ID: <20200317185835.GC1480055@kroah.com>
References: <20200313170730.2924259-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200313170730.2924259-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 13, 2020 at 06:07:30PM +0100, Thierry Reding wrote:
> Hi Greg, Felipe,
> 
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.7-usb
> 
> for you to fetch changes up to 9dd4fbef2f88ccf46f5294805bf121d6554791e8:
> 
>   usb: gadget: tegra-xudc: Support multiple device modes (2020-03-13 17:16:28 +0100)
> 
> It occurred to me that I could just as well send this pull request to
> you guys, rather than take it via ARM SoC. Kishon already acked all the
> patches for the PHY tree that this series depends on, so I've included
> them here as a dependency.
> 
> Let me know if you'd prefer that I take this through ARM SoC.

I tried to merge this into my usb-next branch, but get merge issues in
drivers/usb/gadget/udc/tegra-xudc.c that I really don't know how to
resolve.

Can you give me a clue as to what to do here?

thanks,

greg k-h
