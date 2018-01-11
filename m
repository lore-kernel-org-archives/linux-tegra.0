From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: tegra: Add documentation for
 nvidia,tegra194-pmc
Date: Thu, 11 Jan 2018 15:46:56 -0600
Message-ID: <20180111214656.r25lyso42p62zb5b@rob-hp-laptop>
References: <1515387278-29777-1-git-send-email-mperttunen@nvidia.com>
 <1515387278-29777-5-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1515387278-29777-5-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 08, 2018 at 06:54:36AM +0200, Mikko Perttunen wrote:
> The Tegra194 power management controller has one additional register
> aperture to be specified in the device tree node.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
