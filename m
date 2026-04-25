Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7BF37E2F5
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777113344; cv=pass; b=Z+QArboDD83SMT6P/x83BA95/RDKoIhc5K2uf2ieILA6faGTmRxFBqBdwOnZLseHQfk7AsRutrihmw0PzV/ULTJ2fX2gDkVL65DHxA7EwRhBa4rKHab1tXC3w8Ebp9l7SUKUecZOqtCv9yUpSrlYjJX3GXpLUzTJORD7ZIjVKpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777113344; c=relaxed/simple;
	bh=4NBgU5nhiCAulZ8OH3gzj5HZxHYRUI3QHz5iaW52bM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RmRW4Z1exmhhZ5yyi5Q5j5c8mEvH9cTqtI7BIeRV/bdyLMdyaDtAPyM4V7ylOHZO4LQo4q+6NLL7HXnXXeBcANZG5jl4Wc2/GHGsV5lsAGpwH7xZ+EEglAlAPivyxYw0QmL+CkqJK6cnmdP0ATkqd68CfGgzVerq3lpHJTs8Dxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGBFF5tT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWq3GUn4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGBFF5tT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWq3GUn4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3N0pJ207243
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 10:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jxCmCQDJ+QKREcMZ2PcVDsOS
	3meXGSX8BjTm2djUMR8=; b=dGBFF5tTpOPFqq2QI4ayNBfnKhRP/k7EDxQIgTYF
	sGqNW5qPUHUXETkyh7iTM5vTeVm9lfUpClEKREr45gJneIbvw4kHmodwjLqqMHe+
	lBBwMGPTQWuzEgmWxoBk9Wi0UE21yKwWY997OZpr3nbrAqm0St4mgvR87fe6WSle
	vITCEfARKXWVSdbl2gUEAEljTKIR0F/ZeBRQ7JWsV+MJXV1I+YQPkAtwgVqWyFuB
	sl3EzPSs+264Drdh8r9xtX2gRqr6IxAuEstVGDGw8IZ6EocBU+dZxYt5DGv2pHrh
	YMbYTmEnSwJ5XvRbZTIKE+EM/htPgfVJF9WxWcBg5GPXuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf0pvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 10:35:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso172020845ad.1
        for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 03:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777113341; cv=none;
        d=google.com; s=arc-20240605;
        b=FFD/oIbsAG6VK59yJxtXer8iIKMjSNvRAqRfl880JOiGoJVVxqp6pv/wKdAIuHLYib
         k0qyuRElc7WF6hc9oD+SvaZ7Q134S5qon1ZEieHpbFyP+I5LTaMKhoech4+bDilUT/J+
         EcOu/tZUAyS649CTSWB/2abfsJRsSvhhuf47ZDSWC85XTPxVXpeq547yoBALlfwGA7+/
         E+7UHEf5wAj8P9f0fCDKkgCzbLqgt4keI3XbbnvAFURn9qswbG04/0RmG+XwLv/6QWBy
         jpyLpuzofHWLgeVheXREccjmprtPWN4OuN3AIAViDB1JHbh133trhDel+gFNDMb6vz8T
         E9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jxCmCQDJ+QKREcMZ2PcVDsOS3meXGSX8BjTm2djUMR8=;
        fh=IoVtwcw7k1bwhGx5Xl6xtjYPbOxq+e2i6l7UD1AqK5g=;
        b=eP3BQcac1rPfzr9Wgm6GmPdQxZNJ1wtv6sclWkcdguMLZNn2TAXMSwwxmGOMGprMST
         oaRpd0wnCDhTvu4bSzwL07mMIJgNusC38fJOHUHgNzBAv7CqYPcJcjwuPLAMaYzbJMZW
         p8b+stG8tul4CfYr1o/JvOU3tJjxwI8Lpt5K1pMC3KHEt0RofPuw3t9SvaZrkqmEBe9k
         QnO/+Er9sa8UQG6ezJxuZuE3NWSGJ2vLuAXuJYm6qx8w3V8hz2IGeCa8UAGR4ESDuklj
         3v1XXwVNVaaLYkz7VfgoG9myixk4wzCSAniz8Dt5bF6z/ie1BltzDMn+ct5xmUBSUhl6
         NvRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777113341; x=1777718141; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jxCmCQDJ+QKREcMZ2PcVDsOS3meXGSX8BjTm2djUMR8=;
        b=HWq3GUn4TuFMoLNMD41e7Y4FL0SvAEZ5wJDA0002+frqA5gBaPRd1kIAI7sCaI4gmv
         bhf0Fh4dmHyZSw+7cQBdTGuKGo5CVMCH2Wdy/m8XcV/sYQRHeBA3ep/wqvM8nDbQnowv
         9rp2WZaueU53y716hFduJAbNbLlK8jdaVkbHkGAzPxVExzPO+r+Bw6mnO/oRHm173vYb
         Z8QAZvjtMqcycaKiJi6rfscwyOdyBYEG+lr2101kO0uSZmw812GCZQJqIPcHCs9bhvfI
         BSpyBTT1vtlryW950+b4GgG6/b1q6uXYxudZflqs0qjn2nHJtqsDJDETaF2HNu1eysQd
         HQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777113341; x=1777718141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxCmCQDJ+QKREcMZ2PcVDsOS3meXGSX8BjTm2djUMR8=;
        b=irzqfBmSxN6nXW1aRMC5o8BesosxZtPWKnTFDivgpLbkveXfLvg99KAv33QIZQQ9Mk
         nTCvzjHSVoAcckxHxBLf8yAarE78e65nkn7qdCvgReg9nqBxAK4E4AmrmLvkQNIJS47H
         a0ft9tsIT6BLxYMC4N6Fi7ZqRxnyPKOZITdr2v1SyrVTS7PZMbVBhjL8dEGKuOg9w3lJ
         xcU7Fpf9OEtc2SDtqR8TwBE8qPOSLStLoIbNryRxpFwzGJxmlRP9TO8w0KIgLOA2qkt+
         JmiCZlu5XE+mrP4h/pj7I42/snsIFurHPOkTNTwt6BjJ1gITmyKaSLghv98LfaMF5Cas
         4syw==
