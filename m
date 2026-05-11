Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F13F9F48
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508987; cv=none; b=YsG5R8ps+8+gUPIgeiH5VRK02PysRucvEdb/XBeG4ciheAlLRnA5ZXiygHvrkjKfjWqNQNKmnBaw+F+utGB4xaRoMyabCXeKzw2GOh+Qg3aIePfMOU3eUaslLcTHrmw/dqg5oquiV3cADkJcHJNT0R+mDz4tEs0oA+ELxa03fmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508987; c=relaxed/simple;
	bh=GOIgHaYHVEr+D4jT/lbQ9M4pWI6vXaYERO1WNoWFViU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Co0Jorfi1R87FWKuAHWVCbgJaNDBBVX/UAWxBRRVLUbDz+gTwsiwrXdVfbvPPZztei8APforqlmmLEfErHnVw+kPwtOo7QFjy917WDEZl3AYN2NYJcYMwsT+ylF0UfZ+d7eGGt2F6QB4Ue35A1HokqxGy+GrLgO38BVu9t1mPDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AL68GNis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+NzXxP8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AL68GNis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+NzXxP8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BA5CEm2039730
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 14:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cYnHT9BekgKDF9vPnYRkY/ldH6SS2M4Hi6O/HEwZY14=; b=AL68GNishQetgwW2
	jDn4sqkYLeSfvDU/H1UsB02gHgG63kfHzJN9KX/Tk8ecNdsibXNFpIwy31JIBx8r
	PIYFWGbUZ2q0D1otJ3KQMvkiZX2j6wF9fz7ANM1zp3VB8LR68xlfWt7y87U5ZR9v
	9+rlNI5cK6seWvc89r8z19UPvtDMVT2yt1DZsyErgGzBH85oQHAylx7AsaJ0hi19
	9HYXpyoHmtgp1vGRqZUkAoYnLhCE6eTn6ecAg/kIjS+oKGIye0Ve7KkRqGjKncNH
	vT2kUVAAJzastn42/g8bC31Rk9n2GU35z/tKo9gr9HLPzV3FTQlMUx5RwUJBetwQ
	aII0Xw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22rvx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 14:16:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso3139000b3a.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778508985; x=1779113785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYnHT9BekgKDF9vPnYRkY/ldH6SS2M4Hi6O/HEwZY14=;
        b=M+NzXxP8TuOmq1EMSF4txcS5rmS894Cjz/Jbxx3b7eIktFGs2bd31SylGXeQm+8bjo
         bW4DHrlzfJfDXqsfruCJxyfIn0K7AXo8G8ypWWbSpB/WuLuvAr0Ina1YGYA6q2AOdy0h
         lEHvDP1e0L9U45mGmMXSQx0m1vxR46InGp7mPgr16t1ZO9njS3xI9BL2Chj6iibQGGhZ
         wfB07Jhnb3llP50Gfx302vFsyyqZBP1rTmzVMyq2w5/IuK0NyZt4NtbZsb3i/9pBrxVh
         CsFsuaJR54B7mUu761pSVedss/YTzQBRfKM93P7Jogmr7F/0is5Ru0QrNCA/Iy3OQx+d
         EOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508985; x=1779113785;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYnHT9BekgKDF9vPnYRkY/ldH6SS2M4Hi6O/HEwZY14=;
        b=A0rXVRAaZGsaflYt2vppku2u40KWYgTfnBywA7L2sIVeuayQnSq+QsjFnJOLN692j4
         q8NI07dG0M3A979x7IVTieQ0HLiRAy2NTIp3Lp/2EgIBOrf5MEhV1LtkZs4oCMZSSVfj
         9oJnVXYbfeogJurYKKvhZFDMpDDHFsTZgbEPTokEqMdyPa3SyDD5HGO5yf9T0YiofQn9
         Upowiki6noPhrDS2UrCgEjKeNmmif+j1kGoUJR4UsvtdgATBDa4L5iTdV3DzRjEYfMWs
         uujLBlnT2q728bwmsJNFy5Wns6Jo5nbAfR4CIuA3Ksa7uIh9lbImWPQrH9D+VcJnKn+6
         8WlA==
X-Forwarded-Encrypted: i=1; AFNElJ/Qc+CYGDF2d8bb0eLzKVoqkT/tCMReHV1vJ5B5DNI0DDt7ondv6kcJSICgghGBKlFnHA54wY352HzaiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ouFj2XTbvxzZIeHvDgjBilHu00/g4XL3R8gMSst9rC3lwgq1
	3TrQHssRHfTM8j7fJx9T3cQxelK6DsTDP81ocjohP17mHwkMGAbyd/7/ZWTlOglVhZqHdNmI3id
	Ocm9o0nqFxse5iGDfRuCekETec5K4I+fF8UbO6x7C9H0AvVnLgO8wS05IQrYE+tE2hg==
