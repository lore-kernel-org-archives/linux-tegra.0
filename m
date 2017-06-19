From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.13-rc1
Date: Sun, 18 Jun 2017 21:02:32 -0700
Message-ID: <20170619040232.GG30022@localhost>
References: <20170616081306.11505-1-thierry.reding@gmail.com>
 <20170616081306.11505-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170616081306.11505-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 16, 2017 at 10:13:06AM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
> 
>   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.13-arm64-dt
> 
> for you to fetch changes up to 475d99fc216f4b2aed7021734838c9b578338598:
> 
>   arm64: dts: nvidia: fix PCI bus dtc warnings (2017-06-13 16:50:48 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v4.13-rc1
> 
> This adds the CCPLEX cluster on Tegra186, which is used to initiate CPU
> frequency and voltage transitions.
> 
> Also included is a bit of cleanup for PCI related device tree content,
> in preparation for a future DTC release that has additional checks for
> the PCI bus.

Merged, thanks.


-Olof
