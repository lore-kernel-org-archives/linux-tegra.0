Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6EF28F948
	for <linux-tegra@vger.kernel.org>; Sat,  4 Apr 2026 15:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775315455; cv=none; b=G1Fpxkuy/PK7uHJeq46TrSv9VdPFbQf99lTB76q0hoDH0Shkx+ZfT+62IUkt4Teo2StLE3r/4r4HLwePU43WAGV99eD10Q4RMtwz6miCXpvUq0k9mod7xi1LXQNiOGAHOybk2GRpy7j+U3rCVr8nx7R7343gw4DOVYOALUJBk9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775315455; c=relaxed/simple;
	bh=BPM5wF4iF3aEeIAWUCdAJdhgX5s3txVIU6V7Id5Des4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BEfRIz1WQhnoFoN1ogdIqRJplQ/eU+EpExWhhwZs4Zy1Vki2vacPXlgzTHjmREHaCKNmWit2Wo9FBB65fH6T65wDPDdiOdvzmDch91eiPfImdaN6u2QfSfBwmlNHLrTdvGGqu/gj61IPEpMh8fKaQwKH/4Y5k5gBZ/dFN4+oikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhnmcqO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lh3gjUT4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhnmcqO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lh3gjUT4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63428sOV2408615
	for <linux-tegra@vger.kernel.org>; Sat, 4 Apr 2026 15:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBGJSQnWiUchmorQvtlWdbS88dtxB2MRA3kIrXW1Q/4=; b=QhnmcqO4Lw1NZNNH
	hn6/ZMGgszKbZD8DBQcAHBY+7Cpofx23yseqKgHx0aL0QiBrV91WWK8pD+bGdWdk
	tDRItP7u01U3ILZoXvXn5KIAxgI5Ag5in3W8z+hQG9eT7U97Rb7XL6m5LX1I+7cq
	CStiTZI8TsGvWmNRH6oa73H/wRTHPlXnXu7uLL/qP+JWWVZHWg2slL3Oi8KkTrpf
	a125O37x702GHylbHEkNF42OFmpECqiRpj4ZPwVr9IniW8qUj9XDKCj2OGsdsxeY
	MwX+b682Q8KENInWPFUGBuF51Yv3NCtf9yr/h4B9rE0NXPQdXaZdJrnePfu0rdIm
	CaH5oQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrh5bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sat, 04 Apr 2026 15:10:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82ce50e6e28so1917713b3a.2
        for <linux-tegra@vger.kernel.org>; Sat, 04 Apr 2026 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775315453; x=1775920253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBGJSQnWiUchmorQvtlWdbS88dtxB2MRA3kIrXW1Q/4=;
        b=Lh3gjUT4ibELundGK1TymBOI2ntW9w113e2Pfk7nvHfoMCN2SiF58TqvHsGOAdyLuD
         GItIIHwAVEZLJkTkWHShRhNKUXHNLYgihlO6tE+0ke289FPqi+unjmSwXpkIYn1b8PjZ
         YcYELnRVLYfBJE0x4yHyRxT6vTiJzN8a9KALJiuXbMyW5pnkve+SvOCD2CvezzuON1Cc
         ppUwvGS9SmLRnt2clQ5HlopRpcLgwtgAJmWpGuzAg5Ly3i1zT92xlT+2GbvDwmey9aEk
         9YI75Relb4ZRgbz/Gi5z9vMarB7I+NMEahuaTi/nf71Rs/uRuvNiwnO8T2GrVvuIvdWA
         jZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775315453; x=1775920253;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBGJSQnWiUchmorQvtlWdbS88dtxB2MRA3kIrXW1Q/4=;
        b=D5g1FLCso8KV1640/0m8exHCuT1ujhsMBBC5cuLMKL83xaS6fsoBq5iYToMw014Nzy
         Aoq058s+ktMcfnbXchrpZM6QSc2XXf8tqAT9cDmBMcaacs5bMQpLMN06d7ZCtXJ0gwkt
         wRfXwgxjFMv/d+Ix4MYZcrl/U/ftF7rBN42lZfEqVek1SN23sR/LkqFuBO2ASi+iSVqJ
         vnsG42/gHf+4uiGHnK6BRgmmj81TgGre6NRE/Ixmn2vg/nHMNE23H7pIsVe76DRTonhR
         0FV9vgR8xzmoA0b2VGlfaazf792HvMPdYJOr2QkA6Js2JhZzik/gmLbbTO2iXALrUFXX
         tkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV70uiWR0xKKL2Tvi7v608raaf23YD8uRJtFKTE8bvL8L9gt3X5w/pxBRGOjGGpCWO/FVIh0Dia3KHizQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvqJI29D6sRflVpxSJg1jE2AmjkCsQBficggo6DX1+cUDUch5
	tQ4lsVKiDt6ieKoyC1sv6VlEKvvXbVVQ+gqZBRdH74lAgR0n5MqZyWW1Oiy2WlKfxH9qkjCWieJ
	cjDEsuAZS3UdRia5lq82QS22zCAvV5U8U2KABEgVWpZ6BAnyOJB0eTdvFV/Pt4iRRL7asTU84Mw
	==
