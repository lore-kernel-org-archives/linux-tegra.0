Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2366D44B670
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138137; cv=none; b=T/jGnGjtt4QWlCmXGEVdh4gOYlE4i2L1oxeLmX0Q5u+4zfXQ5MnNJvnYW01xAzmVHrtj3OujSTp0a012u9A3CczDUneI4ZZarfuK+5aTwGFfEVTOR7R+tsctnaXs4VPLldy8u2ewcr2DbhAU/AH9a3fL/qltlQPlf0YaGpLEP0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138137; c=relaxed/simple;
	bh=+IN4A9ObNJIE42Al5B2G54M7L0WHphc2jkAQdwTLTZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JPy1FBjlfv/GlBj+6Cei8nxIoQrVHL0vrJCI3OX8s343toOlpx1aRwpqV5lmEJJE9Ra5AVbulQOT/krQ3XR7YFs35s3Xu9kUTWSE719QhxZplakG8tmTHaJt5fzc+31QhJbwBscjTeraRRxFm/q4N7LIU+dGvz1O7ORq8cuYn3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiUMK40j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cnbJp4RO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiUMK40j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cnbJp4RO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEkKb3277381
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oq7Xf4ZjqMCZ6q3U4ZqFMk
	y4J+wud+GaGkZpPwgycZg=; b=aiUMK40jCNnXZbwb6c3H5Q8QZlFtISDWTDBJ6S
	P7ACzg49C0BGUZ+6PQwDtJ7VtLBc1wKfiKcxzniYT2duUWUyWyELK34d3RPBV5DJ
	KPu3eojVg7ANvJemq24lRbVJesxzRvhhyAUf/eeGDb2zHqRzT1gn4FIeg7AaMc+A
	WtVt4U7/ItDCsl7fZA1/QCjstDtJ0uTydcokTKk58Nk6RlBHTFNErg6MGTuK5zOf
	v7iSuGg/aoRryCnsHGdK1BMXg8+VCK1Agsfg2+4/NgSzIjRTsgicWr5yCVh+VSA1
	nU+93QZFMoFTQ81a19t/TVCjOetdoJpcyLBDFf4YTwSzPL1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8da76q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 20:35:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so1007766585a.2
        for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 12:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772138134; x=1772742934; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oq7Xf4ZjqMCZ6q3U4ZqFMky4J+wud+GaGkZpPwgycZg=;
        b=cnbJp4ROrInZURmCckQWXvhfk1UVlQdLF0AZEElTAzlSfI4r9/CXUT6rlG3cTXjMxN
         GmqBcODDDwYpX+9R4D2eu0APkgEzWDU7VC+Btbf9eOXGNkIDh/xLsQeGnIPhjl0YBR5V
         Du8Xwm2MHm+e1hUuZ93XAl47vPRaL2swwOSTC5o90lfzUDWnA/aa2ywLhOn6CxO81sWr
         C/7/AoV1+kRWwC4XzhRZJob5ZWm7PQP3eCDONMXfeGbbpwg63qYsmjVDEwTU9wwSdBqg
         ghWcBaZYjCFvkXobyTnU+1vd9Re6AEHnPXQjmiEaN1WootWjjb+t4vwAFtUHwVEWaeXx
         SayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772138134; x=1772742934;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oq7Xf4ZjqMCZ6q3U4ZqFMky4J+wud+GaGkZpPwgycZg=;
        b=m4n+w2fgbgwicbl+WSR3jljq8l+/1r2NujHnnM3HXvcQuMd/Fun3YD1BigDrM3S3p8
         8PIU7pUqcFzApHikODs9n8Rjwj7IgzFNH6d3eH6axPtVoFqHRQXpnSOzipHl6gkhJhSF
         ipanP29ihNs3prdlag0PU3X99raX2ox3FPU4RFoM9dXDoUzqC2yaeNJWHV2ARRd88dI7
         ILambJB4R28Jmiith3Tq/G9mchm7cPC0Jzlrdtpyu+7CRIieo/4FCFQMvgBLlyxplZzl
         mrit9dlZ3cHgZmxEgLhTuCRDZZf73y7gsXN1ny0H2kvTJJhodSzZROBSUj+YgxUmXzau
         9Zxw==
X-Forwarded-Encrypted: i=1; AJvYcCW9bnlmeePOoMSlV6WhaWaoEXRoMRvF8vQmDNnpa6ohItpTYqksaAX8PQW2nxLm3eMOdtouwv7h7w293A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+2UylBj5CtMEMk11BD8EQR7Vao0UWa0nmNSPGi3GRbnuz07mq
	6R66pMTaEFbhrDTMLXc1echNisPLX+25et7z3xnJ8BF16DLK4c6KMAE4tkoKH07OKu+LKxVsXf5
	neB/5/TmY/pBuZjNEb5aWCRPF2jkElD2OkK1vz0/XaAk34ofePEPkQaBeStpJ/G/dy6cshA05SQ
	==
X-Gm-Gg: ATEYQzzuHVbUL/oZemRLsSu8FyR5y5mWkOIJKQKA7N7UQwB1iIik5FM43obqQIP/yKf
	o+xADlxbtWLUBkomne/3Hya9eDO1pMgoSgiwHx/V29rxsla2m8TVuKUXsE+M85KiEzOwpynknYB
	A6/FCYtLAMiJzIgGQDsebzd0dcCK5+W3HnYwI5EhnKEX4rRPDrpaUTcYitUlt1viLmjWa8c7DUy
	uwoaSgXQGE4Ot5B3dZbxRitNs3KJCtgKUB6IsOZ1hMBtoNlO+YInaM2dDA/wzhdQNm1e/jEgrWC
	F0ZetXCCp/zEZmFQpIAOU8k6kx6Y2KsHvFWzLbQj4SIWN5/ZGLYAE+xUUtf1GcSkT4tlhdk7aPT
	VONpz25/EzuYhCrvyE1mNIjtlPPg3dWtAn+Uv6XuUKrxNEQ==
