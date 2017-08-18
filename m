From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 3/5] ARM: tegra: Changes for v4.14-rc1
Date: Fri, 18 Aug 2017 23:36:56 +0200
Message-ID: <CAK8P3a2uqSEwoVvUBzYO1GpH257Ubyp0cbQfFbEw97BEMwK4Yw@mail.gmail.com>
References: <20170818144806.14252-1-thierry.reding@gmail.com> <20170818144806.14252-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170818144806.14252-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 18, 2017 at 4:48 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi ARM SoC maintainers,
>
> The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:
>
>   Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.14-arm-core
>
> for you to fetch changes up to 6aa26c5d66595494e810c791602d87a572c78808:
>
>   ARM: tegra: Select appropriate DMA options for LPAE (2017-07-31 18:59:44 +0200)
>
> ----------------------------------------------------------------
> ARM: tegra: Changes for v4.14-rc1
>
> Contains a single fix for platforms with more than 2 GiB of memory
> running on a kernel with LPAE enabled.

Pulled into next/soc, thanks!

       Arnd
