From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 37/37] ARM: tegra: colibri_t20: add eval board device
 tree
Date: Tue, 25 Sep 2018 14:06:54 -0500
Message-ID: <20180925190654.GA11832@bogus>
References: <20180902100906.25792-1-marcel@ziswiler.com>
 <20180902100906.25792-38-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180902100906.25792-38-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

On Sun, Sep 02, 2018 at 12:09:06PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Add an evaluation board device tree more in-line with all our other
> device trees.
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---

> +	panel: panel {
> +		/*
> +		 * edt,et057090dhu: EDT 5.7" LCD TFT
> +		 * edt,et070080dh6: EDT 7.0" LCD TFT
> +		 */
> +		compatible = "edt,et057090dhu", "simple-panel";

'simple-panel' is not valid.

> +		backlight = <&backlight>;
> +		power-supply = <&reg_3v3>;
> +	};
