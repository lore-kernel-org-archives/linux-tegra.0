Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22A2135B7
	for <linux-tegra@vger.kernel.org>; Thu, 27 Mar 2025 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080084; cv=none; b=gOaYirrvjIDOOfZQ/DGlC/mgbvQY320sR9eESCEFXWmjTeTy+l0ivgo6ECz1QOTZ66L38loL/FsPUsTWGd1qLEiMiVBPtEX/Mrr+uIBrS9g9JUyQuZYgZ9On5WrT3dFyMqQIENyOKS6Jp+ikVw1RLy5gik30yTl+7ma7oP36I9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080084; c=relaxed/simple;
	bh=zNMs33iWLVQmGxEAXLK0AwI3cfZeuphSok4IPUwRyEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbG5m2dKGaRhMFi/pJgUAEMowTFBUib+APCZ9v7/stEEpKxig+Z5u5GORH5OM4eQeeul79LYvXX8bNfrOZ/nKqx5Yh5wBryQAGBRQ0v4z0h1ufgBdqofIU/bzwIyzvWZEpZWR23//kzQngaTaef6xxcNHRixgV8UhSgZCKoJmU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3GQLfWV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3GQLfWV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jIEd011014
	for <linux-tegra@vger.kernel.org>; Thu, 27 Mar 2025 12:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ys0LaI2UcfNwMcZJGrbIWM94BdFxA4cSNIC6NvFfr+4=; b=Y3GQLfWVM090S1Y0
	A8qvgSDjjyRnZe2RuTgUX9FaycDn+/xyENpFmZ1x1d956/MnXxzyd7As5XZZAgOB
	XzprcxuXNZIuRooG/rukCYaCU3oznLslHd5JjmaHIZylMPviffJdJAWu7K3FxXT/
	KRBKH/WK2JzrGai9VtoTMYk1GuFB8fGByhYz1iGyTFFYhZA5DCnZeVem6n2OIJrz
	vnD+j4zKthLRNXdRd5FXyTqxo5N8gwQlD/5AI01TzPQ9OFDf/w2b2IPKkiiE5sFV
	vNZQ5E28Tn7szpPZWNFCtBVqvZmqok9iSTtZST703XlJem6rGsOT55L0G0nezgqW
	jTkzlg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqh5qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 27 Mar 2025 12:54:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0b0cf53f3so137977585a.2
        for <linux-tegra@vger.kernel.org>; Thu, 27 Mar 2025 05:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080080; x=1743684880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ys0LaI2UcfNwMcZJGrbIWM94BdFxA4cSNIC6NvFfr+4=;
        b=Zl+8iCrbiFSZRyEtUwpU6Dr+ds5haQjmATdKFfn4vNLK0NIuFe9kQfpfWbZL7zispc
         aQaGmnR5fyUIlHzFO4NAGo9Qi7bT4329O3OfMYPrVa0NU7ifwNw0smhCWQZu4uCogv53
         S3RJ6/Uhwk/24806OReexr6YfDUhmTk49k3z1S70Uv+we09SIzsAaw8YxeSVgFudBNHx
         Fnyp+NX4i3OOTQPS0RzRruK/lAmcRlp90CuOsCbKDyWCDuW6+CprZ/BUCgcMtTC9Be6b
         rVJ2uxHyRCmu6EtUZ4uqfz4K1xtRdqpQpoDR1jATBWARj4vXflU9NQE0GCdiwRme5su5
         l9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNA/0uNNRXrUkY4tRnv917WBUvi4LdKCze0GEz4kbgrg1dmB/zDIx18tgWr+WsNWao95AwrWP2vVhQWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJUW/DH0shub9vdGmbw0bfudsFTUrN3vSc9KQEOBMNXqwY/26Y
	lCrFMmcbJsSg3buvxuoJuA+PIpGL6HmCKee/KTE+WVFUWLnXYvk1wEHv3Aszvgzegz2pJpHRGjl
	H6yUGEnviUAbLAWnyt06sn62f//MEd1jPFbyRo2kJhd/izRU/SqIAkKnt89Zlvg==
X-Gm-Gg: ASbGncuWfywThYy/zMAKud+RYtHCMEvIl8mN/Av+IRtLIuLojlSxAYXcdp8590k+KuS
	IkvcEmn+S1lf4LjLpB8pBv1TeW1LtrE1zYRg6o0sh4hn484LPFNeIeuYvDtvhFkMjImlrUP5w4U
	ArU/n8x37Rq17ix+RiSTxvP2UhISb9DV5+UikQVOfjNKFW6uCyo2rFNXx5zV3qqfX3CixQhEI/+
	IJn728rn4FsVAWH4WWM5WLKQZIsLZIX/ECw0ZjBISL/0qIu3sXo8Xe4zzz4Ec+GGYzXemtgPJZv
	fBh4XIToHOV1C2M2QJnZ4LIYG8VIUnQiJy4E5XCbx27TZB7K8BC9oNYTkLTGlP4f+VsXHLXVZs5
	rptrnQfzeWhvfHkxvPqD+QSJ49YwzpMj6lHJs6QLPcWWVvJD2QGoYbvTP0q9TnF3n
