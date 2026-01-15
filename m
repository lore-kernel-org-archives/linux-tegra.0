Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09139A805
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502959; cv=none; b=eA+2m9YRCzOwum8pvBO0v76bHcBNDnPtLTMMS7LlxtzW6sY0e1udLuG7u1vFmRGtNVB+B1aKZi6KjXPNNajaBMRmTsdtwKwLQnur408aaFkslnmb95C7Az4vViKEDu2mv0u0ZwDp66abPwAQdFCgixpsZQxvD9ZuL7eedyngRx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502959; c=relaxed/simple;
	bh=XhTQsx8pwpOzRAYRz31K6P25bIMmv/bapx+k7WPlnd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjlnfobIf0OGxwRs5W7DNw6ynv1m1QbSsteo0AdZh7JAWnbGi9bX/iab5xv4ZOxvinWvSL69Pz/KL0df+Gw6WL1ayF4KoHPzxlxA1+Y6Yh+XXD/TXQTTQshu6YIB6uIF/GgtEsYvhLWf2dpcuCHSWxQ0j2yw1EQp+mVGP7btYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSVqfOzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8b9FDSw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSVqfOzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8b9FDSw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFfx1D2312041
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ADn5paNI7+2
	PMz36V0Jh92c9czSYZR3ZhlqvEgODntM=; b=oSVqfOzvDZWKcKZblm5hvLePI/l
	VPAefIBlARwK0K6uOvcMQxYTYBafyghFp6J1sk/lsTyfECut2TOWmJ+xdyAhtMHn
	ftalxZ8tnZBmSTc/1XbuF6D9oIJE+OQrGakZk0OhvrsrZSNGXwYpVHqtSYyFiTD3
	dJLZkuH3PnpDb5F7gAty+IjKEbzS7dMReXcUTL/sk5hREk1Y6XqIGaSeNAwy6orR
	R0SBbvN2qCjBd+f3kDTGBuNlm9LARcVrSSOfNlNLwbwus05d2Dkbu49PtTcRN5ST
	eTCo0FtqdYKlsvvRhOSiN9sOsBDT5l+zKcQQsxHrNfWf/k18H/dYbY1ZHbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq340gnqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c277fe676eso369293685a.0
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 10:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502952; x=1769107752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADn5paNI7+2PMz36V0Jh92c9czSYZR3ZhlqvEgODntM=;
        b=F8b9FDSwdwwcfSygM73wi1gCU53qQm0FddDDC9bbDkovCmfc2Q6tr4j0IA6J8SiafC
         9I73cqcyXM5ti8UmCPfboLO1KYexTU7nfClHG9T6iGUUusuiJB9udavzukXbNU7nQzSm
         Vf4L2SCdeV4+VL81me82G2ZMY/ldX0g10FhJ4n/J+qg8+lZeg4ml0HeJ4aZb3/EY6Gfw
         n7w/WwHXXHDKfRhhDr6CD9kE9ONM4kUQURGKvYkmgUSs5Lc0k/93kLXhcvt96TriSnxR
         y9T5ChS/+7YfG7GakVfE5TgIEGFg9tnBOM0zxC9xn5FNOuzU3iy2NKH9Uvjv6aQp5N4b
         zK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502952; x=1769107752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADn5paNI7+2PMz36V0Jh92c9czSYZR3ZhlqvEgODntM=;
        b=DNc1KZNcSuXACJl4bCoOvWdNdESKFLK0U7HEX2abZtdQPXLnuvOrxXegvJODcDmmM6
         pvmF9krSOY0WaHd24JAgIT9dPGrGk/UZBJoH5S92X6JxunfPZE0+M3zZIzhv/CvPzto1
         Tpvd2odwLJRoJfCqiBelbUIu6noZGAdcz6cagiGKtfFmv5TjOrJQn1C7sx8Y8NGZQErn
         t3bsf32KGsy+N4trD39NeuWmyK+rFPgJIod+sQmswgF396pSeakrGwMydlpeLMBIc+mr
         2h8iUgUy9iaG6i5nSWe4vk1yZXl9yYLzKupZ0LoOLmwyb0WXcOqfY+1ZN2rDM3Ajtai9
         y2xw==
X-Forwarded-Encrypted: i=1; AJvYcCV8+obr+4frd++jkQ2qzbGgwz6L5eqxChAV8DrQo9ApIpUYx36qd3KRC0/NvFhSyDJDBo/kFpmd3CsmNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4CbX6n72os7m7jz9cAYOD/9j62PLGx1jlOrzjzGDuYIT4xFY
	iVUek2XAIoR7TrJZmEb3pn2BG3nX9X329kye+hy9TtzHsKWqfOwXGV4w5eyVpb3erlPh96axEnI
	GbfbnIamirIgVPNwne0hjLNJHo0ooV9L6UiWTOj2ExDmlbr6J3rTsQS7DGAL+eVGM4Q==
X-Gm-Gg: AY/fxX7p6W8GDgcUkB9P6HAhy2ephy4IQxOxxgn555SRWDtL1h+6QXf92GnCYAjl/OZ
	Del/97AxN6FXQcOE05WZBvc1Jd6VTXDIlwDEVkZXfVLsqvmdzcb8urPX7tJzLcTWzFDSviwi6FI
	gnBB9llEfcunntltZ0PShUyq0km/8K88XDeYK7Oga0c3CFVkNVoDhf4Qcoh4zz754REBbTcFXex
	H2O+ZOH8p5iIA5Ni9gbiK3Q+vR6Y8gDUtfw+79EuMnQ95a80+R7YLWykr9lmu4mwRjSsU21jzRB
	cDnKfCqiCV8jvnVywc/Tayio4zfT0xKzsw2nGhgo77cWTIq6JIVaHvJ1agVtdaZLVraOxgiHmp7
	s97abxf9z3/v6npgca2mBq+HK4g==
