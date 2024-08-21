Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B331CFED3;
	Wed, 21 Aug 2024 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724236488; cv=none; b=q290YCA8h9IFSP2joxvELVsgNZsVB3OLEvSbJxtR5/izq7f1AFhGKnjGiZDk+EhafRnQGNAfua0xVxc9JQRrhJdcZaoEXEjF0AbS/UOKThPtWhyIewgiAWy0UkQpg2jmZvsevK/6bPbRXdNU5Hl2suYwGqXVlBIt9UrtXi7koik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724236488; c=relaxed/simple;
	bh=2jzeEdnLYCePgLpuQFWyV5MeZjrftOfeai5HuPW9XyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udoFPhNbcgL3Sp61MhOfvfi+4oXWYJOhfS21gGEuXpeDXbR8CFo3QohjOYk2MPqwGZwDnpRZe5AW3hBWZK1XjLgRniscm5wLbotJicSW+wtwsqnMJJn3FVv7CvTPqCMvlCUx2gpS0rggpvmJe/w7x8keL69tsTMtUEsU5lQ3DnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=c6J4bnUu; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="c6J4bnUu"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id A2E4460022F7;
	Wed, 21 Aug 2024 11:34:36 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id i76sRW4G9r9u; Wed, 21 Aug 2024 11:34:34 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D60CB6000872;
	Wed, 21 Aug 2024 11:34:33 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1724236474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOdZ5DZBzLNtKU43Z18gUBStiQCsdElmzJoMkINRkJ8=;
	b=c6J4bnUuEYkH7GzQ8pqy9UuHmO2lPZGtzfRHvD9fFP3QFGndKg3fcfHTUGDRnsYOOM+ds/
	88o1fc+PXwti9EruZPuDBqyYPMobxZdxtsME4vtVNYo+gnbDTcqa3EtUTZ7cPHCNXVlRky
	ghClDj0jtusl80xcSKqxa4BruGmYUf4=
Received: from diogo-gram (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 728D4360086;
	Wed, 21 Aug 2024 11:34:33 +0100 (WEST)
Date: Wed, 21 Aug 2024 11:34:28 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: tegra: add wp-gpio to P2957 board
Message-ID: <2qdy5ehshfslfuyqquycsirzx7ngbwbet2mzsrz6xitaa4pyri@oqohc4egyydl>
References: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
 <e544466f-8c9c-441a-a209-bda0b47aeb7d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e544466f-8c9c-441a-a209-bda0b47aeb7d@gmail.com>

On Tue, Aug 20, 2024 at 06:32:44PM GMT, Tomasz Maciej Nowak wrote:
> 
> W dniu 15.08.2024 o 17:50, Diogo Ivo pisze:
> > Define the wp-gpio for the P2597 board.
> > 
> > For this, patch 1 fixes the assignment of the vmmc supply's gpio that
> > was incorrectly assigned to the wp-gpio of the external slot.
> > 
> > Patch 2 adds the definition of the wp-gpio.
> > 
> > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > ---
> > Diogo Ivo (2):
> >       arm64: tegra: Fix gpio for P2597 vmmc regulator
> >       arm64: tegra: Add wp-gpio for P2597's external card slot
> 
> Hi,
> for both patches
> Tested-by: Tomasz Maciej Nowak <tmn505@gmail.com>
> 
> PS
> I case You wish to save some digging for other features I enabled BT+WiFi, PWM-FAN
> and power sensors in this tree: https://github.com/tmn505/linux/tree/jetson-tx1
> For passing MAC addresses for BT+WiFi from cboot provided dtb check this U-Boot
> tree: https://github.com/tmn505/u-boot/tree/jetson-tx1

Thanks for testing! Are you planning on sending your patches upstream?
It would be nice to have those features enabled, and I can add my
Tested-by once I test them.

Diogo
