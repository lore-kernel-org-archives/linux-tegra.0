From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/8] dt: bindings: Move tegra20-emc binding to
 memory-controllers directory
Date: Wed, 20 Jun 2018 12:24:16 -0600
Message-ID: <20180620182416.GA13759@rob-hp-laptop>
References: <20180617145539.4758-1-digetx@gmail.com>
 <20180617145539.4758-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180617145539.4758-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 17, 2018 at 05:55:34PM +0300, Dmitry Osipenko wrote:
> Move tegra20-emc binding to the memory-controllers directory for
> consistency with the other Tegra memory bindings.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt      | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt (100%)

Thanks.

Acked-by: Rob Herring <robh@kernel.org>
