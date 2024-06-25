Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEEF148FF3;
	Tue, 25 Jun 2024 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719354622; cv=none; b=tddgwyxbB4a/G+b0NQ2g3mEm6hfyqj6soc291Y0YXfdYJ3Yf8jkDo1RTjyIcOsQUFm/UDxW4O9wa/QzspT/D4IsSGvmZ4FL+209Fx2sAP2PGUQn71XmKu2WRkTvyRfVrk7JCk5c4Z6bxt5iL53eTDjuDIQd6189VwJp0AvfoefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719354622; c=relaxed/simple;
	bh=qS9TTmlDjgipvMH5tjZeBfWS5KHkS6WYJPS068gWSE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pvBeXI2EUoLSaka9wj5KFEkQihjuoBbOMLzg9b8xZISrLqPz4Xn/aozC8Gf3X/TDrsmjFGUoK4ody2/qAaben/YKmB37Gse9HFd1tTFKrp6XEwpeM50o5DgGUUxzWG82OSH7Rvj8DpRIbZcMWGTTpS1UcLPMRdiXdomHyY3DgJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZRgeRPF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZRgeRPF8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PI3gnA032231;
	Tue, 25 Jun 2024 22:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfUIF9UojzMOtwX6nE2K3rtBehrIGg9xx0Sst/8VS8A=; b=ZRgeRPF8kRUUlf0j
	8g+XLMJZOYw8oEl7PaxrEIbk+nL2DurL8X1qvJ7qG5WIt6m5wyxHd46Bkz8WpI2f
	1Wv9Nc/iUaPl8q41t+iX451ukQC68boJdH7GuBNjyHB8g+nu4xOg9RCssMizELYJ
	1uoczBSHGmU19PpQ0fvhmAnIkTEJHrwlxKCUoULyQiVmVyTJBU6hjXQSaNHIFSsX
	xcBmA1tVmpq2OP/NzwW+tDe7MCmbIK/Tml8QSHGdCNd9LGrvsiJi2T4GPQc8wGUS
	+B+NQoeQLwx7y3uAPPTUqWDkGBLr/pPYgPHb6uj9XQxJc+UARNeQKy/XGflP8fGQ
	5BZRUA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv7peu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 22:30:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PMUEKv032155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 22:30:14 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 15:30:13 -0700
Message-ID: <38597076-e0f7-4266-bf85-3177ef249922@quicinc.com>
Date: Tue, 25 Jun 2024 15:30:12 -0700
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hte: tegra-194: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC: <timestamp@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20240603-md-hte-tegra194-test-v1-1-83c959a0afdd@quicinc.com>
 <92059885-858c-4a07-9e2d-cda10c6c38bf@nvidia.com>
 <d3f5890b-db18-4e56-9768-db0382717baa@quicinc.com>
 <36113c8f-12de-4530-9727-67c75b0daf47@nvidia.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <36113c8f-12de-4530-9727-67c75b0daf47@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jJ5REi_-kCJf-QGvegUVic0gTiUVH_Tq
X-Proofpoint-ORIG-GUID: jJ5REi_-kCJf-QGvegUVic0gTiUVH_Tq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_17,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=973 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250168

On 6/25/2024 2:05 PM, Dipen Patel wrote:
> On 6/23/24 10:53 AM, Jeff Johnson wrote:
>> Following up to see if anything else is needed from me.
>> Hoping to see this in linux-next :)
> 
> Its in linux-next[1].
> 
> [1].
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/hte/hte-tegra194-test.c?h=next-20240625&id=9e4259716f60c96c069a38e826884ad783dc4eb4

thanks,
pulled it into my verification workflow :)

/jeff

