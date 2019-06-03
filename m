From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 07/26] iommu/dma: move the arm64 wrappers to common code
Date: Mon, 3 Jun 2019 20:47:57 +0100
Message-ID: <acb46c7f-0855-de30-485f-a6242968f947@nvidia.com>
References: <20190422175942.18788-1-hch@lst.de>
 <20190422175942.18788-8-hch@lst.de>
 <06b331f0-7df7-a6cd-954c-789f89a0836d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <06b331f0-7df7-a6cd-954c-789f89a0836d@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Cc: Joerg Roedel <joro@8bytes.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tom Lendacky <thomas.lendacky@amd.com>, iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 29/04/2019 13:56, Robin Murphy wrote:
> On 22/04/2019 18:59, Christoph Hellwig wrote:
>> There is nothing really arm64 specific in the iommu_dma_ops
>> implementation, so move it to dma-iommu.c and keep a lot of symbols
>> self-contained.=C2=A0 Note the implementation does depend on the
>> DMA_DIRECT_REMAP infrastructure for now, so we'll have to make the
>> DMA_IOMMU support depend on it, but this will be relaxed soon.
>=20
> Nothing looks objectionable, and boot testing with this much of the
> series merged has my coherent and non-coherent IOMMU-backed devices
> appearing to still work OK, so:
>=20
> Acked-by: Robin Murphy <robin.murphy@arm.com>

Since next-20190529 one of our tests for MMC has started failing, where
the symptom is that the data written to the MMC does not match the
source. Bisecting this is pointing to this commit. Unfortunately, I am
not able to cleanly revert this on top of -next, but wanted to report
this if case you have any ideas.

Cheers
Jon

--=20
nvpublic
