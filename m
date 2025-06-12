Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613B9229B12;
	Thu, 12 Jun 2025 12:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732637; cv=none; b=moBhTLr+aGTvWBOHA26YIXlnq2E6NRUFg0dtPIYxY5l7c044z94nYbAD6O+R2110HnZRwZPABkD8qgtkg0LLWgH0+TfZKTeexHsjsrZdbguo/uGxBoN3ePkDeaqrVnpOqrZ7gz+b5Q84AedFYQ5PZnudQDIqvh4mjUzCA3eHd14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732637; c=relaxed/simple;
	bh=EE1ske5xbCd3TbfXLaqtf0BwK5AykzlzAQ07qgaAk1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SA7Ic+Xs2e+vw5swPLU6M/iHS2UZrupffd2AKfkbVW/oChYHba2QE9j6ip/l4sdl2vgCw5pyhXsyaFrfNGMjeNh6aNPDJv07vCJeK61pAW23Vp1vpu90qEfjgcwIp3vE1wmXZzCa5Eiz+RnQzbMTDWi94TQxtqrIAx1/4wn5/bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJ1zW1ZZcz9tNC;
	Thu, 12 Jun 2025 14:28:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zr2vrxnsQQ38; Thu, 12 Jun 2025 14:28:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJ1zD0n2Kz9t2s;
	Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 155E18B77B;
	Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oyxrjpKtRtzW; Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 94E438B769;
	Thu, 12 Jun 2025 14:28:39 +0200 (CEST)
Message-ID: <af4e9c8f-edd6-4baf-bb24-caddf731da29@csgroup.eu>
Date: Thu, 12 Jun 2025 14:28:39 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: Use dev_fwnode()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
 <22deb36a-ca61-4793-99b4-87f520445490@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <22deb36a-ca61-4793-99b4-87f520445490@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/06/2025 à 13:31, Krzysztof Kozlowski a écrit :
> On 11/06/2025 12:43, Jiri Slaby (SUSE) wrote:
>> irq_domain_create_simple() takes fwnode as the first argument. It can be
>> extracted from the struct device using dev_fwnode() helper instead of
>> using of_node with of_fwnode_handle().
>>
>> So use the dev_fwnode() helper.
>>
>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
>> Cc: Qiang Zhao <qiang.zhao@nxp.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>>
>> ---
>> Cc: linux-tegra@vger.kernel.org
>> ---
>>   drivers/soc/fsl/qe/qe_ic.c | 3 +--
>>   drivers/soc/tegra/pmc.c    | 3 +--
> These are separate subsystems. You need to split the patch per each
> actual SoC vendor.
> 


It has already been Acked by Thierry Reding who maintains tegra so I can 
take this patch as is via soc/fsl tree.

Christophe
