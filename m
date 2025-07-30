Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7132D6623;
	Wed, 30 Jul 2025 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883450; cv=none; b=MLmmrXehaYgtGFJUjomG3i2aQ5wN0mwX4lvixJTNE8dsiAcjrpw5RnHwJQ2PnWDyr0H5CVuoJ6oPsJYnm10v8xU1HVqa5+wNWxRwc9IfLMCIKkvX7ho8bS1RzTEi7Z6sS2J3rTvcYRV+hlfuqrl9eXaPbFrbW7RlGL+mSyEBIfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883450; c=relaxed/simple;
	bh=J7dvpyIoCy9NIKCBj4b8RMd8iL7yTVA0V2WKCp0lX20=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nWPi0NEGUxwWFh/LE+yxUfLeZWiiLcySHimHp78u1B1trA9WXooX96WKg67udp6YH1RROgKSejizt0MGodGLzaWd5OAh20k4JnD/jaROK0zeFSynWemSER+zKtMiXBvKvALoPLGGEucB/U10ruk86KcAmUI4rhobPKt/nJSwrmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsYDJ1Vh3z9srp;
	Wed, 30 Jul 2025 15:37:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTOaUPuVAapB; Wed, 30 Jul 2025 15:37:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsYDC13bxz9st0;
	Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1EEA78B76E;
	Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rpERR39Nzj83; Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA4F58B763;
	Wed, 30 Jul 2025 15:37:14 +0200 (CEST)
Message-ID: <5553bad0-2bd1-41c0-966f-98a0a4acbb23@csgroup.eu>
Date: Wed, 30 Jul 2025 15:37:14 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: Use dev_fwnode()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
 <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/07/2025 à 10:33, Christophe Leroy a écrit :
> Hi,
> 
> Le 11/06/2025 à 12:43, Jiri Slaby (SUSE) a écrit :
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
> 
> There must be something wrong with this patch. b4 shazam applies a 
> different patch.
> 
> $ b4 shazam -l -s --single-message --no-parent 20250611104348.192092-19- 
> jirislaby@kernel.org
> Single-message mode, ignoring any follow-ups
> Grabbing thread from lore.kernel.org/all/20250611104348.192092-19- 
> jirislaby@kernel.org/t.mbox.gz
> Breaking thread to remove parents of 20250611104348.192092-19- 
> jirislaby@kernel.org
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
>    Added from v2: 1 patches
> Analyzing 25 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 22 code-review messages
> Will use the latest revision: v2
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
>      + Reviewed-by: David Lechner <dlechner@baylibre.com> (✗ DKIM/ 
> baylibre-com.20230601.gappssmtp.com)
>      + Link: https://lore.kernel.org/r/20250612084627.217341-1- 
> jirislaby@kernel.org
>      + Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>    ---
>    ✓ Signed: DKIM/kernel.org
> ---
> Total patches: 1
> ---
> Application de  iio: adc: stm32-adc: Use dev_fwnode()
> 
> You must have posted another patch with the same message ID. I had to 
> apply it manually.
> 

Applied (Manually), thanks!
