Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE682BDC13
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502957; cv=none; b=Vk4sKuUZnmGl0Zt002Y5BWhiLtPbo6YiyQn6s+IeeLYz6kQrvaaz6EMR7pT12W1D2V7WhTBxSFi+63fxC2A1sIxEUvkYVU14PRxQiA8g8Yhal5qF93zeNGke0ejhGCw96jsv/30hXuk+RBxZkL3qG6Ife82mrSCQ0rtWyoGUK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502957; c=relaxed/simple;
	bh=8Ps6/ZB9sMWXbg2rQU91hoCqw7vRALlCvUf2dxKJhBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlOiAgSfGQXY91wvagn+KInsHQTlasSouF3qzMGQQ9uZf5SCWQz8f0fWfaOgQ33wh9tQULvmoMR93T88EDNyl5RR68czws5gC/VavU4M+5gfGn/qmnNJaEDuWVLrvUF+6OlnYY+wjGqKc8VLsHSz4uKazi3+I26WY4UjJZ2EgaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihhRTNAv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2kQTk6e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihhRTNAv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2kQTk6e"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYMdK347954
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1x9sx3KheQ7
	g8OGjbROqW2N17D4RfqLGmQ3FoycRusA=; b=ihhRTNAv10jc5aNvNjEL/WKEgKK
	Bbl3mJbGWXudaAwp2AM+33IHwWcuGR/5kgwCQyVVNwLXOWCLJ2fkompXX/9yosYl
	hGFmqXFfUqEmEFueacLiSKMFYIRHqffnEkIo56c6+4LKTyYz3tjsj+tgHwkOKeU0
	NYXxpA236hQUOk6g+J4mq6e0yuQV5Lc4tz0xIL9eGHVKTL8VW/5/2Ygm9HGw9p60
	mUVTxbkE1gexgLi1CVteUOSxpcmnQHvnwXdUatFO7ly+gcFDvrlHAnTt/qAUNKUF
	4s+sypXtidWGj/Hu1naBbvND1c5VYtyFuzQ9Sf7yISzLbaF4jT2qN7762ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpy07sdmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52d3be24cso161970185a.0
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 10:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502950; x=1769107750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x9sx3KheQ7g8OGjbROqW2N17D4RfqLGmQ3FoycRusA=;
        b=W2kQTk6e7LYR9HI396XyvOJWNRswgkgG6shC2ZVHq4t4syvVTYZcjUcBlvdr9zKvIp
         dd3ujrTwA/2k+PLHcqo7wVVqwocmKgwcyMreI9U4rpSHGIVzlE5bGgwHUoU1WiXI1AV+
         MPD/2lP/7sVqDoxn8t6grh6nmz9iZ6JwIHuXgfLiT1iEUT2Pm1mF2s8XnPRLb/ZZzXUH
         ZS/x6GJeHSogycwoRw0b8FMkiM3w+6o402anCQvc1EGAz5eMGd+Cod4d6hQBtSklm+Pn
         vLt41FY04fMwMWSA2A4ZmHymjA2S1RmLL4d6TnKXKOCemC59oh/9a8hdlM3uM5tshNHD
         SCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502950; x=1769107750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1x9sx3KheQ7g8OGjbROqW2N17D4RfqLGmQ3FoycRusA=;
        b=aWwzWdsnZYo/uuiUXWzhoknN2r2PD9gCxN9cIW+Ow/KFLqKJTaUQh1TzhaCCe52E7F
         SN8twnMpYSFCkQqsLE2z4MUsXyUnmnPiIO4DaJf0hMqZ1KwO93psnZEpLL4dCcdF6gLn
         Ww42WlomR3Xax/9Vnd0AUOpKoL83Z0h0PldTF/d4SBNPT9b6LSjwx5Ez6bhbxXb09+P/
         F20346eErjTT1EIHwBu/7MlreamPMSgHBL5cYsVKoKoF4emAyfbtTWn3KHabm6WUsFvF
         Zr5QrZ0audVqhuwrTauOl8jAkvIC0aB9O1G7XV13vHCChizpMrPmB/aaVr73iYZkpYxI
         PpXA==
X-Forwarded-Encrypted: i=1; AJvYcCXNscYm8C5eiXopuA8uer94zAUrLTCi6LLhwVWbB879BhG/Zb7hcPFtV4DwLUEb8RBY/ZMiui0L1etKcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynyDgawblh6XZOTQB/SJmR0lMKD8tZY5v3rNMxeY02XDGcXzWA
	dj4thf7j6LZT1C9DCUfyNzVawDqJtFA15wiGBFuoiNuiKo058kIl0886w75AguyPPiy4jmWnMtL
	e8N67XGLfABYwYpsat8Ynt6utOZng4BjXJ0vWxdV/fUdK+tuKVdclDqXDWycSpTtqZg==
X-Gm-Gg: AY/fxX6w0badMv7r6Lp6Xf265cND0yuQRgaHLE3IuERag7pSezXrBHf6xKTaqVALOcr
	7NZLYAi2v/xlWIUY95uTP/tvas9U8IgAR8ZveriiuV6PSASLyl010DObMjvmPMR4xpT4Um1NwdA
	N1BXDI+Y/NoDRfZ0oJY4bMlsvWt3x4XW8mhDVuY18KOpnKoqgHE4JFPoLqrbNd2TWlxCJtQVV5g
	0uO9FGAXNjanxhPGbMdqdJdg4I1i1Q53d+OCJDDzeDjBcpUxe3l5dXnwCnOx5X+gICmrzY5ht5H
	7V/kMURL8q33ym6hf3xwzR68sGooHvgsgJ07iVj7kOsbAxrBocY7OaOnr5c3IuZg/nE1+pdGwFw
	k4gi4nngk1NrAQlqHhIqqpaiA0g==
