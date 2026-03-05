Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9182372EE8
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699983; cv=none; b=dwb9f1EZ5B8X1sdqiTcYLzpUu6/76outUFsoJx+bIHCchr4su8a1HVOjMDOzemaxfNbvJkG2bfYCRrSojh0JAg4oLDny93PsT5nuvZzVZgyOngculCIB1tX1OyluN8GTYVcIE/hg+O3lw+Qvsh+TKNerCuNuKu6S5oftE1kDwJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699983; c=relaxed/simple;
	bh=6xaS693NEPvMsmPDTvB8J6q5UsLGM4wm4qipY7xfOGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgTe0q7m7j1NKTtYNv139E66TgtaQLNyzLwI9EWXMHh2i5HZdkNqFBlpffJraGOur7YSh4NPQRfTikfPvWH32TQv/zeoihfDPPODDJrfiZG6/btGPrNkNkrqkz8gGd/0k5FZcdnAjuyWiuWvd1v9QAz4bQiJZnNdF7OXpFi3NnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zhs1szgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jftXYqSq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zhs1szgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jftXYqSq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251CCn93473514
	for <linux-tegra@vger.kernel.org>; Thu, 5 Mar 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=Zhs1szgRs6PvG6yC
	/K6l0Og7co3C6ED8icQT7ngtsI9G5Zp17IaIYa/MOFJSyTxAUHo39qtMLOBGQhpj
	JO9fE/F/E4F4LvhAKnAlFKn+fH9sEpkGqfNT9M43WTCJkjqaFeUzfOGpTrDAGNtC
	tA5poP4iW9oFEFa2er9A5XyBDJ8CedmbmCYM1jjJmOXgrD4UqsM96/EbUTiVA/x+
	+Hq4ib0d4uJFejDRNFTAYPM9OxAzG41cfjw0IJBJVDWkmbFbGS1eLwFkvUDxUI+x
	i9yGzbk3U3z2KxBfUGbK5GoyOmpZPSUHhrYGJ9ek999ywA1Q/YTR3XTo5MWWFrPw
	1lqwYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj183y2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 08:39:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38a5dc3cso577902085a.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699980; x=1773304780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=jftXYqSqtrokdujho1rSZ8RV2+df0VSJJ/M8ZUZxSfL+guycXk5e5Oa+/kyiYv6qq7
         wDt7pgwE82GoCanbnE56n+QEoFdpyD0IDJAXa2uedcbQvZQWJRRzpQWeE+FA2evLbImb
         HHx25k81XwtVs8AYIfGmGN1Heris1W4EH+3TjG9IsAQO2tfFNcYJFHacx8H5ixGQjhjp
         YhLkHjONVRBKpyl+EoAHQo2i8UAnKVr+iozz53JeeF4uhO8r6lRrGpcB/0Hhik80AyD3
         +bPbUwPZDvHgZwinc1JyJ5+XebVWXjYBrsXBjFQwXL48HKIXO1qH/SWx+i+izxWR3tKA
         fXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699980; x=1773304780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=eQinyKxUWawH5Hvfxo4frdXaaPS8UxUSoTWpAGCJYJbb/hoLhMCHF036TDX7Z2bd7+
         rY/6LKdlE50HE8xVEFyGX/3sf9FP8e8sd2j6kDomKjOBaUZ3Nk4gYCjhxnP0yMpOS0hY
         4Pio6d3mkQSruGLz1FHVhZf6gAhq8gDQgSC4usMLGYrS6e7rplEOngc33dtkU29TnYgw
         yU0nQh4ElJHb8MgtnyQV2qFSD71sqSfbXZfQWpznLmuZ+FZPV8iz6yXyV3HnrkUqCqBO
         j5FldPEqMY4ebITO0SjTsA6a+bBZaZ16E7UsEHsYDcj6nCCOHcLg0JURiLTn0aP7u+rR
         FgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNxS+o1VyUEtgjnqvVgi5MLKRzN8M0k4h00JJmoEnPjMQ1dLWBnCJKdOLeWQ4V8No+85xcLyAEIyUMVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy8VUv094JAS84t8Z9GZVZnGgmn1/3Mu8+ISglI/Peu8gi3uLf
	BczbkErNVc87EFDt8D/5mEauCryBI6getpPsWLio13PbBtyD/CJY3YBOLcKlsTPX/qQ/2HkQc7z
	d34F90KlcOMKhrl46bfsDXDibitr4bC4uT4WKBgUpK9OEsD2sioeldnkq2yH4oz/05A==
