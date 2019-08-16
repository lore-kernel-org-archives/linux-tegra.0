From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Document regulators
 coupling of NVIDIA Tegra20/30 SoCs
Date: Fri, 16 Aug 2019 16:34:17 -0500
Message-ID: <20190816213417.GA9123@bogus>
References: <20190725151832.9802-1-digetx@gmail.com>
 <20190725151832.9802-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725151832.9802-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 25 Jul 2019 18:18:30 +0300, Dmitry Osipenko wrote:
> There is voltage coupling between three regulators on Tegra20 boards and
> between two on Tegra30. The voltage coupling is a SoC-level feature and
> thus it is mandatory and common for all of the Tegra boards.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../nvidia,tegra-regulators-coupling.txt      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
