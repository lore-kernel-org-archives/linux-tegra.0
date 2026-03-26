Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0037BE7D
	for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549766; cv=none; b=WPzTJSPVveXi9FTa9YG12RBTCmGEvrXjEnZPapM7bpqhvsQGTIfUn/47r5pSku97CTeOtECzIMUPmVE6Fb9OHIlZlR4ZqlIQ/ytdrjSxLlIX25ixJ1IYBcPEx1K75LKIJUQ56UhCdSuUe/+iW/UqG24OZbgQkUXin0XbJGFdErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549766; c=relaxed/simple;
	bh=2RnMYeqxbIG3xtIeWfFsB1hg5NMXMzWhzE+LRApt/Y4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hkh4yD1StM6HMfjeTm/QPfWhJNYN11xmwIC4cmGCLteMnyaqAEEU7v3QdoBcG4AfNTFJZAdaiQt8IdMaQiqOX8osUbgmDCnT+8xzjMYL0EbQkr+NoK+MCoDWnnlvtVi0sA+hJePpHWFYDgU2a2cUNttg0ISVEQJaOuwioHOQGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENRwTg0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPHXqAny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENRwTg0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPHXqAny"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9o9l3898412
	for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 18:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=; b=ENRwTg0wQgzSXmjb
	Mfte1+W3mldM2W+BFRwd5RobDOHcS6s8+faGOe2/GKEJD9WDyst+D6RhEif5zxkB
	f07S0mjqTvx+yjrj1RV22kPs2lTRdBsFTG8Bm6Flb9AIB6BxNP4kZeg7Mr4CeZiH
	r4AN05B/ZgCQNZqrsF40onb9wXoeab19z7+GnYtCUeQ3/EpHuqsyPDLIY1OTOPwj
	BpPfmU9Z0JNE9EFMybPlewCnDrMBcv008XOVT5vhTlktjiHVgD0LP49Omsr9vvQx
	3060uUgJI8cqVgNyDUGp9xoPwxoOzWirQICEKpKbwV6laGntEqoPrjAQGofLKPqP
	6chb/g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kgab5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 18:29:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c8768a633so1188789b3a.2
        for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774549763; x=1775154563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=PPHXqAny6U8hgvEK1fVGS1FyMGn3MsbmCwEG0VS770aUO4koYz2PEZs2iaTrZbHES7
         Op9dt7CURpMY/EDzA7ef3W4jxCUWBmxgLltqvk2Tnl9wFdVYd55GYcOvGsblkSm60862
         haxm8KWiYHMM4AQofOuBc7PQg1G7tNf6iPJE+gpQ3QMkvywOl0QGa3IHaAHSLtuypchd
         0cgITdEhrRoK6tfVbWsUGapuzNWJSEBM5+DmOTVHfkuUzKXegMs1kxBRmsDQt1A5VXc4
         z6v3paSH6S2HAhoPGsyKVvh9WXIO/Lq/H53ckU5mXzAEZM32ZxPDB9GVW/T5hG0EenAd
         BAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549763; x=1775154563;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=WirUGgf1wzZ2aWuAFCnv16kC1KBKtOxb9Dmizm+jE6c6jypMBmX537dEGD5pxFzyQ2
         OMpcTnaD6SVEVmUvOcqDBmQHTeXfzSDVqUHNBDfy9RfyvnUxTlSXXD6ts1NXVUkXDeUh
         ada8IUzwd9GpZUppj6odyWSiJaPpaBIdZvKm+ntqeQZFCAXjNlt74w4RseyQaJUSH0Rg
         jiVqnzbhFSY7CSeQTGp/SG/AnNwl8jyPoWS3noty9yQ8jO1RvQUmsptsQJBq/jGqxxcM
         3MSNJTMPrqJctBgE+JLgcPxJVQ/cXk3LyPyRJEKjPW/6P4vv+DmPypyQ6KbZUEsW3ooG
         Fxpw==
X-Forwarded-Encrypted: i=1; AJvYcCW0gXtMOHnxuuE2Y6wO/Gao5L8Cm+7XT+8r9zK9wGVsCebMir7cqJUfV6BehujGDEZeIwkfl8+g5bPC9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2kOfoJkqujnwh6wfgyMmtptahNfLzBb4X9oUcANQbrTIFVB+g
	vtXtC09UpgeYWne5CUv5wdqH9w/tkuR20cl5pQiVo9Q/Hjx1iANHOk18ZDyFtqhGrB41CFYDCZw
	5RHbjT4Wue3CL/ZoLUMy3Z1r1AUJmpWE5PoDU5+eykKe8WXUCzlxby/d1pfYJFGqKgw==