X-Forwarded-Encrypted: i=1; AFNElJ/pq70U0wylJsNSIMnaHTJttuV59DCZ7f5W5LoU1Bk/DY69btGPKvZN2iOgPSaNbmxayRD5enjefYZO7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSD6z9+z4augAroQZc2ukHdOdOqrpx16kAxe+LDhzldpQV0R5F
	EetTKp05sjf5sgaOsKBmVZj2JnBfMR+xlWBLZR/lKGSX4WK6tUSssGC2SFfl7GVpRO2/elPdhRY
	PWFq9jvgCywGnAtq3rZx1qCnmPX1Z2jtY5yAvJlDCIjWnSE1DUP3kiQN1LxkmCU2N0ReRs14zww
	Ov6flKwu/fzM5cBnkMNoewZOWrW8fH3lR7RUUrrI0b
X-Gm-Gg: AeBDietyajdLEK3V5sO8K2m1vKsZOzDwgLICfpq0P+H7NpHuQlYF+pDS8OYmFv4bdEY
	3AfnyfBJTZDwtPrIoZRznHV1H5VjqnhB44TDdeAVcRKiKbemEYimNK0BU6g3QJcpSMMSTlOAnzz
	BHUNz1cn3ZUbfbLGoUEJPyigKLD0ynvb1jVy/E2Swrwe4zyS8yaoy4mQGGFBcUM/PpwcDCoX0B7
	u4UFmX5Y0setwgP7R4=
