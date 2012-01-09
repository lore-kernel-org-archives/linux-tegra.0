From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v3 0/2] ARM: IOMMU: tegra: Add iommu_ops for GART/SMMU driver
Date: Mon, 9 Jan 2012 09:39:48 +0900
Message-ID: <CAHQjnONDAmH+zpSmmOCCs9aYxT+LJGso98=exf+_WFYKT=fE3A@mail.gmail.com>
References: <1325747509-29665-1-git-send-email-hdoyu@nvidia.com>
	<20120105091718.3fb378b2a1d390f9dd63c396@nvidia.com>
	<20120105125326.GT11810@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120105125326.GT11810@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Hiroshi Doyu <hdoyu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linaro-mm-sig-bounces@lists.linaro.org" <linaro-mm-sig-bounces@lists.linaro.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 5, 2012 at 9:53 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Thu, Jan 05, 2012 at 09:17:18AM +0200, Hiroshi Doyu wrote:
>> Just for DMA mapping test from MPU side, the following one is used.
>
> This patch is buggy.
>
>> +static void dmaapi_test_map_page(struct device *dev)
>> +{
>> + =A0 =A0 struct page *page;
>> + =A0 =A0 dma_addr_t dma_addr;
>> + =A0 =A0 void *cpu_addr;
>> +
>> + =A0 =A0 page =3D alloc_page(GFP_KERNEL);
>> + =A0 =A0 BUG_ON(!page);
>> +
>> + =A0 =A0 dma_addr =3D dma_map_page(dev, page, 0, PAGE_SIZE, DMA_TO_=
DEVICE);
>> + =A0 =A0 BUG_ON(!dma_addr);
>> +
>> + =A0 =A0 cpu_addr =3D kmap(page);
>> + =A0 =A0 BUG_ON(!cpu_addr);
>> + =A0 =A0 memset(cpu_addr, 0xa5, PAGE_SIZE);
>> + =A0 =A0 kunmap(cpu_addr);
>
> The DMA API works like this:
>
> - The CPU owns the page or buffer and can access it.
> - You map the page or buffer.
> - The device owns the page or buffer; the CPU must explicitly access =
it.

I don't understand what  "CPU must __explicitly__ access it" means.

Do you mean that CPU must access the mapped buffer when
it __explicitly__ knows that the access does not cause any side effect?


> - You unmap the page or buffer.
> - The CPU again owns the page/buffer and can access it.
>
> Please respect the DMA API rules.
>
> So. =A0Once dma_map_page() has returned, you must not kmap() or other=
wise
> access the data contained in that page until after you have unmapped =
it.
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
