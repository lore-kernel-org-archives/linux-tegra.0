Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAEE39C648
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404637; cv=none; b=ihpYWa4L1OdCgMzebWgovB12GLpuRUHatr1mOQLuoTyoYw7PDizdkQfu7emgXyFth8uV4kT48jMapBJvfZSZH0wZo5hN4RNEoBF338Gy1A1/nOOf1vUgODmNkR/U7zA8+9lygHGE+guTvHSCRx+raXItUbEaVraTDARW6P1OIu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404637; c=relaxed/simple;
	bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGaWkB517SeZby9f4UXn/BFkj4aowHZSf+rhh/mXHvsgvmw92tP1GTNMsB/i+M0N6CwlG1V3oYG7rez5UZKp+jUutZSbFEn8nz6rw8jbCfCsQeJXCQGWMmDsLteaEVfHjwSNYSBcDEVrG9zbxYF2EsWdZrXiErnoUsLwrpgc1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6kkEHcw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFaNvOtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6kkEHcw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFaNvOtN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB2aWr3416162
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=; b=I6kkEHcwYHnmLqcC
	bCog3zsSNQt83q1g15rqSXMAHoCS6ayKBCuK/od57mJZRARRmEKWePBZ++KRDRFf
	nA/wQ3gmm9OmhEdA75fhn5wCblufkPBQS4FPjA1MLG8XjHUW5rpj3ThuLbR54inW
	ZC5Wo+bUgahzHKYqqo6mScjg1mnK/iL0PhMHXVhGcvGY9zbAELUEeRa23OKCvh3x
	urMzRY5AmgIdBLrvSeX0LZzwdcJr7L2+2n1AHSumMEuqSkZsHx4g6FgrUQB+0/FM
	xIJf0EElVUNgq68df0rWEdMcPXSuVq5wvOXdMLZwdMvExgqGYam5JXWk6HI6mWVO
	XotTrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x2gube-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 15:30:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52c921886so197331285a.2
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404634; x=1769009434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=RFaNvOtNfeWXdJJi/fhkzJWAgQg0baqtTYYa0gPSxPv4nyN/QK/9XfvirnbH0OCEJj
         08BJSrls4RiUv5NtiCOTFBtbQqHMY9w+wXkmf+17Sp0bilAKxnbN5QqZ+XCguBhoMG0f
         3yVDKXR+QMr39+fW26KlhrBel67r1NhQJaVmp7YT9OXsHwFBMDuljmC18+baZbjzZMqg
         OIm6XWXzT5p12QKsCHPF0VHLRb5GvBtbuq9HztgibS00NlW0m1PWedrD5JkRaw2T+AIq
         8C/sofa9/b0rmS8572P1dhm72NGXyLkrYAn4t9RZ7RgJ0Toa7eHoNoyUbB1wSnFTIAaK
         NK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404634; x=1769009434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=aGFqAh4V6zq69Yc0olSQb7m6vSY5vGKqOaMuGe5AbPOnfjhfPKY7fft/2C+BwbyDkj
         FaRVm88RYuCxvwpprW1eS+H4VHZ+ONeuj47yDge5HMZ9G5zW+JL70mit0taL8KSrUqot
         PjZ7nVb2hpoa/Q1LzIDUbktAHhNW+HgfcjZr+ImDe5xle6+nW9XbXAEGHGzf8AuMoG6Z
         xW4JpZ5RBvGtKV1ibntdytFvI17rIrC/A6rF8UBwwdjjpChYBZrUxeNpDmpscZx7kSOk
         PtxGzduNEvso1xtPqCAfRTJQHsMsEqrOfPS+2AIfDgUxqrwvPHaX6lw1E+sZPPXAIatH
         HZQg==
X-Forwarded-Encrypted: i=1; AJvYcCUH793LMZr2zCEUmd/32OSd4/STejYXrf5bpjlSe1tWtEPJmXC6mzh1fO0U/YaDlQrgW1PfoSS5U54rjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1NluZPFUmUhGc4OESmVyGpw5rRcZ1dWtP0cTQYEohs+ZvwdAO
	+sEW/a2+A0tSfg9RLaJQfSSRFHwwQL8/fVSqNc2lcO2DTIsMMCor08J6SqM7SrHLucVffFgH3Uu
	x0qqfeKniE4ejKnw8CZL6a+wdx92bu4HDUC510e88HEqMCntfmQXgQJhdrICG0Gcoxg==
X-Gm-Gg: AY/fxX40pWpa/O0lM/tt0sfy5qhgYFkBE1rQ+b6DL7vvlgvhlsVfg+jXwd09FBpT2j7
	An0B5YyaFTQZKuJ6JuP1MwcryU6nQ9K5NuoNJnhb7N4UDlVjJzkkWhq/GGMt9l9MpyrbhzWs8pe
	PfJ6dobZCBf8ZW2osDwMMd/rOPs13Q8J5BBxJNNFfUfnoYlD1tpz5wT060BNQMP8DMvx1mNPdby
	CzikJAFNkirb7RWyel6OYeHXg8DZXl9t+hVL4WInZRJjASr8PoMN+4YVmvyRSDr9Ngxv98vMTZG
	h6RlmM/KXCfd3uiG0NhMNtXLLX3NmF6QzxpQUJH8z1gHQqdWiZ8H03idfoe39MLOkaP9BZj29zg
	MKlCCLFlhc9Sskd6B1faUZsgYIen3iVwthA==
