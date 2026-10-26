Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013039;
	b=qktixPDJTRdr32+P7+wW5NLHikBSvixvtSiQCfOz+aWQFbaEOuknw3CclqH//vnMnq3T
	 e0OYzVxnqrKZTWfAD4ngHPkT7lFl6pgF1C2yGIHLqeD0xFUTeHcIUaLViZ8LEsc0bxrrs
	 5iV1v2lfFO9nPDsnrZKy22TuzpeuzDLvtObo9fl1hkpUkuoVf7Hdn1RZmH9Yb6RLkR2S5
	 hse9aHAlC7X3q9vkvCkfZ45ghoSlg+9v+KkdFY3dw7bbWZhujH5J52xn53+ET00Qb2nup
	 8Sa3jtVur5/e3YfuG/eFeMQkKQw1fCAkrbOBGjaGWyR5nxYE/YccsRCvgM8+QvMkAbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
	b=VgbGEFp6EjmXAeJeH/Ygtd3xyQL+tqgQWlcxRIcu8ZBxawmqpOKhFgPUSdTBXZAasQq0
	 cpvlDwL5D+vvm8Cv+1Pe052cHHG82HgZsCE8miXU7/iD5ZbuIyxmJSJ1xLsBZ+LahCfam
	 7JDzUqEIp069qx5f6ujPy2RYbcTfv/ZHONuAb/Ksf04ugIVmc3HudKQuLSesOHSo36cvW
	 2sR9Zz1YcdbqbAmvDjIhmMZ0/03G4FUZjJKbPRpV7QcGjvdRi4vPssir7OuCxHbPoodNN
	 omksgxV4yMkN4nUTEh/4CGCqhd74DyP70+TuVBxVPxDCmoZCKMooD1l84ZzGCHY81qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3SeSQGl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSXNtHDY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3860A5BCE
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D3860A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3SeSQGl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSXNtHDY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtX4B1547945
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=; b=o3SeSQGlxlD1ZlZu
	j6N6iic85w2ONYT3wC+38Oi7/6GVPFFUa2+aL4sncrS1hprd3DTTHJvg0o/lOrUN
	23PQliQylUfxjXA+2TxQx2QUzEtkRfXJx0yJJixRVeeqaF9l4l2sV8cQ5OUGzNM2
	bB/7Rx4DfJAoOA0KCBTLzr+nmrQ9bRTnbN9ysYrRExwgSp6VIssuPkjH8d7tXj+r
	c0bUzyKYtzgmm2WbJGRobeAtN1PXuE6AqPibFFQZpnBYYl8tD/ETvypPB2dz0OKM
	ys1ABQ9mswzCSZIe2mn0enVHrO39EpJqwP2UGBOsnqaouJ/BRpt9dToAR58j01BZ
	6egJBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst5eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 11:10:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so631899785a.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013037; x=1793617837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
        b=VSXNtHDYTt07RNmoisb/s5UfeW9cyrmTgFAgX2GtiMjgNLIfc2dFwaTGeoQdNFMKje
         1dxPdbz+74MF94GsJC2SWG+1VgsnA7ttDrJlQjXhtcraGVnFnF38OMRXe6ez90tKukc+
         WjZICaofQxTxrctV/+nAaqfarvUdpgMkQEWNT1mfQTfryjxT6usNjmm2voHYb4EVsbS9
         AxEk4rFVdfxQr4/Z1vifxp5XfW3swxsyVfJwbJ0/SOJ7K8v1zQWq1/VBybH3rEv8zHjA
         0igX6PpanhQhiE4i4udpJDm8yZmPqdITIR3b2D3QNEBNmjDt0gwx/FNfJFiKc4gHgMC0
         8soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013037; x=1793617837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
        b=SQ2+6nLt0xWPgkQPk6quQYLxgq81IHt3fP6aD6EVejS+TwkA4kIe06KkL0nGpfps/2
         E7AgRAyNCy7wKTF4c8JNoyWFoIQ8thkKp8xq8bxm0GXA65sU6hS5m4ModU2mPfb8iY3J
         F4/vNWdO8sVsw8/YAyCxC56ifSHvxp8UUG2uzyMc9sFAQr/tJW494wuPwZlrwU8alivC
         yfY6WiSHcYECQZJr5dHhkAehcTMmU2D6D2YpIbJJLLXXA3Ay+bc+8KKCjgU4eIKRvJI4
         pt+NoPK+zuN3POSmruUm/orPMfj1BRdYYxUNrA4L50idBSUgQalzkSFRCk6WE5h4B2v1
         B7+w==
X-Forwarded-Encrypted: i=1; AKwUvByWi0vZ2UL628KC73aCBrIUS3IbqrTkjRlfroAnE6n3NpFSrA71J3b9Ygh1jvNac7+YezJJfFwoOoDTCQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIpvix5vgGrp3a4cNRhp3qw0655isSNSosLguLPofc0hbgHOKVq
	DWjuETncm3cl7kdbwxaSlouHWIuWEicIXVAhhP37myHOBShnAVcAwMkUPZM6Ovx/sAqlCcl2hy9
	fXGE7+hsmex+4evt3qoundKbUBNVeCqPVCXj8JivwKxosOFD/aFZgLx4SEU72BMw6ig==
