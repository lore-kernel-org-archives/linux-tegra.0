From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 04/15] dt-bindings: memory: tegra: Add hot resets
 definitions
Date: Thu, 1 Mar 2018 15:56:31 -0600
Message-ID: <20180301215631.6wm3e4rtrqsbqn72@rob-hp-laptop>
References: <cover.1519141896.git.digetx@gmail.com>
 <8b54af80e13406fc873dcc5932223f5d1c196172.1519141896.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8b54af80e13406fc873dcc5932223f5d1c196172.1519141896.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 20, 2018 at 07:25:17PM +0300, Dmitry Osipenko wrote:
> Add definitions for the Tegra20+ memory controller hot resets.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra114-mc.h | 19 +++++++++++++++++++
>  include/dt-bindings/memory/tegra124-mc.h | 25 +++++++++++++++++++++++++
>  include/dt-bindings/memory/tegra20-mc.h  | 21 +++++++++++++++++++++
>  include/dt-bindings/memory/tegra210-mc.h | 31 +++++++++++++++++++++++++++++++
>  include/dt-bindings/memory/tegra30-mc.h  | 19 +++++++++++++++++++
>  5 files changed, 115 insertions(+)
>  create mode 100644 include/dt-bindings/memory/tegra20-mc.h

Reviewed-by: Rob Herring <robh@kernel.org>
