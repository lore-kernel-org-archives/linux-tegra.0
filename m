Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06F12836AF;
	Wed, 11 Jun 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642727; cv=none; b=HPiJXrrQb7tGixTL7HHjvU+Q4kNlmSeNu4wCCwZz66Jdl41BbZHQ2NMD7KIi0cnaQVU/Z5+oj6vi3OMZG0n7jzIUQ1nH19wC5QuoqVdPiTLZ2fiQfk8SSM5ySZoemBsX2qNhhyKZRiNqibGHDLSdLPFI4Bh/jjAwEDr0pQuwBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642727; c=relaxed/simple;
	bh=GtmhfRKIqXA4qFy6It71qRzGcdobiTnryhfJuuRrCCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gbVLo3CDzdf4RfG3cNuVt6IzIMZoGaeWZWQzEX3AIMX4rOix7X7J40QN9w+sZW6QuV0FwzxK/w+U1OlfhBRgRC1HcRkrEK3a1ZBocF9MU36TByk+6jYvreU8lMP1mAzmKi555XGt/Of8w9RMURYmCiYODmRmjNinnkKpkOoYAXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=Zt7n7Z4/; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Zt7n7Z4/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D6AFF6003006;
	Wed, 11 Jun 2025 12:52:03 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id pgY0qHFItH3e; Wed, 11 Jun 2025 12:52:01 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 013966000870;
	Wed, 11 Jun 2025 12:52:01 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749642721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Rri53Eo7/3l8mt9JrOH+jnscGitH/3oc84vLlM63uI=;
	b=Zt7n7Z4/VXQFijEFZo7YyBFOih02agzetxv7J7KE51BT6jbMYwsa6ROoHwhCW3RfK6ntPT
	zqebZgCccTbrC+vmcnDwfL1YiadoD3w9G8lWGcQoUZIkOhK9sHeEds0e7shyKopTx7Z1Q2
	PL8AKvmdnCrSAMV+uWnVA4CZttIHowQ=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CC98B360061;
	Wed, 11 Jun 2025 12:52:00 +0100 (WEST)
Message-ID: <4ac9f433-f1d3-407b-8fd6-3cc44c141748@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 12:51:58 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: tegra: Add NVJPG node
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-3-5f2c36feeb39@tecnico.ulisboa.pt>
 <4a02f671-2be0-45c9-b471-071596b22338@kapsi.fi>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <4a02f671-2be0-45c9-b471-071596b22338@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/25 6:01 AM, Mikko Perttunen wrote:
> On 6/6/25 7:45 PM, Diogo Ivo wrote:
>> The Tegra X1 chip contains a NVJPG accelerator capable of
>> encoding/decoding JPEG files in hardware, so add its DT node.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/ 
>> boot/dts/nvidia/tegra210.dtsi
>> index 
>> 6f8cdf012f0f12a16716e9d479c46b330bbb7dda..087f38256fd40f57c4685e907f9682eb49ee31db 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -253,7 +253,13 @@ vic@54340000 {
>>           nvjpg@54380000 {
>>               compatible = "nvidia,tegra210-nvjpg";
>>               reg = <0x0 0x54380000 0x0 0x00040000>;
>> -            status = "disabled";
>> +            clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
>> +            clock-names = "nvjpg";
>> +            resets = <&tegra_car 195>;
>> +            reset-names = "nvjpg";
>> +
>> +            iommus = <&mc TEGRA_SWGROUP_NVJPG>;
>> +            power-domains = <&pd_nvjpg>;
>>           };
>>           dsib: dsi@54400000 {
>>
> 
> Please mention Tegra210 in the commit subject, and perhaps adjust the 
> commit message to say that you're updating and enabling the device tree 
> node (rather than adding, since it's already there).

Will do, for v2 I'll collect the tag, mention Tegra210 and change the
commit message.

> With that,
> 
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