X-Gm-Gg: AYBFou1MHmCjvGzentmYrbA8XMLvBhXCATra/BkNUIGdQcXWp98xT2iAFk80/EriZp2
	YfQM4jmpZtpzJfgJDq5O1zlXML1j+dkYmkHwGIuSS6oyJZBM/u1958DTueAecWj7TN4j0Esb3W0
	qz8VHd3KaIpH5bZKZB9tMQZbnhozC2oVFcOmOP49PkdVHjbSiFdLbeQHI6KKtwIEQS4sHQcgba7
	sx3s2ZVhlv3eLUQw6j0CIrQMDZsTeq9m2fRMJD20G7pgrefkEwITV1S4kmqtw6jqljIBJbrwt9U
	JiStEZQxPvSxbbt8qOcF6UEfRYfEGQ6r8/lzQiimhQpgGeoMMh/m23SWWU9Tz0k9/LM2KVX6EBq
	cvkLOoI32FuAa0p3Sf0qKqVRY6xwigTBAkBl1S+LU7m2TQHEkEEhpBYv3wQKiuYsL5eXsEgEa8r
	8qJM2yz3nrxzwR
X-Received: by 2002:a05:620a:4043:b0:93e:c12c:fbbe with SMTP id af79cd13be357-940ef9559b3mr969000385a.75.1793013036689;
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4043:b0:93e:c12c:fbbe with SMTP id af79cd13be357-940ef9559b3mr968986285a.75.1793013036065;
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:57 +0200
Subject: [PATCH 08/35] drm: rz-du: use devm_drm_panel_bridge_add()
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-drm-panel-funcs-v1-8-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L9QBqBm7svfVSs2q4h7czZX0v21Ts82vCTLjVtq1nVg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUJhK2bkP8mANHdq/N3ftOzv7WccIKtt5ZXO
 6tCU0MGEKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CQAKCRCLPIo+Aiko
 1fz8CACOTwp8mMz9LdCKLCqOOuK8Qd2qaZB1SvSzCPhwgD9Ian8Zauhug0X+fdkmI4VjKEebyNl
 6eIlHeO20Qt5hfXfqdwz/ezKE4k93aAYep2wG1S2hfEEQ+crBeN/yowHzi8TR+/iO4f//86+EnD
 e0M8eAye5tkII9M0Iwm0aO0L+FqC2IIBirkJUdokHuBjpGeGSEjleYPkCsElUY+37QjY+2bDkGK
 HbDOBsf0Ey9N/Pv62g7KU2qjneW637Tc1H/TcF8lQ2elO1nM3Pcf8J6NxmyOSPxow7TzT8yi0s0
 MAHYZLVEY9W2W9Fg9FwCn6im24F5casNbP6xXhX5rdBCStUL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX4hUyzS+u76TP
 7o1fjvd0UBe2B73Ri/LkfzttSbr6p/29k02MD6HQowI0vzxmAHE6uh+E09PzHW/D7BFRFCva7Fk
 /lrBZ0rJiU+MsF60M8jjVlCbCmH4uCw=
X-Proofpoint-GUID: MUkSiYa94VhBEPjs3l7Q1xiXHqeHYJ0j
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf352d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: MUkSiYa94VhBEPjs3l7Q1xiXHqeHYJ0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/T90/EcNaIdC
 qLFqxCkQ7VoMQTcw+oAJiFg4kPwbnlf+VmFZSGgzKYx8Z1nQ1uUzTsq6qnRQPo8/XlA+dVoYPEo
 ls/r5u5d0gGfvWgH+4bfQeHgCJWGIF9fT47vAy6/F/zERtQ1qK+0hsL+wIndTyugXPKbzeKq9fG
 dKYT7QsSPqRLmDmo7PzGlbtVcOzPJlHmIPAMTIkVnaZHn6uU1q/7P0JqESO/z8pY9IaKUlYqQ+Y
 fYsh2TTFexUmCg0vjuspt8qRPtWCIWlNs5rHfN2PXQMj63x4wZSdmuJTcPOAnWh+R6gV4vXWtS0
 UfN3plae9BjTPuOgFtbMBUSrE0VQL2FlMvq8aSj+5NQa7ug9CVzzETmn91OAvZNajLNBzqMq9FN
 d2gPGbYZv+5OTRl50y0gQySkGsPveQRPoqx+ufJTsuU5eQ8+m/CvAtNw7xfJNnv+YkkU6J0Y0DU
 +YpGjifmnsMGpDL8R7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index a1b48973aa8e..3ba28496e948 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -112,14 +112,13 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 		if (IS_ERR(panel))
 			return PTR_ERR(panel);
 
-		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
+		bridge = devm_drm_panel_bridge_add(rcdu->dev, panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
 		/*
-		 * The reference taken by devm_drm_panel_bridge_add_typed() is
+		 * The reference taken by devm_drm_panel_bridge_add() is
 		 * released automatically. Take a second one for the __free()
 		 * when this function will return.
 		 */

-- 
2.47.3

