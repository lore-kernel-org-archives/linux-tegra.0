From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: beaver: Allow SD card voltage to be changed
Date: Wed, 6 Jul 2016 22:22:06 -0700
Message-ID: <20160707052206.GI32389@localhost>
References: <20160630153208.22761-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160630153208.22761-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 30, 2016 at 05:32:08PM +0200, Thierry Reding wrote:
> From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> 
> This allows to switch the card signal voltage level to 1.8 V, which is
> needed for any ultra high speed modes to work.
> 
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi ARM-SoC maintainers,
> 
> Can you please apply this for v4.7? It fixes a regression with UHS modes
> that I had hoped could be fixed in the MMC core, but it turns out that a
> fairly invasive change will be required and it's not going to make v4.7.
> 
> I should note that this is not a workaround. It is the proper fix to
> enable UHS modes, but it exposes a weakness in the SDHCI driver which
> will happily switch to UHS modes whether or not the power supply can be
> configured to output the required voltage. Ideally the SDHCI driver will
> be taught to reject UHS modes if the available supply voltages aren't
> suitable. There is work underway to do that, but it won't make v4.7.

Applied to fixes.


-Olof
