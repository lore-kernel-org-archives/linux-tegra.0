Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7537F30E
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877561; cv=none; b=pRr0LtyvL8aRacLnNKvNfsMSzErwSgeykF5S9TiLZr1NcPdMTTrGmscBkr9BK7ov6566JJCKV82g2epHS0DgURdS2eI0ZuUf+a4MBbxjuETzB/Tfg6FK2Jd9E/Dtq3mIGMklUUkFX9pmIVWuOzjhx5tR5Ywe1QlqTWtQBn9G1q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877561; c=relaxed/simple;
	bh=TTQO6xNT4+ZFAJc+p+fBQr7kWhLYOrv86Pelwq77JSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZarLUAVuXP9p4bLhCJyq3s9feFTynJ1UoTsHE8thzx5ZZNlqc8iZtFax1WunmgNiDIg3RuL4VTveZGmiA+e30PqzEtNxQqnpkVXRVBass8Ji0nyMbC6wCSm4LJsG4Ggh8AFmRdwCPYH3gnMUnDxzV8yl4Lhuw9pBZmuJc/QMis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npjA9KyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCgiId2G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npjA9KyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCgiId2G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lUHW1510162
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSSKfbrDBA6kV4AouFVgN1sSPJ12hs/Z0PrpD062x9E=; b=npjA9KyWxrODPK/B
	2ZcuckTlwC501EqXnW/9LDzom5vgcQImmEFJvOxPrufqEbeT51iBFz0+Bzxozp3W
	HcXNE5VPB5IuL52g9BKF8pzsGqdCNnQW/YE+AZ+GDO9iZEpvwlmsQ4I+Qi7cPYZd
	JqH6oz+3XTx7d63Z1pPW/kQ5BL7rlOeYf8ziWhPcrGQtF2NkKnoJoob/diBio7y5
	pJ0Cv6SlUW3vom1YBlNvecIQX5O97gQhll+F6562kd5MGv4XZhv0iZbQq9Ai+Nqu
	AiiBa6dWH/LVxYsekp6lWmN0+YlJsbeAo/3eWfnhb2ZSDIS1N1msjZ35125JiW0X
	EKCwiA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrsgb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacf17c7e0so2475895ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877558; x=1785482358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSSKfbrDBA6kV4AouFVgN1sSPJ12hs/Z0PrpD062x9E=;
        b=aCgiId2GxPhKSdoSvtcMeRPfJM+n1HacI4+nk3UynUcVTWd7EjUK2UUIODICQOr0LZ
         nPGoWfmCtgUaNvothRHwQmjlrjR9a699fpnvun+Q1ceKs1oWjTpxgIH68LIq6giajgra
         9pD3BfRsTfYq9U/fmv7VQ2P1t2KzfloayV4m5puAGUq9yeJxvizdyGzN1/YjZ608AXcH
         hzc0AamvGDTJU6j2Zqgd2xTrnn/Ar5d4yU/OGd5nnWEFIGIN5tv/R33TnMq5PW9rgCb+
         8XERRomUwaevW9aOBrjPC8fsctjxf3ea3S5r/D7/z49xZYDlWy6Y58682n46lxNQPu0P
         gsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877558; x=1785482358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSSKfbrDBA6kV4AouFVgN1sSPJ12hs/Z0PrpD062x9E=;
        b=lQn7TnYwjYa0NRAihQV2ne4nVb7T8h1d/pUIxP6pzqvgH6+SJGdG3s+2tumhrex25W
         ZpZYtwtSU2itLqm9Q/+13D32TDi3SJf92WiaK6PZylSZfrmr69oFkbW9BQSVa1UHsoS2
         g45u+z0uUe8VTp07uaZnlXdB8b+mtQYKZugPBx/HmNEw8FvWFvyS4jmPvXJ7bDBR0Dqa
         lgJhmikaU+fE9emmqOWCx/RBoJiIk8cw6Jv4j21rzHB+wJ3tvjl6Aie6yagU6OQMtcVm
         lK/WTpKg7oWEbpCrIYZDsjngA0RHavMZG1mxANoo80Q4A5eBJXgLBL5v0Je6UY8WD17Q
         3HxA==
