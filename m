From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix Tegra114 IOMMU register address
Date: Wed, 30 Oct 2013 17:39:32 -0700
Message-ID: <CAOesGMiBK9=g0+RjX4xKFb2gtjVCHwz1ZdAxYP99=pzfSdU+3g@mail.gmail.com>
References: <1383175068-27420-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383175068-27420-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 30, 2013 at 4:17 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The IOMMU node's reg property contains completely bogus values! Somehow,
> this had no practical effect, despite the fact the IOMMU driver appears
> to be writing to those registers. I suppose that since no HW modules is
> actually at that address, the writes simply had no effect.
>
> Note that I'm not CCing stable here, even though the problem exists as
> far back as v3.9, simply because this patch doesn't fix any observed
> issue, and I don't want to run the risk of suddenly writing to some
> registers and causing a regression.
>
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [swarren, wrote commit description]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Kevin, Olof, if you could apply this directly for 3.13, that's be awesome.

Applied to next/dt.


-Olof
