From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add Tegra Memory Controller(MC) driver
Date: Fri, 04 May 2012 10:53:58 -0600
Message-ID: <4FA409A6.3020700@wwwdotorg.org>
References: <1336063897-12083-1-git-send-email-hdoyu@nvidia.com><4FA2D0C4.4020608@wwwdotorg.org> <20120504.160035.1828735037330038337.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120504.160035.1828735037330038337.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/04/2012 07:00 AM, Hiroshi Doyu wrote:
...
> What about the following AHB patches? AHB patches are independent of
> MC/GART/SMMU DT issue basically. If you think that they are ready to
> merge, I'll post the update version, I fixed some of your latest
> comments.
> 
>  [PATCH 1/3] ARM: tegra: Add Tegra AHB driver
>  [PATCH 2/3] ARM: tegra: Add SMMU enabler in AHB
>  [PATCH 3/3] ARM: dt: tegra: Add device tree support for AHB

Yes, I think they be reposted and go in now.

> I'll hold off on the following until we get some direction for
> MC/GART/SMMU. They are related to how dt info is passed via MC.
> 
>  [PATCH 1/3] ARM: tegra: Add Tegra Memory Controller(MC) driver
>  [PATCH 2/3] ARM: dt: tegra: Add device tree support for Memory Controller(MC)
>  [PATCH 3/3] iommu/tegra: smmu: Refrain from accessing to AHB
