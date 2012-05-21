From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] iommu/tegra: gart: Reserve iomem resource
Date: Mon, 21 May 2012 10:41:14 -0600
Message-ID: <4FBA702A.1010203@wwwdotorg.org>
References: <1337019127-6863-1-git-send-email-hdoyu@nvidia.com> <1337019127-6863-2-git-send-email-hdoyu@nvidia.com> <20120521141152.GA21513@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120521141152.GA21513@avionic-0098.mockup.avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Hiroshi DOYU <hdoyu@nvidia.com>, linux-tegra@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>, Bharat Nihalani <bnihalani@nvidia.com>, Vandana Salve <vsalve@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/21/2012 08:11 AM, Thierry Reding wrote:
> * Hiroshi DOYU wrote:
>> GART Register/Aperture range should be reserved.
...
>> diff --git a/drivers/iommu/tegra-gart.c
>> b/drivers/iommu/tegra-gart.c
...
>> +	if (!devm_request_mem_region(dev, res_remap->start, +
>> resource_size(res_remap), dev_name(dev))) { +		dev_err(dev,
>> "failed to reserve GART aperture\n"); +		return -EBUSY; +	} +
> 
> I'm not so sure that this is a good idea. If the GART driver
> requests the GART aperture, then users of the GART aperture (e.g.
> the DRM driver) will no longer be able to use it.

Presumably the DRM driver would be obtaining access to parts of the
GART aperture through the GART driver, rather than just grabbing the
IO region and using it for itself?