X-Received: by 2002:a05:620a:4101:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c52fb32b67mr343232385a.14.1768404634206;
        Wed, 14 Jan 2026 07:30:34 -0800 (PST)
X-Received: by 2002:a05:620a:4101:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c52fb32b67mr343223385a.14.1768404633459;
        Wed, 14 Jan 2026 07:30:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:08 +0100
Subject: [PATCH 07/11] pinctrl: tb10x: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-7-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aFRdTPwiFL/h2YLFk/n9wL4n9QTdVBj0L6r
 8aUJ0hOsNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hQAKCRDBN2bmhouD
 15BvD/4sSskWeqqie+QnWNfV5njoEI/Dxm+OQU6hvQfAn6W+mFLEoVNCYY1DYciSU2Abpt2R3nR
 +qvBID4STILG6i8SyHTuaGcand6oW9yUTQpRJAmZLQwTU6t5Txha1TR6xku+5Oy8NyzMaHRuJTv
 +q5GGceQij71KHq+iN7y+f2Kh47ZLjY4bh5UEgUQ2UIoWQOKsKGVqFMR4D+URpgUMijJNLMK1eY
 OiA7jL0EBA0jRXolicdtAQTBVHk5WKJIlq2dKAIVzHYv12gvTtggiJd6gKyNR8t5tX+yOxZqM0D
 Jd4RwOyuhKazwxCfXv+bUlaqLfNnifpec2mksBSbNjseAfzxvkqxCt+VMZHZVoZ9mzpRmAppP30
 i9SP4gbwW16v6PBBhPIiLG0HrWfQ9XJ2JH7MYWKjn2JypFxHEA9Db766OZxcFqNRKVlsMAtIK06
 ZKalbIjY3hmQO2RLFsbhmE9qgNQm5n6vPYCORIFGTSFmcIKyeFghhXkkuZqhqTORTVXwOoPyhnb
 rrCyYVw4Twlq3ASI88CvQgLBkMD2dmqaPlhTZ37MJzVXVgufCKwBDhrq6xhuAlBI1vufryly9SE
 iw2aWK83dO7QfgeR/uYrjPKYMLwUfoTt6nq5Ph8Apc8jGok5zHX7/Xej2gYuXZnBbrTOGD48Hiy
 LRCCfd8e1rw2F9w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Rqyx8VRfv_genFPN2YZ-T5udBmUyFrFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX4E8huC+2ZmcT
 GSe/0myzj3r9RM9XZ4CcAGdVi26mE/E4qQMVvyk9PyFxjgelzacocaTsTqPwbzxiCvule4UtMgj
 CPcgctIjkCOubOIh+684rVKUJlCsA/Dezwx2K9V7OR5PsBdCRmNisMHTnIDmE+gm3CuLdWQNoPD
 TpOxV+YZxl6fPX+CphX7OyR1W3mCrIRl0YBXl1b/jVGX72NoEVB1vA+3MJdPjx3T+ylQfn4zH5I
 oER+cre+F8dDyz1Trixta1OTSY9JwMvkYgpjzJn6Lq61fTGoWcNwLwFPG5xp72y3BNB+xIcZhXJ
 BbYn96F31caKT+3IflHY5i4K6xim3H6znrcoXidYoYsOha+rgCiS3olwcn45ODl1Uk7IpdOH/GI
 U7dqgQoSAziem0DL8w183ijJ/KrbYa1uhgd52aSQNgcuKlWBwocl70VguJg0+e6PzqvfHQUBFVc
 J789JTrVHSsm1FgMy6A==
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=6967b69b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fB2tTgKqvhDdEbG57mcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Rqyx8VRfv_genFPN2YZ-T5udBmUyFrFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140129

Simplify error handling (less code in error case) over locks with
guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-tb10x.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 129fa51d13b1..3f581404a9b9 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -607,7 +607,7 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	int muxmode = -1;
 	int i;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Figure out to which port the requested GPIO belongs and how to
@@ -642,7 +642,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 					 * Error: The requested pin is already
 					 * used for something else.
 					 */
-					mutex_unlock(&state->mutex);
 					return -EBUSY;
 				}
 				break;
@@ -667,8 +666,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	if (muxport >= 0)
 		tb10x_pinctrl_set_config(state, muxport, muxmode);
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 
@@ -695,34 +692,28 @@ static int tb10x_pctl_set_mux(struct pinctrl_dev *pctl,
 	if (grp->port < 0)
 		return 0;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested functions.
 	 */
 	if (state->ports[grp->port].count
-			&& (state->ports[grp->port].mode != grp->mode)) {
-		mutex_unlock(&state->mutex);
+			&& (state->ports[grp->port].mode != grp->mode))
 		return -EBUSY;
-	}
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested GPIOs.
 	 */
 	for (i = 0; i < grp->pincnt; i++)
-		if (test_bit(grp->pins[i], state->gpios)) {
-			mutex_unlock(&state->mutex);
+		if (test_bit(grp->pins[i], state->gpios))
 			return -EBUSY;
-		}
 
 	tb10x_pinctrl_set_config(state, grp->port, grp->mode);
 
 	state->ports[grp->port].count++;
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 

-- 
2.51.0

