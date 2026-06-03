Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997E4BC003
	for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2026 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527554; cv=none; b=lVjD0kUcTwdxjVlUtmaY41f7vRNVxDvzhjwBQFH4PCgERMJXXl/X4FpCExmMAskiP1ImA9o5uvC9eEE9srpyiJkkIOwbmEVVCWo1mWzvPQB1IEeabl1jrhlSgSNQPmnzW/uZ+Bjb0f2iZZjC4V2w3I7MQokjbHehCq72b+UGTYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527554; c=relaxed/simple;
	bh=RoiQDo2vHkOIYi8QYhXjdnc885eNLNOiDk6hnbsmcV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXMyrojT1mqNH8nm9jKiPZN4JHhRYKShUpoMwfgUcXXABHd48HX6Y4PQlLFeJ0AsVpY9trT6PyB5omyeMlnxfczQZ+RdI6ZQoEzsZRwoEK2/rppyFJ7oQisFOZoSNvfgwrDbgZrz3kEgoiWq0muSZ4xrcfu24HjpR0kIe8s8szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUsHQt0D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub2GfWei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUsHQt0D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ub2GfWei"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653InOR81946505
	for <linux-tegra@vger.kernel.org>; Wed, 3 Jun 2026 22:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONnM8cPGqCvQUEArvOdVRHLA
	7AjrNnYCfdYyBl3uu6Q=; b=JUsHQt0DxYLPJKgSTR9tREQC+/92i/jaL10JeZka
	jx+w7LeQXnnmF1WukUK+kcEWnvuxt/l+kFvuthhHCI4AaDnS76xdU7CZe4PJzwyz
	K4pbBszfCfx+alv7S7iFmtT9ExLdFXbo7XeJLWvND6VGIKR9I6rEOyaIC7iQ90Xg
	9iCkzFtDeVSeFE9jXjV05X+B3ZHU8eGLF3uNdxHjQ9Y5yb4DSJt1nRiG8no/6vX1
	96gpOiH9tdw6cUja413gftwtc/vaKQ+VyGGi+jsd9T/Go18S/qq31wYXJCMNU+uF
	jhitbT5yARcAW7GDcsEOVJ2x/bh93aalFtYzYhWqyr/g6Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgmxba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 22:59:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b2863d62so53276241.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 15:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527552; x=1781132352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=Ub2GfWei3yzVNpw5q0on8mOpXQn9Ro7onLdc5uE0xrcb05St7nBIJe5tz8cx+KP4NQ
         432lKORy6YYbfI541ZE4cnABBx2LHLkZWI4Ru3apfNAEAFdWPinb6ipPDjsw1deMjS0x
         nFqTF8TDAFrXLS8CDQtw+JmzbzS4XUIBt/StOWP1z/FjRg/bD4A8oHC1mvoWmCYvEakD
         H7JWa9p5vX+E9fBL+VOIH9jG92D4fGX4eSbpBNolkZA1ByC/8xWOxq17DEJAXSAuSE5S
         2n1240kjl4IC3I9ogQsii0M/JIgM9csy8UgwXG6SjNvsa+at2KjE5XD/TEOuJYRjpkak
         h1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527552; x=1781132352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=LR+Es27ZZ5aASjgBi/W2pf+NO7HjNZxuVRaelGsuKjV3Npyn/H4uK4QzxsjQ8/gKY8
         xcFoQ2HbIGpATiBDOLY9ZSAwE87S3Xr4Br/91XMWIV/zq1nm6QmWiiFl5s7rfkh6zw3/
         bTiBxmJUkBOyJQFDxkv2ECUOSQGRRr1ozBK7PKcsfoWhR0bxhM5e7j7VFiTaBAqrl6gi
         N0A7W9tW4hPTyhgyg2bZKGrXgRFWmmDrc8jolXu2aQbzvkN6KIsl8Nx3Et5K/LlNbHFB
         7+ucbk6ryBn3TWNzV1SV7i5XVodZW3XHOgq9THhS8/AV9ockDX08+IUWUbSEQTQEEmcb
         qK4w==
