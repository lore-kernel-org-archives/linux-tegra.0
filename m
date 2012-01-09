From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 0/2] ARM: IOMMU: tegra: Add iommu_ops for GART/SMMU
	driver
Date: Mon, 9 Jan 2012 11:45:10 +0000
Message-ID: <20120109114510.GK21765@n2100.arm.linux.org.uk>
References: <1325747509-29665-1-git-send-email-hdoyu@nvidia.com> <20120105091718.3fb378b2a1d390f9dd63c396@nvidia.com> <20120105125326.GT11810@n2100.arm.linux.org.uk> <CAHQjnONDAmH+zpSmmOCCs9aYxT+LJGso98=exf+_WFYKT=fE3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHQjnONDAmH+zpSmmOCCs9aYxT+LJGso98=exf+_WFYKT=fE3A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: KyongHo Cho <pullip.cho@samsung.com>
Cc: Hiroshi Doyu <hdoyu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linaro-mm-sig-bounces@lists.linaro.org" <linaro-mm-sig-bounces@lists.linaro.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 09, 2012 at 09:39:48AM +0900, KyongHo Cho wrote:
> On Thu, Jan 5, 2012 at 9:53 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Thu, Jan 05, 2012 at 09:17:18AM +0200, Hiroshi Doyu wrote:
> >> Just for DMA mapping test from MPU side, the following one is used=
=2E
> >
> > This patch is buggy.
> >
> >> +static void dmaapi_test_map_page(struct device *dev)
> >> +{
> >> + =A0 =A0 struct page *page;
> >> + =A0 =A0 dma_addr_t dma_addr;
> >> + =A0 =A0 void *cpu_addr;
> >> +
> >> + =A0 =A0 page =3D alloc_page(GFP_KERNEL);
> >> + =A0 =A0 BUG_ON(!page);
> >> +
> >> + =A0 =A0 dma_addr =3D dma_map_page(dev, page, 0, PAGE_SIZE, DMA_T=
O_DEVICE);
> >> + =A0 =A0 BUG_ON(!dma_addr);
> >> +
> >> + =A0 =A0 cpu_addr =3D kmap(page);
> >> + =A0 =A0 BUG_ON(!cpu_addr);
> >> + =A0 =A0 memset(cpu_addr, 0xa5, PAGE_SIZE);
> >> + =A0 =A0 kunmap(cpu_addr);
> >
> > The DMA API works like this:
> >
> > - The CPU owns the page or buffer and can access it.
> > - You map the page or buffer.
> > - The device owns the page or buffer; the CPU must explicitly acces=
s it.

Sorry, that 'must' should have been a 'must not'.

> I don't understand what  "CPU must __explicitly__ access it" means.
>=20
> Do you mean that CPU must access the mapped buffer when
> it __explicitly__ knows that the access does not cause any side effec=
t?

No - I mean that the program must not attempt to read or write the
buffer.
