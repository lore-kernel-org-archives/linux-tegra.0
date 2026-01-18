Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341C3093AC
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759829; cv=none; b=u7Bv8RWnii3xjJ/aW6i8tPcHivnrclZtW9gg3d8ThaD8DbCq+WjRH7iAH9FwCjLAqqP+LguLF883F3GKajx/eFgCH2Xbj9Hq6i/oAbpGAeRkgEWw39Gvu1N4SfYZjkV2TfdPzALHyezp6rFGvpjfkXSnQB0ipK0ADQ4l/+MvXXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759829; c=relaxed/simple;
	bh=xHpKv/L+LPsJ9X96+TG0TkMyLzJ8lmjqPrbjckpJnLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6Q8qqx84KPgr0+iTJlYb4X5HlOyt2gKjnWNL9KBiehRFP4AMxBJXsDyiW/w4a78ddA5veo3szpqsZc2W7Sz8J52XZERVIJE6ZTCNe0BJQ+fBdSfKePGGCQgN8SMRHPnO63wxeBi1HtORNZ7XbSTUfgiP4ijsou3d+fiw0EUJA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6DB2YhG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cf8PPIxe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6DB2YhG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cf8PPIxe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IHNstE2915997
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=; b=Z6DB2YhGkaLCOu3G
	dvJzrF9MGYlT25uf4akGK2B2DlOvGRwGmJkrWOY3hzsMZ9UZKt9Edh/p9bkWGcRw
	ajdURbQ8XtREwXTXybLIEXImTWYYnGNwOm2JsNhQGOtXgrTJfP0JCqqeKjwLBLit
	VU7tDcy+orbSwYYr5ZET5qJ/GHTAYICe8F06wtnrAv9XQ+ZekQSdskicVPmsod1j
	jXwEuDZ/7cpau5lyz9sJ3ZCk1xTKJju3RqwxrwYerQtNGXL4GV9TsZEV2RI6HFgM
	vUIkGVwtgZpSNCspbZo8ypNikiv8lENoW2W9dQ0qDWgj4faSZJsRXaFDd7Up2NXc
	o7I//w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3q9amx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ad709d8fso397160785a.1
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 10:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759825; x=1769364625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=;
        b=Cf8PPIxe3QExB3ydmvkmtzwX3c6mpxzPB+OIl7jplg3oo5NJraNV2fGtDl+17R2L9y
         rNq2jm0oE6MPZhf9wXWhyQCiMUvn+3ZHzm+7WuGD2y8xBr16e3I4AhN2hFkAWr1K8yG5
         f2lD1EYtx7MlY5A0Prv/fzJpj8tE/7h3XfgzBSQxXbJqct6/oHUCb5Tw3C28b1wI6Cwc
         RN6864dmcIYkKJ9agN4jwQwdLRn2e3M9z279q1L1NSCRA3kA9Y5xOYJX2J9v5aHJ4gVY
         0yHA+FSLEHDifs5joE5+GMmnIX8ZhaHBbzgkCbAPUiw2NoI838eAHGvfk+6AJWfICAO6
         8lUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759825; x=1769364625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=;
        b=hTjkqcveJzCsBvZXvJaQIEqyM7K1rZDjCkAdiY/bOnvniE1AApcuuM1GkIo1UUZluv
         MJ8UZxcDjk8qL6Iirio9T80j9ma5e5UsMUXLSV5myWul1HpglZXQ+0rR3AU9h4WFvl5w
         z2Xn8sHNwZdATrDEGCQDbD3tIWofXLx5V4lVheX80a4I3zBPgvLxY5ZNo/BCZR3pcdTv
         TMmexiNXqgdcIBOdAIp+wlAR0k7lPK/X2t4Z+1+1i5j/PdapgQnQXoRpi0jXAaZY6ipi
         uQSVPXR/6KbX2iO3dqgquvxunwmNg9+VLZDdgTEBeoHW8mIDynh0eJAnem/lyqlZnToi
         gGog==
X-Forwarded-Encrypted: i=1; AJvYcCWJzzaZCbCqM+r5kfiWW4OqkMwnkajWdoX9OWQ/Cq1ResSTFBpE5Cx6x5Nc6DyOMjqpE1M7XXDkD8wSKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUJIJx0t6zS4h1lvY0kP34NvWMExlLdA3Li5m4f/eqBH8BVmY
	PWKtxwFyqFIu9HNFXIoatFrornP2Oiv6dzceiXo94kHmSiSHpWN88BqPSXoJh0X/xNXreoSlccD
	x7e/f825/npd2gZmX2XjcWubJHl/ng7e8xHFOmgoaRUhgt4JtbSsJYbihjpsHDxduGg==
