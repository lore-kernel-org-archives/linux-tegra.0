Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B42D061C
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319810; cv=none; b=dsF6twXiv6jWcX2DRfgGuS8zbvOsvW8qGYDtmOGsv0L5X1izwFs/JSxZT18mp9yDh38uUm4c/nuBb0YZ0ridD+DfSiGm6YJ8Xp7hXGaHLSJpZdr0Jcah5sI8dsKb8J+kofXpQy/y1YM0Xji+uWQHBwx1aN/kOi7wCXvhsjNIEOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319810; c=relaxed/simple;
	bh=EztO9yRXq58OPjDRS7fRx/PH0JJemW9dGn7fxYyzExE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ktTEC0Afd7MQFqJn+1pNoG8wpQOjnhcpB1NLh6fWh40xVhwxuT0cDeb3MiFrcnzglpVanCIfu70DPPj3Dqw9EzViMMNnPu12URjo8H5IW0AKPRkWuhbEybvJm3aw3zN7HP1fBXQ9z9PCT/ZKNGusKSGc2ZaMIJmZ/zsUSX8mHUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tqs9XoGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HundQALR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tqs9XoGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HundQALR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H90luB289398
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MS3hOD6m1Xbn2MbT5juObO
	378HbR+C+3UhwUs/0y+8A=; b=Tqs9XoGqMHyJhDnFRxMTnUMq6VMJPXp5/OyAMf
	zLuLNEx/bq1D8lwYawytRf9T/eU9/VU+sIE68ljs6nsa4fBwzHjjSXZQkMRZhcsx
	pbVK1hda901a13I5jS/Oj9MwBAmdRJn/Qpd8Tm3MdATDxHL7cqRFjHWWKFBdXPBN
	5/5ryISPnlEU+88CPg9zFbp/YOqAcT0S4aoONWYHHcFL+7tE3+3AGVT+tPfEawvi
	L8JIUgoDnS4K1ZGTxWXfVIp09/kT06aUMqd76cfPEi1VxH86ee0SJemjD6eDKhcL
	29bWiGZYdiv1ML79O0UyF4Kw+o7eDdnY4G1rrjgSr1GcgI3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrsqnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3ad1b81aso4108012485a.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 01:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771319807; x=1771924607; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MS3hOD6m1Xbn2MbT5juObO378HbR+C+3UhwUs/0y+8A=;
        b=HundQALRO6aFKrT+BqqRZWHoAtakAXw5G2kSR6DIIEqcnB0xZEcnJmVEHcinNDa9Ja
         2NwuBiA3tL/U5WRw3I34u7q6uHsSnJFBWSELMloaVM3xgKM8KE4v+fvoJRb1ezLr6IvT
         HS0ukkl5Alok78cTIaMSC4OZEAWMqV1s1/IV2UNucW+Do+lNS715cyueKTbvOd/syikF
         r+9j9y67DbJGFBI6XnCd+hTsCO19yXrKVwkvlnabNxPSt+F9EXmk04wsHTNstERRLQ1A
         pYExUJAezoMu1qDfy5GpU4C67dQCMM738ALGvRtRHMQ20KzMpF6u200xLZB6beJNc1/l
         /uoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319807; x=1771924607;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS3hOD6m1Xbn2MbT5juObO378HbR+C+3UhwUs/0y+8A=;
        b=jA9nj5cTxLTMpAU/ZmrD2JjmQEzSGlsBw+OMTUxidweq2IFVXQQEYF6Vijk2o9Hmmw
         Vn98ARcx07eNdGv0zDR8i31v6ZkzAIi04jYEndbGO16desXx8iV7cro27wqlEQm6W8cH
         rnEILeKK/L5rKej2tGCbrWWuCL6iPjHH/aG7n+RtyZZmo7v2D2e1yyFVPblJsdaTiqIu
         6AiHlhgC76WC+2N+fRZMoUkAX5x2UGnRJVG5jaamPlagtUQBPXP9a7UrbmBZ6p+gcdLN
         CIP3Zmpuum5EZDe97TN72/tN9HoIAP8vktJ6dwSLcK1FzHHFpYzY92aMmM5BZPtMWnoD
         zZ3w==
X-Gm-Message-State: AOJu0Ywfb2fj1omDY8jjnPRanLhe+/aLgbxVxhRP3BCnZom94Gg6OsF2
	ib2uOiZeFqCF/KDR2E0wut7MAtZC1FxRL/7xkJM5DxRWaj5hJxde202PdftHtICIRJ3ukvG8OAY
	6nNap2m80yGFDivaKrD6k0YG98T1oSEu0mpORu17ZxGQlQnKz+HZTAC2Vi5fTOEptnzU8rbexWg
	==
X-Gm-Gg: AZuq6aKLjt8TE3Y+eVHpw5Pw8wEDaa6t+E9ZmpPUePWg6V49Uv/jfyXbN/PODDQ779A
	mg1BGea8DzFqa4BbzCO0iw1QkecVqWoVdlrlVAisM2+jb4VS+P+r0exaP8jf7bkzxsXPeXVX8TX
	JupohKUYZoA5/c/d7bX73vZY9PXhHEJXOYoctGuJMI8Gs7e7dXCXejEjBNZwC0k1HGokRSG2hbK
	8mVh/QXyb4+/o/A1MB7ubkDHHRnwZC2K/olf5MIUzFwQ3poAn5yk803dsaV3QnPLWmjeIPbKgyp
	A7y+ZMoDwdp6Bs77a/mY6jpRT79djYp5GQZz/EAIOLH0kdLyFryuCHCkyMVjBJltis7FVJLbu//
	84UN4gjAY4wjm2a8gG+HSokUf0gq1RUh19zansTdCdjdOKw==
