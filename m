From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/3] Documentation: DT bindings: Tegra AHB: note base
 address change
Date: Tue, 17 Mar 2015 10:43:12 -0600
Message-ID: <550859A0.9090500@wwwdotorg.org>
References: <20150317083221.32662.14647.stgit@baseline> <20150317083221.32662.96822.stgit@baseline>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150317083221.32662.96822.stgit@baseline>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul@pwsan.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Hiroshi DOYU <hdoyu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 03/17/2015 02:32 AM, Paul Walmsley wrote:
> For Tegra132 and later chips, we can now use the correct hardware base
> address for the Tegra AHB IP block in the DT data.  Update the DT binding
> documentation to reflect this change.

> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> index 067c979..7692b4c 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> @@ -2,10 +2,15 @@ NVIDIA Tegra AHB
>
>   Required properties:
>   - compatible : For Tegra20, must contain "nvidia,tegra20-ahb".  For
> -  Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
> -  '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
> -  tegra132, or tegra210.
> -- reg : Should contain 1 register ranges(address and length)
> +  Tegra30, must contain "nvidia,tegra30-ahb".  For Tegra114 and Tegra124, must
> +  contain '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra114
> +  or tegra124.  For Tegra132, the compatible string must contain
> +  "nvidia,tegra132-ahb".
> +
> +- reg : Should contain 1 register ranges(address and length).  On Tegra20,
> +  Tegra30, Tegra114, and Tegra124 chips, the low byte of the physical base
> +  address of the IP block must end in 0x04.  On DT files for later chips, the
> +  actual hardware base address of the IP block should be used.

A table-based approach rather than prose might make this more legible?

- compatible: Must contain the following:
   Tegra20:  "nvidia,tegra20-ahb"
   Tegra30:  "nvidia,tegra30-ahb"
   Tegra114: "nvidia,tegra114-ahb", "nvidia,tegra30-ahb"
   Tegra124: "nvidia,tegra124-ahb", "nvidia,tegra30-ahb"
   Tegra132: "nvidia,tegra132-ahb"
   Tegra210: "nvidia,tegra210-ahb", "nvidia,tegra132-ahb"

With any luck, we can extend that final item for future chips to be:

   Tegra210, TegraNNN:
             "nvidia,tegra<chip>-ahb", "nvidia,tegra132-ahb"

Perhaps we format the 114/124 entry that way too.


As a historical note, I thought this issue might have been caused by the 
HW lumping together a bunch of vaguely related features into the same 
address window, with offset 0 being unrelated to AHB. This is certainly 
the explanation for some other interesting reg value in DT on other HW 
modules in Tegra. However as best I can tell that isn't the case for 
this HW module; we just mapped the start of the reg value to the first 
defined register for some reason rather than aligning it with the entry 
in the address map. So, this series makes sense to me.

The series,
Acked-by: Stephen Warren <swarren@nvidia.com>

(it'd be nice if the DT doc was modified as I described above, but not 
strictly necessary. I like Russell's ideas how to make this more 
transparent/automatic so old DTs can be converted too).