X-Received: by 2002:a05:6a20:3ca3:b0:398:77ae:8d8b with SMTP id adf61e73a8af0-3a09d099c4dmr37413510637.10.1777113340988;
        Sat, 25 Apr 2026 03:35:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca3:b0:398:77ae:8d8b with SMTP id
 adf61e73a8af0-3a09d099c4dmr37413465637.10.1777113340418; Sat, 25 Apr 2026
 03:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com> <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com> <2026042422-deem-chemist-8d0f@gregkh>
 <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com> <2026042428-blemish-helpline-7d8d@gregkh>
 <1e039dd5-da3f-19b2-ef98-29e64fdd925d@oss.qualcomm.com> <2026042442-luxurious-antonym-f20c@gregkh>
 <xuitjl6tzfl6nl4ds4vdy3637i5cqtjuqntcpqt5fnkx2ogcws@iapcavrwhyzv> <2026042539-swab-active-21a5@gregkh>
In-Reply-To: <2026042539-swab-active-21a5@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 13:35:28 +0300
X-Gm-Features: AQROBzCbHZ9w70YTtp6TmSB59GwDi5IqmqQ6RzKXe3MebdTi8LTOo1dC7YaDYn8
Message-ID: <CAO9ioeXWM74DEa=SA2vSvN_cmXivDth2VSmv2c1SOWtdL2i=OA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: Yysl4JERF48P1nIqJUqWXPa3NDdSwPVM
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69ec98fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=ag1SF4gXAAAA:8 a=G4jgJTYFYwyYmvXJBf8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: Yysl4JERF48P1nIqJUqWXPa3NDdSwPVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEwMyBTYWx0ZWRfX/sgSlN13plzO
 7m8OrJrI1IkJe1f+ejLex6RRT23H6EGWqK90w7z9oZxMsy4pK89k32S2ilTWTAM8PKE98ehCrOD
 tuaiVrVyQrwrA4Nsfd23Y6CRkEd0KMJnzBWaJWC56iWb/EHWbG/vEFKZ7bMyG9g4MxfpNVcFO74
 E3mXpVEVHyptqFWF6IhOb0sXF9+xhMFfuYDoXK3E8SxUTkFKkmZzqWvH5k33uhKiqkXyv2kGDBL
 q7//KobvYl7c8C/yfRElwn/fBsTPjPz3wB2etqtkW2NVzauwcrdq/RfyiS2BxdC5RrsLamn3VN9
 E/d2rA+smFCmuI0/0jJ3UiRTcSRBI9t1lRNl5qx9kK4A0VdMbYljyfNfkwQINCkT+wrotQdqDTP
 5iSqt+kaon8tqRwz1ACZNQYynUVOpQ59Hr5lKi324AWX4J2ljNAJX4HtLyZRXoGR9heVY4eymO3
 +WgBxtE4LF0E8LhqQTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250103