X-Received: by 2002:a05:620a:4588:b0:8c5:2dbc:6256 with SMTP id af79cd13be357-8c6a66e497bmr68063085a.27.1768502952282;
        Thu, 15 Jan 2026 10:49:12 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8c5:2dbc:6256 with SMTP id af79cd13be357-8c6a66e497bmr68060085a.27.1768502951855;
        Thu, 15 Jan 2026 10:49:11 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c6dsm14408166b.19.2026.01.15.10.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:49:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 5/5] arm64: tegra: Correct CPU compatibles on Tegra264
Date: Thu, 15 Jan 2026 19:48:45 +0100
Message-ID: <20260115184840.310191-10-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XhTQsx8pwpOzRAYRz31K6P25bIMmv/bapx+k7WPlnd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpaTaOUjfPBxtNuTpIcQE4WZqE7sMILb5RbbZ8I
 1EBEkhe9QWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWk2jgAKCRDBN2bmhouD
 15h4D/9Fo1VlefHsy1p/cXl/9dj98KNr0/PR3ZHhZanQlQ1LWwoufGKI/NGr37qsRIqS29lbtIy
 YqAP5siM0rBQiT81N6oYSOhZEDk9411iHuqzifYFDKmKQLZNEvXOOwllqCRhis2yZETOLI927W1
 /LBHmmg62WsxKmpzDQ4CAkfo3w1zNrwvGv3lLz+4KbEmYY66fSYNHXbMxH6wGkZt9WJ9GynB8ML
 I2B/tTWyctIF6s5o+Xk3Aid44qce6czWRehSRr8JhBrT+hXnhxxCdmY506SVVNriCO2zcVpmVNb
 BQKtoeuewpjrKHzh2/HM9TJ/OHRf/lCROZCGy9EoI9zsrgdTE2oIt3xDHR/91Vfp4I4rVIH0ajb
 5ia4+cJPjT4UHVJ9J262uqrxHI9t4g+zzEXAOAMFRLVLJx9RJEJm5EVn4g7MQOwLvHuP0clrHet
 9L+mTgioZE3SNt1+QphPWe02Ia63yF+Q5UiuDzrhcwNPp42fxLkONRRTuGu9CwpV03U4NyRLdFP
 FGgDNVok+WIKSqvbni7F4azwuDMCJa2sF0qvpNK5VcL4UW73P9VW9FzAuXGeHwEW9OBKODzHy+d
 IN/cPi9OEaPMRTGAEZL30TtVnm/7uvk0iTSYqXJ//kNR/XiU0m14H6516/ilLHMc41fNKQlGVHp rJwX14KJXbhr0YQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w3Yf-33HYeVlTzsp-wCbnkSVIIc0vJUm
X-Authority-Analysis: v=2.4 cv=bp9BxUai c=1 sm=1 tr=0 ts=696936a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8pif782wAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=brvJ6fAH8qXjSY_mVDYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: w3Yf-33HYeVlTzsp-wCbnkSVIIc0vJUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfXyKhWHpnRX8yz
 wbU7R+/19MRKMjOG1B34J55bvBbURE8GASBnQ568D1f+QljxMGBJ8OqTiygTKLOMmXBbWcvdztR
 9IakG2W52MfniyT17dQbmzOkkCWgYKxKFwVXe/0iyF+vHGsRhbhX08PexthHIGUJ8CuXups7m/P
 5gQr3ZVfRRYEFyX5UK+JFz4/1UioWnwLxOWQF/jRdx2AtCksCXumwJ8QHHL/MOP8fJvx4DTaCZ+
 KddGbBSs4SeQAiUkj2DlPO8T5S/fJO+dss+MgfZETDicJcMo1kBjH/2evoqB4LdN2EdAVx8ZF4c
 EENQz2hvzQrYOa5jlKQTXSHjgSX/OBjs2uI8ZQmRIT9kqVURux4ufh/rmH/LiipBUA5bsV1yglY
 4L9n+265bOHKFHp0QxGM4sNwFsWAvt9l8prJpl2Y+LusQUWAQ9V4T9HymtZ1dZiJBdfd+g3hh0z
 RQ7iqiZBbLEorzh/2wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

"arm,armv8" CPU compatible is only for software models and must not be
used in DTS for actual hardware.  Replace them with Neoverse V3AE
compatible, based what is written on Wikipedia [1].

Link: https://en.wikipedia.org/wiki/Tegra#Thor [1]
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/59ae6b16-7866-413a-a1d2-4a735024c108@oss.qualcomm.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index f467561aef5b..10cbf7c90066 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3733,7 +3733,7 @@ cpus {
 		#size-cells = <0>;
 
 		cpu0: cpu@0 {
-			compatible = "arm,armv8";
+			compatible = "arm,neoverse-v3ae";
 			device_type = "cpu";
 			reg = <0x00000>;
 
@@ -3748,7 +3748,7 @@ cpu0: cpu@0 {
 		};
 
 		cpu1: cpu@1 {
-			compatible = "arm,armv8";
+			compatible = "arm,neoverse-v3ae";
 			device_type = "cpu";
 			reg = <0x10000>;
 
-- 
2.51.0

