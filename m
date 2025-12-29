Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0E3164A8;
	Mon, 29 Dec 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014666; cv=none; b=ENUdIu4jieRK7S1LTKIxiIWGSFfe2rsMNDe5kGcaeCj9LbyvN7vckPKPzKrgJffiTwfuYxXUFdxAvfOVdUBHz3/RxNNTcFD07KffHUncRxr2Ij7pPoI4k2w99H12djgg9K+L7hPxW72zFUKJ3vs79GomXmO2gSVJggUKuyEHCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014666; c=relaxed/simple;
	bh=1RLLMvwM6Kz/hBPx+VgNo14k3cnzriMn8z5q0fggmu4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NH3FLzxBu/+QL6RBYju8A3NE8wV+SUzglP7fIWCzxJvQCE+smpC6XVYE1QGQMC0ynGLXTMwnFyA1I0LPCG89c78oHSeWcjLkC97S6fyJXHh8ieDb12NztUBD1puekC/B7p0Kx+qF/0KDLyfRG2fkT4Lvs/kH06aSWUZu65SpkgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bx/Ffsri; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bx/Ffsri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767014659; x=1767619459; i=markus.elfring@web.de;
	bh=w8ClR58Cfpycw02klzxwPrta8Q6Ou1mAgEyCsXGyI3M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bx/Ffsri+d/PfrhjKUzwguR1a6PaWl46lfBRNieVbIatCWSTQURBbz22p0d1abUL
	 bfZzq5HGvkIuZxYLXtNf3dXZkCiScus8bxu8XNXcBmoQVpgQAOJGRqp+dsttlrDTT
	 wodoeboTXJfvuVpjdcLBkVq4MYfLNfz3zkozbCCGe63/Sfd5IFD8AULnFeZsu0Njq
	 ibS4iLXqRedZt1PoZPmbfB/kHMdn+cplClv/3Vq7UQlUWN4jWQPYk5PLGUHt8qlKC
	 vU0QzQHVkFWRWEMp97Z7/e6YGMX/33XEcnGHqIF6jUm4QILHevMhw3Fv5dxeDRWu5
	 15qyewtUFeYOsTTsag==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.231]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MiuSe-1w5zkd3KYW-00lqYx; Mon, 29
 Dec 2025 14:24:19 +0100
Message-ID: <c99d37b9-f313-462c-ac8e-7a29637cc101@web.de>
Date: Mon, 29 Dec 2025 14:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, linux-tegra@vger.kernel.org,
 linux-sound@vger.kernel.org, Daniel Dadap <ddadap@nvidia.com>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mohan Kumar D <mkumard@nvidia.com>, sheetal@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251228140530.3739960-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] ALSA: hda/tegra: fix a memory leak in
 hda_tegra_first_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251228140530.3739960-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l/TGNvAGRjQpNxdll1UwVCHkQj9qNT+j4oMk31vS8dcjTtufeYo
 STknBPTMKpmHSMgTUgtN9yVFFrZsGCIr3BBGjx7t8naD7Jod1dNo4P5yMUq+2KM2pDNqBeH
 GxqZ0OutxzNrH12UWq8orMjSlq+LV2TOphxALdi5U7efNovcRYqmRXhQwem3Q3nDg0yE6m8
 E1K9CyEA/XMbc0xRBA1jg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2lEueDRsEOY=;5pO7os9fJmJ3nDRjd36lh7bhn9O
 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
 US5eMQutUu6eqEOik=

> Add azx_free_stream_pages() to release the resources allocated

                              call?


> by azx_alloc_stream_pages().

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc3#n145

Regards,
Markus
