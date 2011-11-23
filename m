From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: Tegra+WM903 machine: Set the
 new fully_routed flag
Date: Wed, 23 Nov 2011 21:32:20 +0000
Message-ID: <20111123213220.GA8149@sirena.org.uk>
References: <1322077326-5538-1-git-send-email-swarren@nvidia.com>
 <1322077326-5538-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322077326-5538-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 23, 2011 at 12:42:05PM -0700, Stephen Warren wrote:

> v2: Rename flag from auto_nc_pins to fully_routed. Adjust description.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  sound/soc/tegra/tegra_wm8903.c |   22 +---------------------
>  1 files changed, 1 insertions(+), 21 deletions(-)

Things like your above "v2" line really ought to go here below the ---
so they're automatically cut from the changelog by the tools.
