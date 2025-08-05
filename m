Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE427F01B
	for <linux-tegra@vger.kernel.org>; Tue,  5 Aug 2025 14:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754402712; cv=none; b=jjOttH0vlSg+1xRltz9NbSfF7qlsfOf5NiPgNZ/pxcLLqK595XLFwSOtRwS5HpMuXstREHe+1IUcrSRK+xSlKq13v8eyWy8UOLIOxPCKmq53EfVX0mwPJ6kcL9Ttogi5jF1BRPGGb6ri0aaVANxelQIIJRYQ7pJR3hMrJQfYcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754402712; c=relaxed/simple;
	bh=VwwDGPh3ds9A+awGPqwqcnNh6Gh4WFl0HqGJuWyvkkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RG+ullAbLD/9PR0EQiNaqceZdbXy5H/6m94JdtVw0Le/sYvuiIcraH3O2ySzY3+vJwuO7FvY1CX1kdy0efcTMtkgjZ84cNeahtNP9IPzoDHd28LH586iXINtFggwgBl7hK5CDqe5GUZbcvRf0G/IjRT105+nIc9lF+9E590m3xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JswbVhN9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JswbVhN9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5755v464020917
	for <linux-tegra@vger.kernel.org>; Tue, 5 Aug 2025 14:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUcLnureUr1s/7YsNTnvW5Csv2CIZeOY1lQ56p5/Cj8=; b=JswbVhN9EiO/3bXB
	KFFT2FK5zmrdDsAM9Z4O6z5zh7QsngVwmJQyJVPLIRQZy9tXuLlXFzx5q8QeK24Z
	UuASYCo8lC5r5kPQilhktpk99gMDFXxhv/dT55dfFGKBCQXaaStS6SqslNBHs+Pk
	6lpCnGjbmxM9hWGEUq1bYfANmhL1k2BCrodCT2z4jODPS9GZvl5Ka+gigTeBZa4j
	hrLEdMvf9GRA+didrRj1V7EI/VkbiYXs7SbD328oyEfQp3RkEeUY0iTi8A1CYyOi
	HGtkEWfS1GX9/TR+jdWzEglaT9vngedtZgPPmRClZ0L8g80N1lRCZfR6JAq2vIX7
	73cJtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjrye7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 05 Aug 2025 14:05:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e802ee0d2aso14088485a.1
        for <linux-tegra@vger.kernel.org>; Tue, 05 Aug 2025 07:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402707; x=1755007507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUcLnureUr1s/7YsNTnvW5Csv2CIZeOY1lQ56p5/Cj8=;
        b=X4W/K9ScRFWVs1IUey4QPVSYdHgWPm3kmnC3SbiiyWeetISEIgfh40tftpC0Kmrg5n
         N5xVXpjZOg2Hp4ttfLQEslhodWeSo2Z+0nQrmc8XhxsvaEwuYrWo2hDiaP8GR5+P6PYK
         db1VQARb65rqe5Rsz+0ea3R2vqrhXxnKj98YRpgjGuxOt4He9xkIPWNhrCrdWKaQwpmQ
         5Y82CH9F8KWYNUeuJZngkwIwY84vZFk5fiDNjb8Fz7o74MZrxpxSo/HUZngv/sL6RrAW
         PAdpa+dk+lgGfqAnNHhDGyLLTMvK+5F5l1tYGYVzRdhFAopNye5nKv4vYoHREzmnINTa
         gayQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjImEEtdezXJapCHZGpMqeBd9aNbKx28QHiykjipqi8LBHI+z9rw/p+KmYvH4jWEGlzR3nKDRPqB5kzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtpyfSprnKGXyp3McOWCDUJhlXdgNvR18cQ3SlPrwPPEc4HLBZ
	U+Ew/bAeYUGhrTdbw6k6Ujdz+VwN/k3wtyzrbezA278QbjVRNg6SHG3RylsaljcD9+XDhtLCeZp
	W+TnNc18BdgdFqTxTkFbrG5y+KlDUIpb7gpSqfvztdIeAv5vcno/V91OTh+dvCJR12A==
X-Gm-Gg: ASbGnctht9159UHOMRvPefB+lmfhDWNMMm/YdS2ldslLToZa2nI2t1CZqGbUTS3HixJ
	3Hgjl206MARjLvB5WFrKgHi+AsOroatRmuPTJvDo0xN8J8c88rZ9qVatc2FVqxL28m1pz4EQ0jb
	Bm8p6M676cg8umymuq3Ew5ESUFZvjMDaMi+txOkocwS4kQeNj2aEAaSNmi2km1tv7JKklCCxZ6L
	IY/ti9ROrxJ08/sSVRoS+UBJOUydwvqXRcygVcmy4h0bE0Z6snlqGH3RWrynFyBms9JfwuLlVNz
	q58o+Jj+zr9mClVdeaZAsTEbgmQmnGQWv87zOW23Rgk+SU1128ZZluiWx0VmMpk0o/HttX10itj
	ygkIJwMxZ1wkigRx1Xw==
