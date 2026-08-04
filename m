Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1BB4562B7
	for <linux-tegra@vger.kernel.org>; Tue,  4 Aug 2026 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850979; cv=pass; b=rm6VZlBBmLuFNtQmPRs8n3J3qY+I89QTFJWZA+o5NSX/6gwWSUHKilps5IuGHnIZnrQDpa0gbN0pfA/yFpSg2QPhFc66EKV13yBLhzID42naEHOfnDvIa4OP8Vsj4KYKmAI5TnJSB/Pwu/yzE1vOga9XCrvm20uLP9aQpO1aKZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850979; c=relaxed/simple;
	bh=O7wUWXDsY3uEeARPEMMNmbRY52q+9eneHeaJu75kFmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJcGmF2/fDwx4/ewlHpPOct8LrsNuTF3VpOy0yHJ5dqVn9SYJFclhtw73PnxVOgTaWzRrlkar0Z/T06AL9NpPOz4bW855p2qhpl6fc3s1xFM57ODt46+zecWKO8y9q7UnLZMYdQTyz9KPOgoFDlO6CntvpC3fBCAAAS/gCCtMHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beU9q1KW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2PIy8xy; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="beU9q1KW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2PIy8xy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXMV63829976
	for <linux-tegra@vger.kernel.org>; Tue, 4 Aug 2026 13:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XvvqE13EntW6712+NVvxyzFymgdbvIBVB20n97Y8Rg=; b=beU9q1KWcc06i6JJ
	HtF1fUhq3CAtPEl8gOjF9N4gv0zfw5Ow7L32WO5Nyb6JTSQzThP08uw1bvB+jB9H
	p72I+2joIZO7aJpHdXSyN7a84jSRcUB766b9UlYe9tNfPsssLbsSvXuBeSb6fvAi
	lqnAGOlTolGbaARO2zONpEP/kGWuocvmZU37VDCMSHHET21PnCcpRgwGxlYIb4bl
	daB0Y91CdGDn0h8plEws9tCV22C1hF0xXI3hDBB8/2vXMvWSeTKRAYFO82jToe9u
	7Pa8wv3cnpqFvOvhp3/tTangOX6WVpgDFF1TfeY54eSoCgFo8am6aEWAUrsmaVXG
	qGffpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5scfp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 04 Aug 2026 13:42:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so48750371cf.2
        for <linux-tegra@vger.kernel.org>; Tue, 04 Aug 2026 06:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850976; cv=none;
        d=google.com; s=arc-20260327;
        b=FodyVg3ts3iJ8zXdejPzsOm6CE/CZ0CqrJ3ZMlIpqYrgkjexJWFI8RftC+d0fRcfqy
         vHzZGti+Kgg6TV4kUkd3q4tDgjWZNwCHahJ22dXyPpaA1WQxSunrljEldJ4aNgOEo9z9
         2YFbAuu/b7hUW2b3RZNzpIzE6nDuixHZ/9RtB43AASPLTCI/yp2wJaMg5jYqq1gKJjlp
         /oR45f74oUL4tttCq0Q6HFXfWI7xXVYZafbW1pKaBzWxeYpjHpOBloXMOF40yApwmYrB
         yxwLvgGFxLbDazpkoil187TGeTpxCXdBxvYg2DHme+LLi0zcQWL1gihnbql8Rhdu2rip
         XoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XvvqE13EntW6712+NVvxyzFymgdbvIBVB20n97Y8Rg=;
        fh=slyrQNd36r/bMduTE7GLDRVDZsCSNEJpJ2kYQwrdiJk=;
        b=dCpiLcGbJs874dQKOU9yAIET4RtxuItCmqEUATLaB4d318q4Le1jYD80g0oTOEKATu
         QSAgPlbqxwznKU26CsTPuwXfwWZT26rwL3DK/TH9cDdfPFqSkk8mX/BDrtvQA+xLxWtI
         pMAiF4j/VialRpsYkFjkBda3yVbVbPYSnnHltbatNlV9c2HETziTL+C8jXji0Mvulz9r
         9G+ny7yp1NtdkB7omrxjyfIJpKhSp/MERNeP41DU7Sq1GrCQKOn6WYDSLHUoHYvE9u4c
         AE0jQGzbabON5Idx/TjlYcHoQ7TSn1HQNWDsyxwvBuf1EK1gQpwxgqj4frfiTulbNk44
         sLWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850976; x=1786455776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XvvqE13EntW6712+NVvxyzFymgdbvIBVB20n97Y8Rg=;
        b=S2PIy8xy3DKbBKm+u++aPUWcYTQrV6hgEbRu1lIXDVObWle27Mm2fs3eibctxGEgHb
         jdXn5IB10OtlWHFJSQJqO67QATDoktdVS2aCIm01SoBvJb+9KXPFMoB0MxFDYvHnrqm0
         bYCg1jhKJ7McjZu9CuhHxrR7A+gYAoF4wPJmoD1+eaEbu8DbtFwNa7bWB2D+g95pG9at
         BUPSwqyJV9oyGfI4dxvygulZAgcmHCcnWzlwdn2hfh1qmTN1ylcJ1NtWxgrdwI4TWWoK
         AyDRsG29MH30pVLWn1afiI6h5rpL7o1wqWFqJvWV8/Pcnremt1IgNZ8B/0RmxF+TX26C
         hO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850976; x=1786455776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XvvqE13EntW6712+NVvxyzFymgdbvIBVB20n97Y8Rg=;
        b=eBXDjHU6iwg+8BlEsEF8j56AAkmgoHZfJqVmUsU8z2fEBLuPF9Z0/R6KqdlONEEOfM
         8ahMaBXFVcqJnA6NNMzDfhHdrL0FkU5euOPgU/AhDi+9RzHrQklEXIONUPKbSbp79DLD
         JB98UZdoUB8As5hIBQOH1MzHkyKbYg/KxE0TGxPeoOTfhQlhSUH3ZxYzz2vZ3ETjNXJx
         lQYyJXTiDpVh6BBqiyQp6/K9F5I17GdmH7JggumpeJTYONGTRkizsFKqqgT3Xfn/waOk
         P0HjM+7glOjgDJ2H6B8VVkr5yqhUHGz1rJIdwvI+MeoRfEJCdTuBZ5qmYDvLL3qveKLB
         SE1Q==
