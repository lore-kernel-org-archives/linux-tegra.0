From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 2/4] soc/tegra: Changes for v4.9-rc1
Date: Thu, 15 Sep 2016 00:40:32 +0200
Message-ID: <5777274.tbFdIa53BH@wuerfel>
References: <20160909152032.9550-1-thierry.reding@gmail.com> <20160909152032.9550-2-thierry.reding@gmail.com> <9462882.Qh35FHRZfK@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9462882.Qh35FHRZfK@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday, September 15, 2016 12:32:04 AM CEST Arnd Bergmann wrote:
> On Friday, September 9, 2016 5:20:30 PM CEST Thierry Reding wrote:
> > soc/tegra: Changes for v4.9-rc1
> > 
> > This contains a single patch to fix an issue with setting the deep power
> > down mode of I/O rails.
> > 
> 
> Pulled into next/soc. 

I made up my mind and put it into next/drivers instead of next/soc.

	Arnd

> Should this be backported to stable kernels?
