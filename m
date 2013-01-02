From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 09/11] clk: tegra: add dt support
Date: Wed, 02 Jan 2013 15:06:11 -0700
Message-ID: <50E4AF53.2000905@wwwdotorg.org>
References: <1356619644-18565-1-git-send-email-pgaikwad@nvidia.com> <1356619644-18565-10-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356619644-18565-10-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/27/2012 07:47 AM, Prashant Gaikwad wrote:
> Add support to initialize clock from DT.

Rather than require every separate clock driver to create a header in
include/linux/clk/$socname.h, would it make sense to create a single
function that can initialize any enable SoC's clocks, using a scheme
similar to:

https://lkml.org/lkml/2012/11/20/706

That's in linux-next as of today, and Thomas Petazzoni was working on
something similar for irqchips. It probably wouldn't be too hard to do
the same for clock initialization?
