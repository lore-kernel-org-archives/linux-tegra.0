Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7A93019D9
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951102; cv=none; b=aFb7YnBQYSmk9k4CMvao+oxi0ebCT0+/mE6tHKN7Yn2Jsxd2eWtPwpbHtkm+CMPPQr7lq/S4vdlaxBsRmKwULpKUvzpS75zSGCYA8OhSR/pgiXEx1WiuVAzM94gYzeCkLEusxztz4/8npNIl+QJVnha0S/tN5L9BdIzyCRPEKWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951102; c=relaxed/simple;
	bh=ebFEmvXGGkqJKD9mFiIVA1LtU6HQ5Bywf5jEMGrP3G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcOGCyUAPPFabJTCdxFxmeaA0toEAB7/wtlAxYEYu5CdO1GqFjxF2Q9uPq3aDdhyT8hwhjV++SU/NTbCMWCzBuBHfFZgkOqrF8ec9jSHLCgy47wnnt8Bve+qQGrS0YmkRXeZF7LCEKLjLVWvS64Xy4TBJgfsBtGoHSRGhL4KJfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gg7QXMgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdR4xRtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gg7QXMgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdR4xRtS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u1Ok366169
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 13:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=; b=gg7QXMgwOV1shweU
	RcerV4o2vU+G0PAZKT37xgsx1XatL3FYPGu/gX41xZUkofpC9P0GYLlein6D+KDw
	uEghegjDPPw9vINbXnFQeKoT9F17MvLu2/PkYcA71HBO2y/0GGBcZ6tgAn3dSLru
	dKlItWKwsvh3dGq3UtzPScZw3oVG9MgF6ri4t+TmdbArx7Qv9sCzkAaB359X6DEq
	wcDHWDhKNehWssmONfMoxmcFpB5Xcym2LPhv0DUfTnDBaeEmZ2bV8MmubF6AyKdg
	+qvh5YssFPbg0mGgpQ0d+dbA2NB26kTqNX5ib9SLZLE05tZ6nnh2tUvgXvkA4tU5
	AbV+UA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rbnn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 13:31:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so130933795ad.3
        for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951098; x=1777555898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=;
        b=AdR4xRtSI5R6G+s5zJQfdMgFGhRTGE+DC2Tn6zd43WUE3LiS3XKvtT3vmG3TDH1UOM
         7NSAPsyKbODvamHo5bI2RL3VLxpin24CsZ+siBTrFJ2SjDKKdz3NnlY7x6+Afec1bVIf
         qD1gcwGrOhwI3Oi0Hi/YtVa9pBL1YliHybTZ4c+L8pmFXQbMo+81ii5l16t5gCzt+ia9
         1WzPMosoXYQQbXpVwfwyfbFsvLIFCFVmusYvJU2b3DBguEfl3JUPTzTWHB0LZqVkoZwY
         ZGyVg/czanUtTC7zCMgOZkKAKk7yO0SR6rt/Z+avKjZPB1soItDmCFESwZf/xFJ29NeC
         HHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951098; x=1777555898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=;
        b=OUE5azm3Sc/hrNRVx9FCydwNlR8WYYgBL72z7IEATCL+8FwuP2DM0RWnFajj1+++Nb
         7YJ7mHvTf6OAjZ2GajBFzypyfZvndgji67FQGk7NIcLHbrxJjZsjHRQnHnpo15TWamsM
         J32ahmAcwsU3K/7mDKKMq9a5Pi3houq8cbjKztmVLdG7Umrr3GsSIwHGQ1g/vXXRF95G
         afi2FA8YBTldbq37ZMyjrPz+PUsaqi0+gm8Q8q0tSsHIK4eKRBwOORTIfe74d/FqHzjh
         F7CQ8+/PjByVAgQWXipYaPygE6kAIgxkoN5bSI+0ApWGIwNL9OM+rj3q6vndCrgwbhR3
         xS0w==
X-Forwarded-Encrypted: i=1; AFNElJ8xfvbVp4pNYZb6EvEFs6UaYFFmUUi/ZFEZxLDhiseADe6vYjOt+HOCbFf260gA+VKXgIWLdCkTgSVQqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsw04fWuU0Zo87uWTxmxGCKY26hnpGyyS9P0OgTMTmDitsCi/j
	MgsCemF/Roqc13+EKm10tnysghySqpTiHE0Ao+nKMqEJ75yFi22J2+Ia+dd9Tf8JEG7OJG04Ss3
	LgLW1PKHUQDMLCvMJv/m2KpZid9GFHTCjjdpLkGvBhU55I6vakUrXiEIo+05luFySrw==
