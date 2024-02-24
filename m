Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2CA171CD
	for <linux-tegra@vger.kernel.org>; Sat, 24 Feb 2024 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708754601; cv=none; b=EShaU0bYVJeaRbMsyiuKRaCMnSSUIzG7q86w0icpQ62Wd3xukuMBqZb43ORJlyfWkJdAKjCqQppm02jwugS+S0JYAhw1Fg3t1RfQnxpxgM5jSR/x8SqH8H53rUwVSgUigB4NaASCKZgYZIRcOkVKWQ/noJiMnrOdQXZwiWeOS2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708754601; c=relaxed/simple;
	bh=SKq16zmAwzTY6n/18F4Y2CQZHYTJ+Y6D2j2NZ6NS/68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4Pcbn0NO0Mitr7/tDTr9gx6NRRsVTfFQgW3MifrvWF1xINi+PK9t4YlhD5f4SdPvAzHaNZ+OtbY6B7hnt6pO7WVeNICj91IEYGPhaR5rc4UoALSRiq6/VUdR1yLybgGSLKiUC8Uq+IVfotyOM5lhJpy33jcKMXF3p+tk5w968w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=wsDgu2uJ; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="wsDgu2uJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1OTgNY1oLANIYiIyNCIKh+rWMiWKg3CC6NBhqKo0xwg=; b=wsDgu2uJByb63SK056oYuSAE7e
	f/gzC2rDu/gDm2TiWPOaIpqwAw8I3SuCa6al9Ekn3X1LA45WrMbIEgI+9uiplExo8ebG1bhAOlQh2
	5QitGkmOu5FsJPk02mco9vcbhLqdOL/5Zbm0wXcuBvC4/jSHylRZFD5LXPpDElMt0IOof17/nDZ60
	D6KlNW6rm9V4kr9BmF3chuAt5/0Dnq/gXXyLIt2Fpp/JM0iKBgKHpTH9oPro5+BoBPzu9yuRIi0H8
	FTmeSb9NVp39gUxI0uENwg4gkNaY/h5XQ1fAIbfVjZv5hi5kf+zQKaM0KykI3ipWmbRWdH8O2GpWR
	B5zznb6Q==;
Received: from [2404:7a80:b960:1a00:a957:9937:1687:d740]
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1rdl7p-007EWJ-04;
	Sat, 24 Feb 2024 08:03:05 +0200
Message-ID: <2bf19c74-12b7-43e7-8fa2-499de24ac54f@kapsi.fi>
Date: Sat, 24 Feb 2024 15:02:57 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Skip reset assert on Tegra186
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20240222010517.1573931-1-cyndis@kapsi.fi>
 <CZBT2NJ7IDA5.1OXUZ5JBIQE5C@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <CZBT2NJ7IDA5.1OXUZ5JBIQE5C@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:a957:9937:1687:d740
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

On 2/23/24 03:06, Thierry Reding wrote:
> On Thu Feb 22, 2024 at 2:05 AM CET, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> On Tegra186, secure world applications may need to access host1x
>> during suspend/resume, and rely on the kernel to keep Host1x out
>> of reset during the suspend cycle. As such, as a quirk,
>> skip asserting Host1x's reset on Tegra186.
>>
>> We don't need to keep the clocks enabled, as BPMP ensures the clock
>> stays on while Host1x is being used. On newer SoC's, the reset line
>> is inaccessible, so there is no need for the quirk.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/gpu/host1x/dev.c | 15 +++++++++------
>>   drivers/gpu/host1x/dev.h |  6 ++++++
>>   2 files changed, 15 insertions(+), 6 deletions(-)
> 
> Applied to drm-misc-fixes, though I added the Fixes: tag that Jon
> mentioned in reply to v1 of this as well as his Reviewed-by and
> Tested-by as well, since this is pretty much the same patch except
> for the comments.

Thanks. Sorry for messing it up :p

Mikko

> 
> Thanks,
> Thierry
