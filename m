From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/2] arm/tegra: Fix section mismatch errors in pinmux
Date: Mon, 19 Dec 2011 18:05:02 -0800
Message-ID: <20111220020502.GG27789@quad.lixom.net>
References: <1324317718-24464-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1324317718-24464-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 19, 2011 at 11:01:56AM -0700, Stephen Warren wrote:
> Patches in Tegra's for-3.3/soc branch introduce some section mismatch
> errors when building with CONFIG_DEBUG_SECTION_MISMATCH=y. This series
> fixes them. I patched each file separately in case you want to squash
> these into the original patches.
> 
> tegra20: 6996e08 arm/tegra: prepare pinmux code for multiple tegra variants
> tegra30: 241682c arm/tegra: pinmux tables and definitions for tegra30

Thanks, applied to for-3.3/soc.


-Olof
