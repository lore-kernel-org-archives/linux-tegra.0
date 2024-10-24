Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E5F1CCED2;
	Thu, 24 Oct 2024 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729768852; cv=none; b=dGqnSVOPCNTRZdh6+CAUkNw0sNtCslC7yX3eT1XSCVQiZWaVCRJ/gwbbtaphk2pYOsh72atEOaU3JnYxPMUUOl/UwMMXfV4+Y0lp59HtumgHMJCmj3hmi9QZIK4Zx/cUGscs1CABKj2JE9StfGBogLv7bI8Ej1XNIAoYd7FR7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729768852; c=relaxed/simple;
	bh=JE40iek36fBbE1ZHewZErdWy3c8wcYro4M12LMBdKqw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ibekAE2+j3Y3xQ/5upkdxzV0PGgzSwNRrYoTvqxl6v11bjDGY7FWLnIMMMFMod0NHCkv5ceafmRn+A1F2G/PwJbaqZlNuiEOAWZmPOAIrGzzSU3MSjecgo/nzOKvJiYELEg0UoHXvpp3XHehpqKLNugwombjGNEz3RP1HSeIkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=LBQK6X1q; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="LBQK6X1q"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D7B5E600243D;
	Thu, 24 Oct 2024 12:13:41 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id K0xnKsHWIxOV; Thu, 24 Oct 2024 12:13:39 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 68AAB600301F;
	Thu, 24 Oct 2024 12:13:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1729768419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JE40iek36fBbE1ZHewZErdWy3c8wcYro4M12LMBdKqw=;
	b=LBQK6X1qd5o8xzHblBVAkRkdE0khQ1GDyQ2USBzm8GajhA3ax2EfFz5LptHFMHvDV4CB7Z
	HxZVewscpmATX0ixcWWTD+f3GmcyUAEj6Tr7xwcqHoTgjxVNMMPjnjosvnjzp1mHsXJCP8
	ei/zZnDA7W9sGt/bjTVHYLVmcSHtJpg=
Received: from localhost (unknown [IPv6:2001:8a0:6a67:5600:aca0:c311:d240:b169])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 15ECE36015C;
	Thu, 24 Oct 2024 12:13:39 +0100 (WEST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Oct 2024 12:13:38 +0100
Message-Id: <D53ZQ9HDYR37.2FKW9R4J0VTQJ@tecnico.ulisboa.pt>
From: "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>
To: "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Thierry Reding" <thierry.reding@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>
Cc: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: tegra: Add SDMMC sdr104-offsets for Tegra X1
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240923-sdr104-v1-1-ec7b3394f880@tecnico.ulisboa.pt>
In-Reply-To: <20240923-sdr104-v1-1-ec7b3394f880@tecnico.ulisboa.pt>

Hello,

Gentle ping on this patch.

Best regards,
Diogo

On Mon Sep 23, 2024 at 7:24 PM WEST, Diogo Ivo wrote:
> Define the sdr104-specific offsets, preventing the driver from
> defaulting to the 1.8V offsets, which cause the system to hang during
> the SDR104 mode calibration.
>
> The zeroing of these values was chosen since it restores functionality
> and no better suggestions are provided by the Tegra X1 TRM.
>
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
