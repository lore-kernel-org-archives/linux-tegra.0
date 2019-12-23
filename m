From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/8] iommu/vt-d: clean up 32bit si_domain
 assignment
Date: Mon, 23 Dec 2019 11:00:47 +0800
Message-ID: <e569e246-11a1-e8bd-9347-310284e96885@linux.intel.com>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <20191221150402.13868-2-murphyt7@tcd.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20191221150402.13868-2-murphyt7@tcd.ie>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.d>
List-Id: linux-tegra@vger.kernel.org

Hi,

On 12/21/19 11:03 PM, Tom Murphy wrote:
> @@ -5618,9 +5583,13 @@ static int intel_iommu_add_device(struct device *dev)
>   	struct iommu_domain *domain;
>   	struct intel_iommu *iommu;
>   	struct iommu_group *group;
> +	u64 dma_mask = *dev->dma_mask;
>   	u8 bus, devfn;
>   	int ret;
>   
> +	if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
> +		dma_mask = dev->coherent_dma_mask;
> +
>   	iommu = device_to_iommu(dev, &bus, &devfn);
>   	if (!iommu)
>   		return -ENODEV;
> @@ -5640,7 +5609,12 @@ static int intel_iommu_add_device(struct device *dev)
>   	domain = iommu_get_domain_for_dev(dev);
>   	dmar_domain = to_dmar_domain(domain);
>   	if (domain->type == IOMMU_DOMAIN_DMA) {
> -		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY) {
> +		/*
> +		 * We check dma_mask >= dma_get_required_mask(dev) because
> +		 * 32 bit DMA falls back to non-identity mapping.
> +		 */
> +		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY &&
> +				dma_mask >= dma_get_required_mask(dev)) {
>   			ret = iommu_request_dm_for_dev(dev);
>   			if (ret) {
>   				dmar_remove_one_dev_info(dev);

dev->dma_mask is set to 32bit by default. During loading driver, it sets
the real dma_mask with dma_set_mask() according to the real capability.
Here you will always see 32bit dma_mask for each device.

Best regards,
baolu