On Sat, 25 Apr 2026 at 08:42, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 24, 2026 at 07:11:35PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Apr 24, 2026 at 03:34:38PM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Apr 24, 2026 at 06:12:09PM +0530, Vishnu Reddy wrote:
> > > >
> > > > On 4/24/2026 5:25 PM, Greg Kroah-Hartman wrote:
> > > > > On Fri, Apr 24, 2026 at 05:15:02PM +0530, Vishnu Reddy wrote:
> > > > >> On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
> > > > >>> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
> > > > >>>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> > > > >>>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
> > > > >>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > > >>>>>>
> > > > >>>>>> When a driver needs to create virtual device at runtime and map it to
> > > > >>>>>> an IOMMU context for memory isolation, there is no common bus available
> > > > >>>>>> for this purpose. Each driver ends up implementing its own bus type,
> > > > >>>>>> leading to duplicated logic across multiple drivers.
> > > > >>>>>>
> > > > >>>>>> host1x driver implemented its own bus type to attach an IOMMU context to
> > > > >>>>>> a dynamically created device. The Iris VPU driver now has the same
> > > > >>>>>> requirement. Rather than duplicating the same bus logic again, a shared
> > > > >>>>>> bus type is introduced under drivers/base that multiple drivers can use
> > > > >>>>>> directly.
> > > > >>>>>>
> > > > >>>>>> The bus takes care of creating a device and attaching the IOMMU context
> > > > >>>>>> to it based on the client inputs.
> > > > >>>>>>
> > > > >>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > >>>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > > >>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > >>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > >>>>>> ---
> > > > >>>>>>  drivers/base/Kconfig            |  3 ++
> > > > >>>>>>  drivers/base/Makefile           |  1 +
> > > > >>>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
> > > > >>>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
> > > > >>>>>>  4 files changed, 107 insertions(+)
> > > > >>>>> as you can not have a device on multiple busses at the same time, this
> > > > >>>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> > > > >>>>> please add it to the bus that you are wanting it for.  It can't be a
> > > > >>>>> generic bus as that just doesn't work.
> > > > >>>>>
> > > > >>>>> Or what am I missing here?
> > > > >>>>>
> > > > >>>>> And why is DMA somehow "special" here from any other hardware attribute?
> > > > >>>> Let me give brief information which was discussed, in the initial series,
> > > > >>>> the iris VPU used platform bus for dynamically created devices and we got
> > > > >>>> the comment/suggestion from Robin to implement a proper bus_type with a
> > > > >>>> .dma_configure callback.
> > > > >>>>
> > > > >>>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
> > > > >>>>
> > > > >>>> based on the discussion, implemented the dma_context_bus and used for iris
> > > > >>>> VPU devices instead of platform bus.
> > > > >>> Why not make a irus_vpu_bus where you can do what you want?
> > > > >> Initially iris_vpu_bus was introduced, and it was made generic based on the
> > > > >> discussion,
> > > > >>
> > > > >> https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
> > > > > I don't really see that request here, I see a "make this better and more
> > > > > generic for other busses" but that does not mean "dump it into
> > > > > drivers/bus/ for someone else to maintain" :)
> > > > >
> > > > >>>> Here, the device have only one bus (dma_context_bus), not multiple buses.
> > > > >>>>
> > > > >>>> Regarding the "DMA" naming, the core operation of this bus is its
> > > > >>>> .dma_configure callback, which calls of_dma_configure_id() to map the device
> > > > >>>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
> > > > >>>> purpose.
> > > > >>>>
> > > > >>>> I am open to suggestions from you or Robin or anyone else, if there is a
> > > > >>>> better or preferred way to achieve this, I am happy to consider it and
> > > > >>>> rework the implementation accordingly.
> > > > >>> As there is only one user, just make this your own bus please and do all
> > > > >>> of the needed bus operations for your devices there (i.e. don't hang an
> > > > >>> "empty" device off of it.)
> > > > >> The reasoning behind to make it generic was to have more users - host1x,
> > > > >> Iris VPU, QDA on the generic context bus, instead of each of them having
> > > > >> their own. Let me know if you suggest to have the iris_vpu_bus.
> > > > > But you did not add such users here, so how would we know this?
> > > > >
> > > > > And still, I have no idea what this bus really is doing.  Is it dynamic?
> > > > > Is it self-describing?  Why not just use aux-bus?  What is it supposed
> > > > > to be doing and used for?
> > > >
> > > > This bus will allow users to create a dynamic device and map to IOMMU stream
> > > > ID via .dma_configure callback which calls the of_dma_confgure_id() based on
> > > > the user inputs. This bus is under the iommu_buses list to register for bus
> > > > notifier callbacks for iommu_probe_device() and iommu_release_device() during
> > > > add and remove.
> > >
> > > But a device is nothing on its own.  You can not just have a random
> > > 'struct device' hanging out there that does nothing but iommu, right?
> > > It should be doing something else that is very "bus" specific.
> >
> > Unfortunately, it is a pattern of IOMMU-only devices. All the actual
> > programmig is done through IO region associated with the main device,
> > while subdevices are mostly used for DMA buffer allocation.
>
> Great, then you have a "host controller" for the devices, and children
> devices on that bus, with proper drivers binding to them.  Like all
> other normal busses.

I see your point.

>
> Yes, writing a new bus is a bit more pain than it should be, one of
> these days someone will get around to making that simpler...
>
> Along those lines, why aren't these new drivers in rust?  :)

:-D


-- 
With best wishes
Dmitry