X-Gm-Gg: Acq92OGObVivoh9h+djviYehiHSrU0hfJpDzXE/sYZKsFUig0pRNyXHxSbqdlEvEdaU
	dZZQICoGezrJa6d935vnKoYejooR8vlAIrXMme9a+TPRZL1KcPQjTHkBXV2PliVaSCdaUqQ0R5U
	vvCGGSz6tAjT0s2WEWg7LTxiYNJDhRdDhJPqo6KKZu1NqZOTunsBp3RDZrUXe16aRqQGfBv2vVe
	l9vvN5MOknmzt1nMKw8OunXSoRxUrJuqPCvHesTUY8mwQ666omh5z6eamVMnPBJD2zHbV0DY1fT
	36xBd6fFNKKRmpKNkJZkV+XqXKHEgZ/TnXXvUBG8JQyZ+BkOr7/FFHO116EtmdjNKCxL3nW1E2p
	7kVxMLojnzJ0dA6LURk1R
X-Received: by 2002:a05:6a00:28c3:b0:839:dd77:34fb with SMTP id d2e1a72fcca58-83cf5c4294amr14905282b3a.22.1778508985004;
        Mon, 11 May 2026 07:16:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:28c3:b0:839:dd77:34fb with SMTP id d2e1a72fcca58-83cf5c4294amr14905200b3a.22.1778508983911;
        Mon, 11 May 2026 07:16:23 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.54.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682abd39sm21100027b3a.52.2026.05.11.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:16:23 -0700 (PDT)
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
In-Reply-To: <20260410062507.657453-1-mmaddireddy@nvidia.com>
References: <20260410062507.657453-1-mmaddireddy@nvidia.com>
Subject: Re: [PATCH 1/1] PCI: dwc: Apply ECRC workaround for DesignWare
 cores prior to 5.10A
Message-Id: <177850897704.187882.878362162947134934.b4-ty@b4>
Date: Mon, 11 May 2026 19:46:17 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a01e4b9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=9aueHI4LIkvGXWIRyVK05Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=yd0uEEa4BFbhJQzLfZAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ul_722Pwn2xRfFDzXuee_5pTrRrghMht
X-Proofpoint-ORIG-GUID: ul_722Pwn2xRfFDzXuee_5pTrRrghMht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1OCBTYWx0ZWRfX4MwQmaYMJAIA
 T3OCQ+C6IzqbDwqLCMfr6dBSIm/yMBb3Nu6cIffyqEWN/lc+Jo1aDoPIamIR3S2Ql+FeA2Fj7tq
 Ao5YuUef7dtlWkzD2yPpMjxPoLlribcOV5/0mblBqX18pAJqON0b8onehBcLyd0vJCxwk58f6Pk
 RCK03jsQ67gLcRD32mavd+PRX+xfPXCIFcvX8N0DMpCEAU/5UOdmkTlFJ9LIIbqu65nE4ohSA9Q
 87DxHpLLTqSGLHfL/AucSFzrbcCZFNFBRDK5wB57Pc4575p38axkxF/FgHe2zcmpJMNW6LA0N8j
 XFrd/A8GkpJwZ9uGk0Y1edEa0zlWLQSknXD21HYnVcNHw+CLkifAV1KdzXKgXYWNU8rZt/xvupT
 QKKBOuHHy/E5fzneES4RE2GiZ+PBvLCYB8KUpov0j96Z8g0E44jSw8iOHkyevfx4jJz9+cpC+7L
 NoAuIoB1uHMOAaJ4zAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110158


On Fri, 10 Apr 2026 11:55:07 +0530, Manikanta Maddireddy wrote:
> The ECRC (TLP digest) workaround was originally applied only for DesignWare
> core version 4.90a. Per discussion in Synopsys case, the dependency of the
> iATU TD bit on ECRC generation was removed in 5.10a, so apply the
> workaround for all DWC versions below that release.
> 
> Replace the misleading comment that referred to raw version constants
> with readable DesignWare release name aligned with the implementation.
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: Apply ECRC workaround for DesignWare cores prior to 5.10A
      commit: ea72929526dfe6fb1a4c20afc0f2bff3dd0eb6f1

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