X-Gm-Gg: AeBDiesgcI2UcKxzwNP7mGbCC5DNX57DTFFPYK/pl1YPvQlzF7yWdm0D8snd6CZmgFW
	dRXapVDVdMSH7D8ZzrH9tLvRGFMNEddcosoJm7uDS77BGwDxzWoelYEIRBb8D58menHCTrUjm3P
	lRJYGTDApkhDSdQQ8RbM6EWDzqn66xHMYhUPz55gIGQw6349y1+GRBvMa+KRlk4W4KCL56BpK2d
	mQ15BhOMTAFdGR834wf1hS8NMduZuhB818bAcaywFJTDP6Rqlr9ivgQSObtqKwC4kM1qqus3nhR
	0oDBXBw3vg+bw/r+HLW0KqjLn9OISk4NYBGnQ6mjkDxpSMabvMJv40jrxCGyu6yFNZMmXet1roX
	1ErCMXRtQa/U+lvHsYOw1ygG2FxPzueHLuhOfqzpuPcQ03piLyIIyLOVMCal/6n2Svg==
X-Received: by 2002:a17:903:3688:b0:2b2:501c:ba8 with SMTP id d9443c01a7336-2b5f9f7d700mr214913945ad.26.1776951098338;
        Thu, 23 Apr 2026 06:31:38 -0700 (PDT)
X-Received: by 2002:a17:903:3688:b0:2b2:501c:ba8 with SMTP id d9443c01a7336-2b5f9f7d700mr214913615ad.26.1776951097773;
        Thu, 23 Apr 2026 06:31:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:31:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:40 +0530
Subject: [PATCH v2 11/13] media: iris: Select DMA_CONTEXT_BUS to create
 firmware device
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-11-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=1132;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ebFEmvXGGkqJKD9mFiIVA1LtU6HQ5Bywf5jEMGrP3G0=;
 b=bQ2hOZeQXviL9nyF3kRsnvZT4zluN72vayk4KkSLYRcfIp5ZJavRUHXeaeh7XDtSU5FxhOQqO
 0m/xHMr57rABgvyiSf0X1xDEkWlvlf58cukHzX9Ec8r7jTMd6Tw/pND
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX2mmJ+4/6H5kr
 COtA8Z5At6VYLxeZ49W8UgfjqTdFTDH/cjpaapZIoaRwOEdV2yQkAoFHDpoW0VynS+4scQEuTsM
 +cC6zi8mayBzalcTc6zedSoENQAqnJ11rcGQsMMEPe6oNEKKH49mgTHUHp610Ndf1EM7HH95Hu3
 R+R8BKNfvkQmJAoLLLfSjOICOjdzhNdjdKC9Oiiaz3RklFv0PI2EIvQoX394wg0o54rRxHKjxrC
 mVuFEWbVA5gihfeMG6Ujy+zS5IvXXOCdbwMlfIUYOVIpi8qHy428+VAbZbNxg9euiSt6MM0bIFQ
 NmlmvZ9Rrc6kWNA3j3wApTIe6w7f/npbyO+2T14SL1yhgP+En9ruyxT69h9G641fEd9kT+MRcZg
 norfXSjlV8VNoAJtW/bOkJfl45bcrwtuDgt6sa4RnAWReqGp04J+KynZiuPcI6aIxKuwAlez7u0
 fVO9ViqjYpR8D1YXsow==
X-Proofpoint-ORIG-GUID: jgFoerUvSGexkYWHw1cLEnP8UoBIFE-r
X-Proofpoint-GUID: jgFoerUvSGexkYWHw1cLEnP8UoBIFE-r
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69ea1f3b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LyCF3VY0PmB3I9bQj-wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134

Iris need a firmware device to enable secure PAS (peripheral
authentication service) support in case of non-Gunyah. This device
requires its own IOMMU context for memory isolation. The generic
dma-context-bus provides the infrastructure to create the device and
configure its firmware stream ID.

Select DMA_CONTEXT_BUS to ensure this bus is available when
VIDEO_QCOM_IRIS is enabled.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..de1fc4b07ff8 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -6,6 +6,7 @@ config VIDEO_QCOM_IRIS
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
         select VIDEOBUF2_DMA_CONTIG
+        select DMA_CONTEXT_BUS
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
           hardware. It accelerates decoding operations on various

-- 
2.34.1

