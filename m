Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D302371CE0
	for <linux-tegra@vger.kernel.org>; Fri,  3 Apr 2026 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201704; cv=none; b=oRmPk7LT50vLQ3CvWi3zNrqLOUSoNSgpzwTrTteycMHkYB5pfY0cELvg3nEUzVPFM8aqGvzzhdtlstBdYN3GNEznUYuFsjzZY9/qyR7VJ7df6d07Nk7OFOvw+FR8Mo8cGfu++Z2quhvGtiwXq9w30KqSg6bzcxzEJHszWmnLmO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201704; c=relaxed/simple;
	bh=b88F/W5W1nSzHoIZaHpZ53hxpjDr1C+4WeW8L3mEIww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bzhdw8VUnbCw6L9Tqi6/mYRWj5+gULPT3kAti2FtoyyG3JXccjLWe18AJ34DnnhDhLiDI4Dwu2lGOSbJVG37uKIvC2ve0pkGSeuqvHrHyaRYpjx4mLTlsUULNQ7mS1wHj73xeHa1T2OnLTCtrsViNmF/74yEcX4f1XjUfuAOXI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azY2esPX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azY2esPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6EBC4CEF7;
	Fri,  3 Apr 2026 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775201704;
	bh=b88F/W5W1nSzHoIZaHpZ53hxpjDr1C+4WeW8L3mEIww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=azY2esPXY8lihI+oGh2n7H2qfdKrZ7yec0qZMnrlR2ax0CUFq+Qil8ENTh30PDWsg
	 J5/y/alxsU6ITOf/iLsmmFFgobLIJ9zG37pheeFWtgGeCmYEAmPzWgwJZwGlVG7f/u
	 ckGuHZ/FQAq04RoynrhGyTYbzcXS0b0KeIGCv8mx9uaqmHP9rE7I1Xqt2k5cUGvATn
	 KcjfOOYvgB0i41VmzaYCdBkidByy1pr8G7Bz815NPuOdcVYh8JpgByfc0V3PKMjlfX
	 18PCrrd34+FchL4zyexbzXfxqJiEiGaKuAG4fWoQSlQeYCmhBrVpDYZWDcM7yuEdHG
	 IZifnKgxDSOVQ==
Message-ID: <18acf94c-d1e1-4c42-b1a8-4cb230c3eea0@kernel.org>
Date: Fri, 3 Apr 2026 09:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
To: Thierry Reding <thierry.reding@kernel.org>, arm@kernel.org, soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-6-thierry.reding@kernel.org> <ac5ahWb1I-qnaK_Y@orome>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ac5ahWb1I-qnaK_Y@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2026 14:02, Thierry Reding wrote:
> On Sun, Mar 29, 2026 at 05:10:43PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <thierry.reding@gmail.com>
>>
>> Hi ARM SoC maintainers,
>>
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>
>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm64-dt
>>
>> for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab39030:
>>
>>   arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +0100)
>>
>> Thanks,
>> Thierry
>>
>> ----------------------------------------------------------------
>> arm64: tegra: Device tree changes for v7.1-rc1
>>
>> Various fixes and new additions across a number of devices. GPIO and PCI
>> are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowing
>> it to boot via network and mass storage.
>>
>> ----------------------------------------------------------------
>> Diogo Ivo (1):
>>       arm64: tegra: smaug: Enable SPI-NOR flash
>>
>> Jon Hunter (1):
>>       arm64: tegra: Fix RTC aliases
>>
>> Prathamesh Shete (1):
>>       arm64: tegra: Add Tegra264 GPIO controllers
>>
>> Thierry Reding (6):
>>       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
>>       Merge branch for-7.1/dt-bindings into for-7.1/pci
>>       arm64: tegra: Fix snps,blen properties
>>       arm64: tegra: Drop redundant clock and reset names for TSEC
>>       arm64: tegra: Add PCI controllers on Tegra264
>>       arm64: tegra: Add Jetson AGX Thor Developer Kit support
>>
>>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++
>>  arch/arm64/boot/dts/nvidia/Makefile                |   2 +
>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  12 +
>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 -
>>  arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   1 +
>>  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   1 +
>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   6 +-
>>  .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  |  11 +
>>  .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  12 +
>>  arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 336 +++++++++++++++++++--
>>  10 files changed, 500 insertions(+), 32 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> 
> Hi ARM SoC maintainers,
> 
> DT maintainers objected to the way I wanted to handle the DT bindings
> dependency here, so I'll drop the whole PCI stuff from this and redo the
> PR.

It took me ages to get that information from you but finally you pointed
me that this is shared with PCI, so it is fine.

Best regards,
Krzysztof
