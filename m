Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8CF382289
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777481800; cv=none; b=iy+p2KbPMkWJWkUE195f/mInuCUvXYKGaWsyZlUt4xHwBpicEXI6Ffxm7yXf8iypA1fVkycV9Vz+E0WDMsis5nAB6x55ykfQzvyH1D+4o7bBtJvOJrzg6rRTRnbYec5Zz2qNZ/Gm+CviKBnXn9odOwva9a5+wDYtlXDb3lmkNCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777481800; c=relaxed/simple;
	bh=1pwrD1mtxWjKZKg0d0n8zASSKOrTCp+wMf36OUBdg+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TG2Gl3Bl7qy4YaK3HlHvhG/w0AZazx1avhzW8LNNCxMp3+TKtV5WuzMHSM+oWus2ZsH3RGwaoGqBM+GruXE+1QaM5G7INe534SI+3JhvR9wiBbjBIMwL27x+UplInmse0MO1OjjlcKjCS+Tgk5A5L8P7HDl3sWCxUzIILKdUsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IejM5o8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNkGyKL2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IejM5o8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNkGyKL2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCeRLq316843
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+xyMYLqbuW1+V6VyGV6t0mUvdAy9lEshz/x
	aX0ggCfw=; b=IejM5o8zBBm+Up8vtXQmIkQ/Z7SwiAjXxqwtn8i00yQIxtFGLjt
	qauGSqoS11guqV38wAPxQB7QtgnZxMURgagKykdVPqEo4rRu58iYBOQRbVey/oGG
	in5DBt8J/ikD20UsMg1nkYKhhJnLoHvqhTP2XcIXtKZag1atVAcS9BjXMj1cj1dz
	iSKM45CzaP4aeP/2P21NlZDZU3gNxQgudFAskEpJI8784OwhL9sHwBxre2JqT5Ka
	O0pXfNiYLx9O/LV0jMnWSWVOB066kgNFXThWotn2282k3r1YqzLaYZ50KVcSmvh6
	mrTeHNo1Swmrskl3/ottml/rye1OFYbNnBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t91ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 16:56:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf01172bso272579051cf.2
        for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777481797; x=1778086597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xyMYLqbuW1+V6VyGV6t0mUvdAy9lEshz/xaX0ggCfw=;
        b=CNkGyKL26Xe7gGUDOV7X4593dE34NuAGFgsV/cguB9N/z3142z3qZpQd99SBvW5Xyi
         UH/cC8e9rusK2+zZQCxr9ROaEMmnJKKHKnkvWdPKDqV0l6WrGXZCey2OcAR2gn18A1g7
         BZMtQiavT7U3rTd8KIvp28NIviJ0+ed9hmL9DzArE0DC+a51YbfMruAVHiWECEERdTa7
         dkJzj/t8WrW4NN1xTxuyt26tY7nf5jvkGA5qhqLEomQA4Ia+YqBkFlpdVa5N6UfuzhU/
         VnIW/BXyjPQaFfSvpv0FJTJbyUZUCIYEx8FC6IMYA/aS4qOMEPFE6H35msOdHLSF3iqh
         RVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777481797; x=1778086597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xyMYLqbuW1+V6VyGV6t0mUvdAy9lEshz/xaX0ggCfw=;
        b=D5YyNsG+ShB4NoKW3aL5iophfi3vQBj0Sbh6YRzy+DgjgCRzX9apWa8xDLBVGWc7Ht
         LQLV+FrMAhsBKUXGN9LLjZYnXywvj+wtaxZwf6p1jewCdHQ0v7ZDekdmvLa/bQhg/75Q
         jGEdNoXYjB3GARbVnrL2yg0gDN+jpps9yOsgs1hXbywyK3m/dF7somYYQnm5DLXZZMkJ
         jZz5vO0RSwzD20AkUkc97RbimhyxAjwyhT9Da6q94pbJKylUoaiHu497c0xLWQeIoJcQ
         FQrdaQJ+95vhYwteD4CCKAEpaV0MuGVf9lUxrxoa5KvVJ8U9Hu6dS0ITucjVqtzAjch5
         yRvA==
X-Forwarded-Encrypted: i=1; AFNElJ/IEknuXksqZeHJDUrAhvUwzT94DAoXArwhw/TWrvl7VyaqCzCKqbEdKL+ARg5qGROmAbCNXWuPyTX6jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0llPH2TrQQz1T6JKc+i09tF/2VqXkY+leZJNHR3IEt8+mrLmR
	8/ulFc1BRN/rRuN5lIpxRh2XdMdAADLPCCAQrZoRo/L2TEL99RVlfNaR6mULmOu0sUXBSLQwLkm
	4BDYujdG60fONVzJiGQ1whHnPXQ7I+0zWgvfsZi22QnvO30nLVTYJFDBDTimJVlH5Sw==