X-Forwarded-Encrypted: i=1; AHgh+RouaL94eOsL/BbTbxI/qTuuPFrdJvLu2e54RrgzFiaRNM1GKxiJQluXgwzg0/cc+VKprrHpIguuRdAx7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3yE/OaOcLwDJjVd83dNwHv5uqGyKXQ2ZfmpHM8QMiQbcMuATc
	gzJVxxYvR9inp5uaJxzR+Q0g5Y2o6Ey7R3i5MfiWP0BuO0i2KwWf0uBT5Tpqbe964/QxfHUo+sy
	3rzOqKrt/YmAZcvCPbUAbqOAx6huc6ZtsQvbYska/j+qHHPNPh9niKSZD2NE7vE+s+fXYCSDZDw
	==
X-Gm-Gg: AR+sD12LlEjbHHjEWqEQjG7ttyD9rbq+3aRVBPUSJGXIrBb86L2xKGr9Ki20UNfw8MB
	PYXR0r6JXE9KHJuiQpTzIpchNcjt/d4al6/H88fOWXvpaK6FXED/zBhgeP24Of6XgS2KqyNWNd+
	uV6FKjFCBG1YmKtPxj5uXGiZNlKkcfoLxOIoqDGfkJz2GF2kRHsJwr+lX9twnL+EoW+217zNNew
	fUJQBPEUrXIRnJIAnKmDFL21HTadkzljHaw9+BqoXq7coL4CYlXfaGSTpB0Xs+/qkm0EwgUgN4B
	WbtBO5rsLpbO/IbzT/kNUPY0DrfwSQQLw/0hGlatqyI/lTWBw9nW4DNMm0pgtn3zO9GfOjXTK3J
	PDaBt/C+bYySzpAbTJWomylv5Oaff8X2tInBgkumgqOEtjucEFG6+5FgTEsTpZ1li8vN8XlsyL4
	5c6QKGrf7+PDr/JXZVwP8XQuvkeq0=
X-Received: by 2002:a17:903:1b07:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2cfa6c567d6mr78816155ad.22.1784877558355;
        Fri, 24 Jul 2026 00:19:18 -0700 (PDT)
X-Received: by 2002:a17:903:1b07:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2cfa6c567d6mr78815845ad.22.1784877557972;
        Fri, 24 Jul 2026 00:19:17 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:17 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:10 +0530
Subject: [PATCH RFC 05/10] PM / devfreq: Add new track_remote flag for
 governors
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-5-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=3635;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=59NPtGqSBHQF7ZdSEQTKlbhHTzbuDIOFGJTtQD3qeLM=;
 b=/Y1gUkrABenFv0sYOLB9F9uLwyaV7q70opsOpYpYHrxm90y3JRI9nU8of7ERTXbtfg7yeeVa5
 xlFxLBvZvm/BRmgU07gxLL3ol3/t4Nk/JehrI8/G029d4rfFZ378iDR
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX/2ApEsZtWsN6
 srGzJUzZSP90THJhde6vBrIt9EX0cTsyb/+onxX1aiYhG2UHy3YPdPlF/oSYngC0yEnCMaPsI3A
 IGxNbi9JoRcUzjBt+TyBAHPUl8Vgsfk=
