From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Mon, 21 Jul 2014 09:16:19 -0400
Message-ID: <20140721131619.GE12921@htj.dyndns.org>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <111661024.qGiugVUugr@wuerfel>
 <20140717110652.GA18383@ulmo>
 <6373493.kzO00ziuYq@wuerfel>
 <20140721131233.GG15238@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140721131233.GG15238@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 21, 2014 at 03:12:34PM +0200, Thierry Reding wrote:
> Adding Tejun, since he took this into his tree on Friday I think, just a
> few hours after I sent out pull requests for this.
> 
> I hadn't considered this build dependency. We could resolve this in two
> ways I think:
> 
> 	- merge the for-3.17/fuse-move branch from the Tegra tree into
> 	  the libata tree and apply Arnd's patch to the libata tree

I can pull the tegra tree into the libata if the tegra maintainer is
okay with it.

Thanks.

-- 
tejun