X-Forwarded-Encrypted: i=1; AHgh+RosQSEUONu/FBgQr5adQwPYt5oz1/QiKtEypsAY56COVrLoOl+josjCt27YSQpCEFx9B2ifc20AoV/CQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9xFKfXIDGbt7U6jaSBu2lKxifq/QLGQdZtT40BqQ/EKy1E8hx
	jQP8fpziKAcojeRM1WUu5oYdv4cwawOnRIKnkq1IPUgygSMSOait6YlzRNM3oQ+t0ybFP/h9RtX
	1Xr1+527JXSK9/l6g+56uXKED+s1S96mLdeeRCzAMlfOoIjkxGNYoa8JNW20CPTaXR514bPd+2G
	h7JrR0/etCFYuAV2P/8fQ10daLdRVIXLQQZYJ29Ytp
X-Gm-Gg: AR+sD11jmH9r9aensFvyiKhDCuXopeNa/gICbvMT7aM0wa7Fwoh2gK1z00CU7KeUsDp
	LY4aW86TlIdh8LBEnsNUkksyIcLUkEx+ZfOCHqyuF9CSYgn7zU3PL3Sr7p+I7OvYCEPxj21TkWg
	0maj7t6JsVoO0e3Hzv7i7p5mcaXXVs45rMqqh/+CujM7EINw8XvexUic32sA==
