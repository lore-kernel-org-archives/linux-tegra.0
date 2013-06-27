From: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Thu, 27 Jun 2013 09:59:47 -0700
Message-ID: <51CC6F83.2010606@nvidia.com>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371994685-4997-1-git-send-email-chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/23/2013 06:38 AM, Chris Desjardins wrote:
>
> Signed-off-by: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/tegra30-carma.dts |  461 +++++++++++++++++++++++++++++++++++
>   1 file changed, 461 insertions(+)
>   create mode 100644 arch/arm/boot/dts/tegra30-carma.dts
>
> diff --git a/arch/arm/boot/dts/tegra30-carma.dts b/arch/arm/boot/dts/tegra30-carma.dts
> new file mode 100644
> index 0000000..e88134e
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra30-carma.dts
> @@ -0,0 +1,461 @@
> +/dts-v1/;
> +#include "tegra30.dtsi"
> +
> +/**
> + * This file contains common DT entry for Carma
> + */
> +
> +/ {
> +       model = "NVIDIA Tegra30 Carma evaluation board";
> +       compatible = "nvidia,carma", "nvidia,tegra30";

Chris,

This is not an NVIDIA board, it's a Seco board.  I'd suggest:

model = "Seco Tegra30 Carma development board";
compatible = "seco,carma", "nvidia,tegra30";

But you might want to check with Seco regarding preference of prefix for 
"seco,carma" above.  I see no precedent for it after a quick check.

Thanks,
Eric
