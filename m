From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 2/2] of: configure DMA for host1x devices
Date: Mon, 25 Sep 2017 14:47:16 +0200
Message-ID: <20170925124716.GB8130@lst.de>
References: <20170924090454.28116-1-mperttunen@nvidia.com> <20170924090454.28116-2-mperttunen@nvidia.com> <20170925074448.GB12494@ulmo.fritz.box> <dd8e9524-1d91-2c8b-a753-086d3ad9f9c9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <dd8e9524-1d91-2c8b-a753-086d3ad9f9c9-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hch-jcswGhMUV9g@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 25, 2017 at 01:26:46PM +0100, Robin Murphy wrote:
> Alternatively (and modulo Greg's opinion, obviously) it would arguably be
> neatest to handle this at a slightly lower level as below - I only really
> considered this idea after writing the existing fix, but now that I have
> actually written it up I do rather like it.

I also like this much better than hardcoding specific busses.  The only
real downside is that it makes it too easy to add exceptions :)
