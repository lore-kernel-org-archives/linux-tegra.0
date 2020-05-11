From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [GIT PULL] arm64: tegra: Default configuration fixes for v5.7-rc4
Date: Mon, 11 May 2020 14:00:42 +0100
Message-ID: <384ae777-3e3c-8244-0645-13d9c7a8eb37@nvidia.com>
References: <20200430105700.167199-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200430105700.167199-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/04/2020 11:57, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> 
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm64-defconfig-fixes
> 
> for you to fetch changes up to 90670f0ef690f9c8712f236e8cf14c156c9a6365:
> 
>   arm64: defconfig: Re-enable Tegra PCIe host driver (2020-04-14 16:15:00 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Default configuration fixes
> 
> This contains a single fix to reenable the Tegra194 PCIe host support by
> default that was inadvertently dropped as a result of the host/endpoint
> mode support that was added in v5.7-rc1.
> 
> ----------------------------------------------------------------
> Jon Hunter (1):
>       arm64: defconfig: Re-enable Tegra PCIe host driver
> 
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Please can you pick this up for v5.7 fixes?

Thanks!
Jon

-- 
nvpublic