X-Received: by 2002:a05:620a:45a8:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8c6a670d051mr58511185a.30.1768502950570;
        Thu, 15 Jan 2026 10:49:10 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8c6a670d051mr58507585a.30.1768502950058;
        Thu, 15 Jan 2026 10:49:10 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c6dsm14408166b.19.2026.01.15.10.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:49:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 4/5] arm64: tegra: Drop unneeded status=okay on Tegra264
Date: Thu, 15 Jan 2026 19:48:44 +0100
Message-ID: <20260115184840.310191-9-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8Ps6/ZB9sMWXbg2rQU91hoCqw7vRALlCvUf2dxKJhBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpaTaN360SHRdh2/Z4qKvNzfT6AZtA61xeqX7XW
 d+AiQf52L2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWk2jQAKCRDBN2bmhouD
 18vBD/9DiWSNA5jH6WyRNxO6k8i8OWNnqxQ+tzweLScxLM32X/lBtW8NxhmLQa8tBF7Pa0Wem/Y
 lxbq+Thi0bvIdyOd/wQtWl8E/vF2VG8t6l3Uf/rvI8jH5h39+HY2IvrUOxOQ4LnNT5qPSg5EfFI
 ati4I8MT9yUbSttzMkj84bWenSmEUD07HSq8Kn+Fu6uW59gtgFbCKPEiqYFm5gZ3dXWfARMA7Yi
 Ib19VsPvP/IPrT5iT9vMGAHvxmBJeD0iRBqgEDDzNWVuswQTfwztSQeOsvhJcMsBJQiE2GoI57w
 ZLuqB556M89DgY9UADsLZTiu+ypj4Ur8AZOw0HYvUOox59plL+L5po0BDDTg2UJzRHK0YI7B39Z
 AHvSMN4HoCFDK8glA/MHrJEAMJmZQPdV4yw7a6tO+by0LOgnPCarF/mZxBMWvXNiOXEnXyKunbg
 C7ztd8ybzE7oVrhcnhu9L5mNcSbE6W2P4B++hjRTYlCJ/rJGPe/RqbWbywPk1pKoNHMbr1JK3T0
 0qT5zmzkxuXHrHT3eD/bF+vpQL1qmYrqGhZoxx1gI+TNdJV9fmBXRS0s2b9pe6nf25HgI2Knmvs
 RCZpzo3iMcJZjvKyOSbsUZOsIyIobwQ87dli7bsfx2S1gzUrieSL+5qlQIgog7JAAtqcOU2MlI3 /5fah6FZcHeA6bg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vbWBdT1bxao0-XMcJq58pLNH7YHPG5YF
X-Authority-Analysis: v=2.4 cv=fMw0HJae c=1 sm=1 tr=0 ts=696936a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=T11ZgC6G7QN3siJHUSwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vbWBdT1bxao0-XMcJq58pLNH7YHPG5YF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfXw6H5PpxRfXcB
 OT4E1ADIuvrVAh+mW4c43v6vn+XFIOvUId6FxJqXLyKXjwTF9vx7IKJ6GYVOUMza3nCiJtZfLxf
 an8AktBj4YynRE5Zx+2OEWjVXnCnnsVbKNi+Jyd0h0s/NoJzRCXpPyCrl/7yy+ZV8l259oFKKb/
 09DG1Al53oI3eGmgKEidg4/Nr7/lPqs3X/qtCXZuy7a/rIwUENpHzMCQOh0RO3k7eddY5i7NXE0
 Z0fvVjM8n1lavAxNU30E4XVvBOt9Ot3PJs47Z56f3sAnzzNRQVMflw8fPqD0rH1ngUn2/66QbVr
 oEe9OuNQ34QLwMvw74Xn9FS+s/S7ae+WO9EDhOOdeCq6PPTsQN+QjCCMmgk9y7uZWoKdyUTAaBS
 wL9xMFZjLw9US0mFXamBNkvIBbV4XFq7P/tUE7MGCZy9T8L0bG9GAdhBouQJVDAh9r+GXsad0MV
 P9B/JWz7f13WCcvmAxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

Device nodes are enabled by default and this DTSI file does not include
anything else, thus it is impossible that nodes were disabled before and
need to be re-enabled.  Adding redundant status=okay is just confusing
and suggests some other code flow.  Verified with dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index f137565da804..f467561aef5b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3736,7 +3736,6 @@ cpu0: cpu@0 {
 			compatible = "arm,armv8";
 			device_type = "cpu";
 			reg = <0x00000>;
-			status = "okay";
 
 			enable-method = "psci";
 
@@ -3752,7 +3751,6 @@ cpu1: cpu@1 {
 			compatible = "arm,armv8";
 			device_type = "cpu";
 			reg = <0x10000>;
-			status = "okay";
 
 			enable-method = "psci";
 
@@ -3790,12 +3788,10 @@ thermal {
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
-		status = "okay";
 	};
 
 	psci {
 		compatible = "arm,psci-1.0";
-		status = "okay";
 		method = "smc";
 	};
 
@@ -3822,6 +3818,5 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
-		status = "okay";
 	};
 };
-- 
2.51.0

