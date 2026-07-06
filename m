Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CAD44211B
	for <linux-tegra@vger.kernel.org>; Mon,  6 Jul 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333085; cv=none; b=JyhvCYzqNv0axeHRLMmsJrB7tWSE6zX1VUHgABGHEZQ8tP4chyDFLIlNuB0K0htupON+Tew5MiA+0Q8Deu6r4Av95Kx3QIENUXWdZ1z63u7a4tki5URYGqUcvHH8o70PCzYY+CZesD+ktt5T1tier+AKTBXZaQR3AgmPur9/g74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333085; c=relaxed/simple;
	bh=wEZxFzfOdORenc2tso655jPsA2uN7AtraSxKNfd4i3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKYyCYgmTE2vQ6XomFtrph3xuUUB4fl6aEFV06uTpkee6yak86JOmJHrreSGq5cDG6WRo6QPWjG0o+9K6Dpaxzfo4CH00esPnvZlnTJACPzq81Gl0E/Qe/9sIRpO5UJQENwa8Z2dKybkWSxPvtOUqF/HwSbn3qQiNZL6UOFS5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A43MqP1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7XrjJg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A43MqP1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7XrjJg6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666947c9104035
	for <linux-tegra@vger.kernel.org>; Mon, 6 Jul 2026 10:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MAabmaOne1IQZuI2g48uowV5XLIoLFCGQrP
	uaubBB6c=; b=A43MqP1Bii67L/MrbLQjkTqRtD9yjluxdPftyu6/YYK+trzpg69
	lViFy5SeT5ToNIn9/Dv0whRXpBQwvBf7RR0wNqwQB5QotTttqe0qwzthYgRzhkoS
	ekNTBWbjrORprwmJRpxKmX2m9YFaGjtu+nZbfYL78uFrWlVBTllN7efnJnmiVgXf
	sRErlg5HhcnoActqb7JvUrkuNdM6jsYsBnlOnwduyg+EoC/hHFwn6H38eZyTKm3H
	y0u5bCzfvygLzmNFwHoD9JDAoOPjbXRMp8aCj3Tgq2iJAr5+bjlPbNhaeN+c0W5A
	pK3L3CJ85nJiSHoTV8JFo/9OBhhkQ351vnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h50gud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 06 Jul 2026 10:18:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so270884785a.3
        for <linux-tegra@vger.kernel.org>; Mon, 06 Jul 2026 03:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333083; x=1783937883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAabmaOne1IQZuI2g48uowV5XLIoLFCGQrPuaubBB6c=;
        b=g7XrjJg69ANpfXqB7myECzcqyRLP4DJbANyy537M8vHO11rf+AzzoFIzxkzYYfKf1s
         /haT9lWT1BQ778oSwJTir3h4N/oQN+xKFjvssjxx5xT7g0l0pcsLqPE8IrnjYrb4YGJa
         8SKP0jjOvwUAz/uU22FD6egDOzDAN7ItoKPR7kMHGtfrQeDC0MVXAdH1eimQkBOL/Rcc
         m6cu5z7ozHuFnRSRrSOl5vDUJhEw13mZlHEG6PT9C9PeKRNM0betX4AVtu5mrAYSbNEl
         9HUiC1vcRDjd9m9OEw8eWki/Mi6Bo/87mJ2g4m6DqqvUlziWngp4ERzl3LhMA/ud8XK4
         LuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333083; x=1783937883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAabmaOne1IQZuI2g48uowV5XLIoLFCGQrPuaubBB6c=;
        b=bR67XMLEpeEJ2n2bRR1EH6b+XI6zBBJihSn+zDg1khYYsOfpEwAUGs7oo+49MhpmB7
         NKb/cm20wmeP/DoKsihjFvp0jdQIpXSvql9OHoY0NBU5pgqqe1Yy72ipRHqiuLUsVNuJ
         K3+yndfiLhkQitkUtWICLfrWEpviC60KUK4o+X452UfG/5uAEYhKFrks/MIJb+d5ESy2
         Cp/uohOmye3takKf+uQl6shrk2HHKswPKa/2Va7S4oa7A5JUQ9yNZCrSoS89/759Ufb4
         odm5KvhYbakP7I/rw1HCWDfF/9Tea765rWBFpkVeEl0w0b3VdNdkEICXVbhPYWOepP2X
         BhsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8XIazvff7h9ycEI+MY1ww1F+PfDjcSixEomogEdiCHLHiV4tKovvrAICrxcpybM2SWNzUWLiArKehiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJUBIc/Yv3FqK72j0zBTorsQ6ZvRcsfxHogagV0+NQwKnwVqBB
	mCdDDWacdI2uNzJ3b/W6adDOprB/cpmPEeAh3qWM+mrZZzOVgaibaUUzeKne91uNzj8JbJI1EG5
	PJ0ItLRs5bYMJwivHP8GfgQjDImgm3AXuJKyJtbH2XgKbUGgsIERym/najDrznlQkEg==
