From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 5/5] arm/dt: tegra: Fix SDHCI nodes to match board files
Date: Wed, 7 Dec 2011 16:21:35 -0800
Message-ID: <20111208002135.GK12945@quad.lixom.net>
References: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
 <1321911851-10091-5-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321911851-10091-5-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 21, 2011 at 02:44:11PM -0700, Stephen Warren wrote:
> Mark any SDHCI controllers that aren't registered by the board files as
> disabled in the device-tree files.
> 
> In practice, these controllers:
> 
> * Have nothing hooked up to them at all, or
> * For ports intended for SDIO usage, the drivers for anything that might
>   be attached are not in the device-tree yet. If/when drivers appear, the
>   SD/MMC port can be re-enabled.
> 
> The only possible exception is TrimSlice's mico SD slot, but that wasn't
> enabled in the board files before anyway, and doesn't work when all the
> SDHCI controllers are enabled anyway.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied to for-3.3/boards


-Olof