X-Gm-Gg: AY/fxX6SfdD1robxXilZvh5zYM6T1kYvdcYWoOFJNpetipBbgsQkbjq0hjPmaHieCSE
	6cHIl09Baz5i6kfW0BXLes8eMcvZyZvEM9o1rtoeLxyTZ6MxqFaEVp2aIzzuO03kBS+U04As3Cy
	r+m3HWQ7qqavICHh6Z+K9pLFmew/wWDrlFLE+SsNOq2iBN+0Zbw/tcP/LaD74rysh7jZz9YhBvN
	eWGY/3BF+ZZHH/kBEomyAMHpFLlHo+RfpFhIbE4wAPO9KKxcPJqjtJGoxSW35pUCjOM+p2clfpl
	Qbo63QV9bwfefpQsWjlndtnE72MJwOt3yckPUCmvq+VPqRMYhY3YKc1M6lS1vl76C1MOXSmycXQ
	4/XKF2eHVNDc4OMn6y3nRKZnLPii4R2C49Q==
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1679914485a.42.1768759825061;
        Sun, 18 Jan 2026 10:10:25 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1679909785a.42.1768759824643;
        Sun, 18 Jan 2026 10:10:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:33 +0100
Subject: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xHpKv/L+LPsJ9X96+TG0TkMyLzJ8lmjqPrbjckpJnLU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH2V7HCVVZQA8nE36OlRFJLPIeFm2jrQH0SA
 voGEok2auGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9gAKCRDBN2bmhouD
 138DD/9yYDuntgcWTSxWPvfXFutn8XLNtbjiww7N0//+LCDsOtjjM92dz6ezguNQS/QHM98IHRr
 SF6pn5H3zt8atlHdhCPpyf3x3oKRSwOS0Akm92SgBtUpRXGuMiq+7O2MsLdR/tIUF6gTEgn6yFV
 84Lk5zDvgwOi0QlMHAVQZPovb6h/vY837EVCDSRCFQDUTEAR7na7JozMG8tp0VE0mE7bIWwPT/f
 v6lwP4dm5xYRh+B6HzZmHXrpwVUi9RbgeRK/PNZNadB3uz62KT1T0IT8R9nZUQtX9G4FMRwD3xH
 P5t30O/Hz6it1xvrvw1Lu5f3+AySnjjr6MZxix/zVD9DGKJE40H8HH7zTSSsREL4FwUU8zZS7HX
 dALPTXy6us1q2unNwiDi6kI/AVXWCCZ6sGl+XxvmbSBYYbIWREh+WyDt22jBLH1KeIKQYb7jH64
 SyxqJFMRWZNJsMGxf5H4BjA+NqW9skDWnXCNH2FnpIxnCtdb32i8yyU24YQcB2qy+UqVOj/UGme
 M5VDHJie/HU+5EggRTKsw7A3HWxLO/5lpq8m0Aym+vl3+6ldnGSTLTfSdS07z4/0Eibgnw8tPUH
 +vVzE2zpO63gAjhez3qAdbhnW2A7TSbUiCJyYbYcgetBXMa20Xnn0pQEThXHPYBZKIK1KuGnnf6
 /vUyVHqLHNNxN8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE2MCBTYWx0ZWRfX+vzxeugcLrkd
 U+cDickzvtpBn5f4iAqS3PpbulFo7cQ7Cd+BJn2eXN4ob/1Q1fzUO1Ib0ttw1eB22IXe5ZDXqyu
 IufLm0ppN0Ah6aKTS+fYgl9xuZSVWMGU42VMD9+vBKUyjOPyC4p9gXecA47sYo1MrPHjakPnIoG
 4n0sI2hJpJl6eo/iHlaMx/ELFRGxwekVblQuJYsFUli/4tD2ex5CtzOj27spOKYOTajvEG78HjA
 qqWb9KFGZJiCQTsDVReWtagEgJmVM5DRfJsQukQgivfEzGo/R4LZMxSIP+UlEObebrIsvG1dxgQ
 PvUSRheBkS+wdD3uEjjGa/w8oB+9O3PnKwrr9M3G9/M8HQqeqM8fOgcMMtyQXbaUR4NFfJIO0tG
 hvgvJ9D6MCIwXfFfQKK9XNCfTnpjFxvdKcFMMIU3raw3tq7JeYyB55fiJv7a4pSK6JFOZqxrM41
 ty5TwwcQ2HHWgrAI12A==
X-Proofpoint-ORIG-GUID: vZW1dt2JptfdNEjjA8p7cQ5SP9jiy8_R
X-Proofpoint-GUID: vZW1dt2JptfdNEjjA8p7cQ5SP9jiy8_R
X-Authority-Analysis: v=2.4 cv=dPurWeZb c=1 sm=1 tr=0 ts=696d2212 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zo1y7j5tH0XFdPBYKCAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180160

Simplify error handling by removing two mutex_unlock() calls with
scoped_guard().

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..bbe1cf712965 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			 * The lock makes sure that either gpio-probe has completed
 			 * or the gpio driver hasn't probed yet.
 			 */
-			mutex_lock(&bank->deferred_lock);
-			if (!gpio || !gpio->direction_output) {
-				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
-								arg);
-				mutex_unlock(&bank->deferred_lock);
-				if (rc)
-					return rc;
-
-				break;
+			scoped_guard(mutex, &bank->deferred_lock) {
+				if (!gpio || !gpio->direction_output) {
+					rc = rockchip_pinconf_defer_pin(bank,
+									pin - bank->pin_base,
+									param, arg);
+					if (rc)
+						return rc;
+					break;
+				}
 			}
-			mutex_unlock(&bank->deferred_lock);
 		}
 
 		switch (param) {

-- 
2.51.0