X-Gm-Gg: AfdE7cl+4LmjbudbUSl5CIAbufEpBUH0R0LCWXn2py73bRCX7uwULfNHD3iygHDQvv7
	HUw7hFx620xHXI751N/9XYYRAf/GyfjvqpLJT2i7c1ZVv+yld6CpOaSkggP7E7trWn/Z2HbvTDT
	eE7EP+WFpPuparIdoEsQZIV+M87vnZRLczaBtSvLPoLTcYY0qwQtuHDVXSGsQgHR/RGGn7KxIWS
	U1+jPNfZ5CBPfG6ps+oRMwMjFxsJKQY3T6AdLeRQcxn6S6Kcrmsh/gSdlDn1CffmJ2d4yL1xgDM
	mlPHGlPF5Uqtn7vKXEOFywsILeS+baP2AdPY2dxCxo+gPhdRCMToR/poZmMJ65wSORLiS4ANxVD
	2lIlZ8AohK3BSkF3cSQsxh+4EJBg=
X-Received: by 2002:a05:620a:4115:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-92e9a3447fdmr1369297785a.15.1783333082770;
        Mon, 06 Jul 2026 03:18:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4115:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-92e9a3447fdmr1369294785a.15.1783333082237;
        Mon, 06 Jul 2026 03:18:02 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm24579558f8f.25.2026.07.06.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: nvidia: tegra114-asus-tf701t: Correct trailing whitespace
Date: Mon,  6 Jul 2026 12:17:58 +0200
Message-ID: <20260706101757.340149-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wEZxFzfOdORenc2tso655jPsA2uN7AtraSxKNfd4i3E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4DVioZ7v8bMLwiSgrxj3rjQNh/7ub1IcpWES
 jfotTRUMSCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA1QAKCRDBN2bmhouD
 18aTD/wLQspJgy/98ONkyLrE0Q67FcG/7ibLVzkMw4C6lnoTGeHYRhV0Aip7GtPoKz5vhvU7+JM
 aVR9Z1fq7EzYfa/4S/fZv9olQRpZhgeqRpkOMdcZnr0t9QRlt/zdejzEWgTFuJAJZoaE/7NE/EI
 YWb5wwowZiu2F6q7AA+St531Uq1AHHlWqbz232lnOnH0tMrF0KCb1r1RFKG8LV79RqkKUxjn59I
 xtAHrum66H3xRt1r9SJF7IYR1N8Fmva0VZJSS5c80kUZuo/D3xsjENwzcALr2fsnToeHKEq8NAn
 XiIuKzqpVOSPJ2EhFx9jaP+uRxPFBNIF65GsM+yeeQAgNl0SedJyneW+61+AYI9PwvLuUNAhbE+
 R4xmIywI5mI/mR1Gn8UYIvvi7e5zFL27EbBIQzuna0xbQSEjumwNJsYyYoineV+eo7f/o8W7S+Z
 0VMifZTyhEc1YV4IYxqO5D2WTjGlUf4D/+f4h/ZV4quY5GNaSlQNIeG7JBOfb4TdVa37+J+d6u2
 TmVAquOrNS6spdRif+sBOWYPcpCENHHEKtCcoKMNzX/18yhdYHXDWNLoVAusndGLrzqODeGRwPa
 DdjfEX70sUyRM7zCXSBXH4nPYMLuUdudctfRgcMZcI1zfkU2YDqjmUg7gOjmHXL+X4iZRJVrEJK OKDph4SjuOdVThA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wldAafn7wtDXADl3kheWTlAjFCREI9ta
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXyimGTX8opHcT
 LKVRQzISISCCEKt6d/lxY3jGEj66YMYKuF7pz4OGMuMeJa7Duw/W2baFiXrLQ2izBHh/6jqtVnT
 PF2nMTpjFa9WV/PHwXEaAQpn+gocTw4=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b80db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mzNmfwoBUIZJ0yLm2cUA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX5nJRIEmjA6A7
 0SIfco9rz87xciQu8rO8g0Q1B/JWnzruGW024Gi/S3O7fXWAibR3ySsWLgNc/hrE5/pf7RyIsqC
 nv3zSoN8JG0EDn8ZNVE5rvWhBEplJ8vtWsBVh1eW+U2+eMzMOM797KxM86yNs05y184CmD8EJXv
 XXJu7+I+DIXHh365cf3pM2Kv0CiXSnAYYGaCu5b9k47Nv+GkLr3O1Oq6UaT/cKlFN/ZCO6Y/gIs
 HgOOpSeRGgiQDc0vCldotjFJXndY0jQkEH2ck+CJ2JLS1N1ztQolOfX59nRDY8Ug+mOCB6c3J6E
 PQz1xSY6+pN1Otf5aIBFu8I1bU9oc5jlOAdW3Mtq6cnqu1uc9CNgN432VErbypJFl23s1qzj5Xl
 m+boC7Rx7uaG82ajuwAAU7RSZmUaWTi6m5R4YQZk9hcBVjdg31So+J4xxrnN+9OJvs8jMhIYlZu
 VzAle7QxrXan5N9ldwQ==
X-Proofpoint-ORIG-GUID: wldAafn7wtDXADl3kheWTlAjFCREI9ta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104

Drop trailing whitespace.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index f02e2cf65fe8..e563beaa2bb1 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -386,7 +386,7 @@ cam-i2c {
 				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
 				nvidia,lock = <TEGRA_PIN_DISABLE>;
 			};
-			
+
 			ddc-i2c {
 				nvidia,pins = "ddc_scl_pv4",
 					      "ddc_sda_pv5";
-- 
2.53.0

