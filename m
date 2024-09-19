Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD4F1957E7;
	Thu, 19 Sep 2024 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726736161; cv=none; b=Jmt/bp1iAWgNgI0+HRJqa2OjHgpejLXYz/uVKRG3oe3f3yyD56ry60Y5UqEht1w2bDvCQu/CGxALBV/BvMIpQ9vPms+x5pkKxj5qAGiko7xh6QDPW6NujxA9kuqHamiOIT1nlp3oYJLWT7mHYSsJ7G+QZXWWRgR87aUR7ESq3I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726736161; c=relaxed/simple;
	bh=tLo0+Gejk23J0fKT7g+olOV4M1y+Mq8K+ASTF+mWBEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNwgJmz3BHMesEZwgc8bMj84G1lFd1qEdySAO/34lPffLJJMJAgKMqX5K5EzaFd22kFsanGfQQC63dJg18GuG9ypBTNrkZNnMknKwW17HhXR7eQnrg0IEUWLv5NioEuIeywJKb36QtmUGhc04U38DRq41n+28oUDQ/0Io5iSK+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=W8rfm6II; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="W8rfm6II"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E63DE6003C0E;
	Thu, 19 Sep 2024 09:48:54 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 94kb_oDrimSw; Thu, 19 Sep 2024 09:48:52 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 32E406000249;
	Thu, 19 Sep 2024 09:48:52 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1726735732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WvgPBwIZkNLSeUVeZEOkmQqK/jVBqcgra9Qwax10Ge4=;
	b=W8rfm6IIyDLO58GT/2Lny1iZY59+y39hCAGgUV2wsY/zIOJfE6wLk3LPwUaQsdrpoHbjZR
	YEbr9sfCLBw0sKjBHTary7tjU3n90357KjpupX0p101g587tEwYBD7ip2Mu1RaehSN7Wa7
	EQxh0T9ktHVh6jG90MkFBnqUCrWT9Mk=
Received: from diogo-gram (unknown [IPv6:2001:8a0:6a67:5600:aca0:c311:d240:b169])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id DB82F360107;
	Thu, 19 Sep 2024 09:48:51 +0100 (WEST)
Date: Thu, 19 Sep 2024 09:48:46 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: jja2000@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add touchscreen and TMP451 tempsensor nodes to
 Google Pixel C (tegra210-smaug) Device Tree
Message-ID: <sjcgt76mo6pcw6n4vxg3zgxxjbeu6ixfbseqglml67xt6ltwye@a37rvqudxidh>
References: <20240916-touch-temp-v1-0-5a008b2acbc8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916-touch-temp-v1-0-5a008b2acbc8@gmail.com>

On Mon, Sep 16, 2024 at 12:48:12AM GMT, Jasper Korten via B4 Relay wrote:
> Information to get these working was gained from downstream DTS.
> Link: https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra-dragon-3.18-oreo-m8/arch/arm64/boot/dts/tegra/tegra210-smaug.dtsi
> 
> Both were missing upstream and easy to add:
> - It uses a RMI4 HID-over-I2C compatible touchscreen.
> - TMP451 is located close to eMMC according to iFixit's teardown.
>   Link: https://www.ifixit.com/Teardown/Google+Pixel+C+Teardown/62277#s290806
> 
> This is the first time I've ever submitted patches upstream myself.
> If there's anything I've missed or could do better in a new rev,
> please let me know!
> 
> Signed-off-by: Jasper Korten <jja2000@gmail.com>

For both patches:

Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

Thanks!
