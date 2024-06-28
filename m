Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com [17.58.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74BA626CB
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 23:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719616486; cv=none; b=M3gSWrCXg7wcdLdzWf8A07wNU5kiTwuG2uQR99p4dYiodogewQw1nqMdGlHLudLNMnMFtM/rxv0CCSRyKXrNT7XSfQ0r6a8VPNZlFPvblPtAREGTgGy+0OZKeBaEln06yrjGkAtAKoU1qyyKUUErasKFQko6FuFY4msRyX6NcPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719616486; c=relaxed/simple;
	bh=keWjHNwrplzMe1yHzdfjb9hGCOvcOJn7XkaJ1+yBGak=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WLJ5EdRTYc6as0dAAqTKquTC8G5FlFvLUfKIrMreg5a+QD4VhGMUuYvKaLi72VSq/oIWaJ/OB5ZkHO1IW9V/1q2zcDJFudQWksvV3VVdVUak4fa3mCpkdtXlb5LCDeqnZW4mTrSbcV9fwZAXr+3SpVExV7y8uaMIXWy1W1IrkXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=qlogo.org; spf=pass smtp.mailfrom=qlogo.org; dkim=pass (2048-bit key) header.d=qlogo.org header.i=@qlogo.org header.b=rt4Xfrue; arc=none smtp.client-ip=17.58.6.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=qlogo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qlogo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qlogo.org header.i=@qlogo.org header.b="rt4Xfrue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qlogo.org; s=sig1;
	t=1719616484; bh=U+mM5AgSKk9Kx0J4JYeP8IL8tu70jv7di4g/FWoIVWQ=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=rt4XfrueK0kB0XAHMjZZDAxT+A9HMKA7kEaRnge9X7S09Tf0NeSerM3RT1KoohDXD
	 JwbWgmw+MWR6T7OwPuwH73+zT64r4pnalvy+Z/WV8SecV4snYJznKNUANSVA5PWEtI
	 UM04yy/jv1y72gaDWLLmJels04Wb4JanfQGRZT1jGg+1AOFzJpLUSXL+lh4KE+UJSH
	 KUxS5hrSOGkIsyBitUqzYB25rSCofH50KOBY7qJxOynGJ0KLNbtSebKlQV8jARe2zx
	 nJ/mcXW79YcPr/hiTLMhyUapWB4KRMym5maD3iX0lZs1JN+e8nNGZtCkJlNDqICXUS
	 NUy5lsDjmrkxg==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id B2CE64A0181;
	Fri, 28 Jun 2024 23:14:42 +0000 (UTC)
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
In-Reply-To: <2etkg2arvsxtjgoxuaks34th5llpe5kn3bakelz7naeghexval@s5up5vt4a5gk>
Date: Fri, 28 Jun 2024 16:14:31 -0700
Cc: jonathanh@nvidia.com,
 kkartik@nvidia.com,
 rdunlap@infradead.org,
 frank.li@vivo.com,
 linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F7BBCA12-BFCA-4B19-89EA-A9B251FEDC7C@qlogo.org>
References: <20240616073721.5696-1-sikes@qlogo.org>
 <171958790864.2433364.265100419611870394.b4-ty@nvidia.com>
 <xyxjlp6hb7jcwlhbm4tpmt5npx74qpuzybzakdkev6ta2nl6go@txh4ue7faenk>
 <8963AF0A-16DA-46FE-BAA9-602752410E8E@qlogo.org>
 <2etkg2arvsxtjgoxuaks34th5llpe5kn3bakelz7naeghexval@s5up5vt4a5gk>
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Proofpoint-GUID: S4eL8GHs_Vg0hLqjRzI6e6ipvbnYK_Jk
X-Proofpoint-ORIG-GUID: S4eL8GHs_Vg0hLqjRzI6e6ipvbnYK_Jk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1030 mlxlogscore=798 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2406280176



> On Jun 28, 2024, at 2:27=E2=80=AFPM, Thierry Reding =
<thierry.reding@gmail.com> wrote:
>=20
> On Fri, Jun 28, 2024 at 10:17:13AM GMT, sikes@qlogo.org wrote:
>>=20
>>=20
>>> On Jun 28, 2024, at 8:29=E2=80=AFAM, Thierry Reding =
<thierry.reding@gmail.com> wrote:
>>>=20
>>> On Fri, Jun 28, 2024 at 05:18:48PM GMT, Thierry Reding wrote:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>=20
>>>>=20
>>>> On Sun, 16 Jun 2024 00:36:57 -0700, Jason Sikes wrote:
>>>>> gcc 14.1.1 warns [-Wcalloc-transposed-args] when sizeof() is
>>>>> used in the first, but not the second, of two size_t arguments.
>>>>>=20
>>>>>=20
>>>>=20
>>>> Applied, thanks!
>>>>=20
>>>> [1/1] Fix warning in tegra_fuse_add_lookups
>>>>     commit: f56da7f4048ff41cb029a715935394f5958a825f
>>>>=20
>>>> Best regards,
>>>=20
>>> Scratch that. Looks like gcc isn't warning correctly here.
>>> kmemdup_array() does have "size_t element_size, size_t count", so =
the
>>> existing code is correct.
>>>=20
>>> Thierry
>>=20
>>=20
>> The order changed in kernel mainline recently (very recently).
>>=20
>> Commit: 0ee14725471cea66e03e3cd4f4c582d759de502c
>> Subject: mm/util: Swap kmemdup_array() arguments
>>=20
>> Apologies if you received this as a duplicate message. The previous =
was sent with HTML, and Vger rightfully rejected it.
>=20
> That commit seems to take care of the change in fuse-tegra.c already, =
so
> this patch is no longer needed, right?
>=20
> Thierry

Ah. Yes, you are correct. All is well.

=E2=80=94Thank you for your time,

=E2=80=94Jason=
