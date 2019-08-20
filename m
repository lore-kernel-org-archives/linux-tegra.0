From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V5 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
Date: Tue, 20 Aug 2019 02:43:24 -0700
Message-ID: <20190820094323.GD24154@infradead.org>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
 <20190815110944.3579-5-murphyt7@tcd.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190815110944.3579-5-murphyt7@tcd.ie>
Sender: linux-kernel-owner@vger.kernel.org
To: Tom Murphy <murphyt7@tcd.ie>
Cc: iommu@lists.linux-foundation.org, Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>, linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
List-Id: linux-tegra@vger.kernel.org

Looks good, and should probably be queued up asap as a bug fix:

Reviewed-by: Christoph Hellwig <hch@lst.de>