X-Gm-Gg: AeBDiesxna/rRc46jZznXYIcF7TWS6Xfc9l9NefEdX1gE1l87X1PJkOZF8fjP4QN5ES
	QQ7bAplTkcGvqXLSjO9PRzHXC3paA3apsgER9NV6iCdxEjCMdWzNvBBGG4GHIKFDzH9h3bRjru4
	Lev4WJJdfZihZaG3/ae/E/c/3WbvTbTH67qleyRXOVDrv62qPYMFS9O9KPnqbaOvcs50sVhU3CX
	JOJbvOMIUdYYeUQ+P6h9cdRTdv4WYrQGyiUs77MgkxlImh8nVKu6sOrrm4gURpDMwiedfhOa+UA
	R5Pu1SVFMojERziimNgx/xOFqp5NPOBbJhVGES5cgDoExPQwLJyHMSYsGSBRTedXPmJMk+Rxlsk
	rN2emiqZiZkQ8zPUH9bxEV2NwJQkFo0MblN44Z6ml8puc618=
X-Received: by 2002:ac8:5e10:0:b0:509:f36:496d with SMTP id d75a77b69052e-51018a356a1mr70618611cf.33.1777481797452;
        Wed, 29 Apr 2026 09:56:37 -0700 (PDT)
X-Received: by 2002:ac8:5e10:0:b0:509:f36:496d with SMTP id d75a77b69052e-51018a356a1mr70618311cf.33.1777481796940;
        Wed, 29 Apr 2026 09:56:36 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b901a15sm52244375e9.1.2026.04.29.09.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:56:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] arm64: tegra: Correct Tegra194 p2972 interrupt flags
Date: Wed, 29 Apr 2026 18:56:27 +0200
Message-ID: <20260429165626.243471-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1pwrD1mtxWjKZKg0d0n8zASSKOrTCp+wMf36OUBdg+U=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGnyODrI92+1lI6GkuE4jYHhymBTmzlNYxl65uY/UH3RVXXTF
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJp8jg6AAoJEME3ZuaGi4PXTokP/2zc
 0OQsVpyRv7EUr4Wnni/SP/kVSWxHZsxnyCYMe61Q02aHUpRTgf6hKXjHztcwvVp+PsPdJ0iLbCq
 fDOVTty1rCoNseZxR/4jChUu2/74JjeRFP4Q/tIYly3eCycIbtleywaPD/e8stGUGoygCdT4ALd
 J4dWx3PhLLRLUUKIKG62UFQN8JetT6+3w1N27HgX14Y1kxmGOglDPH2AGvbxqyFFydu5oy5oMlg
 KLsEGzb5HwoqyA0f7VadWFLbqzhwNna0ytWhke7XaFRBTAzSPMJT1nNFpL0RxhRXtyfAm9FpY2c
 lGCS2T8y1PCI6lEruxgp1fWmJrIrTAJoFSzfxDinKO/N/bw7imsBuyzjoJUp/jfXHmipn15K06Q
 THWO7j5PQa93OKODov19g5386RqvTTT96J7OvyrQl1SiPWozcZB4P1jlIwiwZIMXvDpTpbJwi6V
 1Pc7eHEvIFE8YxW1iGr5lifOAMmE9dY03fg92uX6tsOCAyO6tDO4IKnwEqCvMjDr3okgBapE7n4
 L1IUREkWQXO3W+2jTweJbFXtSGQ4Zad2zS+glXfFK6kSnbqVRQrDYfH5Clq9vz5XqYH69uHsKB0
 YBniDoBPnoTfQdNZUb8Yl0fBtnw8d6k/x4frbFfcT17pMcOyPx10Kwk6QSd1jtR5lr5kpH1koU/ MXzsg
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cAyrw4EP_YHOJ-9WQZgUq0YRAN4f5rrQ
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f23846 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cAyrw4EP_YHOJ-9WQZgUq0YRAN4f5rrQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX96/gOCNGiXuO
 fGQTYL5GaqMKKmQNVbuUjLvu64QzLsA0MmzN3FLkyf/+r0oNfFeyL/5NzaY50pcP9zomTL6jbrR
 U+9oVCjDkDznbGY9+sKbMAt1DNuK8lhaRvXVCTktuxX24vjX99Eehktp6ssZ8xQhuzC2qJboQrs
 mGUberhEFUCuLzFcNiooMgm1PaCOttWVVbGoqWtf1LYNwQ8Gdlkl5ZMIduigJLOTSWYMxAqZdVZ
 C8RHivwY0v3s/Gbt25TUnPc8T6sPH0c1/p5DgQIM/6uQ6Pt2V/qbh5uGs6ISQpiTyDhskyXqUKs
 SnrQajoEFF3VvZR/19MLy/DCT2BRDh4opnK4DJ9Arx0aKqR1rT5Akk//a2F2i5wt0cmcdqab7+i
 XDB4xd0Yo3WArNKmyykMXoZkoGftw6Zi64RBpF1KhqAnblp2MhrWzJWwEbx4mzeaQqkgJey5/At
 fizEq9Dv1FaHEi2zWTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Realtek RT5658 codec driver requests interrupt on both edges, so correct
the interrupt flags, assuming the author of the code wanted the similar
logical behavior behind the name "ACTIVE_xxx", this is:

  ACTIVE_HIGH  => IRQ_TYPE_EDGE_RISING

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index ea6f397a2792..5462200f1176 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2170,7 +2170,7 @@ rt5658: audio-codec@1a {
 				compatible = "realtek,rt5658";
 				reg = <0x1a>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA194_MAIN_GPIO(S, 5) IRQ_TYPE_EDGE_RISING>;
 				clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 				realtek,jd-src = <2>;
-- 
2.51.0

