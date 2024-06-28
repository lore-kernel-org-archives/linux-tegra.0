Received: from pv50p00im-ztdg10012101.me.com (pv50p00im-ztdg10012101.me.com [17.58.6.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2654D1C9EC1
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719595052; cv=none; b=hFMmSPbrk2iX7jYQWF09JsYYUfa4LR6gmdF6vGNXC3XF7HpH8rvNiwxrL62zRNq3UmoNoanb9f8I/wtrzS6D9V7ymk0pQutdkipaqeKuoA6fN2SPxCIKAAbPcK0e0Lmy+x4MsalRY1xM0J33AMzNDiZuUrSxSJc7ZpnzyYOgyyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719595052; c=relaxed/simple;
	bh=Yg/vlIm1fM8SdxDnBMDbPGfoth2cG2C+D0qGBF7WZf8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=K90LQ6w/ioN5DqHoQacOJjIZZqxQBZSMS+OBq6q5meOZZlKByMybQAIsXNrMOvMgQX1LddyeOL4d7STD1zFhLRyIts/oovysZAaQN9Hjs9JTF36oMgWmEqUkckb268X4HmDzUaPWlbRnhUGoaY8RyzNC7i/0eGVU/7MP5MIzK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=qlogo.org; spf=pass smtp.mailfrom=qlogo.org; dkim=pass (2048-bit key) header.d=qlogo.org header.i=@qlogo.org header.b=KH4syaIj; arc=none smtp.client-ip=17.58.6.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=qlogo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qlogo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qlogo.org header.i=@qlogo.org header.b="KH4syaIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qlogo.org; s=sig1;
	t=1719595050; bh=TaQN/AIt1lMws4Zh0UePleCM5rwyoSZDnrgqknXATVg=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=KH4syaIjiEmpsiCZu7Xo+ZQgYSZ8NutQPRKnDMqF+55dAM6+wI04J/zBxyrUs2ocl
	 laNb8VbNfpfxY2ShnF+AYb5IUdEQvrCYoX8BM0OJ6fhNwk882tIqEVjpevzbQ4qKdQ
	 hnlfpgczawgKpX21y5DOWAJswZ2hyHJ5BfdL8SiLs5cbtLKxwco7YBxEBJXRjnb/UB
	 iUVbcqKd1iGVj7AFwduaWZBvWQCsumCxMe7D7wMyqLo1OPVcybx0TfNDG/4S1ASeRu
	 GIjBpvLuSxAy2kG/dZ2R2EyNmOIGin2uQTVY/R7QVq+J45cvPOCPh54ZrlROL+Ev8l
	 XqooavnlNm/9g==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012101.me.com (Postfix) with ESMTPSA id 1BC127402E8;
	Fri, 28 Jun 2024 17:17:25 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] Fix warning in tegra_fuse_add_lookups
From: sikes@qlogo.org
In-Reply-To: <xyxjlp6hb7jcwlhbm4tpmt5npx74qpuzybzakdkev6ta2nl6go@txh4ue7faenk>
Date: Fri, 28 Jun 2024 10:17:13 -0700
Cc: jonathanh@nvidia.com,
 kkartik@nvidia.com,
 rdunlap@infradead.org,
 frank.li@vivo.com,
 linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8963AF0A-16DA-46FE-BAA9-602752410E8E@qlogo.org>
References: <20240616073721.5696-1-sikes@qlogo.org>
 <171958790864.2433364.265100419611870394.b4-ty@nvidia.com>
 <xyxjlp6hb7jcwlhbm4tpmt5npx74qpuzybzakdkev6ta2nl6go@txh4ue7faenk>
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Proofpoint-GUID: u89jsPXj7xKgzWCs8LVTHXImHZwFfTB6
X-Proofpoint-ORIG-GUID: u89jsPXj7xKgzWCs8LVTHXImHZwFfTB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_12,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=825 clxscore=1030
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2406280129



> On Jun 28, 2024, at 8:29=E2=80=AFAM, Thierry Reding =
<thierry.reding@gmail.com> wrote:
>=20
> On Fri, Jun 28, 2024 at 05:18:48PM GMT, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>=20
>>=20
>> On Sun, 16 Jun 2024 00:36:57 -0700, Jason Sikes wrote:
>>> gcc 14.1.1 warns [-Wcalloc-transposed-args] when sizeof() is
>>> used in the first, but not the second, of two size_t arguments.
>>>=20
>>>=20
>>=20
>> Applied, thanks!
>>=20
>> [1/1] Fix warning in tegra_fuse_add_lookups
>>      commit: f56da7f4048ff41cb029a715935394f5958a825f
>>=20
>> Best regards,
>=20
> Scratch that. Looks like gcc isn't warning correctly here.
> kmemdup_array() does have "size_t element_size, size_t count", so the
> existing code is correct.
>=20
> Thierry


The order changed in kernel mainline recently (very recently).

Commit: 0ee14725471cea66e03e3cd4f4c582d759de502c
Subject: mm/util: Swap kmemdup_array() arguments

Apologies if you received this as a duplicate message. The previous was =
sent with HTML, and Vger rightfully rejected it.

=E2=80=94Thanks,

=E2=80=94Jason=
