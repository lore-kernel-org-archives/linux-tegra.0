Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359182A1A4;
	Mon,  1 Jul 2024 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719844775; cv=none; b=P9Kqocyu2eKiLSiBfbc7Y6SW7K3S1YAF0l1JSaMMozaCVMC5+s573FLBdf6kfIeZ7vmo8G+QD2nRKDcBfxaioqtmiXkNeuIJh7AKZ4VQBkofoL73NPmmo4GN/WJ1fjiri3o/lHUwUOBR5HEt5luhB3upNvjGw7WscyYucgYvfFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719844775; c=relaxed/simple;
	bh=/6qke6RUXta77pvxyFGlQ7jb5LbK70lHz1fXlCciVSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fC7X1sC5/TCGMA2HK2XwwarKZMkE19v29IDL1VJqv3KB2R3DR1SKkyL2D2DrD1v7F0cJUVzcVzw27iWQfixtMR39S+8m5qXB5eLYfAzuAatIUxWuMR17ooNSyR7m44XSLOXfjBe70vUKenamjpFTBWUtdfUIiTrPjECpYsBhXJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=UYp5EScF; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="UYp5EScF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 122A26002414;
	Mon,  1 Jul 2024 15:30:39 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id vtWJFCvQ7Ifm; Mon,  1 Jul 2024 15:30:09 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 5B1E2600140D;
	Mon,  1 Jul 2024 15:30:09 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1719844209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R1hlZfJgLOxh6K5sBaTW/U1/Z3z8nnKAghRXP3SUY+M=;
	b=UYp5EScF7V+KxA4yERMIUFmVwF4ik5RZZrXsTQ+JOmRz7TDUNzk8F9oeDbcNRDUt/YyzgC
	uecnkyP5cSBhMWq0WLp8KzX+X4Qk4z0wx3v4TxtzPnKQdCBDq5J4ajqGNTlhKdaKAdEQ1L
	5w//eWiLtm2vsLdM5RcLGhDQpcD8T2Q=
Received: from diogo-gram (unknown [46.6.168.43])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 11CD83600B9;
	Mon,  1 Jul 2024 15:30:03 +0100 (WEST)
Date: Mon, 1 Jul 2024 15:29:55 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
Message-ID: <otqwrgux76jfnj3zqdmybivu23k7os4gthxlvwn6xh3wv5g4lk@niz3kwwmcizr>
References: <20240430191856.874600-2-robh@kernel.org>
 <lbv5dlpvjfolp3tidna6ft7o3c3xswu6udp6savazegbfovygp@uzf2yyrocfuj>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lbv5dlpvjfolp3tidna6ft7o3c3xswu6udp6savazegbfovygp@uzf2yyrocfuj>

Hi Thierry,

On Fri, Jun 28, 2024 at 05:06:10PM GMT, Thierry Reding wrote:
> On Tue, Apr 30, 2024 at 02:18:54PM GMT, Rob Herring (Arm) wrote:
> [...]
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > index 9ebb7369256e..2e5b6b2c1f56 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > @@ -25,7 +25,7 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > -	memory {
> > +	memory@80000000 {
> >  		device_type = "memory";
> >  		reg = <0x0 0x80000000 0x0 0xc0000000>;
> >  	};
> 
> [trimming the recipient list and adding Diogo]
> 
> Sorry I just noticed this as I was doing a cleanup path of patchwork.
> 
> For tegra210-smaug, unfortunately we can't do this. The problem is that
> the firmware for this device looks for a hard-coded /memory device when
> updating with the proper memory size and this firmware can't always be
> updated.
> 
> Diogo, you're one of the few remaining people that I know of that still
> use this device (with an upstream kernel). Do you have any more details
> about this? Is there any way the firmware can be safely updated on these
> devices?

To be honest I am not quite sure. I do know that at least there is a part
of the firmware that is locked down and cannot be updated easily, as you
have to disconnect a ribbon cable inside of the device. Do you know of
any firmware updates for this device? Currently I am not aware of any.

Diogo
