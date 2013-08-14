From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 2/5] ARM: tegra: add support for Trusted Foundations
Date: Wed, 14 Aug 2013 15:38:05 -0600
Message-ID: <520BF8BD.7050706@wwwdotorg.org>
References: <1376360992-1508-1-git-send-email-acourbot@nvidia.com> <1376360992-1508-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376360992-1508-3-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Tomasz Figa <tomasz.figa@gmail.com>, Dave Martin <Dave.Martin@arm.com>, Joseph Lo <josephl@nvidia.com>, Jassi Brar <jassisinghbrar@gmail.com>, gnurou@gmail.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/12/2013 08:29 PM, Alexandre Courbot wrote:
> Register the firmware operations for Trusted Foundations if the device
> tree indicates it is active on the device.

> diff --git a/arch/arm/mach-tegra/firmware.c b/arch/arm/mach-tegra/firmware.c

> +void __init tegra_init_firmware(void)
> +{
> +	struct device_node *node;
> +
> +	if (!of_have_populated_dt())
> +		return;

That's never false on Tegra, at least upstream.

> +	node = of_find_compatible_node(NULL, NULL, "tl,trusted-foundations");
> +	if (node) {
> +		const char *tf_version;
> +		int err;
> +
> +		err = of_property_read_string(node, "version", &tf_version);
> +		if (err != 0) {
> +			pr_crit("Cannot read Trusted Foundation version: %d\n",
> +				err);
> +			BUG();
> +		} else {
> +			register_trusted_foundations(tf_version);
> +		}
> +	}
> +}

I think most/all of that function will be common across all SoCs that
support the TF monitor. I think you want to move the code into
register_trusted_foundations() (or a function that calls that) in patch 1?
