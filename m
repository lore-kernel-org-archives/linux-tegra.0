Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9ED2FE071
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759813; cv=none; b=q9Jhjx0lmEO25ZojJFOxC8YDK2T/WkPNJPJzBzfDeMuQyVWnglSwFHytz7PXXK3d1xT4desTxiIvZQP5TrggO8BhGorkfnOkxofK7U4677YCk7FWoQRthJN8GWiqBk+ouFW9RfkziFhjwIlYU1zcSEOb77ZwvfQlwtDELycdvwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759813; c=relaxed/simple;
	bh=K3uQDGZFV9ixSLMAp+XTCn6w6PMJReQbBttCFQN0F/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnLkjHsa9nHxR5Mg8luYiJckSmg2wbgVqoweiYudbFFflqzcs4fflWwji4ufOsfd3npHESOs5B1FTLPTkeCG8X9qU5NGYj+JKQhUPU35be4GIm5q51zmN1zrcvkwgULPjNZcHuW7HX+ZvbYIfTQfYjEXjE8zPHcUUyhk6oZCDXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XM0kU0IO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6jKdIww; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XM0kU0IO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6jKdIww"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I4tVqQ1454370
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=; b=XM0kU0IOuobH+dzF
	6qVL0KuB91DXq8pk+r1qmhwUkydjBo9HyCAY1LKdpuGih0pp9iKU6HVfW9HWLFxz
	R3IvKRlSB4lkLTBq6Pbr+wtIL33Q2GypI40wf1+SQn+5VlMc+q/3g2J/WUeCGB97
	1dnPHYWjD5O3T1uXciWGtbVV3Wo7snw+1aYn8bU56XpkaX0IxdQtyK/Gfzq2EqHd
	49dgs7MxLA2i7SGKCaYTRZEYUpviIKBf427BxsincA+Rj5kL4djRYs1NICEOqLuo
	Xf2CJ7rrUcH9mKV8D8qc8HG7eIjsQBCiUZGE8GGMvx+q81KgwIcWKIef2/ofx/2C
	kdePBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3q9amwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 18:10:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd4cca2so937700685a.3
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759809; x=1769364609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
        b=Z6jKdIwwZNqUcNHj7LtvEF5afSbpN4IKlMLhUbOc5X5QQri4FiuaMHjm5BaXHZOV2B
         pHfLDdg3FT/Jtl367u1GxZ/S+6KwxX2d7l0uXi6sf+IlAPFTsa4tH+c45BAQV6gAyVwb
         9OUo7YUtx/VTmowY4w/nzq8cc2xKobiT1Dj/Rw+wzQF27NK97Ajw54H+nkr9t+5MokRb
         sVFIK610NHfZ5vDYdr05e9UimopJu9Dq9JMBN5AgbgpMqtYqIyCpJ9VuGixUPqieLvwB
         jXqYSpYwjkrlELCw7i/IjTNtZGssKKuM8AwJbz5plBVKDnWjK8A75KARlxeDABFrYXyY
         8FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759809; x=1769364609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
        b=X6+ZI45XSE84bpFrehbvv/QV8H/gnmI+yqIEEKi9etJwikFBohUs++aEi8z8An4Jlr
         zgZUT/Dv47pXU7CMBEcx4GdSkUZR/7hrUcur4mkq1N8YWkc9MlWJm2lX0vOQlXPm8Dq6
         Glp494Bm6l0kr1nZC4eT2QwXUjk5ewO99VPufb/lw2oGaTqSbj8cf3+Dh97RLRZv8Z0a
         Qh056lIbTyebh1kyh3k5WN5McyWQN+phFbdpc4QvRcAo0IJkyTooEi5woEmFSTnOLe1L
         18UR9o9LdJHx6xkc5DfXtx8Nkzj5EAv0/GHFz4Qcz0Q4Eg6Z5J3AVBZ/Ip+SOXAZGthd
         9eWw==
X-Forwarded-Encrypted: i=1; AJvYcCUBsniZm9heUpzNKU08X8TYcK2pIkYRZ5rHQydu7EHOK5PtkhFs5vrPtR22ZRZEMIoPxKt4Bzkoc3Kxbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUNPDBIq7hPeECck9Zq9aKheTTifrFliUEbboUElnjFXx4VWt4
	IRUjaDNIx5uivsVKz9P3bM1rKq10GlkCGIJqgZrncJFEDTo0u7vCDjGUj6dfz8xwYk5nnbYg6bN
	KYaj+S7cIYUAydgzpG2KnQ9snykl++t1vSbhyPLWjSYCIfA0KnGLb7eFauwHCbHx4og==
X-Gm-Gg: AY/fxX5a4lFTTyP9yJMQjGKUV4lmR2fdtPymzL5S2E0qEvURUXdyreRHsyaBrbTdZC7
	qvDvnhe4uq26zF92MhDxjN8fxoKhCyM5WWKgG8rliuIfZ/X+FuS6k9CiRnoUxxKWQj3Wa/X8oQL
	vDWspRk5VLE2g/z9gE92B8uMjhl2oq9xWOUKMp4POKztlCbD1mPuKH00AxKM0RSe64KhV3aQM3V
	e15P8zBLy0wa/3RaujkzdJ0zeDF+RXRCoAXfsvdO5YNat4QyHjQBIcRYvn+elGM/+r3VOUHbTCx
	AZG5DdeY5SEbqER79cFC835MSHJQjvI2iqPMD4c2cpG7xNE5jpCyhCPJcqe6ZyjpJN328OCo/8P
	GdQfdIJmhL7n+gLwVvcD0gRjB0dHL20cIdQ==
