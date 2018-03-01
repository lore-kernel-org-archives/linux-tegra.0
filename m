From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 02/15] dt-bindings: memory: tegra: Document
 #reset-cells property of the Tegra30 MC
Date: Thu, 1 Mar 2018 15:54:57 -0600
Message-ID: <20180301215457.xaem7gblo2srez42@rob-hp-laptop>
References: <cover.1519141896.git.digetx@gmail.com>
 <cc137269e617947fe6b80629cb439ff17eec38a6.1519141896.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cc137269e617947fe6b80629cb439ff17eec38a6.1519141896.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 20, 2018 at 07:25:15PM +0300, Dmitry Osipenko wrote:
> Memory Controller has a memory client "hot reset" functionality, which
> resets the DMA interface of a memory client. So MC is a reset controller
> in addition to IOMMU. Documentation the new property.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/memory-controllers/nvidia,tegra30-mc.txt     | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