X-Received: by 2002:a05:620a:4256:b0:7c5:5791:122b with SMTP id af79cd13be357-7c5eda64823mr589647785a.37.1743080079960;
        Thu, 27 Mar 2025 05:54:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGauD6ziuw0IhIZog9VhQ+0nMgNmotDcQ10Mfm1rBFAYVGZeZbi6W/H9wqWH07z16ItQ2B2DQ==
X-Received: by 2002:a05:620a:4256:b0:7c5:5791:122b with SMTP id af79cd13be357-7c5eda64823mr589643085a.37.1743080079331;
        Thu, 27 Mar 2025 05:54:39 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:ffd6:c4de:52f:971e:7ff8? (2001-14bb-ac-ffd6-c4de-52f-971e-7ff8.rev.dnainternet.fi. [2001:14bb:ac:ffd6:c4de:52f:971e:7ff8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7fe7b4sm24851371fa.53.2025.03.27.05.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 05:54:38 -0700 (PDT)
Message-ID: <0d44fd9e-ab84-4db4-955a-22670d2990ef@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 14:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/dp: Pull drm_dp_link_power_up/down from Tegra
 to common drm_dp_helper
To: Andy Yan <andyshrk@163.com>, lumag@kernel.org, thierry.reding@gmail.com,
        mperttunen@nvidia.com
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        victor.liu@nxp.com, rfoss@kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        Andy Yan <andy.yan@rock-chips.com>
References: <20250318063452.4983-1-andyshrk@163.com>
 <76a55b32.acc9.195d79cf378.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <76a55b32.acc9.195d79cf378.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xq96cNztHDWWKy55dQWY-ggXb-SaIvXT
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e54a91 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Byx-y9mGAAAA:8 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=vCqhtvarF6LdSwkuyZ8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: xq96cNztHDWWKy55dQWY-ggXb-SaIvXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1011 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270089

On 27/03/2025 14:39, Andy Yan wrote:
> 
> Hello Dmitry,
>       Could you take this series? If so, merging it earlier can avoid future conflicts from other patches.
> Besides, I can update my DP driver based on drm-misc-next.

I'd really like an ack from Thiery or Mikko.

If tere is none (and no objections), I'll push it on Monday.

> 
> At 2025-03-18 14:34:35, "Andy Yan" <andyshrk@163.com> wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The helper functions drm_dp_link_power_up/down were moved to Tegra
>> DRM in commit 9a42c7c647a9 ("drm/tegra: Move drm_dp_link helpers to Tegra DRM")".
>>
>> Now since more and more users are duplicating the same code in their
>> own drivers, it's time to make them as DRM DP common helpers again.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>
>> Changes in v2:
>> - Fix commit message as suggested by Dmitry
>>
>> drivers/gpu/drm/display/drm_dp_helper.c | 69 +++++++++++++++++++++++++
>> drivers/gpu/drm/tegra/dp.c              | 67 ------------------------
>> drivers/gpu/drm/tegra/dp.h              |  2 -
>> drivers/gpu/drm/tegra/sor.c             |  4 +-
>> include/drm/display/drm_dp_helper.h     |  2 +
>> 5 files changed, 73 insertions(+), 71 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index dbce1c3f4969..e5dec67e5fca 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -838,6 +838,75 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
>> }
>> EXPORT_SYMBOL(drm_dp_dpcd_read_phy_link_status);
>>
>> +/**
>> + * drm_dp_link_power_up() - power up a DisplayPort link
>> + * @aux: DisplayPort AUX channel
>> + * @revision: DPCD revision supported on the link
>> + *
>> + * Returns 0 on success or a negative error code on failure.
>> + */
>> +int drm_dp_link_power_up(struct drm_dp_aux *aux, unsigned char revision)
>> +{
>> +	u8 value;
>> +	int err;
>> +
>> +	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
>> +	if (revision < DP_DPCD_REV_11)
>> +		return 0;
>> +
>> +	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	value &= ~DP_SET_POWER_MASK;
>> +	value |= DP_SET_POWER_D0;
>> +
>> +	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	/*
>> +	 * According to the DP 1.1 specification, a "Sink Device must exit the
>> +	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
>> +	 * Control Field" (register 0x600).
>> +	 */
>> +	usleep_range(1000, 2000);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_link_power_up);
>> +
>> +/**
>> + * drm_dp_link_power_down() - power down a DisplayPort link
>> + * @aux: DisplayPort AUX channel
>> + * @revision: DPCD revision supported on the link
>> + *
>> + * Returns 0 on success or a negative error code on failure.
>> + */
>> +int drm_dp_link_power_down(struct drm_dp_aux *aux, unsigned char revision)
>> +{
>> +	u8 value;
>> +	int err;
>> +
>> +	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
>> +	if (revision < DP_DPCD_REV_11)
>> +		return 0;
>> +
>> +	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	value &= ~DP_SET_POWER_MASK;
>> +	value |= DP_SET_POWER_D3;
>> +
>> +	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_link_power_down);
>> +
>> static int read_payload_update_status(struct drm_dp_aux *aux)
>> {
>> 	int ret;
>> diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
>> index 08fbd8f151a1..990e744b0923 100644
>> --- a/drivers/gpu/drm/tegra/dp.c
>> +++ b/drivers/gpu/drm/tegra/dp.c
>> @@ -255,73 +255,6 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
>> 	return 0;
>> }
>>
>> -/**
>> - * drm_dp_link_power_up() - power up a DisplayPort link
>> - * @aux: DisplayPort AUX channel
>> - * @link: pointer to a structure containing the link configuration
>> - *
>> - * Returns 0 on success or a negative error code on failure.
>> - */
>> -int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link)
>> -{
>> -	u8 value;
>> -	int err;
>> -
>> -	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
>> -	if (link->revision < 0x11)
>> -		return 0;
>> -
>> -	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	value &= ~DP_SET_POWER_MASK;
>> -	value |= DP_SET_POWER_D0;
>> -
>> -	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	/*
>> -	 * According to the DP 1.1 specification, a "Sink Device must exit the
>> -	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
>> -	 * Control Field" (register 0x600).
>> -	 */
>> -	usleep_range(1000, 2000);
>> -
>> -	return 0;
>> -}
>> -
>> -/**
>> - * drm_dp_link_power_down() - power down a DisplayPort link
>> - * @aux: DisplayPort AUX channel
>> - * @link: pointer to a structure containing the link configuration
>> - *
>> - * Returns 0 on success or a negative error code on failure.
>> - */
>> -int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link)
>> -{
>> -	u8 value;
>> -	int err;
>> -
>> -	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
>> -	if (link->revision < 0x11)
>> -		return 0;
>> -
>> -	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	value &= ~DP_SET_POWER_MASK;
>> -	value |= DP_SET_POWER_D3;
>> -
>> -	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	return 0;
>> -}
>> -
>> /**
>>   * drm_dp_link_configure() - configure a DisplayPort link
>>   * @aux: DisplayPort AUX channel
>> diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
>> index cb12ed0c54e7..695060cafac0 100644
>> --- a/drivers/gpu/drm/tegra/dp.h
>> +++ b/drivers/gpu/drm/tegra/dp.h
>> @@ -164,8 +164,6 @@ int drm_dp_link_remove_rate(struct drm_dp_link *link, unsigned long rate);
>> void drm_dp_link_update_rates(struct drm_dp_link *link);
>>
>> int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
>> -int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
>> -int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link);
>> int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link);
>> int drm_dp_link_choose(struct drm_dp_link *link,
>> 		       const struct drm_display_mode *mode,
>> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
>> index f98f70eda906..21f3dfdcc5c9 100644
>> --- a/drivers/gpu/drm/tegra/sor.c
>> +++ b/drivers/gpu/drm/tegra/sor.c
>> @@ -2666,7 +2666,7 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
>> 	 * the AUX transactions would just be timing out.
>> 	 */
>> 	if (output->connector.status != connector_status_disconnected) {
>> -		err = drm_dp_link_power_down(sor->aux, &sor->link);
>> +		err = drm_dp_link_power_down(sor->aux, sor->link.revision);
>> 		if (err < 0)
>> 			dev_err(sor->dev, "failed to power down link: %d\n",
>> 				err);
>> @@ -2882,7 +2882,7 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
>> 	else
>> 		dev_dbg(sor->dev, "link training succeeded\n");
>>
>> -	err = drm_dp_link_power_up(sor->aux, &sor->link);
>> +	err = drm_dp_link_power_up(sor->aux, sor->link.revision);
>> 	if (err < 0)
>> 		dev_err(sor->dev, "failed to power up DP link: %d\n", err);
>>
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index 5ae4241959f2..f9dabce484a7 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -566,6 +566,8 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>> int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
>> 				     enum drm_dp_phy dp_phy,
>> 				     u8 link_status[DP_LINK_STATUS_SIZE]);
>> +int drm_dp_link_power_up(struct drm_dp_aux *aux, unsigned char revision);
>> +int drm_dp_link_power_down(struct drm_dp_aux *aux, unsigned char revision);
>>
>> int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
>> 			      int vcpid, u8 start_time_slot, u8 time_slot_count);
>> -- 
>> 2.43.0


-- 
With best wishes
Dmitry
