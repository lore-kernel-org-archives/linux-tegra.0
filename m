From: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iommu: tegra: depend on ARCH_TEGRA, not ARCH_TEGRA_*
Date: Sat, 20 Jul 2013 09:15:27 +0200
Message-ID: <20130720071527.GI28811@8bytes.org>
References: <1374013222-4856-1-git-send-email-swarren@wwwdotorg.org>
 <51E81F23.40807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51E81F23.40807-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 18, 2013 at 11:00:19AM -0600, Stephen Warren wrote:
> I'd like to defer actually applying this patch. There is some discussion
> (in the thread for the equivalent ASoC patches) re: the best way to
> handle the ARCH_TEGRA_*_SOC Kconfig options which might affect this
> patch. Any review comment is still appreciated.

Okay, not much to review here. Just let me know if it is still required.


	Joerg
