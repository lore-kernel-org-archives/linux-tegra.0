Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4083E3BE652
	for <linux-tegra@vger.kernel.org>; Mon, 10 Aug 2026 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359347; cv=none; b=MhHOuTtyrbSSgaybcoAq1JDKoBJWdU1lY+vvVbczwlJ2+wE/Evql87aPdF7For+1ssbgkj3V6g2ozNnHCkjjNWnCJGq7wYcaOHwuJwu8ryCc2zRN16WA/bddxBMLMKDApeAq/AXkvg76otOwydjpe1fJ+Fn/3c6eCC+cq//e2VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359347; c=relaxed/simple;
	bh=fo5m4AkjKizHv6hKu7rjm3nm7ZDsLovNU+f7ayOVr0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxXh2mioZfckfCK0NvuVE/NtZxhSn+M3EGEk2cczfroJjCxeUavbedn84jV6fy4MkOn6Hl7S5L+pr7kGjxWc+6ZO36yzsAN64OfgY87yDtrhX/5OWLBuULeikVhlMhwAOF0/MiQ0S2SD8B4GaWD+Bp/GRk3Qh/ulc7dJcdeoqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgdRiibe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOu2Y/K4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgdRiibe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aOu2Y/K4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AA08p6009847
	for <linux-tegra@vger.kernel.org>; Mon, 10 Aug 2026 10:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=; b=AgdRiiberGOg55TN
	bPt69zq6B8zegVZPLUoLLcCMzJ11uypxFljHA/ObNfcKDg12Duhm7J9DINSktu2W
	QoQIRENx/PSgRcfz3+pxdTRVYEcR+uS9FmAFaTcbrV12TIqTL9UoiZRst8CvpPXV
	bxT+MvmHJZ/voLcXoVboAxLUV9mL1ybQPKC4mW2l/DBC5W25ht++Z7dRhC7xxHgn
	Ao+t1DEZ5k7G8o8Vc6TE5Z4PZSVU63bF+U9WoR500KWpbVWFEKe03muGCEg9jhgt
	Kq3nNrkrBV7ufy08V4RDFUnxi9wZU/KokRbLiP1HqNrjrSRmU7SiF8W6itZamYun
	xJcfsw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycger6hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 10 Aug 2026 10:55:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f113592bf3so34491336d6.2
        for <linux-tegra@vger.kernel.org>; Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786359343; x=1786964143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=;
        b=aOu2Y/K4uzuGw5b315EMNkMd+R+i+9pLkm+4zOkLS4+KK6DlDlOHF0TeTABgOkU9RX
         HWbN3uSGUaompsSxE23eS6hee/8gXHKOLv5rd1KiONk1lrA1uRwTiyOtuXhkLO+Wv/CL
         bO5pIUNtAmhPMmJgEbTLbviRGlxbzUlJlHLO4Ew7bA83mORrC/XAc4maO1t6uf73hvJY
         FR1sDfHqUiZnfaryWL/DujPtfsmTr/xNRUHPHNYUTe/dzvOL6NmlqS20Rv2X4BYbi6KO
         0CUGdLhvrAcfBfBxFz14vpM/zp+jzwRCghBId+WBbwVWuP6QAW0zim/kpWM8LYwz3cGu
         pgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359343; x=1786964143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=;
        b=AolzQ9I7dmdeorHIqMOdsVXSMTB3+8K6kYX8yYqyQb6E9/UCapOqvXkGrd7Ue0TMdS
         /vlKlU05CBqUeG3XdJnwCGZNuuWAWaQ7JHIlS2cS00wVTKGajggWbIo66obtu5uJ5Wj7
         uBW2jjiyQQS3/+9iJ1FPPz8tti4QXPIlDSjn3+ULrzRw8hv1+1u1O9DYCQr2NfWM5xpg
         jp5Sm5D7+GJIjIRtAfeU6kztV82zuk9DtBzEH/ysY5Sjp4gCt+8Ka0SOEXc8tfQQp8cJ
         2wxlLyyq1DaG4iIbI/JN5YbQDdgc95Rhj6ZWZ1JpvB30+evKmALtjueetizJoW2x10xw
         6n9Q==
