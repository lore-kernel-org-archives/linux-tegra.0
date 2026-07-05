Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCCD3A3E79
	for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2026 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280462; cv=none; b=IPzHaxeqb2m0WSJgo873YTZZtypV5KbmStPA360K+u77XUn9QzIKuMJPT0de/45Dh8nHkhp0AzMXiIVgYreOBNR+GcTyarDNKbaTFzJAa/adcS4tCyr6Oye/VXGzf9+WLvHTY7KFoliexabn2CsPdupoR066OQfxhLyqCxKTcUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280462; c=relaxed/simple;
	bh=v3ifKCsrwDtuvCvlwDYadGM1Uonf2WH1mckdOsVySyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCDohNsk1CBhw85GIsByk7tqasDH+DDydu4ez4BSr3aIbHPXq0cxl5ir9NYLNdUIy9XZfT1BWPyB2sOKRNioHbUhwHSY8JzpPVn5GyWcg/ZcU/w1PtiqRomXd7ocam1Pu+pN5WtoA0fpn8Xas+uAQkzkBwQ5N2l/DSPBgpG/0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPcw2XE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki4huXFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPcw2XE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ki4huXFc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhxff2327138
	for <linux-tegra@vger.kernel.org>; Sun, 5 Jul 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3J7+oNMk7WM
	Q4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=hPcw2XE00hJiXGUlPJdzgAHVQzT
	3IKBxTpsdM3YltXY0Gb00tp8cyyqr2jLji+CKNDBWau5JTu+BreuyR01af4GFyfv
	ngpGWe//C62ZWMgkGJk4zSl0S0wOJ9lpQw3JAKnLg2fIs5pZCB7N4aamjssEjqJr
	56eMgt2RR1Wu9uGyx458onBujfZX4GqD+UxQKYZvfMFk6K6CooiLxTXLejKO9W0R
	0jkXD7cR55aEXj06BsfreVAtJNhMuxZgvDsgw5Rbn8a2yz3zzklaCOw3S6PIDyNi
	LSZAc2ZKjYucaa8JgIZQNxudHkYVpBDXyT4e5CmqkA1zH01od7f0TWn9fNw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh3ctj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 19:40:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso27832565ad.0
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280459; x=1783885259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=Ki4huXFcopiUnCi55PmHll9dN0enRKHhl3SR+texrrDbfxFUA7YcAbqswPPFZUR5Hu
         trTCi/r+LieHmgndCX+yybgp2kntxcI/sTt9zQ0ci3nSkdKplKgU8nMY9wZZH+RQmkkM
         6pQz1v/onmqnWmZ4W/bUhgIHDYJkAXQIDT/f9/fFD9fFly0DZVgxPG/UmzOjzRmybFIl
         6uk0k/wuONSStO8paHob0mxdQ2hOXYbS2j+Wm7AJArNYgZEV3n6JEZ260E4SB54cpCRV
         H6T1VsK/F9uPAAeOpQVxJTA8I3T0zjEUsZsjjr6xqBs/3Ljk03DYGzkvU0NwQxWZz/dh
         7itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280459; x=1783885259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=VHlzRnhzAJCZ3U3AyoCrhFROfA7ogAxXkxQu/MDpqexEta+ujh2CaaldP2sk8nq9sF
         r5K249HnXedbgkqz8kUUPVqJtYhHbcq37mA4wCkc3EUm3C+87wDhvG8eJIANLJE/5mcc
         1RutcUCo77jQ/AA3BHMQPe9A1C2Ku2uhPihr0MWxPbx3vr0O/1IfO/LqBDGHdUa9nzoK
         iId3T86KYuqeCfy58h9dS55ueS93cCG6ZCteCpqmqSjEDPQ/lQMniySephbb4pfG21+k
         4RQaZJk0w15vNqj7gqZWLg0lw+k73OQhtRot1pfddSIbanJpvQQ35Uu9M5a1k+Tzbf9p
         7iug==
X-Forwarded-Encrypted: i=1; AHgh+RqrV4N3F02zn1zleE3IYWNyfiwwpkN1/K+6wIA6/Ai1+JjPPSfUVPNUxekmmvWDzT+aJe+p4FuKBmP6aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZxbtoAv90ep1rGifMF0UjYFHfTP2OapcrZpq/sWkyADKEpNY
	NT6tBSx9zpISwsluENyjBfCEzlzU5rcavUb+v4UEGNZU2RklTZ2j99yXNxMQoVCoCKl1ADe6aOv
	sI+LZzeUWTUeOLrmO21c6dnyebFBNEZf6tr9+x2B18tkfo0nUvWXMqOqctCUd69CUbA==
X-Gm-Gg: AfdE7cl/3Dqt86BcXZS/GGP/vfzUu7WHIPS3+cAwJD4DXkH6NEmiK967leKlFkxebON
	jhvk4DqpZ0IDgSWArMqN+W5FgCoxzp3B1tf4QQDEsls+V6IbUrrBmn/ir7txRBuRdjZ1uZvynEy
	/51zOFg5LXA+HB1aOdPdawXtPN1/uL4xA1gUv7+tU0Gj8Kf/iIHgxdy5o5DZr4PdibcRPOu0mRb
	h2a+Gk0wfWl40UXOv+BoRSpYjBts59q+atf/t/PexBBc2FXSFnAvgmIx2HGmroI05ER5otDoW80
	qadBNynKjQTkR/beYfihzPtReqVm7jOsxEGcXp5ZiLU/xw1VNr58zopirw4MCA/NH96Gb3MZ2BF
	nOaGCTzHM1Lxj8L5QBlGnKr7ZkFIZrgqTl78Fjg==
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369405ad.37.1783280458794;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369145ad.37.1783280458256;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 37/42] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:13 +0530
Message-ID: <20260705194019.2565498-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4ab34b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/mTdz8if+zbS
 +9ZFu8U9KAoHNtahikCY8YeBr3BrvNgtKg2jjKkwcCq27jmryPlP87CtroOoWt+wgHc3z+JblOE
 auCkkw/oz4CETUqy7T5GLlnIMcnO8mKZXmfuktK/7W0+NM73mfzinSIA+Sr3sxw4/zSRGbuk1lG
 ZdxoClBKgCpHc4S3QDGPkMk4Bc33A2SisO31VIflGubw4GExFHohgWWs3N3xh1i5cBVCOFOjEWe
 Th2TbP9ZuczENCkSwkQN2ooWNDnG0vEzzs7sM9veWua4xNjeMmT17pinvuCxd17UEwx2uty6Va8
 1OV0VbzV0naGwP49qAK01LXGpt31XglcyJk+RC+KkCf9BhrBiu02++jFpGKEJYLKvduIznzbyqB
 nEYrggQGYG/Sk9Lo8Z+DApFrkJnXGToj3S1NjkrRnkEtXRj9SKJ+M5XZIYVoz3g1GEQWvnhJiA/
 a1kjZD3XE2ON+dpX5mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzpX99enggz4w
 EobDBzowF37ARxgAjqSI19faWxkVNYjl15Bbhj+YZg0L4CEb3hJVr3lWoMcWQK0fY7IqGmS2xpo
 8SLoow5E4n6rh3xD/rIk3lf71x0Y7uQ=
X-Proofpoint-ORIG-GUID: qG3GVXjh-FgG91gK77NHw2VvpxqrsOmU
X-Proofpoint-GUID: qG3GVXjh-FgG91gK77NHw2VvpxqrsOmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.53.0

