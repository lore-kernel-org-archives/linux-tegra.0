From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 3/3] ARM: tegra: dalmore: add thermal zones for nct1008
Date: Tue, 04 Mar 2014 15:06:48 -0700
Message-ID: <53164E78.5010708@wwwdotorg.org>
References: <1393932664-13319-1-git-send-email-wni@nvidia.com> <1393932664-13319-4-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393932664-13319-4-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>, khali@linux-fr.org, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, lm-sensors@lm-sensors.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2014 04:31 AM, Wei Ni wrote:
> Add dt node to describe the thermal zone for the nct1008.
> 
> Change-Id: I0256836e52d73ec282574e4fd91df52958936e35

???????

> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts

> +	thermal-zones {
> +		nct1008-local {
> +			polling-delay-passive = <2000>; /* milliseconds */

Nothing can possible make use of this node, since there's no compatible
value or anything else like that to bind a driver to it.
