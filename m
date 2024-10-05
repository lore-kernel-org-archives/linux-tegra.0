Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15BC156C72;
	Sat,  5 Oct 2024 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728146124; cv=none; b=a54AFdR/bq9drTb+/ssdGwU+kEBgZpmGaV3R1nw2ZhEsJCUBxcK92yH6+ixPLK1tvnPiNEbarlJByGwVcYYibLaVi4uuVVcINhsaXKvcOODxQ1u4AZtIv+aeDkX5aus/YaHZP8DJ4+GkBE/ZYxKNlRmXoiOKpyQ8INjFUUryqqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728146124; c=relaxed/simple;
	bh=m7lRBVzNJcOP572KgbB/DII3CmT14dcc8PkIQnJY330=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=PkOiGgcUa1x/gsHIIIDgHl07+QdlOA71Ppy/KMJc7Y/acxunHjHCCVXql7PSlemCiRoQ1i5QU/d30/d2m/bch8cR29smzgPn6xTGn/NiZEBW6jiFPbsoinHhrdzjqBvytqvZJzYFgM/j5pgDlkEI6R1/q/+f4g3scTqyivTggCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=I7Zbp8XM; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="I7Zbp8XM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728146111; x=1728750911; i=markus.elfring@web.de;
	bh=m7lRBVzNJcOP572KgbB/DII3CmT14dcc8PkIQnJY330=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=I7Zbp8XMzF7viJQJ/8wOtHjAWWeiCy+vVQnhLT/p9+jpGV4fKov3U/Do5Jn4dAX+
	 uVCodsUKP90SKqU6eCCgTccLfX8w+tDa54H7j1jQrj4H8gEIKkoRWq7QTPKZRHpR5
	 Y1gP5N4xi9ZErw3OONVHCxFlRZ49UFU/fWUmswXxeB+CjxWRqae4qa/sAh89Eh+3V
	 Usaw0SiUULGUmNW3M3DlMROQr8CwpMexYQ4F/0d/P/tJZQvx5vokTrV8Lp3//0Kb5
	 QJ8iZ8zr8Vsf3VNtPuYTchLui8Ed/OL867x60LG0zT1jbmXFY0RSh3Rr1zuMe0k7M
	 tD+SZeWfNUC5/quQiw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MeUbo-1tXYxX2peO-00fAr2; Sat, 05
 Oct 2024 18:35:11 +0200
Message-ID: <5e798fd6-5662-48a3-8e3a-758f250828c8@web.de>
Date: Sat, 5 Oct 2024 18:35:09 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, linux-tegra@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Sumit Gupta <sumitg@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Zijie Zhao <zzjas98@gmail.com>
References: <CANdh5G4nX_PoRsWmCo1=TzoFA6k--29iJFgL-N_B_0anziAskg@mail.gmail.com>
Subject: Re: firmware: tegra: bpmp: Fix freeing uninitialized pointers
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CANdh5G4nX_PoRsWmCo1=TzoFA6k--29iJFgL-N_B_0anziAskg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ubD2lVzR8pnWzQe8WMzsSSrGvn4JLtgBl6Qx7E7CxeuYSwuikQq
 i94dGueTKOfCtaZCT3QI+4GWyldLO6lO9mwViAOpyUzs0Z2XzDLVl1Z4Exn8Q4cYx10jOQC
 bOZ8vM55jBU8KEUr+22n8++a4QM8tOcgnd2eyW3+cud3f9ThFb0giXsvFufcARJKgzfmEdP
 iny8jU9aY/W3ggsSQjy0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k2BZFXjEl/c=;0PnBbjpU5GjjXiuy8Ei6VE9oO1m
 nZDwRisBtTIKamkmslYsQnclJX3rTYyc8HC+X9eoDuy1hjdIty7G/l8ubwhwnzIsoV6DxCNOw
 0zaYOQXWICwgAwP8qzGQNq3kRustod0xPIRDR2qzsIZGCKoPja1rNVA51zWkXate+pn003MAZ
 uBFeliqnROFzXuzDm3ZiOTKLHXyt2gVpDwmZOsTXHQDIFlpd1tso1Fb5TU+ytTHkHYN/3kuNF
 8vYGFnDigkMRwKVXkKDGzthqYh8PuPhavbgfziC68zAwp2Ysv7OJdHz51Dvg39PV3iDOjrn7Y
 NChIZp4y8GHKqXc7wPEvTR+y/22hF43aDE+fDE11L6E3DA2ElWV1Xqmv6DLlYgNQP3xgQvcsA
 uQ/VClETFPvilr1ct0IW7tMKzTyn7AFCdv8QQLv38ovYM1YsWQVbtY7K02psoxSdbpMcIiVZH
 pgo/dXS1JbG/bS2VKPWMN5ZzcjJepxKHnnOTGID+PmbuHW7s8Cy0dtXKUPmSLk98Lcdrw1iip
 QOADyGvb+dX02dckqF0jMkPHLHYcszqOVs8aKshdpcQkV/k9lGl5f4poy/DGc3u9Do9Zpfls9
 ZT0txv6ZO0yxVVU+aPJaxelTMf1gIYIo8wvRIZ0s8hROB6sgwpWuQD+mizS6WOZJHgg9bX2og
 Y6kpp4upiYEZx7JSfmReFclQ8AdeTYW2Igm4XIinuHfGMQk5cS4BRblPLyh+G77kOGZZ2/JOm
 EPLcbWHKElLW8+TgHff3g9dzGhZFVEcCXymUH10flmL8PN7sVqkkRhd61Z4oRDa288CRSZQj8
 9QRKyyiS6qYyYv3Xc2+y+/Wm5WJVVSaNTym3RModNX9Sk=

> Thank you for the explanation and sorry for not realizing the correct
> deallocation function.
>
> I found in another email thread that the NULL initialization following
> the __free() was mainly for readability but not safety. Sorry for the
> confusion.
>
> We are working on a static analysis tool and wanted to report
> potential bugs. We directly sent a patch trying to reduce developer=E2=
=80=99s
> burden but didn=E2=80=99t not realize the correct use of Reported-by tag=
. We
> will be more careful in the future.

Please take another look at another corresponding public information sourc=
e.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/researcher-guidelines.rst?h=3Dv6.12-rc1#n5

Regards,
Markus
