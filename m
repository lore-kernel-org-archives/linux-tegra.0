From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch 2/2] drm/tegra: silence some sparse complaints
Date: Fri, 8 Nov 2013 16:29:28 +0300
Message-ID: <20131108132928.GT20521@mwanda>
References: <20131108100803.GY27977@elgon.mountain>
 <20131108123455.GA31551@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131108123455.GA31551-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 08, 2013 at 01:34:56PM +0100, Thierry Reding wrote:
> On Fri, Nov 08, 2013 at 01:08:03PM +0300, Dan Carpenter wrote:
> > I've shifted the __user markup to make Sparse happy.
> > 
> > drivers/gpu/drm/tegra/drm.c:138:18: warning: incorrect type in initializer (different address spaces)
> > drivers/gpu/drm/tegra/drm.c:138:18:    expected struct drm_tegra_cmdbuf [noderef] <asn:1>*cmdbufs
> > drivers/gpu/drm/tegra/drm.c:138:18:    got void *[noderef] <asn:1><noident>
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> 
> Hi Dan,
> 
> I fixed exactly the same sparse warnings (along with many others this
> morning). We really ought to have a tag to put into a commit to credit
> people who've come up with the same patch at the same time.

No no.  First come first serve.  :)

regards,
dan carpenter
