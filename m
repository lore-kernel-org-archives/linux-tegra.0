Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA93D5C06
	for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089039; cv=none; b=qFV2X5/cCuHd6kmMeqN7dT2EWnnp2SARoPbl54hOfxzYRzlthts9W8KwBYUFJxTs9PlIdcV30Ys1ktvaKafokb2wpT6+zAXzyoedYCoASgkV/bMHpWTdSjhUAI8243N1bb9ZeewXmFsMOL5CaU6yafeKOuOi7OS2BG9jcFpXEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089039; c=relaxed/simple;
	bh=HSd488UmDXFrKzzjwhS/aUIf9ho+RzYB2yut41CXFhM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P63en7ysY+wtw7+Sr6ijcfbYuRbzAUumzrwDCK787UnSLAI9f3ypMOUS1SmdK353efBAiifukMW1+XcuA5Bp+v0F7vkQhhFlr1hsWxQ72057ULD92XMs0acbKcUqrmFqtjP5M1isD83ZaJf4dgYLodeBQh8vcvvf/97mZhy+VMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeIsWoEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ST+yzbFu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeIsWoEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ST+yzbFu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FGpfSL4100196
	for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 18:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=; b=WeIsWoEmXtI4pgs3
	30zWbkpt0e7Eq5oUsCE5qmQXaB+kxxSzLNk6bDIuo3NvK3EE48SmjiV/30RrFkjl
	9dqofsGYtD/yEaumBFHgRVrqmfvD4ouJRXzlixOJvKGmnOiDDSkmqybyfMNtnozu
	w2O3LBcL/ndil+0mirjePNvELRDwx2RxkVe+NG9S+BvemSor1Hl/K2aaFOq5y1dK
	2aLlkg6+WA1qcili/sjWyAV+WXw67wskVnrRV0LHOzMCJfLAWoiw5qS4FtPrnlnN
	Dg7KfSYx+BpolQ3K69ao40Nd41pChGrKs6tDWbM9cnsdFJE0Wi7DAcpmzinYtamI
	luTZ1A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r9xvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 18:30:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so7193165eec.1
        for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792089025; x=1792693825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=;
        b=ST+yzbFuupAvpe4zLx6TB2y15icJ6gCGGGlzWuC0ERt4myBajKYeA0qrLDXk/82HZl
         J49/lCoXz0OgC1Qs+k0flTERyRYs4qZlxo70aaXmvq2lsY+k+NYQkRz3yNYzwAr49noX
         ExSAEl+vqryWtLfVLAJpoSDN0KfM1im/IhpnZApaZKXLOJdKskoOJEXEK5NhIJb9rb96
         DUQjxWkK6lxHdXjHjisCbh+p//8ywy7StAr+iv2t2uaRKNQPHg8QFmHiiT4mQWHNNbOb
         Ih5f1e8Ge4wAEbCzsTOZwnr8n2fMyoL3T8+K7JpXy8rfbD9bdj5QjXDlnSxu1jxTHYq+
         Tyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089025; x=1792693825;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=;
        b=gxevrWDqhJvDDrzZtNtYKLwbhffszI+K15LEZCVA+KiRhwbxQGDeWm0I2KqDMeswxB
         RZP/ak1Nr3LU/DVwqi15QxG11wmemxP65l+lI2ibpTwlWcPMCwckodk0JN5B2tFjtAaP
         3gumgC8Hx9Mt6jzXrCyi4T8WJEjkC2pzr57nQEjA7WJzWemIBntwhMQ/F+c1j53WR8iz
         +aGJe9Ib5vRG0Y/8RWeehYWSh83NIlJ65z7JEQUQ73wOISS3e2QnIxfBPvKjxxczC4Ng
         eT7zOV/XQ/a3zCLXmQSnPf6P68bkMSE1Bs9SJ1Qie2zxJrx6uwr5erTZQ5JvhUp3x9Sa
         0ILw==
X-Forwarded-Encrypted: i=1; AKwUvBxAyKq7Bvj5DQ8ojJ2t/CmfEgba+gzLOMgIiwLxgzK7LM79WscodbRHhNMtKriB9ilW9jypbK8mH7DEcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/PZvelAUXYDGx2ZmgHHCVI4oQH8thhY60rI/zB0Lg08WppkaN
	dwBzpYZl7SWHv10XMBtrsURzGd5homfGs1a4K4wOfabQfBjdijJd1M8KsnYcUHXvawgYBwBP2zp
	aAGm+jThEFAYD05Jf3bDmEP8Vy12LZMFZVkOhLB7UlhRHZcGVWh/BjYZh1+DSwMj8zQ==