X-Gm-Gg: ATEYQzx+r6TB5/YSleS755BxRRynHAoX+zIIEv+vgYv9yuK3UrdWUl+d5TUR2m2cmUU
	gSsIFRUTSpZX9ikwM/+YBP5MZTVtb13123q4OHIxWSPOBSYMSNT/7n1NDbra8ThzYFCNPxDpmZW
	3b93InkEqXS1f6r1Vj8hM9mPEI2M/GjEqOdQxq0BNVcvKsiSHgZA93Sj9bIkNULVFQUiQjsmC20
	Ewwi2CiE6lSxEry0TIxfxcJHmWui/XcI9UAS+zo0aQ/9Tug+zneV3WFyOpDsd6luiHsIEuFTK0D
	jb0G1X5NyvuER3W5SYuwrLPbLTJcOSPZps72078P2LLFsgLEiKfRibFHsxxSeefs0vnAA+bA3rs
	OVku0aWhJ2Itb52Dr4uLhSrU=
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829079b3a.47.1774549762467;
        Thu, 26 Mar 2026 11:29:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829059b3a.47.1774549761916;
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d21777asm3568532b3a.18.2026.03.26.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, jingoohan1@gmail.com, kwilczynski@kernel.org,
        bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
        jim2101024@gmail.com, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawn.lin@rock-chips.com
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
Subject: Re: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation
 validation
Message-Id: <177454975543.471319.11131195385745201008.b4-ty@b4>
Date: Thu, 26 Mar 2026 23:59:15 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c57b03 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=YByT1-VEI5v2HgF6YmoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEzMiBTYWx0ZWRfX5JPJxipTUHo4
 fFQnKIcCZPkAFrYcYGmVSyTENysst81NdzOoEQA2gzNt6ZagRuKr8j0MiqviDkQ87m5LdDKogAR
 qwwhxh0TiqO+jQrQ4mzm0x4NHZ1ejpPap02IorcQYvLOUPZ8FiN8Efd3XXdFqo81chusjIpLy4h
 NAWQqy0cqr7JV5d8ds1OYlt/D5It9ZvjVVdfr/gNq5njFWowrRL1OzL2xOUirLFCaJzwImdeGME
 YLoXAVwfjel2jKddyydTIW2WF9nln3XaieZGRKqh6qFOpuh8njboXEek5L2+qDSlrcTdCR9b1XK
 NgjaslLwsAUhUjxK6E12Mq8DkcVlnhYT+fHY40sIaDAZTLC2OKCz1hVEMqT+qswFaVdaghPJBgt
 eH7z89XZ8DfwfIdwubeX8Dqr7EIWBL5lvvCvZWmp+ARCsw/f9cO8No7jZd8RzKJzhm0XLUsrv7N
 rg6gZ6NZCNtdNERxM5w==
X-Proofpoint-GUID: cANt7dszcN2ZWABgtNVPDjGU8pxg8qci
X-Proofpoint-ORIG-GUID: cANt7dszcN2ZWABgtNVPDjGU8pxg8qci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260132


On Sat, 14 Mar 2026 00:55:17 +0800, Hans Zhang wrote:
> This series moves the validation from the common OF function to the
> individual PCIe controller drivers.  To protect against out-of-bounds
> accesses to the pcie_link_speed[] array, we first introduce a helper
> function pcie_get_link_speed() that safely returns the speed value
> (or PCI_SPEED_UNKNOWN) for a given generation number.
> 
> Then all direct uses of pcie_link_speed[] as an array are converted to
> use the new helper, ensuring that even if an invalid generation number
> reaches those code paths, no out-of-bounds access occurs.
> 
> [...]

Applied, thanks!

[1/5] PCI: Add pcie_get_link_speed() helper for safe array access
      commit: df61f4732adf9de5ad1f5e71b7670710c1597d18
[2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
      commit: d884b0e51459175f17ddc52759ea4533bb752130
[3/5] PCI: j721e: Validate max-link-speed from DT
      commit: 1542ac6d83d0b5706f45e2937de7b4f7b8c4831d
[4/5] PCI: controller: Validate max-link-speed
      commit: d0cc5918a1d539344190cbb19fa3ae0e7b0dca1e
[5/5] PCI: of: Remove max-link-speed generation validation
      commit: 15217c7015c0e1804925693c55d721aad8987e32

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

