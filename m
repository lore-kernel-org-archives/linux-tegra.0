Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA7821ABDB;
	Fri,  7 Mar 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741356423; cv=none; b=A+9KaHuxPfPAALyHmkx/Vwz1aupD/u+tm3xn5wBW/Wqx81uiNxV2duZZb3k49YqAqJOVpbBv2sN724ddnX1fMG030UxyT7ScoBV5cKhICt5syCcF+Fgj6koiw6ciQQvPTStwsVfP1+itnh3gUp2uDwQigQsz6w5xafQLhNq2whs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741356423; c=relaxed/simple;
	bh=mmv2E9F+UfPAQ/2f6RZO6VoS3fV6ohPEF0Q1R0VuLMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htELGh44E7tmEKAWaPPjhcTKbjqV9ko+6PPIRH6F7DElLvkYEZKgIz/PVGFVdr+xnxpjIJP+tgFZNxdrCM4gW5AHl7QHI7yz3EHgjIu6dC3MnZhXiC+AIaT630Ohu4NxynnIIzYdjeIOs5O5SoibAhiD+af/xYj6SrqT32SNdR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+i3hJmC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+i3hJmC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93B4C4CEE7;
	Fri,  7 Mar 2025 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741356422;
	bh=mmv2E9F+UfPAQ/2f6RZO6VoS3fV6ohPEF0Q1R0VuLMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U+i3hJmCJq6JdAbCq+2zbE69YmNji1k0H0ii5Ri5sz4QeoUo1/TN+bARDZ+XjLq+2
	 gJ72mbISMZTAyIxM3Yf3BTwnDRVLfzJ3Nafs8PeUamTQG5/JUu3sGWlnm8ncY/MkF0
	 C0N32lyuYRuNr2VvRDqfA0xW8VeLDCqm2fvXGu79in40Whw8tOal+48G9sj0Oxk9Rh
	 yEVsC59CwB7UHWKdokmzCBicZiOXjJTMG12om5QsKzaWPoNdIcZVGDxjnm+jyR9/J6
	 PPPk83FOcThC2tiV21VcYkgciYZDQ38S4YSjNmU37zO12BVv4P2F+d3Ph+cfGFM6BV
	 Fidw7qSt7PsOA==
Message-ID: <7d3b0aa7-9ebf-4493-94ae-338207448429@kernel.org>
Date: Fri, 7 Mar 2025 15:06:54 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114 and Tegra124
To: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250307081047.13724-1-clamor95@gmail.com>
 <20250307081047.13724-2-clamor95@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250307081047.13724-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2025 09:10, Svyatoslav Ryhel wrote:
> The current EPP, ISP and MPE schemas are largely compatible with Tegra114 and Tegra124,
> requiring only minor adjustments. Additionally, the TSEC schema for the Security engine,
> which is available from Tegra114 onwards, is included.


Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra114-tsec.yaml   | 70 +++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     | 12 ++--
>  .../display/tegra/nvidia,tegra20-isp.yaml     | 16 +++--
>  .../display/tegra/nvidia,tegra20-mpe.yaml     | 30 ++++++--
>  4 files changed, 114 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> new file mode 100644
> index 000000000000..84d9ab9394d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Security co-processor

How security processor is related to display?



> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +  - Thierry Reding <thierry.reding@gmail.com>

Please provide description of the hardware here.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra114-tsec
> +      - const: nvidia,tegra124-tsec

That's just enum

> +      - items:
> +          - const: nvidia,tegra132-tsec
> +          - const: nvidia,tegra124-tsec
> +      - const: nvidia,tegra210-tsec

And this goes to enum.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: module clock

Instead: maxItems: 1

> +
> +  resets:
> +    items:
> +      - description: module reset

Instead: maxItems: 1


> +
> +  reset-names:
> +    items:
> +      - const: tsec

Drop reset-names, redundant.

> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 6

You need to list the items.

> +
> +  interconnect-names:
> +    maxItems: 6

You need to list the items.

> +
> +  operating-points-v2: true

No opp-table?

> +
> +  power-domains:
> +    items:
> +      - description: phandle to the core power domain
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra114-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tsec@54500000 {
> +        compatible = "nvidia,tegra114-tsec";
> +        reg = <0x54500000 0x00040000>;
> +        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA114_CLK_TSEC>;
> +        resets = <&tegra_car TEGRA114_CLK_TSEC>;
> +        reset-names = "tsec";
> +    };
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
> index 3c095a5491fe..a50e3261a191 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
> @@ -15,10 +15,14 @@ properties:
>      pattern: "^epp@[0-9a-f]+$"
>  
>    compatible:
> -    enum:
> -      - nvidia,tegra20-epp
> -      - nvidia,tegra30-epp
> -      - nvidia,tegra114-epp
> +    oneOf:
> +      - const: nvidia,tegra20-epp
> +      - const: nvidia,tegra30-epp
> +      - const: nvidia,tegra114-epp
> +      - const: nvidia,tegra124-epp

No, that was an enum.

> +      - items:
> +          - const: nvidia,tegra132-epp
> +          - const: nvidia,tegra124-epp
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
> index 3bc3b22e98e1..bfef4f26a3d7 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
> @@ -11,11 +11,19 @@ maintainers:
>    - Jon Hunter <jonathanh@nvidia.com>
>  
>  properties:
> +  $nodename:
> +    pattern: "^isp@[0-9a-f]+$"

Why?

Nothing in commit msg explains this.


> +
>    compatible:
> -    enum:
> -      - nvidia,tegra20-isp
> -      - nvidia,tegra30-isp
> -      - nvidia,tegra210-isp
> +    oneOf:
> +      - const: nvidia,tegra20-isp
> +      - const: nvidia,tegra30-isp
> +      - const: nvidia,tegra114-isp
> +      - const: nvidia,tegra124-isp
> +      - items:
> +          - const: nvidia,tegra132-isp
> +          - const: nvidia,tegra124-isp
> +      - const: nvidia,tegra210-isp
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
> index 2cd3e60cd0a8..35e3991f1135 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
> @@ -12,13 +12,19 @@ maintainers:
>  
>  properties:
>    $nodename:
> -    pattern: "^mpe@[0-9a-f]+$"
> +    oneOf:
> +      - pattern: "^mpe@[0-9a-f]+$"
> +      - pattern: "^msenc@[0-9a-f]+$"
>  
>    compatible:
> -    enum:
> -      - nvidia,tegra20-mpe
> -      - nvidia,tegra30-mpe
> -      - nvidia,tegra114-mpe
> +    oneOf:
> +      - const: nvidia,tegra20-mpe
> +      - const: nvidia,tegra30-mpe
> +      - const: nvidia,tegra114-msenc
> +      - const: nvidia,tegra124-msenc
> +      - items:
> +          - const: nvidia,tegra132-msenc
> +          - const: nvidia,tegra124-msenc
>  
>    reg:
>      maxItems: 1
> @@ -36,7 +42,9 @@ properties:
>  
>    reset-names:
>      items:
> -      - const: mpe
> +      - enum:
> +          - mpe
> +          - msenc

No, why? That's redundant. Having names equal to module name brings zero
benefits. This change even shows that it is counter productive.

>  
>    iommus:
>      maxItems: 1
> @@ -58,6 +66,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/clock/tegra114-car.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      mpe@54040000 {
> @@ -68,3 +77,12 @@ examples:
>          resets = <&tegra_car 60>;
>          reset-names = "mpe";
>      };
> +
> +    msenc@544c0000 {
> +        compatible = "nvidia,tegra114-msenc";

Difference in compatible does not mean you need new example.


Best regards,
Krzysztof
