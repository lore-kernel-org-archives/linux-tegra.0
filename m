From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Drop ARCH_SUPPORTS_MSI and sort list
Date: Thu, 29 Aug 2013 12:50:36 -0700
Message-ID: <20130829195036.GK18542@quad.lixom.net>
References: <1377720334-30718-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377720334-30718-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 28, 2013 at 10:05:34PM +0200, Thierry Reding wrote:
> The ARCH_SUPPORTS_MSI symbol was removed during the recent patches that
> introduce the MSI chip infrastructure. Drop it from the list of selected
> symbols. While at it, move the MIGHT_HAVE_PCI symbol so the list stays
> sorted alphabetically.
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This should be applied on top of whatever branch carries the Tegra
> for-3.12/soc branch (that'd be next/soc if I'm not mistaken).

Applied.

-Olof
