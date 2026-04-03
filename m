Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8296D288C34
	for <linux-tegra@vger.kernel.org>; Fri,  3 Apr 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201960; cv=none; b=OIBVZLtltuW9qgDHDucZDKfDX2xOkqeh3ZOKHgr+Gt4y09UKGgOcVHT1kmBElLzabgg060uZDyWZZlDwhC2G1Ooi0ZbHLcljxikFfBGuMz/3R4UdqY8ufkeatUwkGUeaF/Ak2VkXZunY/PywdBiwIMqAo5ooECKpOB3Y10pZhBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201960; c=relaxed/simple;
	bh=xPoa0BbChJ+jT0Cpnhz+hGgsAJtRwv/Nr2imXzBv2RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m49tNbuu1B7044ei/5gu4P9IHOs8xq/46sBtzhxcabRv4z7mlWnrc9FARsm1/ZfMcwvax3M0AoqkWJxbPRAG8szNlKmoq2cIiv3DwyF1x6OR2/YqzFqIMjphJ8lZLmaVEOSiO3n5HyBdRChto0zaJlACE12aH5OYOYtSSHo4jLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXiWbQS0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXiWbQS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B8EC19424;
	Fri,  3 Apr 2026 07:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775201960;
	bh=xPoa0BbChJ+jT0Cpnhz+hGgsAJtRwv/Nr2imXzBv2RA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jXiWbQS0n6UB8/ez3MJfN+TKpOBfyOQh9hohTDapCPl5RcEZrWKSFjufFIE19wFHQ
	 NtJPfcuM9+op6A0/lZ+A/ckLAJbpHz8f3G+iDvpjY7HEYllOQTJKpOxBdCH29kPR/I
	 lA+BoNfChOwlTe5MSk4HFbmQ2S4CI8muIrHeSsNyHZUP93KdQBRdIPQW6yEmOnNCZo
	 9l/SvfXrDWAKt4ODCLvPiJ4hKBMs0C61fw+2jsf350em+WwSvtfS3PPBSuyUYOXWHx
	 jxfI/aFN1C2Q9wg2ORyVl9rBzfoRYONTENTlrRnwmkDBZZm/qC9L6NQDtWWEeIqSmd
	 u1sXqZNFWF9tQ==
Message-ID: <6ffa564c-9026-49ca-a08d-c87a3f9b9b18@kernel.org>
Date: Fri, 3 Apr 2026 09:39:17 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
To: Thierry Reding <thierry.reding@kernel.org>, arm@kernel.org, soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <ac5aLzMyfnxa-LLi@orome>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ac5aLzMyfnxa-LLi@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2026 14:00, Thierry Reding wrote:
> On Sun, Mar 29, 2026 at 05:10:38PM +0200, Thierry Reding wrote:
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
>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-dt-bindings
>>
>> for you to fetch changes up to bed2f5b4de6c6fd8f8928f6373ad92e8795c370f:
>>
>>   dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit (2026-03-28 01:05:24 +0100)
>>
>> Thanks,
>> Thierry
>>
>> ----------------------------------------------------------------
>> dt-bindings: Changes for v7.1-rc1
>>
>> This contains a few conversions to DT schema along with various
>> additions and fixes to reduce the amount of validation warnings.
>>
>> Included are also a new binding for the PCIe controller found on
>> Tegra264 as well as compatible strings for the Jetson AGX Thor
>> Developer Kit.
>>
>> ----------------------------------------------------------------
>> Sumit Gupta (1):
>>       dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings
>>
>> Svyatoslav Ryhel (1):
>>       dt-bindings: display: tegra: Document Tegra20 HDMI port
>>
>> Thierry Reding (9):
>>       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
>>       dt-bindings: phy: tegra-xusb: Document Type C support
>>       dt-bindings: clock: tegra124-dfll: Convert to json-schema
>>       dt-bindings: interrupt-controller: tegra: Fix reg entries
>>       dt-bindings: arm: tegra: Add missing compatible strings
>>       dt-bindings: phy: tegra: Document Tegra210 USB PHY
>>       dt-bindings: memory: Add Tegra210 memory controller bindings
>>       dt-bindings: memory: tegra210: Mark EMC as cooling device
>>       dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit
>>
>>  Documentation/devicetree/bindings/arm/tegra.yaml   |  56 +++-
>>  .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   4 +
>>  .../bindings/clock/nvidia,tegra124-dfll.txt        | 155 -----------
>>  .../bindings/clock/nvidia,tegra124-dfll.yaml       | 290 +++++++++++++++++++++
>>  .../display/tegra/nvidia,tegra20-hdmi.yaml         |  13 +-
>>  .../interrupt-controller/nvidia,tegra20-ictlr.yaml |  23 +-
>>  .../memory-controllers/nvidia,tegra210-emc.yaml    |   6 +-
>>  .../memory-controllers/nvidia,tegra210-mc.yaml     |  77 ++++++
>>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++++
>>  .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  |  39 ++-
>>  .../bindings/phy/nvidia,tegra20-usb-phy.yaml       |   1 +
>>  11 files changed, 649 insertions(+), 164 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
>>  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
> 
> Hi ARM SoC maintainers,
> 
> Please ignore this for now. I'm dropping my set of patches from this
> because they upset the DT maintainers. I'll send another version with
> only Sumit and Svyatoslav's patches.

I plan to take this, because rejecting it won't improve anything and
patches seems to be non-conflicting. In the future, please do not filter
out addresses of other maintainers and their lists from
get_maintainers.pl output for patches belonging to their subsystems. If
the patchset becomes 50-Cc-patch-bomb, then standard rule of submitting
patches applies - should be split.


Best regards,
Krzysztof
