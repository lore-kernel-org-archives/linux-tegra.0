Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144321F1921;
	Mon,  3 Mar 2025 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000544; cv=none; b=O6xOxIllun6LKZJJHD9Gno514rCmF7ipl11NKV4H8uOc+CI4yLabjUKuUIUZBlGt9g9OhzUKbZpPLNL1tuDabhzp0k0GjSCC69h6+G0sCdWibPyg+wBpbt4NiYoYIRBWQ3ZI+AIFzEQOxTzeo2eQw3hZer2/jWr4F1cCTsNZ9P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000544; c=relaxed/simple;
	bh=My0FAg9ECNGTXiPTr8yp95tKw/PNZxWh3Wz2mbCwVSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GX//8KEh/jNiVJL4chIwr0CLfuFxlOr9H0amJMZm9/VYtEI9maDRcmHY2IwBzlywKcDUgAazraKRE4UaBn8oS9Ypd7/N5ki3Opj+P1wd/XX/vByZUJLgeRCcH/8OV3boacDWFusvcVDcbX75Dfi6XCC82eLuc9/tu6gng60EmlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=jC3FiKE1; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="jC3FiKE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741000527; x=1741605327; i=markus.elfring@web.de;
	bh=My0FAg9ECNGTXiPTr8yp95tKw/PNZxWh3Wz2mbCwVSE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jC3FiKE1zwz0jH5Cs5wJHKsMGoy0dqE9amlLs10O3SwZB/FWdFjB9tSe0wJo4tsf
	 LJujFIQwUlJtAvjP5e4IhYpG46h9GTEeMKngt88WwHnPoxBilG8zm3+hkx53capMF
	 FIC0uDjHF/1el6X2TFLPdPuIQ1DJs9Lym2QFRu+ZlbOr8mpDJdrWpl5o4zY9gAF2o
	 YHqD69241/TPyrmkI+ZMEmfYykbYlvIPHRpcNJ2oblmaZYfbxcpSfHqDTKRzP0/SE
	 +Q7NFKHFaU4R11+vL9f/oudJ9x0zmbVLS/PWZk5lwXk0BaZiYtd8yK+uZmqjGPvvL
	 lyWRNaPLQ/0VZVQ1OA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mt8kX-1t06sA36Jl-00yCfC; Mon, 03
 Mar 2025 12:15:27 +0100
Message-ID: <10afda2a-4c52-47a8-bdfd-4bfd7bd9cb34@web.de>
Date: Mon, 3 Mar 2025 12:15:25 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: tegra: Simplify maximum determination in
 tegra_nand_setup_timing()
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-tegra@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>,
 Richard Weinberger <richard@nod.at>, Stefan Agner <stefan@agner.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, Qasim Ijaz <qasdev00@gmail.com>,
 Natalie Vock <natalie.vock@gmx.de>
References: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de>
 <87pliy9yyv.fsf@bootlin.com> <0193ac44-e858-4aff-a50f-dd95dbf3de5b@web.de>
 <87h64a9y04.fsf@bootlin.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <87h64a9y04.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R1exJjdCQwDCi4tP+5q2mVtAJq6NaltfMACf/dznh3c2rORKP8d
 EjjNDUoCoUYK/hlQ18JBQvxCEai4B4jLmJCvRepLp06rXRRscEQnIunGbqWjJxlGdOa55J4
 th/oQDxXsk4Ga0eZZt8pvMIhamehVGQ6jakpIypJoEFdJhNHSZM2IKB5F9y9xhW0XqNl+wr
 iANKn8LFoBVo8c9eXiw3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9aGubQHfLpA=;X2oznE8qxdpeeK7RDktpeZ6VenX
 SY4S66SxXgz1fvqAzrjZGKCbALvFIOTlSeOrGRCklYGiRfYzeQ0gFJlv4KHA7JQhzD5r0BI4v
 Wz6N9/dPehIzl9RYlP0N8MAHti+KYioj4EYAKcLFjqvYSHmRmDdHWW/ilhqS+HM0q2ZMAEZja
 Q4r17eTq9w+q67VRYXOI5wbP5y09e79a/YdTMzknp/kU2IWg0DWNvmEPdBFPBlX+6dOoQgZRI
 czD7BgbMdJUyY1LF/K/dP13Uic8xLBKBqFDGNfN7ThTfkCTcwPHJ+81yayjP0R9/4LO+3SUWl
 oFtwfI0QVhm5D3GQnvoTQuYINWIoT9mmnO+2Iv380OIjtRQMGObZhmzYJzlaCu8wIIvnmg9VA
 wm2MMcfvA9YsWICoDWwNGKy1ZRFJdWJl+7UW4YxcvRerXqTWI/oDx/GZWFnTmFMEZZYxnMf+5
 aFLhXL7mryGxBAsLlQxNZE5HdYY2G/tJtoTONlFmKqbicGhDysEN46ZZ9PlbLTxUDymiehJAZ
 6COWzab92QXHQsK9/IaRAkx2MWcW+mSSzW1gjlr68lvY574+G2wBYyftLlWAUDax7TwmqEWbq
 uov7uz2SiPXSjLokY7R1NFhCUk2rXGslLd87ntSjMkG7gTYFAaXA06SnJ3JAlRZJFdDpNxdXA
 sk+0X9zBt0oB1InfFbS7l5wqq909vnZVNZcXiWYR4m3PtoqEQkqwwCdy9jXpncKy1hONv3gCI
 tKkTr2lmFwaGojxltZ90mfROkPwAIzC7n2g1hNuYSYCdkQUjub7wRX3maNqK8wSqg/hsFsZxY
 9vizJ2c/rmF3H2UvvBdmp6iBtRy4ePbp5eDgBOqAXcDHBJK/sBMD8/haItmCxVC/4UGseVR1g
 3jDeOBkQ5Hw8WA80Y+UAAlK/S4drhoDf9bnggFJBOH4agcS3jatZOwbkLPe5+vhQHBKTvofZ0
 YYTl8Ipnk8ivIuozDkaMieYQseJ5ypFE/jFyiGKAQnwYTg3LBgajq2eSypUY61kRi4yZERSBr
 Wek9Cfi/H1HmJ6l72jcFcFBxS366IexX/RaSv+mXdW6cT3dLRVTweKWXLe+k8pJlXGLaX9pSZ
 P2Jsafa7cDLgyGP+kUIF+QPNHjJDJx40aipZ/eEDa9EeiK9Sd7g1M3RedraDd4LDbQr2zd7LE
 0oz/4AFwoz+8F8OWHslygz11JlBgY/X3MahIgO6cOQpoIvgvxGNS4aOgK5sRNyWAapydIe5Lb
 GPI2jSktmQ1dKANNF8yAMXiE1EO9IuEkM6IoLmLsRjdwVOo4+XYSdnhYDc5E2ahL8J/dhEWc2
 157rZyW3tFYKyqTTK7HTusBHWxpU1D8YGBzexnzr8E7H7KfpRb812BUtX4A7GJKe89RRQDyFk
 jT+Oh6pfkm6PcunGZLMyDDXvCdI4Dbo4t2U5D1jfG66I53Q6/4VwEpemaEGbrXVMj97dl6yMx
 X22nRxA==

>> You would eventually like to express that a maximum should be determine=
d
>> from three (or even four?) values.
>
> If there was a max4(), why not, but in this case I don't see the point.
Do you miss such a programming interface so far?
Would you be looking for corresponding software adjustments?

Regards,
Markus
