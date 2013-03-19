From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 3/9] ARM: dt: tegra: add bindings of power management
 configurations for PMC
Date: Tue, 19 Mar 2013 11:00:10 -0600
Message-ID: <5148999A.90102@wwwdotorg.org>
References: <1363594400-11663-1-git-send-email-josephl@nvidia.com> <1363594400-11663-4-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363594400-11663-4-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 02:13 AM, Joseph Lo wrote:
> The PMC mostly controls the entry and exit of the system from different
> sleep modes. Different platform or system may have different configurations.
> The power management configurations of PMC is represented as some properties.
> The system needs to define the properties when the system supports deep sleep
> mode (i.e. suspend).

> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt

> +- nvidia,suspend-mode : The suspend mode that the platform should use.
> +  Valid values are 0, 1 and 2:
> +  0 (LP0): CPU + Core voltage off and DRAM in self-refresh
> +  1 (LP1): CPU vlotage off and DRAM in self-refresh

s/vlotage/voltage/

BTW, checkpatch spews hundreds of lines of errors because these patches
have DOS-style line-endings. Can you please generate and send them
directly from Linux to fix this. There are also a couple of trailing
whitespace errors.
