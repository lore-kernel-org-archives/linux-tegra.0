Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B60372EDA;
	Thu, 21 May 2026 09:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355408; cv=none; b=NwPFi5snZsqUU0NeoJNJW0b9DQ8811DFXTXFK8ZbKgXn+6gVd4QpKFoINHZpI61TDZ0UMyYuOGyzYye2B5qd8yePr4kOP60c7TAtr4YeO8nVGSPelbNRAKqzCU6RU5NqZSUdEGAQm3+qTLtgglLPjij1/7LwAlol7IynU9qjHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355408; c=relaxed/simple;
	bh=HUaw0GYFktM4i/W6aor9kZD5qgYVMQfqE6Onquu5g4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6T2TwMCrE3YsfxC9jdeTctQSNS811Lpn1KEMXe3J7h4l0+zm4xyYlm3TRF+SvfQpplmBIR5dIacloownlFiG9Ft1EbKth+qQQ+RPifcARunC37rKD+zg6yij4nD7gU+9TsGSm8ArJ12IiSNP7JI2cz/rz0NuE0fQQIOLNgsb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=jngC8ob9; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="jngC8ob9"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id F36F1600300F;
	Thu, 21 May 2026 10:23:22 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id X5vN4DKspH5q; Thu, 21 May 2026 10:23:21 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E0B1D600300D;
	Thu, 21 May 2026 10:23:20 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779355400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQNSCTh24/TxAkpNclCRhegFcgT71o0jMtEZ8taZbrc=;
	b=jngC8ob9ah2AEwzTgyCuZNkzZjVq3WfouXc91sT//xjgQ8Wg7QYm4XuyEH3FsRQ4jU8RE/
	tkNGbG9S1tBN1TWHRLpoow0ulXeLvJ6DztetAG6tufeOjx1rX6yejqa3KgGseL8yZYe4a/
	PQvN2P7sKyqvha0VpiRd2Og0xE7qKoiNzFyxiOK/rKlZH9R99So3YVGmkczatvWXpwsJb7
	1nDFe3mgPgBhGDKu84f+fQ+9kGA03re5vHmrZVQkpKB4i0mt2rtJOLRpbGeXD73SJT583A
	gyZPAUBG2nohB5VrY8b8N0iTpsUSG/zeMOwbu3ZEX6rlNJQgGmKIIrBcvNhB/g==
Received: from [192.168.96.1] (unknown [89.214.153.114])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 245FF360257;
	Thu, 21 May 2026 10:23:16 +0100 (WEST)
Message-ID: <367bb557-81a0-4286-8788-0e7272cc4d02@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 11:23:11 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
 <ag65LXrLLbbeTbTb@orome>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <ag65LXrLLbbeTbTb@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/21/26 09:52, Thierry Reding wrote:
> On Thu, May 14, 2026 at 04:47:21PM +0200, Diogo Ivo wrote:
>> On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
>> than the PSCI SYSTEM_OFF call, whose firmware implementation is:
>>
>> __dead2 void tegra_system_off(void)
>> {
>>          ERROR("Tegra System Off: operation not handled.\n");
>>          panic();
>> }
> 
> Ugh... sounds very familiar. We have similar stub implementations on
> Jetson TX1 and/or Nano, if I remember correctly. Luckily newer platforms
> seem to have proper implementations for these.

Yes, on my TX1 I was encountering the same problem. However in that case
is it possible to update the firmware with a proper implementation?

> Thanks for doing this. I might want to take inspiration from this for
> these older Jetson platforms.

My pleasure!

Diogo

> Thierry
