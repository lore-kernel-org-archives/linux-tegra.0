Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF4182DA
	for <linux-tegra@vger.kernel.org>; Sat, 27 Apr 2024 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714237542; cv=none; b=rsvEYYkdJryZn3yuqupLC3qOB1ReVR/lpw20sHYaNbWXyePqIYlg/SflV1eLlzo71EgIKJo2YTePOK1kfTvOAw5OJsxZdTpdKQcEjU2+vcL549UGzMen1Vj03zF9w6uPu62qedUA5QP59W63lTx0n8xSy/sGm7enGwoz33YRVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714237542; c=relaxed/simple;
	bh=krI2tDtQB5p8Ps97rZppr0v4kKEPY578OTR+toY5xUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gem3S+gErkwyDttrrWDeYQxIapToOd/qzo9C8FeJbuySWAYTV9RIBOIlZ+H8KyJguQy6YewoJM/ZW1B/s5eeUNoZjOKg/eV3aAd1RkDsdjRtTbvoUzSKQRQB2kLSlYTFhlTD2RSBwuyPYYdg4FtYH5CwV7ETplpNepYOUh/iht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=UyfMW/xX; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="UyfMW/xX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 9502E600087E;
	Sat, 27 Apr 2024 18:05:28 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id wsl_PovW5_Wz; Sat, 27 Apr 2024 18:05:26 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E842F6000842;
	Sat, 27 Apr 2024 18:05:25 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1714237526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kpPOFCgLV4CEx+6PY8DCwcNRre2Cx911jmkqtv90558=;
	b=UyfMW/xXf9fCWJCeQ3JG+gznQoNybGibe1GxB3pZPoSeVPjxyimiZMj1ssUtlUgM1DC6T5
	81rmu1UzjvjUTFdcXGpoWeHGLskS8xfR3feYvE57YjEVwumuMwcm5/0g9Gv+O9eMOXz1Kl
	07k3stM28XdS+yCwO/+V17TjE2eE8EU=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 8DAE0360071;
	Sat, 27 Apr 2024 18:05:25 +0100 (WEST)
Date: Sat, 27 Apr 2024 18:05:17 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Cleanup Tegra210 EMC frequency scaling
Message-ID: <z4irucvflgj4mtvy5qwnbze24tku5zw4xvq5b22x22hw7yb4pf@ihjm4wwecotj>
References: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
 <171398258237.275534.7331223388966262711.b4-ty@linaro.org>
 <a84e606e-ac7d-4f93-9be4-144acbfe10b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a84e606e-ac7d-4f93-9be4-144acbfe10b1@linaro.org>

On Thu, Apr 25, 2024 at 08:11:20AM GMT, Krzysztof Kozlowski wrote:
> On 24/04/2024 20:16, Krzysztof Kozlowski wrote:
> > 
> > On Fri, 19 Apr 2024 11:45:08 +0100, Diogo Ivo wrote:
> >> This patch series consists of a general cleanup of the Tegra210 EMC
> >> frequency scaling code for revision 7.
> >>
> >> Currently the code is relying heavily on a function, update_clock_tree_delay(),
> >> that is responsible for too many things, making it long and confusing.
> >> The general idea with these patches is to simplify this function and its
> >> surrounding code, making it more modular.
> >>
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [1/7] memory: tegra: Remove periodic compensation duplicate calls
> >       https://git.kernel.org/krzk/linux-mem-ctrl/c/f8037b3d9a75f4963c1fd3eaf39b968f206d37df
> > [2/7] memory: tegra: Move DQSOSC measurement to common place
> >       https://git.kernel.org/krzk/linux-mem-ctrl/c/09dd3744d7c02a3844e8a6c96ab2fb3c1e94de52
> > [3/7] memory: tegra: Reword and correct comments
> >       https://git.kernel.org/krzk/linux-mem-ctrl/c/d48076e5bb9be787b769efb3e6439902dc8e99f7
> > [4/7] memory: tegra: Change macros to interpret parameter as integer
> >       https://git.kernel.org/krzk/linux-mem-ctrl/c/56c95667042ba12a66157477282ca73605a25481
> > [5/7] memory: tegra: Loop update_clock_tree_delay()
> >       https://git.kernel.org/krzk/linux-mem-ctrl/c/0d647b9031fe4f6b20d2f18b3d087dea740eecf1
> > [6/7] memory: tegra: Move compare/update current delay values to a function
> >       https://git.kernel.org/krzk/linux-mem-ctrl/c/c1a70060c654327be4aed6e617f53bae5af8625f
> > [7/7] memory: tegra: Rework update_clock_tree_delay()
> >       https://git.kernel.org/krzk/linux-mem-ctrl/c/edbf2db5ae95c4d8f189d05e827d9dd3ea75cfbc
> 
> And entire patchset dropped because it fails to compile on several
> architectures.
> 
> Don't send code which does not compile.
> 
> Best regards,
> Krzysztof

Sorry for that! I was testing this on an ARM64 platform where the code
does compile, so I did not catch this error. Thanks for pointing it out,
I will send a fixed version.

Best regards,
Diogo
