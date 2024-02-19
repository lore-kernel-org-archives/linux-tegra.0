Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4919111E
	for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 02:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708309134; cv=none; b=iO3PHJRrhjxTjck7jMp8HqXAZ/SleHS1BXRvP2/tSixsl1O5qFu1JiYyG0Dim3ejbrsMs/xilZnFEc/7Pn7iErNMOHYII1Vq1W2gUOFDqojMBp/6jZzkP7dFk95Y0WjGE3YtdG6UJkU3/6B0tCrveywI5E8/hEesreZYavlCETA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708309134; c=relaxed/simple;
	bh=DdILp97SF/PUNutjooiTv5rAqhsAK72aDCDy4A2fUSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIts++iaYMCYHO93n0cTGLKyPi9ANrhGFjotjFiNbqXuo7nNfgSvIOrT7nLSLF8gDe1th2t9h/tsmHHMeYpfjjeE9VCu8y3I0TKkwnEXHPT23eG9oFbI1YNE3sMrhGZ+yvKfL2yEj5yFuHgdJS5Z8ev0Ro1t18MJxDdZPKlvQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=GWzIIHNL; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="GWzIIHNL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vhA4e2TfrzzIN/VXazX8S3/mwfzNGV5VwkyksdTQFE4=; b=GWzIIHNLWf0Bxl3r3C0Sr8fFn7
	9ATM8H3s8ijpMGrm8tkPAFUBmoL6UyL7hDtqSE0BqDwr6Tt75gOryOFyv3qSIs4GgCPMRup28Ullc
	GzweTxcGWxsNQsGsuzh101vKS+aZUDOR4hS5JkJz0U9Ir6VoIFuD/Tm/lCnIxRrGsD75sojzcRA6T
	lUOFfEJOgceReWYxJWDKPw6CcwTkuZEqmCWM5CKGPp3kNsRLtdn4BQHJktX8g2VR9VCjUIQms+Qlv
	8e/q/GKfSy9oasN0aV5Mza1DciwXzBm0s4dhwj2KnREQwRL37Uq4l2zqo/3i4sFQzsm3TI+aH06C6
	lCwZ9zWg==;
Received: from flh4-110-233-203-162.tky.mesh.ad.jp ([110.233.203.162] helo=[100.64.1.22])
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1rbtEq-00GqrK-1d;
	Mon, 19 Feb 2024 04:18:36 +0200
Message-ID: <cea93e4c-f6f0-4017-89b5-30e3d7b482dc@kapsi.fi>
Date: Mon, 19 Feb 2024 11:18:29 +0900
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
References: <20240214114049.1421463-1-cyndis@kapsi.fi>
 <CZ6F0Y2S635X.1X4B2G0KT43NX@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <CZ6F0Y2S635X.1X4B2G0KT43NX@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 110.233.203.162
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

On 2/16/24 19:02, Thierry Reding wrote:
> On Wed Feb 14, 2024 at 12:40 PM CET, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> On Tegra186, other software components may rely on the kernel to
>> keep Host1x operational even during suspend. As such, as a quirk,
>> skip asserting Host1x's reset on Tegra186.
> 
> This all sounds a bit vague. What other software components rely on the
> kernel to keep host1x operational during suspend? And why do they do so?
> Why is this not a problem elsewhere?

My assumption is that it's due to a secure world application accessing 
NVDEC or display engines during suspend or resume. This happening 
without kernel knowledge is a bad thing, but it's hard to change at this 
point.

The reset line (CAR vs BPMP vs non-accessible reset line), and the 
secure application code programming this stuff is slightly different in 
every chip generation, which is where I think the differences happen.

Mikko

> 
> Thierry
