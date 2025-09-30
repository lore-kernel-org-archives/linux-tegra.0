Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A982F4A1B;
	Tue, 30 Sep 2025 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759221491; cv=none; b=D7Okwg1A4+5MaHt88RRIz27fRR/lW0dyGOU5v+Kg1O0+FEN5dKxI7zxNo4qE45+zwDDD/yq5uRAEf7FkYyvhpHlnXTykfROWlk3EFKo2If474XXhOt5ouIoH9EJwKgr3g9qvbV8AD6LIYguGwQPhk/Pyh8hjekJK2H/IAX7rRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759221491; c=relaxed/simple;
	bh=lmqllInZfb5npaUJWCnOqhrqfzbIPI8UtolGKdhF8DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjtIkIfbtsA1VKztf6yrOTIM7bCH1+U+C0tbq+BY2H5XcHQSQCVNzgfVLsZ1/x5ULAzeIa1XOgrIGeNlVvRT9BEOXuQdiefZHV0a2M6HZ3Sqx0BG/sngKppNVUp1lCSUWOGregnEFiJu9JIGI+k6JZMKwIgkZHrESFT2LVPDaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 089D21424;
	Tue, 30 Sep 2025 01:38:01 -0700 (PDT)
Received: from [10.1.28.41] (Suzukis-MBP.cambridge.arm.com [10.1.28.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E44203F66E;
	Tue, 30 Sep 2025 01:38:06 -0700 (PDT)
Message-ID: <e21159ef-d438-4944-adb3-eb8e7c801d9e@arm.com>
Date: Tue, 30 Sep 2025 09:38:05 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, ilkka@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, mark.rutland@arm.com, treding@nvidia.com,
 jonathanh@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com,
 sdonthineni@nvidia.com
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
 <20250930002604.346306-2-bwicaksono@nvidia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250930002604.346306-2-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2025 01:26, Besar Wicaksono wrote:
> Add interface to get ACPI device associated with the
> PMU. This ACPI device may contain additional properties
> not covered by the standard properties.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Repeat: Where is the user ?

Suzuki


