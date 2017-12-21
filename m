From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL v2 2/5] soc/tegra: Changes for v4.16-rc1
Date: Thu, 21 Dec 2017 18:04:22 +0100
Message-ID: <CAK8P3a1Z6vD982A9y2zaa+x+2qTdtjbFYw_TcnvwvFD1t5CZjw@mail.gmail.com>
References: <20171220191900.757-2-thierry.reding@gmail.com> <20171221161252.12920-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221161252.12920-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 21, 2017 at 5:12 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>
>   soc/tegra: fuse: Explicitly request DMA channel from APB DMA driver (2017-12-21 17:04:12 +0100)
>
> This includes two additional patches that have been sitting in patchwork
> for a long time and that I had forgotten to include. Please ignore the
> first pull request and pull this instead.
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> soc/tegra: Changes for v4.16-rc1
>
> Fuse and chip ID support for Tegra186 is added in this set of changes,
> followed by some unification work for the PMC driver in order to avoid
> code duplication between Tegra186 and prior chips.
>
> This also contains a couple of fixes for reading fuses on Tegra20.

Pulled into next/soc, thanks!

       Arnd
