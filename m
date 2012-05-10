From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC 1/1] Driver Core: don't oops with unregistered driver in
 driver_find_device()
Date: Thu, 10 May 2012 07:11:30 -0700
Message-ID: <20120510141130.GA20373@kroah.com>
References: <1336635302-29260-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1336635302-29260-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 10, 2012 at 10:35:02AM +0300, Hiroshi DOYU wrote:
> driver_find_device() can be called with an unregistered driver.

Who does that?  Where in the kernel?  Why would you try to do that?

> Need to check driver_private to see if it's populated or not,
> especially under deferrable probe.

Hm, I don't know if this will really catch a driver that was registered
and then was unregistered, right?  It seems like moving the real problem
somewhere else, why not fix the original issue instead?

> Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> In [PATCHv5 2/3] ARM: tegra: Add SMMU enabler in AHB:
>   http://article.gmane.org/gmane.linux.ports.tegra/4658
> 
> "tegra_ahb_driver" may not be populated when it's called.

It can?  I don't see that in that patch.

confused,

greg k-h
