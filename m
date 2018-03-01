From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 03/15] dt-bindings: arm: tegra: Document #reset-cells
 property of the Tegra20 MC
Date: Thu, 1 Mar 2018 15:55:25 -0600
Message-ID: <20180301215525.tufu6qeikvfueauu@rob-hp-laptop>
References: <cover.1519141896.git.digetx@gmail.com>
 <c16e37ca23b7a3c53d121ba85889bb6f35576557.1519141896.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c16e37ca23b7a3c53d121ba85889bb6f35576557.1519141896.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 20, 2018 at 07:25:16PM +0300, Dmitry Osipenko wrote:
> Memory Controller has a memory client "hot reset" functionality, which
> resets the DMA interface of a memory client, so MC is a reset controller.
> Documentation the new property.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
