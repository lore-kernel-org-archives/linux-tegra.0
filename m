From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/5] of: Add descriptions of thermtrip properties to
 Tegra PMC bindings
Date: Wed, 20 Aug 2014 14:16:49 -0600
Message-ID: <53F50231.5010605@wwwdotorg.org>
References: <1407933685-12404-1-git-send-email-mperttunen@nvidia.com> <1407933685-12404-2-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407933685-12404-2-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/13/2014 06:41 AM, Mikko Perttunen wrote:
> Hardware-triggered thermal reset requires configuring the I2C
> reset procedure. This configuration is read from the device tree,
> so document the relevant properties in the binding documentation.

> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt

> +Hardware-triggered thermal reset:
> +On Tegra30, Tegra114 and Tegra124, if the 'i2c-thermtrip' subnode exists,
> +hardware-triggered thermal reset will be enabled.

"will be enabled" sounds like SW behaviour, whereas DT is suppose to 
describe HW, and leave SW to define its own behaviour. I would suggest:

Optional sub-nodes:
i2c-thermtrip: Describes how to power off the system in the event of a
   thermal emergency.

> +Required properties for hardware-triggered thermal reset (inside 'i2c-thermtrip'):

Simpler might be:

Required properties for i2c-thermtrip node:

> +- nvidia,pmu : Phandle to power management unit / PMIC handling poweroff
> +- nvidia,reg-addr : I2C register address to write poweroff command to
> +- nvidia,reg-data : Poweroff command to write to PMU

Why are both the PMU/PMIC phandle and the register address/data 
required? I thought the purpose of having the phandle was to allow the 
register address and data to be queried from the PMU/PMIC driver.

To me, it seems much simpler to get rid of the phandle and just 
hard-code the I2C bus number, address, and data into this node, rather 
than having to go query it from the PMU/PMIC driver, then find the I2C 
controller, then query it for its ID (and hope that all HW modules that 
talk to I2C controllers directly use the same numbering scheme...)
