From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL v3 2/4] ARM: tegra: Device tree changes for v3.19
Date: Thu, 04 Dec 2014 17:24:14 +0100
Message-ID: <25932693.6J1SFYEMJN@wuerfel>
References: <1417707950-7633-1-git-send-email-thierry.reding@gmail.com> <1417707950-7633-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417707950-7633-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 04 December 2014 16:45:50 Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8918465163171322c77a19d5258a95f56d89d2e4:
> 
>   memory: Add NVIDIA Tegra memory controller support (2014-12-04 16:11:47 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.19-dt
> 
> for you to fetch changes up to 5b605d4426e1dc38b6572bd42c151ad247359e3a:
> 
>   ARM: tegra: Enable IOMMU for display controllers on Tegra124 (2014-12-04 16:16:15 +0100)
> 
> Note that this pulls in the for-3.19/iommu branch (tegra-for-3.19-iommu
> tag) to resolve the dependency between the IOMMU driver addition and the
> DT changes that include dt-bindings/memory/tegra*-mc.h headers.
> 

Pulled into next/dt2 to resolve the dependencies. This won't be part of
the initial set of pull requests for the merge window but will be slightly
delayed until all other dependencies are upstream and should still be
there in time for -rc1.

	Arnd