X-Forwarded-Encrypted: i=1; AFNElJ8IWEsugZi3GzZMU4YAKEXNmo67qIITtGvHJfrfqj0OrgpkpkYV8dtvr+bI1Sm/mq1ESrf14OOg3NRAAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dlH74DOVzaKF4fvQ+rC82b2NXcKYyw4I23qI61STFZJj+Qv7
	Lh82daBKHTr7I/u24Z3skPkt3Jc7U6hoolzunASfqMxI1NvyBU1rKOu9Rk+JYc0Z6BM6uwaksAT
	d91RYYrXyvIFW/iazRvApr2gS0kUMJQAZVCFiTIAGhNJyJj2hnLcZA4e94FLwrzJEDg==
X-Gm-Gg: Acq92OFQMTVJkaXS6CAbo4gF2NYo1KYdMNZcCmyCrZL3RjnxyAzKIJH8DGzyk3ySxe1
	9wNmLobG7l5Eq2j7U0hKgWQaXZphTq4W6+fIb8L6ZSKNeyc44Rr063p66wsGnSKv00FZlY/vnoU
	X46NlrG5LulApaNvel+7oLpVBHGY+TcTl/SBsoKyQv8TC5wBYZePBHV70Z49mlHSR2Rhz3+EUfm
	fa/mELDpxG/1JdXldWxuVWmrHGGnUkWeGFX9bt9+PhojwXOV56M8SUjffSWdXioAjW3k2ZOeac3
	MQNZCtqlDnhkEfJzbj/2AEZYWh1+T3Ow0IJaCNulEskbS+3RJ51A6Ko0gkbaf3Bt3a3v0eeUThW
	Xb0jOuteht+h79pJNdxbHODOwG8C/HbUtXlngNwykyqlMEv9oH6zwNRc4n2+3TnciPNyng7W1xO
	4N7qy0N+fq5Wj0R4AtQ7uhW8gvurZT0/7a48fseTwqGOzN4g==
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216906137.18.1780527551702;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216884137.18.1780527551258;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac29sm880386e87.52.2026.06.03.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:59:08 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        Julius Werner <jwerner@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
 Chromium-based /firmware
Message-ID: <pfo7vpd3ooiyfuo3wjom7qzknnnkiyel2kdu5fjqqrq5nccysq@e63rs7lgdfl4>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <20260428200712.2660635-8-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a20b1c0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=MUleZ9s-AAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=iD_vE5mCeOLV2fS3_3cA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=f0F4d6ZXEnSYrzQLsEx4:22
X-Proofpoint-GUID: EPIv3pZTyu9F7GNSfas5KGfJijwjZ-jZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNCBTYWx0ZWRfXy1fBDrxYUQ3k
 HoFFFuAoulCJKN7pPnnKT1qe4rE84nQwI7v+/J0mQQs9kyMOJ2B0U+0AfDSh/Tmc54QzDW491c6
 APJFUuXHh3jfo6ROsQgebAtU5PYQ4H7klp0yF+VrQmqkZj9D+tbF8dviqbrV2Du1YnaKjItzxAz
 s0QX+OcQ61Ifs9wdR9lT0+zpSbvkXRg4IpwTiJIRhuQyPeSmT2ImXox9Kq4tglJRWG1H7b/UZIq
 AAR8Ww/gfOHLGs7Lz/qcVdPcQ/ljCPnFnGuG1PXXYbRWu3Iy32yLsNUKzRLZra/xxoQUJpJvRo5
 z0Fve7HAGH1skg4cE4i4SPGmjn0oYCqbwZfmMPg7X9Um32MnlXSBTQ0mWeZ/qh0FirEP+KaQANi
 9cZgmBkGewtqDPnntJun/WyR2L9PWGbBybc3KNzje8lN/f2Npd/ZrgbwlA8yLI2keiFTVy4SRM5
 q0WQPfYu1o6uHBXR0qQ==
X-Proofpoint-ORIG-GUID: EPIv3pZTyu9F7GNSfas5KGfJijwjZ-jZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030224

On Tue, Apr 28, 2026 at 01:06:59PM -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
>                 coreboot {
>                         compatible = "coreboot";
>                         reg = <...>;
>                         ...;
>                 };
>         };
> };
> 
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> Add appropriate #{address,size}-cells to work around the problem.
> 
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
> 
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
> 
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