X-Gm-Gg: AeBDievjlPkkIbeBShZo9PgVJMT7BCx/9Vz7Rf/lJfKBsNYXjI8GxEL/3iJt1o8ceOD
	bM/p2EQS0fSGk9o0tVP49XAU3bzNEaOZABbOBR8VTowrsgmDnlA9VAApc9YD8S+EWA+XojP7sF4
	FaP9+Dx+Vcra4oHNMF2Ks15J99ubKAEhP3aPJk+YJ5LVu7EYDHSMK5lJjg1/uglBvX59YRkxDuO
	OZM/ZMV4Oi1Ao0uPdHMbaWuBC/74Ud7CtBmoMQXG3F66dkQARs2b05l1B+VIRVPnxiWcCEJqoyQ
	GemLHc9iWSzTHCM34SHRPWOUqUDS5wBwJeCBCYkEEGIClxiCN6TivJ/rnFnKXt95vIFg1coZgNl
	QkG8L+ZaSHlDTXLADZzXJpW+H
X-Received: by 2002:a05:6a00:2998:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-82d0dba28c4mr6272132b3a.44.1775315453039;
        Sat, 04 Apr 2026 08:10:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:2998:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-82d0dba28c4mr6272093b3a.44.1775315452477;
        Sat, 04 Apr 2026 08:10:52 -0700 (PDT)
