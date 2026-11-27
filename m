Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795740957;
	b=5qS1m0UgtFkAOa3OYhohBHz9COee8+d2qK11i2DpCxDyF2V8jC3QcC4teHmE3ttGLYQz
	 Rrc4DDdt0+Job79SB7lH/QEYQK4powbWxydKF+eGchcVG5ii7+dy7kTSyl0IbwVKXaxFn
	 l3ZvDuLaE7LuJccJoCaqphHKkQ/8EcLeqXI48rZl63dzyk4sVB/iQoUeKNeD5mMIO2vHS
	 MNVZXRT5Mt1w5Uy7nZEbfua0w285mj6OcXX2OX0fN1W7Wgd8UDGAFZEgz/RDPRCQa1xec
	 wD6IbhOMDhVwWSAx2ULOHmrdU6KByD0hTYofv23ZBOPHBI6/Ps2xDNaA4kA3XGqQrhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740957;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Tkt1nWHz3EMAf+cICi2fhgWouDhEKP1dic4cU6+kMdI=;
	b=L8AtVJIExvQJSY6vVXaukZh/+cGb6VBh2Yo8mwPf3Jxfkj1OFSZ81iO37YHcAaWSZC5x
	 XlUfe7n5RA4TYYIVayt6kJHFh8g1d4WoB/xAtsU9T9PhAwdocso+tG2KpgPfzGBTC68gX
	 pQtAoy2/W3e/39bcTQcFC2Fdzg9t9C1Xw4Hn+jMGpZC51WK2KLeqIxFHRe9hrjGJwzahz
	 OfRVHwxgC5OClphhf3GD6yVI8UsztwxHSxtcEltRZV50WVKBmcvEzRRR3Bmw4O/IrIMWA
	 xHZKwU+mII1Pi4ieISzJoMz2k4o6+o3ea605DjsEDj8c4aKfT0qXt8NU+CcEcwzZvRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEFUZStr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ECB606A32A;
	Fri, 27 Nov 2026 00:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEFUZStr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795740956;
	b=ng95+eFB+1DwgHTUTIoFD2oRRSHbZDkfKoxsG8s1ArK+4wtrJ7HmtcHJZtDS6A4aO1UK
	 a+pmv0SNCAeZzkpxK9cIn+PHaWOU7TY3fGU1CTU36MwdDHlcIv0qHNW9zF8zvZd3zHpuF
	 FJINn8/yPM6JqYlvrX8kbD9vm/g83S/TsqDAoF15dzIeNmyM4QukW/jqR40T4VagclJ7T
	 qwNXTKYXlQ42Dv/9JBZMWQ9RMrhmVvzKxAsK7OkuwzDf1kA3hinZFX4hQv/pwNz3NJG+7
	 MImeju+37qZuWVPltvtZL/r29vAFu56mQF5UFngPA2nLKqrRAMlB7FP/vv9GLtkqbHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795740956;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Tkt1nWHz3EMAf+cICi2fhgWouDhEKP1dic4cU6+kMdI=;
	b=DyNKjYgbELM5+vWnuqyDeTzamt2/rruseNd/4o/iQ1cutH3eIjxyw6EiwMrFzrcM1ydb
	 y8RsdqX5/kHx5YnimjvTmG7Lc/TwYJ7MsE4I1ze9onTuqUnpnOD0OiydBRcBpHFMyxQK4
	 lErBkxiJoojPjrjXe70m8dYs6aXk+3nVTzmAQJOXjo4ea6sA7O7OY6690270Ji/0iuaH5
	 JjgA+CSpXA9ndIqwy6sgjk8+mZj4yozvUtZfOYD96U3Ir1iFr1CCBnWyoEmdB5cECzHCt
	 QGvNYJ8+b2Cf4aL9hsyFwwv1TLnUjpITXpGQn8HdvgSQvmAwhND8QchRXAvtVcV5yyA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84F751F0089A;
	Fri, 27 Nov 2026 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795740956;
	bh=Tkt1nWHz3EMAf+cICi2fhgWouDhEKP1dic4cU6+kMdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CEFUZStrY9ScjiT1k+nun7mJZ+z5/1ZObt6Icd7EH2a1oAWKMhamhrMSroMy20oOt
	 hfsq3hwyBBKMU8943PhqskSm8ndP9bC5yOcjexv24Kp8CtFJXdetorUiyO+MdAmtCy
	 6rk6KXfPMW0C0ln7ezIk/WXnB/ZRGY936/QIa4yOK5A100okPz/ufWBTrNZ38DbfJL
	 g5jMMp9UvXY8om+fuUt1X1cHTykfxjE3Ji+7e3A3iYrwBDAk15zPBZL9BMQa2NCBSW
	 Dgbui9jrwdZdTT7olUDt7piCvjeJpWB/B1Ay5Vyp/RPToOwM3B2jXS2m0srLngs00c
	 +T9HmnICooUNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1252E4B4C0;
	Fri, 27 Nov 2026 00:55:49 +0000 (UTC)
