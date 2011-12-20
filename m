From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] arm/tegra: Delete tegra_init_clock()
Date: Mon, 19 Dec 2011 18:07:38 -0800
Message-ID: <20111220020738.GH27789@quad.lixom.net>
References: <1324322645-30653-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1324322645-30653-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 19, 2011 at 12:24:03PM -0700, Stephen Warren wrote:
> tegra_init_clock() is written to call tegra2_init_clocks(), which only
> exists if Tegra20 support is enabled. This breaks the build of a
> Tegra30-only kernel.
> 
> tegra_init_clock() isn't actually used any more; tegra20_init_early()
> calls tegra2_init_clocks() directly. So, just delete this function.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> These 3 patches are all cleanup for Tegra's for-3.3/soc branch.

Thanks, applied 1-3 to for-3.3/soc.


-Olof
