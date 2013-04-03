From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v9 10/14] ARM: tegra: Define Tegra114 CAR binding
Date: Wed, 03 Apr 2013 11:55:40 -0600
Message-ID: <515C6D1C.60503@wwwdotorg.org>
References: <1365000110-8916-1-git-send-email-pdeschrijver@nvidia.com> <1365000110-8916-10-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1365000110-8916-10-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Simon Glass <sjg@chromium.org>, Rhyland Klein <rklein@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Hiroshi Doyu <hdoyu@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Andrew Chew <achew@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 08:40 AM, Peter De Schrijver wrote:
> The device tree binding models Tegra114 CAR (Clock And Reset) as a single
> monolithic clock provider.

> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt

> +Mux clocks
> +
> +  300	audio0_mux
> +  301	audio1_mux
> +  302	audio2_mux
> +  303	audio3_mux
> +  304	audio4_mux
> +  305	spdif_mux
> +  306	clk_out_1_mux
> +  307	clk_out_2_mux
> +  308	clk_out_3_mux
> +  309	dsia_mux
> +  310	dsib_mux

I think Prashant was expecting those to be removed, and for this series
to rely on "clk: Add composite clock type" instead?
