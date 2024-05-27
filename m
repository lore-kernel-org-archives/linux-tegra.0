Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAFD60269;
	Mon, 27 May 2024 23:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716853396; cv=none; b=VnZA3J0KJirXpZkACglEUi4QXLeLq7rlvJsWRUqEw+V5+YvM3txettAD+Ytg5vpExPSu88gTVnDsyZAyVIpNicg700pwyvnFBiZwmlU2+0E4gb7BN1f/MOm9b/hFtJPztUJoSJzKIfaRyIN8jfmtSvKwtU5unM8fVgX4eUo9uDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716853396; c=relaxed/simple;
	bh=/kwHgdZsrLu1TzQQqZA1wtyN5OKuelHdCXg3eDURRtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvMysNlZoddCJKDmQTkP5jvFno7FA8QxZwzWFutHXa27invpjwxUqHRK6ZivjpxdDcXMHDNw1hqL0w+thvHDEHxbEj+QAAZyHklAYAd1paKR7P3U2dJ9FNBG0rN5OS6TM83sx9trJ1D4ZzenmyRtbtcbEWckoHFtG07NKreQ2dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=aJD0OzG8; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="aJD0OzG8"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id B02036000237;
	Tue, 28 May 2024 00:43:08 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id PlSEfCxSXQvE; Tue, 28 May 2024 00:43:06 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 69F436000229;
	Tue, 28 May 2024 00:43:06 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1716853386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IJ76wpO5fGaP7PdSuHoaCzNs99SFOGdb5V/WNX+FTQQ=;
	b=aJD0OzG83nVfOFnV+d1bHp6O0g5QCeh+bsEFbG/0ma4n56QDXg22s99FsT+vI/fm7JoYr6
	fHpbBxUT9H8jurmxI+MD5eu9t/RH7ExTyzzgft0XY1unDuUdbmIeNr/CLbYwievhi2Z00A
	kAre3tPTcTTDs8r6+dLr+FYIFMBDtjA=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:5881:46cb:b422:a117])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0DC95360090;
	Tue, 28 May 2024 00:43:05 +0100 (WEST)
Date: Tue, 28 May 2024 00:42:59 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/7] Cleanup Tegra210 EMC frequency scaling
Message-ID: <xnyynaogpmauup2p3rksmpeidvhyglocaiy7rhmn6jnatv6laa@ezw2ifilfyfs>
References: <20240507093056.3921-1-diogo.ivo@tecnico.ulisboa.pt>
 <scjwzfj3jiyqh2hgomlfpdxjpyurkhiyy5bks3damficnn3bc3@vogn5wp5exoc>
 <56345d8d-ec1c-4ff3-b278-f66f2a1f9f84@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56345d8d-ec1c-4ff3-b278-f66f2a1f9f84@linaro.org>

On Mon, May 27, 2024 at 12:20:07PM GMT, Krzysztof Kozlowski wrote:
> On 27/05/2024 12:15, Diogo Ivo wrote:
> > Gentle ping on this patch series. I think this version addressed all of
> > the review comments, is there anything missing?
> 
> I think I explained you the process. Merge window finished yesterday
> (today for this timezone), so why pinging the same day? Give some time...

Sorry, I didn't mean to spam you. In fact it's actually good that you
didn't merge this yet as I just noticed that there should be parenthesis
in patch 7 around (rate_mhz * 2 * dqsosc) so that we get the proper result
for the delay. I apologize for missing this and I will send a v4 once I
re-check the series for mistakes like this.

Best regards,
Diogo