X-Gm-Gg: AYBFou3wRo7k1T1s1BJQLPWZH2xnaZMSrnSwMdlOWMV0z0So/jszTFWA+9TWdkn9T/b
	icrFJUE8cS6hHcDZnuvkRdX2qvkdCIPEm9KKBQW1fBTY59VwnfL8kQJHIvvmRJziEuR3PYo3LWa
	3QrTF+rQhu+WyW0bS8GOKohuWM6kIItktp4Yyinbg+tLqddk2IuQgbzvL2o6TU40vrJBOFyUrZq
	3hXUK+hgBtcUwxf+KNAYRp3fFElEvLho4kn6c9ZB4h54tlYicgV9Fyu/GXU1yJSGFYvu2ClmBDh
	UPravFFlCMDo/I8Z3DmydMOQbjP4HY8OyPKwHDg1fJx1lGc+j8dJtSegcoBXBulRGY9p+OC5YG6
	ti1sA1hb9m/jiPDIdHwwhHgUyJtSM/3t2IdXyJDviQXvvBkEAubiMOQ==
X-Received: by 2002:a05:7022:170a:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-16a61d5c4f6mr23763713c88.42.1792089025363;
        Thu, 15 Oct 2026 11:30:25 -0700 (PDT)
X-Received: by 2002:a05:7022:170a:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-16a61d5c4f6mr23763653c88.42.1792089024649;
        Thu, 15 Oct 2026 11:30:24 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a16488dbsm665948c88.3.2026.10.15.11.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:30:24 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:30:19 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
        conor@kernel.org, jic23@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, andre.przywara@arm.com, aneesh.kumar@kernel.org,
        Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
        bence.csokas@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate
 provider
Message-ID: <20261015113019.000050e3@oss.qualcomm.com>
In-Reply-To: <20261013070205.3566865-3-smadhavan@nvidia.com>
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
	<20261013070205.3566865-3-smadhavan@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3MyBTYWx0ZWRfX6HQLoV2F2FN6
 ZMUcOl/u9oWFxoyARnRPd7zWIk+EBxF4Ab5t2IaCjX/idxW1BrCyVTPJYaCfHGjm9V6ZciMA1or
 lJATtFZAwKcC5KhilFj+sxaYuz9dc4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3MyBTYWx0ZWRfX7x7ayDbb/ee4
 +VR3CwMVY0lKWuS/aiE/MmhlU3AyTZk4vEN7lSSTsdMTLsKCA/6FkzF1ZKfPXqt+R8ebgqbZyuf
 egGMU0nkXGeZd739A9BoX2eh6Zn9hoqECpuWVKvVupoQxV3Hh5oFQsp9lSQ1D89qFLTv/t2GZ1O
 sfhl2BJnvN/r+xKYid8u5Lkm7wBz/rU3l20PJnIuoLBNnsFVcGOAmFCkdFNr+iHDkbUIxmgQX0w
 NVkFbMBVyR/9NjWmzZ/yDDilY0HdG5ZOwTWLEJdBluSX6L3IMbVdxcUpp9qfcJVcsSdDl6zBifT
 wOwVM0mKyhHVFMlM9Nrrdb4gTCZ4THvMQoE8R8b/XfPrO20Bd1tpJ+zKIhdlfoL/MIRlsHnISWU
 KYqVo3kPSh0cu7M4J083yKEdNd0yKMqqK8TvSRJjsmY539KlNJHQdG0FdlogOnanX3s9EWNgqRy
 1r0hdgkdNzWGqaSmwJw==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad11bc2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=24jIKSGD-yZtkObPp0AA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: VuisLBBpzi-nDgYpAkJNsy1Rm7OpDTUi
X-Proofpoint-ORIG-GUID: VuisLBBpzi-nDgYpAkJNsy1Rm7OpDTUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150073

On Tue, 13 Oct 2026 07:02:05 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Add a cache maintenance provider for the cache clean+invalidate interface
> defined by Arm DEN0028 v1.7.
> 
> Register the interface attributes function as an SMCCC device and bind the
> provider through the SMCCC bus. The provider reads the firmware attributes
> during probe and serializes cache maintenance calls. It handles transient
> BUSY and RATE_LIMITED responses with bounded retries. It also registers
> with the generic cache coherency framework used by memregion callers.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>

I'm fine with the changes to put it on the bus and Andre's suggestion to drop
the latency value handling. So with that done

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

I'd probably not have bothered with the mutex_destroy() given limited
utility vs code added (I mind that less if devm is appropriate, but doing
that here would be messy).  If we ever see a use of that after the destroy
then something exceedingly weird is going on!

Anyhow, doesn't really matter either way.

Jonathan