X-Proofpoint-ORIG-GUID: DlY6Amt0QSGO-ObluZ2bfIu2jv2aGggg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX7532H8r9YrU0
 y0dFI5uzMCKRl+6NZvT4CGTucLuhN3uAhpLTrrRD8vASjgA4X7SAVLr+KlzqoNWtwC8S7zlHUNp
 tBYlHtFcLyCoLXd1gXNGaw5uVLd6KKruRPxZEEPJwDgSKyy2X8Ah13e3TiwIX7inlv7yy81Sm9F
 e9Z9jhEzlnmbXBkAaZM5f2/HgaG2HhoOBy0lcTyM2DwdtKCk/z5HutNtGDXFKSceDsLde6zeXpR
 EuGs8CzSTgppRuaxzCduo/v00sna8UZaV+OOxZt9GtrQ+xB6XHJe9tn2bWXcd/K05yyOoniYICA
 2LbyjVuLLf/PFIXBxxdO4ufCqpfRnrFBpb0LIYFHORxq7d171NmgdVWBAi7Xzvhtb9jbyd15bFR
 rRcCB/ryyS6HtS1UkkqmgwcfvWanyy0ZWcjSs/xIuAY8BFWlzicupQH1nc+lE7lT3qCB2zuiMJN
 fehQ0Fx4vipM7Gf8mPQ==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a6311f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_Sn8c3TY04LLovrI2V0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: DlY6Amt0QSGO-ObluZ2bfIu2jv2aGggg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Some devfreq governors need to track frequency changes performed on remote
devices rather than driving the frequency updates themselves. In such
cases, the device's frequency is already updated by an external entity and
devfreq only needs to keep its transition statistics and notifier
subscribers in sync.

Add a new DEVFREQ_GOV_FLAG_TRACK_REMOTE governor flag. When set,
devfreq_set_target() skips the profile->target() update sequence but still
emits the DEVFREQ_PRECHANGE/DEVFREQ_POSTCHANGE notification pair and the
devfreq_frequency trace event, so transition-notifier subscribers (passive
governor, devfreq cooling, etc.) and tracing observe the remote frequency
change exactly as they would on the normal path, and the transition
statistics are refreshed.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c        | 21 +++++++++++++++++++++
 include/linux/devfreq-governor.h |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 2f27a239e34a..71c6ced9e4e1 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -348,6 +348,26 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	unsigned long cur_freq;
 	int err = 0;
 
+	/*
+	 * When a remote agent (e.g. firmware) owns the frequency, skip the
+	 * local profile->target() call. Still emit the PRECHANGE/POSTCHANGE
+	 * pair and the trace event so that transition-notifier subscribers
+	 * (passive governor, devfreq cooling, etc.) and tracing observe the
+	 * frequency change exactly as they would on the normal path.
+	 */
+	if (devfreq->governor &&
+	    IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE)) {
+		freqs.old = devfreq->previous_freq;
+		freqs.new = new_freq;
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_PRECHANGE);
+
+		if (trace_devfreq_frequency_enabled() && new_freq != freqs.old)
+			trace_devfreq_frequency(devfreq, new_freq, freqs.old);
+
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
+		goto update_status;
+	}
+
 	if (devfreq->profile->get_cur_freq)
 		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
 	else
@@ -375,6 +395,7 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	freqs.new = new_freq;
 	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
 
+update_status:
 	if (devfreq_update_status(devfreq, new_freq))
 		dev_warn(&devfreq->dev,
 			 "Couldn't update frequency transition information.\n");
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index 2853f571dfdf..e4f7b6cb07bc 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -33,9 +33,14 @@
  *   : This governor is never changeable to other governors.
  * - DEVFREQ_GOV_FLAG_IRQ_DRIVEN
  *   : The devfreq won't schedule the work for this governor.
+ * - DEVFREQ_GOV_FLAG_TRACK_REMOTE
+ *   : The governor only tracks frequency changes performed by a remote
+ *     agent (e.g. firmware); devfreq skips the local profile->target()
+ *     call and just keeps its statistics and notifiers in sync.
  */
 #define DEVFREQ_GOV_FLAG_IMMUTABLE			BIT(0)
 #define DEVFREQ_GOV_FLAG_IRQ_DRIVEN			BIT(1)
+#define DEVFREQ_GOV_FLAG_TRACK_REMOTE			BIT(2)
 
 /*
  * Definition of governor attribute flags except for common sysfs attributes

-- 
2.34.1