X-Forwarded-Encrypted: i=1; AHgh+RohkFdJGlxT6jYRntV5yixp0JYGNt2VBguzKfKdFUhIt6YNxJUSzT+OTjkkBulFJomApFtQvdOQt0j71w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpT1flO9E5GxKgU7XTi8i+MLnAI/B62EMEGaHya6UyLRS2WDAj
	A1zEVtlRu+YrsnrUAcR2owKHCJ/lN9PuzrrExLZLWDvbXjx68T/w7F+ny+xhR+OQTy8uSilJ+8i
	6yPkaxf3eDZYaUFmlbsVm6JL0Z2rq+2cr//zijp7X7sZfnEuLAnA7lXpnv1qi9/9nlw==
X-Gm-Gg: AR+sD10xMj3NEJuEEshm5Lke/c9Y0X1W5VflO9bEcqLyf0Hcq9rC2m1fX04TL0X7epN
	CVYE4MHCjk7yB6n6NNNEerrrgNJfQbMR8ubeKBOkcjemZtcNsBsHfM+Sc4XIhleq4OLRkeg8MK1
	6HyQBuAb9ssDrhdYvdazpyREDrEKO02h0UQDmYhdS51tt49bn+Lyy2xS6JL6tAKwTOJUaeg6rmX
	QZw18LKokOixuRrgksNNfH3RAXUBNJHWTA8c04gbUMgmSpPTbrLOaNsKFlCZiTVCXxzCGkRr5b7
	/bZl+uMQE1dhJEA49D3YaiYXh3Aq0Rh0CBBLxn66aA+zzb9rr1QS5byalJfHoBM0heIiNbK5MEL
	bYTiGiFr2xJn+aIEEMEWU3UG1ClHB
X-Received: by 2002:a05:622a:17c4:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52d0b298380mr320953881cf.40.1786359343495;
        Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
X-Received: by 2002:a05:622a:17c4:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52d0b298380mr320953581cf.40.1786359343166;
        Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdbe02esm196322575e9.1.2026.08.10.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:55:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpio: Use IRQ trigger mask helpers
Date: Mon, 10 Aug 2026 12:55:39 +0200
Message-ID: <178635933666.24478.15558797954868182509.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
References: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cwKjLnYHDpvMubkjP51MECBb0owZt6XB
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79ae30 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qRw7KHR_QVJorHy5iXwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: cwKjLnYHDpvMubkjP51MECBb0owZt6XB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NSBTYWx0ZWRfX0Yf/QcFV5nV4
 v8engZRu5lwkm/exFYmKm2W245AhWrgtzlHRPOzwTaWKse5An04ac4elsACzZj7Xx+RvGwsyGlR
 Q1kJYFplr/b8/eNOv6bcD2WYTvkqqBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NSBTYWx0ZWRfXw7FgclIM3Nxk
 xc/lVxZNR5iDvbVBL1vlXxlVEt3JE1WP+2BSXvoF6JMCpBQ/7aM9bp4HfckzoZgkIpCrpGfjPLl
 092g1h64hiYa6tSC9VK3zjCwFIATNwNoFa8gg/CbQO2YT0Eca99QjdxLguODWhgoakV6HZ10bzM
 2UehIAjeDkuCORvOJvn0O3eK4RxTiFM3cYgLfAvIsOayTPDuFE8FEr+C099yx+/NXxESzCBVOug
 xG/v4DMAj9At1VSeN1N02mmyo+x1ubLB5kk2RrWTWeBvlh1Xu++ELfTT93698sYTEBIf7/ENQSk
 PlIa9c1ozq9qv+IELuIMymHvBLjaOOcdnkcL2QwZNhx840PRSw5MlZPbEAC1jGllPto/z6mjO+Q
 DverXP5hh0/QDN6QvsQvE7fgfUHJ4fpk2r/xStePmQlYhgH5O1ZLjxp+rDgqVuZxQnyYJzNI989
 vtEE3O7fFodQtQofWaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100095


On Sun, 02 Aug 2026 19:40:35 +0530, Maulik Shah wrote:
> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
> 
> No functional change intended.
> 
> 

Applied, thanks!

[1/1] gpio: Use IRQ trigger mask helpers
      https://git.kernel.org/brgl/c/338c551bcd62ff4f97ff02359baf9d6f7f1f9fda

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