X-Received: by 2002:a05:620a:414d:b0:8ca:2bab:a0fb with SMTP id af79cd13be357-8cb4bf9783emr1280047785a.11.1771319807183;
        Tue, 17 Feb 2026 01:16:47 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8ca:2bab:a0fb with SMTP id af79cd13be357-8cb4bf9783emr1280045785a.11.1771319806731;
        Tue, 17 Feb 2026 01:16:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm149659595e9.7.2026.02.17.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:16:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
Date: Tue, 17 Feb 2026 10:16:35 +0100
Message-Id: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMxlGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Nz3eL8ZN2S1PSiRN3EouQM3ezk/Ly0zHTdNMOUNGMLEyPzJEtTJaD
 mgqLUtMwKsMHRsbW1ACWU88FoAAAA
X-Change-ID: 20260217-soc-tegra-arch-kconfig-f1df38427b95
To: Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EztO9yRXq58OPjDRS7fRx/PH0JJemW9dGn7fxYyzExE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplDH3YqwrUc5NnLK3u8481htj/Zn2sG7whA5Iv
 AzVI/nZXu2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZQx9wAKCRDBN2bmhouD
 1ymAD/4y7IU/yGqe2u4a7mxvx1zRiBj0RQGP2t7jdlE7edxzaLOPE4HIeRIJAZzQM3/G19zhuSb
 gTC8DAkCFCsI7JenmsJBdt3KsFkZpuB2KIaXzi/EmvrIeHdixEWJ5JptGCvAqIOk/gMFR/AoWTj
 WHA+9MRfI4b4+CsQ3uG/I4q3VUL+ozNFOY+f96xm1iRAf/v6QFqjcjSpyBLke9sKfF5x1m5bo5R
 INGD2yehKC4EUUoQLIrl3NKmkGVVqGztcIP62QA8ncqh9RTPf3V4xWyjOjtT1Vnuphst4f8dCdG
 qZCxR1XReZoLXVQx89LtioyuBMcbj9+6K+nlTNDaaJkyo8juSDCvyiaWj+8l79Q1Pi4BzOzJSc2
 vm5ma9c45TmjOqjtc5F0XfvmhBhenU6p/b2WQoCNenK6Flh3/u717niS6FVobyBIL8LxcMYUtoD
 LosyW0n+FCO2uJREwD3Ro/MmvW5K4kSlfR4KOr7cwr2OwBKnOsk+8kdu+X+pi96q+sGIqHgWE88
 1grbXtrvQfarY4xab3Qn/ll343iJ8NlkW3ADUR+9Ju16o0T2lBnCK5GSNrqDw+grJWambEH/O3s
 NEZFHqnZzoIShdCvTpSVh1ciw1w/ivjWuB/wVpue1N3vj5VDjA8H3JyB/8vYWEs0ar4bVabAH9k
 8PgbXlkJMisNN0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69943200 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=8zlw5Bu2NciGkZGQnRMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NiBTYWx0ZWRfX0KEiPnKHzc1Z
 EyXX7xkpjXgJkY/QfqqatB0ludv+706zxjRMy8+kGEcbMDkWNRDDwBgE4UPszaoZ0lrcLXq2spy
 BXsCzFpjrnje7AcpktO8n3SATii1IBF+vwn8rcbAmXZ6CjOEMxKTkpOkfuAQXS117PATmXKG55Q
 YW7mOMafzs8ZpIJNZ3/0oQKUP0ADuPKOyAbF+O8Tv7rdMjMxCRDs2S3vRhhsZTBleqiQa9Bjh3f
 qeyinXUMarvjlqf2fTKXcBdWgCpho7jACm3LqDRGS+6+cnFU0cGfgvDvxjvR72+1EFYRWZiaUFp
 QboxbDDTsqXGKjh+1D6+JyMrNuBg2UIKYt4hrbNk9dFAbUNPJRIthzRtYuuKyJS/otwL/FzJKJU
 5MUomMaYgoT9oWAkVa6tMZ308s1wsMPM50/t1tAREk3a4JuvSaNfHjxp9oLmvL9+a8JOM2qZOyT
 wJhu4VkW6K1/2m58K9g==
X-Proofpoint-ORIG-GUID: 3nAZz5sDSfTuDWm61fsKEM7-NCj_uoUn
X-Proofpoint-GUID: 3nAZz5sDSfTuDWm61fsKEM7-NCj_uoUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170076

Renesas was fixed (thanks folks!), so let's fix this one myself.

By convention, only one globally selectable ARCH_PLATFORM is expected
for given SoC platform, defined in arch/arm64/Kconfig.platforms or
arch/arm/mach-*/Kconfig, because we target a single multi-platform
kernel image.

Dependency
==========
Further (2 and 3) patches depend on the first one, so should be taken
via one branch or some cross-branch-merges.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for Nvidia Tegra
      ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
      arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

 arch/arm/configs/multi_v7_defconfig |  4 ----
 arch/arm/configs/tegra_defconfig    |  4 ----
 arch/arm64/configs/defconfig        |  7 -------
 drivers/soc/tegra/Kconfig           | 11 +++++++++++
 4 files changed, 11 insertions(+), 15 deletions(-)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-soc-tegra-arch-kconfig-f1df38427b95

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

