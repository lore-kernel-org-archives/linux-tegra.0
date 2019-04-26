From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: tegra-xusb: List PLL power supplies
Date: Fri, 26 Apr 2019 09:06:29 +0100
Message-ID: <2ca553b9-a744-534b-6b64-634c14500077@nvidia.com>
References: <20190425153444.6281-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425153444.6281-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 25/04/2019 16:34, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> These power supplies provide power for various PLLs that are set up and
> driven by the XUSB pad controller. These power supplies were previously
> improperly added to the PCIe and XUSB controllers, but depending on the
> driver probe order, power to the PLLs will not be supplied soon enough
> and cause initialization to fail.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
For the series ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
