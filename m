From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] media: dt: bindings: tegra-vde: Document new optional
 IOMMU property
Date: Tue, 9 Jul 2019 17:02:05 -0600
Message-ID: <20190709230205.GA1040@bogus>
References: <20190623170730.5095-1-digetx@gmail.com>
 <20190623170730.5095-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623170730.5095-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, 23 Jun 2019 20:07:26 +0300, Dmitry Osipenko wrote:
> All NVIDIA Tegra SoC generations provide IOMMU support for the video
> decoder engine. Document new optional device-tree property that connects
> VDE with the IOMMU provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> No changes since v1.
> 
>  Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
