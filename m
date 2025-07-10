Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB81FDD;
	Thu, 10 Jul 2025 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752115541; cv=none; b=MVYQxqZG7pKdRHdArGGwDl1EiqlhrVvp5rztbJsh5B5vi/3ezAYitDcN9PNfTZi4alFybR5B8KMO39KNd6X2VHIoMEM8/t6LN7xelFAzmQOrFQkOop/0SK5LXgXoqCBshbCxRo6ZT6zQbNank6tiLjs2j5EH0PjgKsW8a7sfZR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752115541; c=relaxed/simple;
	bh=eUk6e7AZRF7cb9xdrd8ekZHvFdTxe6DSM8C/y5EDFAY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YrdYlPlMa9dOrkMXzE6cCV/Sg6QMT2Yijxc54dy6eX4Jk4mfwCzhFQGpf8T6rPDu50WX6lAyO7s3Wf0eiaz5DBNQ705vEnQirWbDY8Sx9EsAQsY0OuEzN7tcAsj0YbcQYBCuTATnigwcXVmKCUUsNEwuFKlA6CsEUXDHZYT9xT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZOBh7sv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZOBh7sv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A30C4CEEF;
	Thu, 10 Jul 2025 02:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752115541;
	bh=eUk6e7AZRF7cb9xdrd8ekZHvFdTxe6DSM8C/y5EDFAY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BZOBh7svNUr5nkT1+RXSjYuoZH7nlJwIM+KWR8RJI9SvR0VxfDG0HLPCEiE+4B0LP
	 axNwWtnxHl8RlEnzcWK/7R5pQqfTlncrvEZyv9kW9XukMFKNvt/1tI5Pye+H/ScYjm
	 FFyFJ6sOG1bGKm6CTiZFnsp0F8zNySScSFC7X7Wj8lXmyIAQbb8VlMi7Ca7P47k/bs
	 g8Ei3n5qYqsj8EVBGW8EyQqAO/sK4UFfxYVr/1H3+GSfxK6d/1ozh4voOE0ACNIazJ
	 b9n+R4x9a9YcFVkRAE2S7PI9IJI+lXoM5nkCJyc9MvbUfKLfhwZqykM0g86uikQ4tU
	 E0fpNeCeVyZ8g==
Date: Wed, 09 Jul 2025 21:45:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
Message-Id: <175211539720.410893.5566510176831399738.robh@kernel.org>
Subject: Re: [PATCH 0/4] arm64: tegra: Add Tegra264 support


On Thu, 10 Jul 2025 01:13:57 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This adds support for the Tegra264 SoC as well as the engineering
> reference platform that goes with it. There isn't too much here yet, but
> it should enable users to boot into an initial ramdisk. Patches to
> enable access to the root filesystem are in the works but not quite
> ready yet.
> 
> Thierry
> 
> Thierry Reding (4):
>   arm64: tegra: Add Tegra264 support
>   arm64: tegra: Add p3971-0089+p3834-0008 support
>   arm64: tegra: Add memory controller on Tegra264
>   arm64: defconfig: Enable Tegra241 and Tegra264
> 
>  arch/arm64/boot/dts/nvidia/Makefile           |   2 +
>  .../boot/dts/nvidia/tegra264-p3834-0008.dtsi  |   7 +
>  .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  30 ++
>  .../nvidia/tegra264-p3971-0089+p3834-0008.dts |  11 +
>  .../dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
>  .../boot/dts/nvidia/tegra264-p3971-0089.dtsi  |   3 +
>  .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |   4 +
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 415 ++++++++++++++++++
>  arch/arm64/configs/defconfig                  |   2 +
>  9 files changed, 488 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
> 
> --
> 2.50.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250709 (best guess, 1/2 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250709231401.3767130-1-thierry.reding@gmail.com:

In file included from arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi:3,
                 from arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi:3,
                 from arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts:5:
arch/arm64/boot/dts/nvidia/tegra264.dtsi:3:10: fatal error: dt-bindings/clock/nvidia,tegra264.h: No such file or directory
    3 | #include <dt-bindings/clock/nvidia,tegra264.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb] Error 1
make[2]: *** [scripts/Makefile.build:554: arch/arm64/boot/dts/nvidia] Error 2
make[2]: Target 'arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: nvidia/tegra264-p3971-0089+p3834-0008.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'nvidia/tegra210-p2371-2180.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-p3450-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3737-0000+p3701-0008.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3740-0002+p3701-0008.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3737-0000+p3701-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra186-p2771-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-p2371-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra194-p3509-0000+p3668-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3768-0000+p3767-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-sim-vdk.dtb' not remade because of errors.
make: Target 'nvidia/tegra186-p3509-0000+p3636-0001.dtb' not remade because of errors.
make: Target 'nvidia/tegra194-p2972-0000.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-smaug.dtb' not remade because of errors.
make: Target 'nvidia/tegra194-p3509-0000+p3668-0001.dtb' not remade because of errors.
make: Target 'nvidia/tegra234-p3768-0000+p3767-0005.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-p2571.dtb' not remade because of errors.
make: Target 'nvidia/tegra264-p3971-0089+p3834-0008.dtb' not remade because of errors.
make: Target 'nvidia/tegra132-norrin.dtb' not remade because of errors.
make: Target 'nvidia/tegra210-p2894-0050-a08.dtb' not remade because of errors.





