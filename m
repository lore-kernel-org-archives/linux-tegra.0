Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E2639B972
	for <linux-tegra@vger.kernel.org>; Tue, 31 Mar 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944005; cv=none; b=mGsWfCtSLxJ1Gyl79wObvEA9XYawgcilyT7jI0C5RIwm/z6XvjINgJCTjGL7IuzyKAxkAPM2voNDW6xu39w0qQNhzps04ccoCmToB2WOMm8Sbr7axMEUKRyVFAOcQM2eitus76geJJ59MAJ1q0H1z1dQXUXp9gug4TyeH7vk858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944005; c=relaxed/simple;
	bh=q2+nfL37GrTHVmuN1imckBosHqFf22PsTBWLNl/72RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxiRaN8Q94Mkv8CEHQBD1qH5WCh0Fyz22LZLKi+eelubYCS1d7X+NecVmGchswcLKEwcOMv5aKUJrUUXALeD6tX+I5xpCRAw6VKANJS3kGAqVq3aFXTOi5eTRpxHEwbVgmDjSSkmYDI9weXcRa86IgL61jkaLNWIvza0GFYohYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIl+UEJC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIl+UEJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C4DC19423;
	Tue, 31 Mar 2026 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774944004;
	bh=q2+nfL37GrTHVmuN1imckBosHqFf22PsTBWLNl/72RE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uIl+UEJCHUbZRudM3Xq5tbOh5yGB+91Y38yhA/+eLjIPd2nZL9y1GgYev5QA+f08S
	 3yac89lDztd/oz1uYmA63H2i0E+T/0mHqEDzWErqPgLS03OO5SzlflIjJ21Vuu6GSA
	 CPQ30GsI5JyoULVIWmBR2z4P5bJSBNOOb4ogPv5KYFTkEemBWdxBqOw60HpoLV/5jn
	 EICfjwAOT7JdFRboIR8wKKd+d4tqaBd3fTc2vvLKCnkq3tyW4YqMzARnChov/y+sWm
	 lyQ02jveIzxObAueMKEeEtiCj6zpvF51LIMPz0VMif06kfuPX8vJeSUJaxzasPgAUJ
	 U6f58fP6igpyQ==
Message-ID: <e5327cd9-4aa1-4e26-b748-dd1af29e6fdb@kernel.org>
Date: Tue, 31 Mar 2026 10:00:01 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
To: Thierry Reding <thierry.reding@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Thierry Reding
 <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-6-thierry.reding@kernel.org>
 <7b9bc5d1-7a1d-456c-b280-5f4dc969609d@kernel.org> <act77WcvwYedN0Q8@orome>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <act77WcvwYedN0Q8@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2026 09:53, Thierry Reding wrote:
> On Mon, Mar 30, 2026 at 01:45:24PM +0200, Krzysztof Kozlowski wrote:
>> On 29/03/2026 17:10, Thierry Reding wrote:
>>> From: Thierry Reding <thierry.reding@gmail.com>
>>>
>>> Hi ARM SoC maintainers,
>>>
>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>>
>>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm64-dt
>>>
>>> for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab39030:
>>>
>>>   arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +0100)
>>>
>>> Thanks,
>>> Thierry
>>>
>>> ----------------------------------------------------------------
>>> arm64: tegra: Device tree changes for v7.1-rc1
>>>
>>> Various fixes and new additions across a number of devices. GPIO and PCI
>>> are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowing
>>> it to boot via network and mass storage.
>>>
>>> ----------------------------------------------------------------
>>> Diogo Ivo (1):
>>>       arm64: tegra: smaug: Enable SPI-NOR flash
>>>
>>> Jon Hunter (1):
>>>       arm64: tegra: Fix RTC aliases
>>>
>>> Prathamesh Shete (1):
>>>       arm64: tegra: Add Tegra264 GPIO controllers
>>>
>>> Thierry Reding (6):
>>>       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
>>
>>
>> This is unreviewed/unacked binding where PCI maintainers had 1 day to
>> react to your v3.
> 
> Rob gave a reviewed-by on this about a week ago:
> 
>   https://lore.kernel.org/linux-tegra/177440189257.2451552.18196101830235626115.robh@kernel.org/

Rob, although knows a lot about PCI, is not a formally a PCI subsystem
maintainer.

> 
> In my experience the PCI maintainers typically defer review of the DT
> bindings to DT maintainers, so I considered Rob's R-b sufficient.

Sure and they acknowledge this, that review is done and patch can go
other way, with "Ack".

Where is the Ack?

> 
>>                   Maybe they had more time for previous versions, but
>> nevertheless it is also part of other patchset, so it will get into the
>> kernel other tree and nothing on v3 posting:
>> https://lore.kernel.org/all/20260326135855.2795149-4-thierry.reding@kernel.org/
>> gives hints that there will be cross tree merge.
> 
> Maybe look at the cover letter:
> 
>   https://lore.kernel.org/all/20260326135855.2795149-1-thierry.reding@kernel.org/
> 
> I clearly pointed out the build dependencies and suggested a shared
> branch to resolve them in both trees. Given that the bindings were

No problem, that's a valid solution. Can you point me with a lore link
to the shared branch posting (these tags/pull requests must be posted on
the lists)? Or to an ack from PCI maintainers?

The commit itself does not have an Ack, but maybe was just missed.

> reviewed by Rob and they are needed in both the subsystem tree
> (according to your own rules) as well as the DT tree (for validation),
> I included the bindings in the shared branch as well.



Best regards,
Krzysztof
