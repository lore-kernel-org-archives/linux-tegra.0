Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9651C861B;
	Sat, 19 Jul 2025 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752912513; cv=none; b=ek85a/CjR3HMP8LjjsvhObfwJXPkain4oAnqKbWJvPCnjVI41QJLk7TMNuXTerMt+t8InoYOnnCdZQljtW1agSaIZB97vUClEr3x3ClZsocWXPgQKSVY44s1NyOwP3Eb/jhMpUcptETmwFVeU39rQWsFJG7LDYLRFIyPlO/h6XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752912513; c=relaxed/simple;
	bh=S5/JOt1zwzydJKMOjWOeud1UrE21DpMjkm5IOD8ntaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=apKeIJVQYQHAsBmwiQeESURhpFVKy1CENb2mKBgrTbUYVmaZ2tVaWxI7E7+z/bSRlqrmVhbTA0b20YjTZBmjTN6L9TMtVkRy0N1dXjKEHY+O/Q7xNeQuO2SIkluCpC08mp3/bDpTBTZfHG8rkmt9QlJ4vvoUhQoqpqkQmxk1P8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kdOVNaUM; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kdOVNaUM"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J6d6VW012493;
	Sat, 19 Jul 2025 08:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=qClKn6mdeLU8YK6pY2bntGVCNWMLX
	fNpYKUH8JTwtuU=; b=kdOVNaUMz2GJwMLJQutrkkvNPPuegXPOMbNrlV4O6sZTr
	wGjraKsEJivEUAq1ttwlzSiKg8QfkEaXoOgx7YMjEnBWu01N54v/R5yvjylMVy49
	Up+NSX9shtFm5L6xv7e3r/abwYhTXFnPA9+dTeeiLMKSOiTfKIKqxrujamLfWdJm
	vfj+23sQIEyZ6ab1Q4aOWZYM9NLul3mXIrL/XcQ7C0+ig+iQLhY189zoVPkMqSWX
	27+Z0FqSLqrm9ExGxIsriOxAAC1Yc/yNcq2kmUKMmA2X3Htxpl89yVuDcy3n8yRi
	VAZQOa9rhCnakETIaN8cArdX8fiQ4Ng5SN/IfXbbw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e282g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Jul 2025 08:08:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56J61Loa010414;
	Sat, 19 Jul 2025 08:08:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t6e1v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Jul 2025 08:08:25 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56J88PD0001972;
	Sat, 19 Jul 2025 08:08:25 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4801t6e1v1-1;
	Sat, 19 Jul 2025 08:08:25 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-staging@lists.linux.dev, marvin24@gmx.de, gregkh@linuxfoundation.org,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: nvec: Fix incorrect null termination of battery manufacturer
Date: Sat, 19 Jul 2025 01:07:42 -0700
Message-ID: <20250719080755.3954373-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507190079
X-Authority-Analysis: v=2.4 cv=WaYMa1hX c=1 sm=1 tr=0 ts=687b527a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=Hlg3EkAneqA-xDu2zGkA:9
X-Proofpoint-GUID: hVuef5TfTpm7tgq0sh8EFCCEW7a0KnW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA3OCBTYWx0ZWRfXyKOUejxcSl/r
 uPDyDMHKsH2EAnsplS/qexmhCQ2ZxmBs2IG36GdkORr5ssfs+5TPTy83nvU4rBeT6Xmjs1XTxSB
 JmqoWMkSF+nqPaNWHBVHjmdzmxALwneudWoLLunBE0+GYifad44k2+WxUQa/whyIDjk9Md0qj9r
 LcX3zlacsolsI7yx+oZ1M/WA7gsuIp3CKtOXG9b9/DH55lTCpuNuoQJ6BIyI/Q1FdUxrlfEm8o1
 RTZvx22HXDo2X36GDzhgFpjI8zbxEIE8pc8FopGkm4Se9mENAy5IkUX5Ah53NOhZNLk3B8s60WP
 K/9f/gVVUAyWNZphCNTJEddRukJv8srCTm8EQNuGx7krRtv8WNQI5W6jAiVTrgC0GND4U/cOe3F
 hjaJP2CiF+72sz8cqi8jFjoH0vWpvuh8GwUcV3mwUYsozeRCkyzQIakr0Hdt4UVnMCzV7J5R
X-Proofpoint-ORIG-GUID: hVuef5TfTpm7tgq0sh8EFCCEW7a0KnW4

The battery manufacturer string was incorrectly null terminated using
bat_model instead of bat_manu. This could result in an unintended
write to the wrong field and potentially incorrect behavior.

fixe the issue by correctly null terminating the bat_manu string.

Fixes: 32890b983086 ("Staging: initial version of the nvec driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index e0e67a3eb7222..2faab9fdedef7 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -194,7 +194,7 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		break;
 	case MANUFACTURER:
 		memcpy(power->bat_manu, &res->plc, res->length - 2);
-		power->bat_model[res->length - 2] = '\0';
+		power->bat_manu[res->length - 2] = '\0';
 		break;
 	case MODEL:
 		memcpy(power->bat_model, &res->plc, res->length - 2);
-- 
2.46.0