X-Gm-Gg: ATEYQzwgu0oVr9NHBHK8aHwRDlfXTcd/gyENZ9gMzh30YXrsyhMhXolMbtO6Tc8EyYR
	HbNee1do/2LYxFU4rnGasa7QOyt/fegtbrNW11/rXYzMFJEiTQr7T4UI8TsxWCw3DTcvF/208fo
	/zxM6kG7xDOvxSv75NBkArFg+/BVALO5vDBgdGpplD49lLTSDJJ/JepeWPbXwq8payi9vtt6uxa
	+rGbKCk0L7IjmpG3g/dMhqqtDX+ZywvBXMmuORnbu2451D7o0cgDZNbstb/vfz6kaw9gHPe67QM
	o2v1mhpYmNngMywFA3uWxLGmNuon2Lg8T5TUY4zkL1mUCVAe8DkxaRM5VBePxWr/rEukb/+Gq1z
	mh3ZHv/2j/w2O9g8ay079T2XMj/pFtVLfD/NifXW15Ys5Gji6q+W6d2Lzn8KI2AKmSqPuYareZA
	eWaQ0=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452358785a.9.1772699980145;
        Thu, 05 Mar 2026 00:39:40 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452356985a.9.1772699979710;
        Thu, 05 Mar 2026 00:39:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e3fasm6657504a12.25.2026.03.05.00.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:39:38 -0800 (PST)
Message-ID: <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:39:35 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NRB8GupNwj0S4IjgoFFGw0BQA0qWQJSW
X-Proofpoint-ORIG-GUID: NRB8GupNwj0S4IjgoFFGw0BQA0qWQJSW
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a9414c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=GJStlgXwfe-SXQdWLvAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX+PXdNW/BIv06
 ftK8Ux0s7cCZ0Pdh6SdoZwjQlbR49XjkvHnpgs3m5j1t3+RerJuFudH8U+EBzypBrf0qAtbqYd/
 UHKLbABCN/2lHJzmZ7O0+DTemnWXZ/ZWU9SF3FXfgmWGVGYzbaBp7RR+7FUFP/WJ3FePCPK+wLd
 o0bEs9wa4DOxCRkCpbGa09U2wQ0Ba1R18rfKSlbMFe1oETwhWPZHWv3qrMA8ir5R7ZbRIJj1KIn
 yEOkWVxm7I68Qk4w8JfPFrurfp7g7H18cH2z5H1TWwub25GeDyANvJmy1rIiKfEisr/9CGwmeUg
 Hvs0+/vGHryCNPcnEg6yuyJ1I+k0nN9u89Ke4iVRwqnWFUBYV0mEYngRS26cVeEFczbwGk6RboW
 Yf4UIS5W88n1Hjwwydi9j3ATAVWXp2qgsaCWsdEpKRsv6YwKlHKqmQVaEbMRgLi/6hgtCfLCG+p
 x+cHhc0s6qIyDJWmjYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068

On 3/4/26 6:57 PM, Vladimir Oltean wrote:
> Some pragmatic shortcuts are being taken by PHY consumer driver authors,
> which put a burden on the framework. A lot of these can be caught during
> review.
> 
> Make sure the linux-phy list is copied on as many keywords that a regex
> can reasonably catch.
> 
> For simplicity sake this is not perfect (devm_ and of_ are not valid
> prefixes for all function names), but I tried to pay attention on
> avoiding false matches on things like:
> - drivers/net/vendor/device/phy.h
> - include/linux/phy.h - network PHY, not generic PHY
> 
> So I used \b to try to match on actual word boundaries and be explicit
> about what is matched on.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..bdfa47d9c774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
>  F:	drivers/phy/
>  F:	include/dt-bindings/phy/
>  F:	include/linux/phy/
> +K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h

Would looking for the devm/of_phy_ prefix followed by an open parentheses
not suffice for the 'has function call' case, instead of listing all
currently present exported functions?

My worry is that this approach is overbuilt and absolutely no one will
remember to update it

Konrad