X-Received: by 2002:a05:622a:d5:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-52b56670980mr263922651cf.9.1785850975621;
        Tue, 04 Aug 2026 06:42:55 -0700 (PDT)
X-Received: by 2002:a05:622a:d5:b0:51b:fb4f:afdf with SMTP id
 d75a77b69052e-52b56670980mr263922111cf.9.1785850975193; Tue, 04 Aug 2026
 06:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724075700.714261-1-pshete@nvidia.com>
In-Reply-To: <20260724075700.714261-1-pshete@nvidia.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:42:44 +0200
X-Gm-Features: AUfX_mzFueV34L91xtuABsfkzdKLs6pi3RDoAgO7ALwwTVDO2DS46FaYhxnqSHc
Message-ID: <CAPx+jO--kLFbs-khz9UX4OUq6yFHTpoZpjwaKdbKoXZwZhm7LA@mail.gmail.com>
Subject: Re: [PATCH 0/5] mmc: tegra: Add Tegra238 and Tegra264 SDHCI support
To: Prathamesh Shete <pshete@nvidia.com>
Cc: ulfh@kernel.org, adrian.hunter@intel.com, thierry.reding@kernel.org,
        jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a71ec60 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Ikd4Dj_1AAAA:8 a=DZf_on3a76gVNrxzGB8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uddnhUKEJ9pSaxt4Ev-w1eFrfqdHDRCj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX0CHyrlG8IJLK
 eJWOg2qkYqrlJ49eHtqLZdeaOZeelrd+wA6ptFYqnLANMa/HZG3TyZdF84IpzyDXYU632kCFeAJ
 AY3egJMqsHajEB8tzZDE850B9SEHxRwteC8PpH+WGJfwr+wP0EkDWpIPUvAkC8XUrSVaaXqJ1vR
 MeNkEJKgY0qVW6cwXAmqx6nNknZR0/nXYF5U3nhm1kUE+/60UYjJOQZHvnHhmzfBVX/oshKsNg+
 O6dpuNJojQ/9P/n5hWLkYfjx06djPXz9aAc8LWN1sYzot5ArvC9l1nwBkGfker637xdH37cg65d
 9TJwPvhyjP5+FMFoZaSwsRrvh5I45YrIoNoHeZrTi18F5j3/KlmGXK8bXBu3N2ZEnPH3k3hs9CQ
 bqlhxffjDDAa3awJ6IpVrz7NHCV5Bp422N7WMm+UwvLaFipHno0uDrMf77EQQE5FuNPYlkzDzlC
 c7QymcUcLnpBmFWp68g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX6FkCLjtYe0/x
 jBFvlTX8MYnw32PM7FoWFPF5wsLGG5GC29izDlXpE/Eopp1pB/sd0xUL65ReRfP6lnzla6JtH5J
 JiN/nt0wy7lH8mgyk98we12YENFgizM=
X-Proofpoint-GUID: uddnhUKEJ9pSaxt4Ev-w1eFrfqdHDRCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040110

On Fri, Jul 24, 2026 at 9:57=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:
>
> Add SDHCI support for the Tegra238 and Tegra264 SoCs.
>
> The series documents the compatible strings and adds the corresponding
> SoC data. It also adds the Tegra264 SDMMC1 device tree node.
>
> Prathamesh Shete (5):
>   dt-bindings: mmc: tegra: Document Tegra238 SDHCI
>   mmc: sdhci-tegra: Add Tegra238 SoC data
>   dt-bindings: mmc: tegra: Document Tegra264 SDHCI
>   mmc: sdhci-tegra: Add Tegra264 SoC data
>   arm64: tegra: Add Tegra264 SDMMC1 device tree node
>
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    |  6 ++++
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 34 +++++++++++++++++++
>  drivers/mmc/host/sdhci-tegra.c                | 30 ++++++++++++++++
>  3 files changed, 70 insertions(+)
>
> --
> 2.17.1
>

Patch 1 to 4 applied for next, thanks!

Kind regards
Uffe