From: Jerome Berclaz via B4 Relay <devnull+jerome.berclaz.proton.me@kernel.org>
Date: Thu, 26 Nov 2026 16:55:48 -0800
Subject: [PATCH 4/4] media: tegra-vde: reject CABAC in the H.264 PPS
 control
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
Message-Id: <20261126-tegra-vde-fixes-v1-4-fa4a7c1d24cc@proton.me>
References: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
In-Reply-To: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
To: Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Berclaz <jerome.berclaz@proton.me>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=jerome.berclaz@proton.me; s=2026-11; h=from:subject:message-id;
 bh=NZ+kTJWfPnT6RQwMaC2cHK5fnvyB/x7ZJqxE5rk0RxU=;
 b=owGbwMvMwCVmvC9341tRgSLG02pJDNkcV4XTLu15nvkyJMj9wvMPH2b+3f9DXK/EasM75il3l
 083z1x5s6OUhUGMi0FWTJGFtcEwdf4JtoBC/XmHYOawMoEMYeDiFICJXPFj+O9xnq0t3uz8h45V
 s3zXWv40bzxvcbr8aV97gp5pcjzviumMDOfD7tt1uvfsllmpHG1n8FdMt8tp9asc1fv/XszK3x7
 GxgwA
X-Developer-Key: i=jerome.berclaz@proton.me; a=openpgp;
 fpr=058031659FC80650712F9EC233BE6DB1ED151072
X-Endpoint-Received: by B4 Relay for jerome.berclaz@proton.me/2026-11 with
 auth_id=1658
X-Original-From: Jerome Berclaz <jerome.berclaz@proton.me>
Reply-To: jerome.berclaz@proton.me
Content-Transfer-Encoding: 7bit

From: Jerome Berclaz <jerome.berclaz@proton.me>

The hardware cannot decode CABAC. tegra-vde notices only when the decode
job runs, and then completes the buffers with an error. Stateless
decoders in userspace (FFmpeg's V4L2 request hwaccel, for one) queue the
job asynchronously and do not look at the buffer error flag, so a CABAC
stream plays as broken frames.

Validate the PPS in a try_ctrl handler, as other stateless drivers do for
features they lack, so that setting the controls fails right away. Players
that handle that error fall back to software decoding (mpv does after a
few frames).

Signed-off-by: Jerome Berclaz <jerome.berclaz@proton.me>
---
 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 30 +++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 3269ca75593f..e59172d27b94 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -18,10 +18,38 @@
 
 #include "vde.h"
 
+static int tegra_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_h264_pps *pps;
+
+	switch (ctrl->id) {
+	case V4L2_CID_STATELESS_H264_PPS:
+		pps = ctrl->p_new.p_h264_pps;
+
+		/*
+		 * CABAC is not supported by the hardware. Reject it here
+		 * rather than failing the decode job later, so that
+		 * userspace gets an error and can fall back to software.
+		 */
+		if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)
+			return -EINVAL;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops tegra_ctrl_ops = {
+	.try_ctrl = tegra_try_ctrl,
+};
+
 static const struct v4l2_ctrl_config ctrl_cfgs[] = {
 	{	.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,	},
 	{	.id = V4L2_CID_STATELESS_H264_SPS,		},
-	{	.id = V4L2_CID_STATELESS_H264_PPS,		},
+	{
+		.id = V4L2_CID_STATELESS_H264_PPS,
+		.ops = &tegra_ctrl_ops,
+	},
 	{
 		.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
 		.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,

-- 
2.53.0


