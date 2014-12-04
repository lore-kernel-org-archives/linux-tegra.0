From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL v3 1/4] ARM: tegra: IOMMU support for v3.19
Date: Thu, 04 Dec 2014 17:21:27 +0100
Message-ID: <2182969.Fashf5lCE4@wuerfel>
References: <1416570832-6220-1-git-send-email-thierry.reding@gmail.com> <1417707950-7633-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417707950-7633-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 04 December 2014 16:45:49 Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 0690cbd2e55a72a8eae557c389d1a136ed9fa142:
> 
>   powerpc/iommu: Rename iommu_[un]map_sg functions (2014-11-18 11:30:01 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.19-iommu
> 
> for you to fetch changes up to 8918465163171322c77a19d5258a95f56d89d2e4:
> 
>   memory: Add NVIDIA Tegra memory controller support (2014-12-04 16:11:47 +0100)
> 
> Here's a version of the pull request rebased on top of Joerg's core
> branch from the IOMMU tree. It has the advantage of having resolved
> the merge conflicts and the disadvantage of pulling in v3.18-rc3.
> It also contains an updated commit description with some details
> that ensued from a discussion regarding the DT binding as well as
> the memory-client to SWGROUP mapping tables.
> 
> This pull request also contains fixes for a build error reported by the
> 0-day builder as well as a couple of issues in the IOMMU domain detach
> path that I've found since v2 while doing extensive driver unload and
> reload stress testing.

Pulled into next/drivers, thanks for you patience!

	Arnd
