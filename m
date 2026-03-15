Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142C221265;
	Sun, 15 Mar 2026 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773607693; cv=none; b=SqQ2pmPgnoZCTY3Vb8YTPSeU7KuD1oecgG75mO4uh1OS0MuTcdoMYBY03Bqsa+9R1kjTwfeJ174BfRNnjhoupjoJpDvoUQTi4XYNstL19QmlJYoq9Sa41mc2/+jgHuqu3p9tK19lr1igNejtK88+HqMn3ul0o15yo7XLj9AcIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773607693; c=relaxed/simple;
	bh=+X08AHsDj3GmVAeobA9fDcEXl2DHWNce1XM0hUbgDg8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uASqgqeM1G+BfHEwkO7obkw82okehZi4TZqg92gTawK7GQbNPYbQTQ/DeRh+sbNgE+wC8FgI/sawQKiQwBgRt6fCWDF9ltaun+vIssalUR93crQ7qaA2kkHCvKyjp1stPkUdWiYB1jEf8HEeg0WXTmIiJ4LAcQdZ0IalhFlRb9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=SfqYB2XY; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="SfqYB2XY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773607689; x=1774212489; i=marvin24@gmx.de;
	bh=yAohcocTNYALxsGID+iOAn5FcDqVuL+HrPR47ufzgYU=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SfqYB2XYLSWplNuhpCzUfl6YlUzyUle94f9sTJG6YLXd8OKoNMMbbZkYwNYZ+oKg
	 ZEvFQq7LtXZscqngdFDKcNXZIMCJ3CseV1kfWMMFZO2447z4LlY0Xt8iDnBxyHH5d
	 EiO3kBPLEokTUD0Hwq5gajS6kUA74GKHR9uLtHe1fEopNLlHdIPD1O6IEUYwxgW/T
	 o7oB74IlVfgNVOlzeSZvm9UzCuCGhQug7LempMxDtaMtYYHJIeOrcMjsE3CUL3vUa
	 6GWQJVI1db7Lti7tSf1M7jQEer3urztY3wn1GfQE7NlZK7yo+zpZ8uiSRcnPmNoTP
	 UWiN4fSMIkaHCAW1Mg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUowV-1wAVFQ2rNB-00RnMq; Sun, 15
 Mar 2026 21:48:09 +0100
Date: Sun, 15 Mar 2026 21:48:08 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Gustavo Arantes <dev.gustavoa@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: nvec_power: quiesce EC queries for system
 suspend
In-Reply-To: <20260312211151.85379-1-dev.gustavoa@gmail.com>
Message-ID: <233329fb-0ea9-d784-b56c-f078a329d370@gmx.de>
References: <20260312211151.85379-1-dev.gustavoa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:W5tiCN0HOWJA6ioI6BSEiFL9xjrdSjUW5YMxRssVgtLNll1lXoP
 jHAhnr27IbGYUTCIlbGZH8jsXHSBhN9KTXmhNiTES3l26Z5SUml2i1VByzXnXv+Jc3Z6H/3
 WveW5dZOAkZuX8yBQXbjoI3oCToZWLpoVyvd7+/ZZIt3Sl0tpgpzdz6JwcA3OSQUZRw5Z4b
 PziMqmPS3CyreE49wecWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UjMfFpNSkeg=;xUdlNcUZl4hFoZ+L2ekLg0FTYB7
 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
Content-Transfer-Encoding: quoted-printable

Hello Gustavo,

thanks for your patches.

On Thu, 12 Mar 2026, Gustavo Arantes wrote:
> nvec_power still issues EC queries asynchronously and keeps work queued
> across system sleep. This series first serializes the driver's EC
> requests, then adds PM hooks so the remaining work items are quiesced
> while the parent NVEC controller is suspended.

Reading out the battery info during boot takes some time as far as I=20
remember, but I haven't tested your patches yet. Is the use of sync=20
writes really required in order to realize a clean suspend?

AFAIK, the machine doesn't support suspend currently, partily due to=20
missing atomic writes for the EC. Building the driver as a removable=20
module may be enough to test the change though.
Are you able to test the change on real hardware?

Best wishes,

Marc

> Patch 1 exports a small core parser helper, moves the battery metadata
> queries into a worker, and switches nvec_power over to synchronous EC
> requests.
>
> Patch 2 tracks the suspend state per instance, prevents new work from
> being queued during suspend, and restarts the polling and metadata work
> on resume.
>
> Gustavo Arantes (2):
>  staging: nvec_power: make EC queries synchronous
>  staging: nvec_power: stop EC queries during system suspend
>
> drivers/staging/nvec/nvec.c       |   7 +-
> drivers/staging/nvec/nvec.h       |   2 +
> drivers/staging/nvec/nvec_power.c | 122 +++++++++++++++++++++++++-----
> 3 files changed, 111 insertions(+), 20 deletions(-)
>
>
> base-commit: ad6bb64332bb4297110950769ad5af52791e33a2
> --=20
> 2.53.0
>