X-Received: by 2002:a05:620a:1a84:b0:8ca:d5cb:6842 with SMTP id af79cd13be357-8cbc8e02fdbmr43046285a.44.1772138133906;
        Thu, 26 Feb 2026 12:35:33 -0800 (PST)
X-Received: by 2002:a05:620a:1a84:b0:8ca:d5cb:6842 with SMTP id af79cd13be357-8cbc8e02fdbmr43044285a.44.1772138133489;
        Thu, 26 Feb 2026 12:35:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm65180215e9.12.2026.02.26.12.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:35:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] memory: Few code cleanups
Date: Thu, 26 Feb 2026 21:35:23 +0100
Message-Id: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIuuoGkC/x3MTQqAIBBA4avErBNsSKGuEi1CxxrIHxSikO6et
 PwW71UolJkKzF2FTBcXjqFh6DswxxZ2EmybASVqiaiFJx/zIwr7dLJ7hBknM2qrlJEIrUqZHN/
 /cVnf9wMlPDG4YQAAAA==
X-Change-ID: 20260226-memory-simplify-c49c46d55c02
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=723;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+IN4A9ObNJIE42Al5B2G54M7L0WHphc2jkAQdwTLTZ0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoK6N7p2JI7HrVYlNKP5IfOHl5e/uu4FZE/gPu
 2WIaG91gVqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCujQAKCRDBN2bmhouD
 1yooD/42ybzFrHXblTb/VnONDCFsT0+di3K8xFdZff1yMzM5OpJA2fIvqyDGogNRdirK0dEMixL
 W4Lgyfo4xfwgCxZ9Pfv18UBVqIgMtwbfW05/fahpmMn1dT6yAlZ6tv2+DJjOHtwzufEMdNYX4xI
 ppSPOkfrHm6B9SJqElWiHJ3Fqg0bfrdyXkBDveS5bQPrsqTB/Y0aT33l8a0tblViSoncvgvK15o
 Ksba8k7uGzzw/NxAHJDVqFPWurb6CXWb7P4OFSubaKeP//W+5hbgKqw5rJlU+PBSiQpi+eqvKtq
 Gfuk4/gshRc4CWRu9GjAIRarntL0o35TPxyhzQ4MrY6z1DG9H/kyf7MUL3gRo6HaSDY3iYLAFxU
 FCT/zr+ZgJeOV0yYXF7HIAA+8XUV5pLHMAcGJebORVpQX5KDkkV2c+neiSQVwaIndEHU/IFrit7
 MjI4UZ/jIa/oyebiyfYfLGE+9N0yX3Bnu/6EHfZRnbNz8jl2YQ1e14M6kAg46elyokxlFunj7vI
 GC1j3xUGeJ5pGj4Cdg+dihgdmgspcH+BHmm5XjNru13J/Usy8Dmpnct1iOus0vfWqK1HgWUt76I
 y8Sv+aU3Hh9r3mPjsB4vgxp7uhaGLMQ9tQV8wfMmZHLlJsfkJNgMwptfkvhZHPkDkjG6Xd+kSK5
 bpLIb91gP4SXQGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=QMtlhwLL c=1 sm=1 tr=0 ts=69a0ae97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TzGgzsHdK5GUDpVagJkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Mw5AUGzyT-NvzBIjjlqTfiBdVnAMtQBs
X-Proofpoint-ORIG-GUID: Mw5AUGzyT-NvzBIjjlqTfiBdVnAMtQBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OCBTYWx0ZWRfX6vV6cqPKbz0A
 KYrv0W5j/s8bJeMY8HtOY9IwY6gSMC5uaYWGQAu3lHlk9elp4ka4VmWDFGpV/zV9uUeJpcCfWnZ
 4h08vFf8b8GWP7zQWYcq+JuMD6UyntXqRv3WM1yJhYiW2mYdsVFFWx1wb5cd3SV0C5nC7V+qZPG
 aseQLWuaWBEfSu8aMMzoHu4vExcLKtxDZiQiGFTu4qHPaVn5Pc9gxixVK5WQgyG/2O6QJxb+AmD
 Ns+TQsQYtbOhEdtjYX/XL41UiYePO5u6A8ZXQtbfTYOk/lqReEBML4DtKeDbatnpKP2b+z41DDr
 Tu6VMCDu0fIWvG6aoVcJO4XOFhhKUE+eY+wq1bHdBRjWazx+mJCjGsiGezPF9lehiZpvfNeg3vB
 bCyOfk5Qm3mChaNOMr6esCZ8SliUf/hNduHyTl+S5k+BeuTvOGe3MENyyZOB6qsND7P5naAXeEj
 W+is3OI8u7De8yBHi6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260188

Few cleanups for Renesas and Tegra.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      memory: renesas-rpc-if: Simplify printing PTR_ERR with dev_err_probe
      memory: tegra-mc: Drop tegra_mc_setup_latency_allowance() return value
      memory: tegra-mc: Simplify printing PTR_ERR with dev_err_probe
      memory: tegra-mc: Use %pe format

 drivers/memory/renesas-rpc-if.c |  8 +++-----
 drivers/memory/tegra/mc.c       | 26 ++++++++------------------
 2 files changed, 11 insertions(+), 23 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260226-memory-simplify-c49c46d55c02

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

