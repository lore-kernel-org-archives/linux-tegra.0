Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1916247DD4E
	for <linux-tegra@vger.kernel.org>; Tue, 19 May 2026 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200281; cv=none; b=mMYyU1ozIsUTqkDjrN0tCR7lG6VqWt8eEMf1XWXPxD77jq46zWiNL0OCbIyY1EsGl7X55YGoeW1xRCHBCX2bQfHVLR0zjQVHEAnidGFeh1DkZJ96C7+5HQwMepTuSGjnjgMydsuOx30gwhvtME2ew609/NngkJEIpA3i+IGCXo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200281; c=relaxed/simple;
	bh=w6rSSlUOOGgtp4odPIHdwSXP8pS6aA3ms6bNL7gsjTU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=POcZ4v+CkjC2jrhvoki4oUOiwC+UuEi4m3u3XD0rmxXvIacBMeS74rvrqkEDt+zc1/w4Ft3ZhoaxENfMa1S7JTR7kUY3F5r31wtLPKVOeNhUtGUNxVXnOjJ4+b0h0v0nHxAAFRqVQRufCuw9UpbGP9njTDEErgltzB9ltOPq1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gt8dQOtt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3dn/da7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gt8dQOtt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3dn/da7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JBtkDV1737112
	for <linux-tegra@vger.kernel.org>; Tue, 19 May 2026 14:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U71qA0iV9F2TViQIPnVEbXelxIjlGXakpmN89ILGecw=; b=gt8dQOttusADyHJr
	LHps4pivmlMFGUsi2B4VClx3EBGGkQInwF68BysVyZPriJiloyryje96//KXdWEe
	mg6b6Y/chf+r6sTFrCeFgRU0GHaUk+pn8NBzu+QQji3uZlW0ACusV4VKYBnjTlzL
	oug7YW+FDJrMWCa8RYHbL0f98xY1fkyhiXgHrdcErIUKCa+Gw46coqNAD8zzvLtK
	9GGv1EJIKynulKsLTwVySgJYAfYKi6nvAvCFtxb1YMLkwraqac+Eb23XlZSwGmtd
	WWei5JVCH2U98hf/1KTAWNxJ8ruXwJgMQC0+MfaECDAt3I4dyLhz3CJNwXQb5+ed
	CLImZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju91ubf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 19 May 2026 14:17:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba6fe41283so37271185ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 19 May 2026 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779200279; x=1779805079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U71qA0iV9F2TViQIPnVEbXelxIjlGXakpmN89ILGecw=;
        b=L3dn/da7JbjfY6zd70rMpac5xN0yXBVxH4fzqPUaUB7OYdq9wFGTwuudjMHeO38HOl
         y+2XWhdgZUy4dw5+54T7/y7mUvqijYBQdbjdbDB6YodF02p3kATlt1GFQylXn7HljlFU
         Z0KN3bGjcPEVcCFOSPLBeDBC5I9ljRohRn2ZEXQ364TqYsru4N2KdeeeggO+8f2LLG6x
         dv883upGe0DwzktX/fimWMzfO9unRSpUAyDLhzSVo9DESayjIOi8n3fx8sy0dVeVxacr
         EE/0+OyKy5oulosWzE2FPW3I7doI23eApUN8S50+fhptaP1uAy+ftEz98e6FS1uGRBr9
         nFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200279; x=1779805079;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U71qA0iV9F2TViQIPnVEbXelxIjlGXakpmN89ILGecw=;
        b=N7RMDoj6YA94I1YCfH3ZT4Ciuh2dpwgJzXRcpeoHQWvDsbGLOv8hK3PXSWT+VcSIGx
         ebzZ1Utwh63+skSWirzxCVkTp/4AaWBuVA+FoBOpNJjQhvH0nBMKSfkvXphedl8BfSKg
         xqqNUZJgu3pqZWNlAStFlfBgSU62ekGRBJORlMnklWDNug+E4uV5mg/ICHCAGl/0egbL
         Xot+DZxazuzcDoBdXr2+jXj57qsrA+L4a6Wt4j7kc4sPmYRIQL/3Esqsd1EGc62fZ6Ie
         TE5TWrNm6X7WU1rD+DwEvOulxRvMEkdeBXKAgFJ/lyT0Kn++0SGvkJGGUTM/cx/grkot
         yjQg==
X-Forwarded-Encrypted: i=1; AFNElJ/GpjluTMWXWqP/MByoAG/29+WrK+Pv/pygywi60UH2uSpWlnVcxTx5qlQqnPPAUxqHYklz8IZcdVwZVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hJgPkoMDwIptMKJFdudN+stZDjMcM4pOR+oJtyFzeodL7Agf
	lbxbGWY5fsqX/0s2wzxJvn5o64F0XDDtUxulVOmWIDhwVVT+uQwt7xuHDcXRzpeMj45JnMJcCLS
	U9HxHHGWsb12ljBzvDTxJDd9OO1pU2SN5PKrV+wC823jMiTj4hKGJEuS/L0HdewNJpQ==