X-Received: by 2002:a05:620a:2550:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8c6a67cc5c8mr1321767485a.87.1768759809391;
        Sun, 18 Jan 2026 10:10:09 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8c6a67cc5c8mr1321761985a.87.1768759808928;
        Sun, 18 Jan 2026 10:10:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:26 +0100
Subject: [PATCH v2 03/11] pinctrl: sophgo: Cleanup header includes
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-3-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K3uQDGZFV9ixSLMAp+XTCn6w6PMJReQbBttCFQN0F/U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHwFh1ny8ZUBi7E3yd3ZVK3fp/JTPumZY3DF
 DMrk8Bsjp+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8AAKCRDBN2bmhouD
 1xP9D/wKpjBpf0B5lT15hZHuDhBlqt/XMr+dL2IoW+gDe82hyBNbi9Mssn20GVc1WxaEnqmnq4V
 p4+swUeTdryZjhbgxuKOPrnBZ5Vk+8vlzjCsvDVQ2ReBaqMpORafXuxkCKFgclmPhchYQRR6b/9
 /6l9s0yU2jXLJ/19u2o6w1PYH9z2E0bXHvYkcbKNeJFQHEKOlKZO49UNYTddgFA6Glzh2kmdWa4
 iVPwqzZEAbi33uzkLpefoBgD2iQyRwmyLJSxN0ZlVWdPPd6cxYvfPMWlr/a4ZUDTTfEYRZzlkEz
 nxG+54c1yU+jxM5okvGMdms9h6U5n3xWwKQoHYLNd8q0xZXrjBesvQB1Z49IkKfDBFLbkNGgWTN
 tlOUZlfxVOe5kEK6DwJlPpG7xVCf1ey6yUYxBCnqM+1HYMFULN3Q1/C+0jxj9XJZ4mKG4AC63n9
 dYUqyGyPrLP8dKvvV619YhkgqwYnCKINxgT5jTECPev4nLqZjQxG2jWTZtVcGitKwo6aaZAPm4N
 nxmYst0BFODDdlwnUAIbEeTzcSbEfm1xCuURbI7/ir0a83enDBdVx7FY/SLEB55rhRpN63dJLgx
 Vciq6wWoExc3WoBaH3dwBm0ST1MNbLbF6lHxQqvEKQELGhE9JzTjOytPYUjW7UbvNKOMmRQ5Grw
 4tuQ43AnItwMaTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX+mLspkebs5lC
 3rw4fIrcqicssGAx4YhAU7155ZZrjvv6aFwEKPlYr8cHBDePOZk5xrxuCHN8P+GqP6PY8BIn10h
 PkIcV94bayAukV5XANwzs999YtHBIASkP/76IBHptsNpIhWAh3EWcLWolBw9tyMDzQijqrZz0iD
 1cH0wR5oDS+3eVqqGoQRQM4Ef6SyRblFph4wzPZZ/xaFlIedTrzb9uo1547RxeyJhRJWcRlZxrJ
 lsacuaDz2oiVeqoVb2wXpsu3ArHfGBx/l/7Td1lIPDqOmFLHJrs5SpxvCzLPwkShzR0MLqxRzIQ
 TXwJTHfCYYAsruQudfBDdP12CypRjpjj1HG9zln3Ry/v92YO5RCMsDALExarhI/M7CW+XBCu84V
 GJPD23d0kAm/4SG6sXB4cSiCCx+4BMIoQqUG10qf/q4ZdNof0n1nfjvA28ajza6bpx2FTyZYaJ8
 LGCiOnBeF8EBWq+6vBg==
X-Proofpoint-ORIG-GUID: qp675-VVhm4nJwM1TzAXOzWj9MovGJS9
X-Proofpoint-GUID: qp675-VVhm4nJwM1TzAXOzWj9MovGJS9
X-Authority-Analysis: v=2.4 cv=dPurWeZb c=1 sm=1 tr=0 ts=696d2202 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=XMepgddcWT0EFqeyVMQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Remove unused includes from internal headers, because they do not have
following: bit manipulations, mutexes, spinlocks and struct devices.
These headers are included by actual C files, which seem to have all
necessary includes.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
 drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 759c0e604acf..973ab9a38fcf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -6,11 +6,7 @@
 #ifndef _PINCTRL_SOPHGO_CV18XX_H
 #define _PINCTRL_SOPHGO_CV18XX_H
 
-#include <linux/bits.h>
 #include <linux/bitfield.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
index d481973fcf97..1a2b00dde1fa 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
@@ -6,12 +6,6 @@
 #ifndef _PINCTRL_SOPHGO_SG2042_H
 #define _PINCTRL_SOPHGO_SG2042_H
 
-#include <linux/bits.h>
-#include <linux/bitfield.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 

-- 
2.51.0