X-Received: by 2002:a05:620a:2a14:b0:7e7:fbbe:a193 with SMTP id af79cd13be357-7e7fbbea796mr612192985a.3.1754402706819;
        Tue, 05 Aug 2025 07:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu0CtTCnSeovH7oZZIpOsR6SihrS+IeJBeYEWKx2ZbtzZuol650T7aTGGDwlvwPzoxkQZS7A==
X-Received: by 2002:a05:620a:2a14:b0:7e7:fbbe:a193 with SMTP id af79cd13be357-7e7fbbea796mr612187885a.3.1754402706081;
        Tue, 05 Aug 2025 07:05:06 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f17829sm8316020a12.19.2025.08.05.07.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 07:05:05 -0700 (PDT)
Message-ID: <96cf6022-ef69-4749-88b0-e18a07bb8427@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 16:04:58 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel pass
 a cookie to of_xlate
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.li@nxp.com>, Konrad Dybcio <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-actions@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
 <20250730180417.GC21430@pendragon.ideasonboard.com>
 <aIpmgpXME1BmThxU@lizhi-Precision-Tower-5810>
 <20250801120007.GB4906@pendragon.ideasonboard.com>
 <0c2cc631-21fd-41fd-9293-fd86dd09a2d2@oss.qualcomm.com>
 <20250804235140.GB12087@pendragon.ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804235140.GB12087@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=68920f95 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IUwAV-ZVHCOG9dU_XxAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bPinI9NNO2B4XUhYKdcawOwUdaybTU6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwMiBTYWx0ZWRfX5doIlzR1pMBL
 an2augpa16b5T+2d5umyI7TSGaR1fjndA7KOxtrr7FtFxr4u9zjknpW88IdeVf6zbLn8F2M4kEF
 TruCyisq1Q32fflvvjgvVkJh70Zy02EXttNRSDswZu+mQajmO2X3ZDB893njLsPf0T7+SBers8r
 Vrk4SydbxMvirc4Lfc5ZL/YgOC5R36jN2WwZL6B2z15cm+5Td3aauxtCZ35xwB1bBxFuJcac8hN
 49r4g/+otFSuhrRGBOj7ewCKoHXRPb5W3ZDeUxvadCYIQ0GF1TfQyMbRz8sU3H/XWCTrsGnTwyK
 zH2izSCjR0jHSsvPvn1QeieyW3kBi0mbIMGnQ/NtnF3kP8ieJorJOqZWqsvISUXDQECk/v900Z7
 1xSjYJXt7eSnWVsirO/Y1bQGZG5UmizDGQr/tT8Ys5TgY0FldIZa78FoAhxNPLlE6hBP4skV
X-Proofpoint-GUID: bPinI9NNO2B4XUhYKdcawOwUdaybTU6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050102

On 8/5/25 1:51 AM, Laurent Pinchart wrote:
> On Sat, Aug 02, 2025 at 02:37:54PM +0200, Konrad Dybcio wrote:
>> On 8/1/25 2:00 PM, Laurent Pinchart wrote:
>>> On Wed, Jul 30, 2025 at 02:37:54PM -0400, Frank Li wrote:
>>>> On Wed, Jul 30, 2025 at 09:04:17PM +0300, Laurent Pinchart wrote:
>>>>> On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
>>>>>> On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>
>>>>>>> The DMA subsystem attempts to make it theoretically possible to pair
>>>>>>> any DMA block with any user. While that's convenient from a
>>>>>>> codebase sanity perspective, some blocks are more intertwined.
>>>>>>>
>>>>>>> One such case is the Qualcomm GENI, where each wrapper contains a
>>>>>>> number of Serial Engine instances, each one of which can be programmed
>>>>>>> to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
>>>>>>>
>>>>>>> The GPI DMA it's designed together with, needs to receive the ID of the
>>>>>>> protocol that's in use, to adjust its behavior accordingly. Currently,
>>>>>>> that's done through passing that ID through device tree, with each
>>>>>>> Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
>>>>>>> dt-bindings that are full of useless copypasta.
>>>>>>>
>>>>>>> In a step to cut down on that, let the DMA user give the engine driver
>>>>>>> a hint at request time.
>>>>>>>
>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>> ---

[...]

>> So.. do you folks want me to alter the patch in any way?
> 
> I think the runtime PM issue is orthogonal to the problem this series
> addresses. It can be addressed separately.
> 
> That being said, I'm not a big fan of passing a void pointer to
> .of_xlate() to carry device-specific information, in a device-specific
> format. This seems prone to mismatch between clients and DMA engines.
> .of_xlate() also seems the wrong place to do this. It would be cleaner
> if we could use another operation, such as dmaengine_slave_config() for
> instance.

Right, I noticed that the drivers in question already apparently do the
very same thing (passing data through a voidptr), inside slave_config
(via the peripheral_config/_size fields)..
But that doesn't solve the issue this series is trying to tackle, since
every DMA consumer driver passes its own structure (or NULL).

My immediate idea is to add yet another field, but that's lame. The other
immediate idea would be to put an `u8 variant` at the start of all of 
these structs ("we have tagged enums at home"), but that's lame *and*
dangerous.

Ideas?

Konrad