X-Gm-Gg: Acq92OF5rMzs6hf8bj+q6D9tUMSqT8pECeDLyGzUCrZEvOieAEgn1OW2cyCqaxaq4E0
	JLHR/p8AFG7/AdzgUeZS5yE8h68XIKuI8kv0t1rK9T5c+LUq+FFCtlAnoTrmfWmpidWJHrMRrYP
	Ro65M1HzcIQKWIlJM4e0Mj01zHCv6sp1JHGJKQLP4CM2eIDLBcpAixQQ2C7vA7MiiaJ2SNChSHc
	T7G67ckrO1r/gpHtaE1t3LXmAyPYweAM0S+hizar1Phl4yH36KUhpE4V+uZRLWYA8UnzXhMdRU5
	HSfefOxpD+c5XIa9cw0EwI/h0qGu45XBnpZHYUbFVA2OCKJ6zPeCI56WYawQEasw9flewW5uTdB
	kVXH5l9vZuyNhuiEIg8xG
X-Received: by 2002:a17:903:3508:b0:2bc:f202:54d7 with SMTP id d9443c01a7336-2bd7e9c575cmr210481165ad.38.1779200278389;
        Tue, 19 May 2026 07:17:58 -0700 (PDT)
X-Received: by 2002:a17:903:3508:b0:2bc:f202:54d7 with SMTP id d9443c01a7336-2bd7e9c575cmr210480525ad.38.1779200277830;
        Tue, 19 May 2026 07:17:57 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.207.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe492asm194269575ad.48.2026.05.19.07.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:17:57 -0700 (PDT)
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
In-Reply-To: <20260515070753.3852840-1-mmaddireddy@nvidia.com>
References: <20260515070753.3852840-1-mmaddireddy@nvidia.com>
Subject: Re: (subset) [PATCH v3 0/2] PCI: tegra194: ASPM L1 entrance
 latency from device tree
Message-Id: <177920027083.95581.15850589651650964424.b4-ty@kernel.org>
Date: Tue, 19 May 2026 19:47:50 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 9EnXhN_ktM0W2vAcZIwKANKxC5Sj-uxT
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c7117 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=1gRTTRxgmbTSdBvl+srOOw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=H5kH8eP05ZJGUFTVoxsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0MiBTYWx0ZWRfX64zW7KeCPtoJ
 oQxTS1EnG4ACJJlgV2/gqfGquURfHxvlRi/0HdZEbxYwzyWbiz+TagQ0+5kSXeeWs6QTglztPIl
 YjSDtzCuRsxNY93vAkdwfVr2lUoM00llP1SwLKugFJwsJkV+7QSpHWJrwxUM7+Ix6oHx05r9SMy
 yeq10fxY+0BhsyZSJo7wjsww9ehW8mLomkKxDZBVkfuQ+zWJPFQRTwLtUBICYG6WSVtRve9KyWi
 N/a/pU1BLtUsKuYcQLUxAomS5ZOcdp+rpbmgYHt3haJmHBssV83JRIZKHRrLzjmG22r8KNzwJan
 fO276tSOU81AAY+4LBhP5BeZDrPmNTBB3tUIYfkpGsYjx6Ig0ED6C7yie6PMdXna/RqsNFj2oSd
 DWyTw9jeYyMs676tG5LiHCrrz9G+iRsnzWcMSmQO1spVP09gBUV4Jvxlf6flDHl/QCtlq/cfq2J
 pPyq7v0jI8k8Tu6Q6ww==
X-Proofpoint-ORIG-GUID: 9EnXhN_ktM0W2vAcZIwKANKxC5Sj-uxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190142


On Fri, 15 May 2026 12:37:51 +0530, Manikanta Maddireddy wrote:
> This series programs Synopsys DesignWare ASPM L1 entrance latency on NVIDIA
> Tegra194/234 PCIe controllers from an optional device tree property and
> corrects the default nanosecond cells so the PORT_AFR field advertises the
> intended latency buckets.
> 
> Background
> ----------
> The controller exposes L1 entrance latency in PCI Express PORT_AFR (DW DBI),
> bits 27:29.  Software must select a 3-bit code for the maximum L1 entry delay
> the platform can tolerate.  Patch 1 reads aspm-l1-entry-delay-ns (nanoseconds),
> converts to whole microseconds with ceiling division (DIV_ROUND_UP), and
> programs min(order_base_2(us), 7) into PORT_AFR during ASPM init.  If the
> property is absent, the driver keeps the existing default (code 7).
> 
> [...]

Applied, thanks!

[1/2] PCI: tegra194: Use aspm-l1-entry-delay-ns DT property for L1 entrance latency
      commit: 87f493041e20759ffc27262cc0490c41628a5ee2

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

