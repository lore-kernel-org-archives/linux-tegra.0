Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2F52AD04
	for <linux-tegra@vger.kernel.org>; Sun, 30 Mar 2025 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743352601; cv=none; b=bsqz7wA/UWtrDJBAJVXh8cwfC6piaVARY51heHPwbNzSUT+fyxXN7Dwx554AvR6xNlFuI64qWLoJHRh1XfdLmTyq7rtcwd7CV/bxeeV6gAsIBWsGTJBqWQ6cKaLH8P0xAtV+QC0zPlfKE85pjUmhkH+ifpBORq9ZiGanZRyugqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743352601; c=relaxed/simple;
	bh=QWR6EaDQI1AguCT0SWh5ztNU28dnd6/6IjNKf/tPDeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTQslFbW6EgEUiYBKuxqub/KcxVwQmArc3NgUcv5wWcyXdvW9E1KEVY4y0rQQag16YgbDhSNfz19m6UHsNCq9IlQDsLxrA1vcxiEnb8umLFS17EoJp9/KS5rrrzsBKEZUMvjHgBLL3LAyl6QTgueT5P25iuJFioAHo/67EA6NVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa8xr9xf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa8xr9xf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UCuevn029875
	for <linux-tegra@vger.kernel.org>; Sun, 30 Mar 2025 16:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9IbJLHzN5Gek81KZ8rQbP94
	oxIGmfBdFVQn3sF3atY=; b=fa8xr9xf4VRxYcMRudOdck7gw+gOU0yTkctt0jYk
	OoKRdloSvJnZg+yq5y5IUKAblD3jQ0BqZm2JAalm3ZIfqfNvddLM25E701Duy0w+
	2gjk7tJpsyPhYxk4qjEIGj6rCS9VJRuLWHEGTytT8qZISGtZAVHGy2XK9KABRCic
	55h4i30u9QRfle6nLc17EvVFxUKCScpHrUAZFkFv9NIyPkiCk1a4gdDduqGBEFOd
	wCAV+oI4jfGR08C9gVFaOQRqEekXCvLuqBCPkf5rxHdKMoMpFKdTaZDNl1CIyWcd
	ISwEWHB2d7ZGUdTlXv9oc77DYnUAoMWiAQ6K075isyx14g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjjeac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 30 Mar 2025 16:36:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so611978585a.3
        for <linux-tegra@vger.kernel.org>; Sun, 30 Mar 2025 09:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743352592; x=1743957392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9IbJLHzN5Gek81KZ8rQbP94oxIGmfBdFVQn3sF3atY=;
        b=Xop75Uypj3Imewzd0/mgas8/m9+uzCsuIvtINVBpym/+ruiXwmob8ysL/si2AzslBw
         68ZP47Jm4O4icTiWzHUeLd/siFVevBwDGJzayW8HHwfppsVBVZXblCkaVDkM5y9+ZtKy
         fwrApp9PNsNUVD6daOk9teI18rM7Xf7T0/xlQ7f6UcpbsXalUbGN2R/0qsy/sgZGtmyp
         Flzb/bRRf8+qHfI77vWvaSD7FKTf46w/gRCpyYeg7CaCAOBPif9WSr2aEM/Uq9WaAB+d
         xBpdWjVU6pCkWkgNn8FEv3nEmA0+WM5RRqgrcWgD6hKxdFPhL1+5OrDALtUa2+ay+xir
         VQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFS0zTlQIJ/NcdgsDRiahPNRIs2qVn0GsTTNEpE049P0i/GTuOOZL+mQ2w6EIOoekWD4QH/0LT7ngE8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFdvdDGXTg7Ui88YPPeAHot49n0/HRhOUFvPlRz9yAJFNEEIC
	pGumLIbSd+1zOVKmxmGLfwUlxh3BwiUOGLsSMhISyQH+A7JPcMlMQvTETEdNDzknSMvcGGhbRuP
	3ZwBKCAau71mjsdY8FBWi2gne5tgTwqDMUPuL7ARxAscIsxNIemSFh7E8oKKn8g==