Received: from [192.168.31.133] ([2409:4091:a0f4:6806:b530:cb:a537:434d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm4894335b3a.55.2026.04.04.08.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 08:10:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org, Frank.Li@nxp.com,
        den@valinux.co.jp, hongxing.zhu@nxp.com, jingoohan1@gmail.com,
        vidyas@nvidia.com, cassel@kernel.org, 18255117159@163.com,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260324190755.1094879-1-mmaddireddy@nvidia.com>
References: <20260324190755.1094879-1-mmaddireddy@nvidia.com>
Subject: Re: [PATCH v8 00/14] Fixes to pcie-tegra194 driver
Message-Id: <177531544428.21053.931772756422646129.b4-ty@b4>
Date: Sat, 04 Apr 2026 20:40:44 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d129fe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=eF7Vt0sX8hFhN2V_yjAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: jd88K3wRCXV673qzKnILqwxMR6s4a10H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE0MiBTYWx0ZWRfX8qFxA2QwpH/b
 viAKeoONhD2JQupmuozJO/r4eb3Hdg8q9hg57sUUzor330H54AP+gIVy1t8U7nsE+W4z3Lmk7j+
 S5vtD17Q8Ms0yYawfM1hLH6xr21lFqf2sSP2Od72wy27aXUiKvej9Wd8Nb/+inMm72DsOiWI0PT
 tL/WXA4tgFnOmJqudkIUfDZL6VwtJi1bBRKQm0R4vuxYIiUaqYq4WdrdhJVBUCaVBbTmGxCu2Yu
 yEmmEUJ7AZdYkmhIiGEZxIvyky5wMQ58PY4fSjZKFbptWHVbkzksmifCN1rkQyegKETYdPbuLdI
 aNxB4qfM5Dj4ZhhshIZYa1GGCQxsGr/cToSub1c2L0tQrsh5PnRsvFHwLg4jQzTRt6Vm+1hcufB
 e2x6mGZmu8RZt2g7+UI4lLAHzqE57wxWDndtMwQ6P/luFuRM1SPKvICM3+3RZq838zMdzw7GSmC
 7Zh+Onsy0Aklk7WEA9g==
X-Proofpoint-GUID: jd88K3wRCXV673qzKnILqwxMR6s4a10H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040142


On Wed, 25 Mar 2026 00:37:41 +0530, Manikanta Maddireddy wrote:
> This series[1] was originally posted by Vidya Sagar, and I have rebased
> it onto 6.19.0-rc6-next. I addressed review comments and split this into
> two series, one for fixes(current) and the other is for enhancements.
> I verified these patches on Jetson AGX Orin(Tegra234 SoC).
> 
> I added below four new patches to fix bugs, commit message of each
> patch has the details on the bug and fix.
>  - PCI: tegra194: Use HW version number
>  - PCI: tegra194: Fix CBB timeout caused by DBI access before core power-on
>  - PCI: tegra194: Disable PERST IRQ only in Endpoint mode
> 
> [...]

Applied, thanks!

[01/14] PCI: tegra194: Fix polling delay for L2 state
        commit: 368e83ebef4527fa5dae9074e9e8086bb8f8c15f
[02/14] PCI: tegra194: Increase LTSSM poll time on surprise down
        commit: 592dd01fa4bed72b1b523e48a8e0336002169e98
[03/14] PCI: tegra194: Disable LTSSM after transition to detect on surprise down
        commit: 5b2322bd2b0a3d3d98dc1e27ec372221faa98140
[04/14] PCI: tegra194: Don't force the device into the D0 state before L2
        commit: 7049b21df37359e2da77e1c553062d60bd175f4f
[05/14] PCI: tegra194: Disable PERST IRQ only in Endpoint mode
        commit: 5e05484b857981bdf7ad247d8bd9e1733edebe9b
[06/14] PCI: tegra194: Use devm_gpiod_get_optional() to parse "nvidia,refclk-select"
        commit: 4ee540f02d5de5ccabcfee266f12e8bec960564b
[07/14] PCI: tegra194: Disable direct speed change for Endpoint
        commit: 431451cf9acdec5df2210d6a4139a0f8678fc6bd
[08/14] PCI: tegra194: Set LTR message request before PCIe link up
        commit: 24fa3bae1337e91eafdcd6f45dc89edbff4a8e71
[09/14] PCI: tegra194: Allow system suspend when the Endpoint link is not up
        commit: f6faa564bd25742d814382de582a5069b9a48f57
[10/14] PCI: tegra194: Free up EP resources during remove()
        commit: 33d10df4c93fc8dc455275ee704157a1b4b3f60d
[11/14] PCI: tegra194: Use DWC IP core version
        commit: 645e07639d6bdfaf1836b73fbf5547bb054d225f
[12/14] PCI: dwc: Apply ECRC workaround to DesignWare 5.00a as well
        commit: b210b15956061e27f2bbb7a740792227c34ee338
[13/14] PCI: tegra194: Disable L1.2 capability of Tegra234 EP
        commit: 1443e9be158dc199b279a7fd26fa960b1833b9c2
[14/14] PCI: tegra194: Fix CBB timeout caused by DBI access before core power-on
        commit: 93d2f203b330f3f487a3786fe19dc84c618f2b3e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

