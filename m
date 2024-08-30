Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B0C17B508;
	Fri, 30 Aug 2024 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725013773; cv=none; b=IqBtqxtGGY1xWR76vIzKn0oXcrOMRsNLgncrJX/n5vS7nxXPUVoODUCkdQQS6SHqREfc0mWLWZyIVQJ+PtqlqTxfhXLWU66OEdtEPfsgr7tcnbk5GXD11rHz9deiSVXcGSzKIxkhIAFhn8d23QRjh+76y6/Lf+woEzoWR1rm5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725013773; c=relaxed/simple;
	bh=7X5uorWeH4q6GihKuadn5u1Ek5InKG1JjJAOorTZqkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FI+3te+Ha26kwJTGNlShA+MV1T8Bf3HLbSQtBCIl4PT0Kyzbo0ozAB9QtHG21jdc6UeYIgnan64M+aqgJ8FuacEsUqEjdFgQ/IUptWKwW3vbrBoimxJeFv0j1iYabnXoQ3uvHESS8M13cHE7erb/yaPZSX+6yf/7hFsfby9EW0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=Fgl69IBm; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Fgl69IBm"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 8ACDB600881C;
	Fri, 30 Aug 2024 11:20:55 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id y_YNDg5Yp5Zj; Fri, 30 Aug 2024 11:20:53 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 4D4486008812;
	Fri, 30 Aug 2024 11:20:53 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1725013253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu4S81HobKPBEZpOa/pzICVzPqFu5G68cDTXmSDyMX4=;
	b=Fgl69IBmSoErzCo3CeMAyNYGEX64+2LILN3qnPhOzAUo4xo+fFbbF4BVZ+F/wzUvz11gha
	cSfvJEXRkvQ3cybsCU8stLcRwHrxlGXAogJtRFQxBX4MLRgRAxLjLg8RADXEutAOz0KXEp
	qXF+44CpctLb6hIyTCk6r7/kRbR9XQM=
Received: from diogo-gram (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id EBB4E360134;
	Fri, 30 Aug 2024 11:20:52 +0100 (WEST)
Date: Fri, 30 Aug 2024 11:20:45 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: tegra: add wp-gpio to P2957 board
Message-ID: <kbz72jma3bj7dnfnvdjo6m5yqrvjwkvz2gtt6bxpezkslwt3kh@a7wqzkssdfvf>
References: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
 <172494536049.1302383.5328678787632525054.b4-ty@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172494536049.1302383.5328678787632525054.b4-ty@nvidia.com>

Hi Thierry,

On Thu, Aug 29, 2024 at 05:31:23PM GMT, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> 
> On Thu, 15 Aug 2024 16:50:38 +0100, Diogo Ivo wrote:
> > Define the wp-gpio for the P2597 board.
> > 
> > For this, patch 1 fixes the assignment of the vmmc supply's gpio that
> > was incorrectly assigned to the wp-gpio of the external slot.
> > 
> > Patch 2 adds the definition of the wp-gpio.
> > 
> > [...]
> 
> Applied, thanks!

Thanks for picking up the patches! In my testing around SD/MMC I found that
currently UHS-I cards are broken on the P2597. When trying to use one
the system shows somewhat erratic behaviour where it sometimes hangs and
some other times it simply fails to read from the SD card. I have
tracked the point at which this happens to be around
tegra_sdhci_pad_autocalib() when switching to SDR104 mode, where there
is the possibility of using specific offsets for this mode. Currently
there are no values specified in tegra210.dtsi, so the 1.8V values are
being used. However, when I tried specifying them as

	nvidia,pad-autocal-pull-up-offset-sdr104 = <0>;
	nvidia,pad-autocal-pull-down-offset-sdr104 = <0>;

in the DT things started working fine. I did not send a patch with these
values since I could not find what they should be on the X1 TRM, are
there any recommended values for these parameters so that we can have
this fixed?

Diogo