X-Gm-Gg: ASbGnctwE1/KIjs2CoXIZnUJCPFVhIGPMaqYjrsZEdVFSsYQY2uuKo9/jwsLcDY5guc
	fcPnWslamxgTghqVWxDf23G8Y2hwpyTJdrkbkGbPvSQtgMI9/pUGZsYZT5AxB6X+r8RuASaV+p9
	0TASBrZkeGKo4dpwPuf9LuhCGHtZaPb3c4+0mMBTJOdSSUkfZO7e+p8bgN2BjH55GFzlgQXaDAP
	MMEcV0C0+XtzBcgqT1TvSPuAeMA/30q+cnKBOYrhWCAMKp/lM3XPI5QGc+KYerPCfzHPI6DrPqp
	KhhPDSBaEdf3emcuzfkPB7hWycWCzrFT7DLQ0bMnJxbrdt0AFegUhLFPGD+B3f8iDvs5dQpPnsr
	SQSI=
X-Received: by 2002:a05:620a:4108:b0:7c5:48b8:b4ac with SMTP id af79cd13be357-7c69072f371mr927035885a.34.1743352591851;
        Sun, 30 Mar 2025 09:36:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEdV5tc6GnhjMZwo8TLqjXFz1vGzqWB4XFi2jQnVxmtoNtcZMKKrRG70w3Gh77iotOX99M3Q==
X-Received: by 2002:a05:620a:4108:b0:7c5:48b8:b4ac with SMTP id af79cd13be357-7c69072f371mr927032985a.34.1743352591505;
        Sun, 30 Mar 2025 09:36:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fc65sm921069e87.118.2025.03.30.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 09:36:29 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:36:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
        mperttunen@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, dmitry.baryshkov@linaro.org, mripard@kernel.org
Subject: Re: [PATCH v2] ASoC: hdmi-codec: wire up the .prepare callback also
 for SPDIF DAI ops
Message-ID: <h6izcncnqyiyv7nvyvauzjftjvzyhhev6y7wbmdqjyonrdw5ho@4yclxkbukgcs>
References: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67e97311 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8 a=rfKdTcLzpojuHggjPigA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-ORIG-GUID: 6rTz5GZaukQU-i543061-ho2iTVOhsiB
X-Proofpoint-GUID: 6rTz5GZaukQU-i543061-ho2iTVOhsiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300115

On Sat, Mar 29, 2025 at 08:14:33PM +0100, Martin Blumenstingl wrote:
> Commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare hook") added a
> prepare implementation. Back then the new callback was only integrated
> with hdmi_codec_i2s_dai_ops (which is used by the I2S input code-path).
> It was not added to hdmi_codec_spdif_dai_ops (which is used by the SPDIF
> input code-path).
> 
> With commit baf616647fe6 ("drm/connector: implement generic HDMI audio
> helpers") the DRM subsystem has gained a helper framework which can be
> used by HDMI controller drivers. HDMI controller drivers are often
> tightly coupled with the hdmi-codec because of the so-called HDMI audio
> infoframe (which is often managed by the display controller).
> 
> To allow the new DRM HDMI audio framework to work with the hdmi-codec
> driver for SPDIF inputs we also need to hook up the prepare callback to
> hdmi_codec_spdif_dai_ops. Just hooking into the hw_params callback would
> not be enough as hw_params (is called too early and) doesn't have access
> to the HDMI audio infoframe contents.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v1 at [0]:
> - re-sending since there was no feedback
> 
> 
> The following three upstream drivers can use the hdmi-codec with SPDIF
> inputs:
> - drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> - drivers/gpu/drm/rockchip/cdn-dp-core.c
> - drivers/gpu/drm/tegra/hdmi.c
> 
> It would be great if any of the maintainers of these platforms (Cc'ed)
> could confirm that this patch doesn't break anything.
> 
> Mark, Dmitry: who of you would take this patch (Mark via the ASoC
> tree or Dmitry via drm-misc)?

There is no reason for it to go through drm-misc, we picked up only
several API changes in order to ease merging of the patchset. This patch
should go normally via Mark's tree.


-- 
With best wishes
Dmitry
