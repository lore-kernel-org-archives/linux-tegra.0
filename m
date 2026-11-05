Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837502;
	b=tdS3xA0x8Pzj033DGbA8zsTCdBoYqJt3IITPDdW7r1/284buRO2BO0pzFisMno/wWAg0
	 0QZLjGqbVryYmuacwsKjDJnJYOmWs1Z9bnnNBNYrG01h9gGfmlKA/08ghgbdlXwIemAQt
	 /kpoSyR6P3fM8ydukJWiL6CLoiUKGGVr/xUIhAxXXdZR7JvKphX9aO5m3juiQHYH9pCFc
	 I4eiKgkyeUOqVnp1hOtkucQSnOl9rnI3J+sv9ZTpyCQIKMjm6AnEP4G/QYQGc3PoHkE9U
	 V9lVuEBjRdcdJonvunsbyebVSw2j7dqfJQaq4vFf4cBEBzEOeGgKdTXMQ+PN6zYp4+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837502;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=;
	b=r8r2caXq8AZ8u1ZWxl+ire4IAsVmnkHagKV4SdMS7eVsSdeKHdm2lTu1M0E6dwgovO8e
	 nYo2NFKc8IYaHBI3Jtg5GsydHeaTvuP3ayo4JiLHIiAPvZrpleNScZhQe2M8FdTvo710n
	 mGIFAFwKU9c7gikXq9u90rh5NpA+nuLi6sa1yGQWz5ERAalw+drXQaHWK6b2eVv91WeiV
	 uO/cg9x48xtBfCf0dZVVgIKH/tcxeJPepwe9dW1J+LeiM+CIhabIRBIyG48GIcjAcNC9Z
	 MbmWtxRi04+2Ill3X4dn9cIFN7YIArBHvnqVq3z2E7lFwiakAwMpGJ7TBRYxxeig8Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d/1758ii";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUXhrNpj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DA1606A329
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 00:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d/1758ii;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUXhrNpj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4LUgsG2828756
	for <linux-tegra@vger.kernel.org>; Thu, 5 Nov 2026 00:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=; b=d/1758ii96ozVzWf
	BzzbSupEWj/IFudrwFQhlL0mxAy495leOOosbr+TuXez5+xLgMEe3AEPxL0W6b9r
	Uj8Pf8nlU8Hg1gZWQKTep2g869qG9qoiRJR5nYSwGz8WipojGnfUTNiuOm+oa7NS
	FZgygGxzyCOhlXNXdNNfPU0oH7nT2juze6RJ2RlTQAm3B9dcGAIPgLiSDlC+9jtB
	I74mO2jf+pOWK/kwSF7Xc6iKzcoLHVJFFYrHp+aeVlmb05UGSvZhqzS30AJjzTW9
	QWD3AGHJ9Qt6WVdxNu6ZCV9UwugkXsxhv1vnJG7lN7AdAkpI8Pjxayn4QYQAyWwT
	erYWuQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284ud96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 00:11:34 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-15a84442a0bso48992c88.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 16:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793837494; x=1794442294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=;
        b=DUXhrNpjhMeYQIVFcafIL6b6ZpKJQrml9gtmsmgmN6VylwFUUDcEj4ea86bqeW6Qob
         ru88WLPaYjFEfwI9IzTUCyafBRnCyElu/Jxr5NnP6wXReo5mgmZD7tvZztiqwfQX/z6E
         Ip6tzk0j9Qj/bU1C4czIWzURRJrhPXSqFcJWG6ytICf+uJjKCx+XPvI+YdB6Cr+uvlPm
         +vdNA+iWShsSq24siGcmXcFZH9jfCVd0VzvOleMangKVZLMfMZV95cdqOsQgBet34227
         Eof2OigcIj88usZNdK3VtEjDJC5QDT1THD+4PAQYXlQrDFGbkEqybv2UOcI9P8A0NgS3
         e3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837494; x=1794442294;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=;
        b=Ku++e5nV1lV5xL90HwAyfGbAIM9HJ89ewZCgucEVasMcqlOIRcN/qWQKCj4ss9nxoV
         mMl631RNifNYLl91LQnPxOhu4aFZofPBIbqBSH1unxAEjXgvdw+sxt/xIkrTi4Kl6dRj
         Vg4LaeFJ6aPZDdKh54lMl3QSrj4mkiVPiD0N3q61Pu8DhA1sncRpg/Gwi9jdhoU+4Tom
         c3NyUTTpVo13iyv8igSiek/lZVzERhZzJLi+Z9orChYUh8XrPUYRm16KCMm71aPp1F0f
         3ybJBaL+gtRuDXrX2MnCjGjPT6O8+lkLITgyxc3tKiJnNZUSbu89BKB3+iiWJrINmZGk
         qI+w==
X-Forwarded-Encrypted: i=1; AKwUvBy7grB0f7DJSBrGdSa2be+hCsVk1fplUojqkvbtVF2OpK79Sn1slnraSJ1TQJBclIoQUZop4J9woNwS0w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZFocgulsz1CPMw8kzXo9itNvFt5b7HeD51wSE5w5ZdqSunTJy
	mnWEqyTdz6RoPirWyuxt+zBPL02IXqUy7IgCbEJrhC1pyePlNZCWdYDkXlwkOb7eXN5NLjx1Iau
	v1NrvA71wS1cBzpxMo+xzG3H4BNT3r7sY77Ak+39o0iu1uph+15S6imdTE0pQoh1yyw==
X-Gm-Gg: AYBFou1r+eEkS7qdWjtc2VvMMIW6ugKYmI0N4k0ePWr0g5Y+2Lpc2tgoEvh5cBKzZTr
	rZsdETQw1EG5H0fMsha79XMdN9cY+QKzUQxhmshG9ubiFxRmfpdk7mxon13gvN6hfXDQhBypz7l
	aZXlkW7sjJbHqXHsDOM0aIsyAqj2KczVLM9Zz/x8JwJTmNP9kAFBx7zaiRD/TjKMutsidTENixw
	M0ZCu6GMakaqbL7GlzcCab5kBITcuSSbsVakLTm4sZLAT3+YjGfKRk+Pf9S94/faM6crhjnuPd/
	dn9QPapvxoeuyx/lSfMhgGk45t35EsfQjtLj9e95XTVCVDIJfa0WN1ANmkvO2VIRtms2C+13H7Q
	agcKIjBpQdcF1wBYPNcg9WWEF2NKY0KNJJBtGXGElOOPLaaPuGfJH4QwZh6UJP/cdkiMjRpGro3
	0BVs3yvYaAy7kxrol/przW3ip6rg==
X-Received: by 2002:a05:701b:418c:10b0:1a7:4c5f:57e9 with SMTP id a92af1059eb24-1b24f4e4cdemr1394425c88.27.1793837493643;
        Wed, 04 Nov 2026 16:11:33 -0800 (PST)
X-Received: by 2002:a05:701b:418c:10b0:1a7:4c5f:57e9 with SMTP id a92af1059eb24-1b24f4e4cdemr1394386c88.27.1793837492930;
        Wed, 04 Nov 2026 16:11:32 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm10961037c88.8.2026.11.04.16.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:11:32 -0800 (PST)
Date: Wed, 4 Nov 2026 16:11:25 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
        Thierry Reding
 <thierry.reding@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, arm
 <arm@kernel.org>, soc@kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Len
 Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, Hans de Goede
 <hansg@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Mika Westerberg
 <westeri@kernel.org>,
        Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        James Morse <james.morse@arm.com>, Ben
 Horgan <ben.horgan@arm.com>,
        Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <20261104161125.00000523@oss.qualcomm.com>
In-Reply-To: <autmcaraWcXIoRfZ@ashevche-desk.local>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
	<20261003095924.1370238-4-thierry.reding@kernel.org>
	<928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
	<auslF5pwDHtcNoCy@orome>
	<bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
	<autADOKsSVVMn6r9@orome>
	<CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
	<autmcaraWcXIoRfZ@ashevche-desk.local>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aebc9b6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=QyXUC8HyAAAA:8 a=t4CJLuyQXvHctLNzf8QA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: FLVWP7mNw-qrs73tVPVaK-jVwEtU60QD
X-Proofpoint-GUID: FLVWP7mNw-qrs73tVPVaK-jVwEtU60QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwMCBTYWx0ZWRfX5uTyzLA7j2Rr
 tdUIGGdMsz9kfDVLALg2drXwx9oZbuHYbSm7hmZeA7cQeQNMMnDWJ3YoT2dV4EhoOLfYRQqSdu3
 9ovX9PLq8kqypGsA0F6Mur/43V819gN3qs+t51+24YSdUO8hBwcfV3ytGYaYqqfpF65fm8sz7So
 qDN7HjZFFgQpN52lh9GOpfKmKR32Usb4S1He5pEuFG3vutttmQg7/LlOg5QtZSFYE2Ghjzle2Jm
 AaAmnzBVqKkIjf+qJKzCmkxAqd76uLoelGQyFkhoTXuP+Y2ChPSPNX7W/8P+DyLQ/KfG8k0Mz1I
 U9I84kgsgC+Pgl4PkQvfAADkOLJzhaJZzCh9z6lWtTgTErgbZQlKL4+ZwaaEEF01aTfXC6IaJJV
 8ovIqgHKMRQPR+0h7OSvR+ynJ3PeVxVsp9aNeOaxESpBdu2/5Q3K9bYPFZqQkefXNCTKh7YN45e
 YHsj9XzVIhMAEaDIhmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwMCBTYWx0ZWRfX8DKLbVpCauJ6
 2LjaR+WDensjK+MFc9FNZ195OylAaTJFf9uBfTDMqnz1V7/8111MHmHybFcFT1mr/fT20Br5HYe
 LMLYf2021do8Np/CY2HCfQejNZaDcIE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050000

On Wed, 4 Nov 2026 19:08:01 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, Nov 04, 2026 at 05:28:18PM +0100, Rafael J. Wysocki (Intel) wrote:
> > On Wed, Nov 4, 2026 at 3:41=E2=80=AFPM Thierry Reding <thierry.reding@k=
ernel.org> wrote: =20
> > > On Wed, Nov 04, 2026 at 03:11:09PM +0100, Arnd Bergmann wrote: =20
> > > > On Wed, Nov 4, 2026, at 13:42, Thierry Reding wrote: =20
> > > > > On Tue, Oct 13, 2026 at 07:22:23PM +0200, Arnd Bergmann wrote: =20
> > > > >> On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> > > > >>
> > > > >> Where is the ACPI binding documentation for this driver, and who=
 is
> > > > >> responsible for reviewing it? =20
> > > > >
> > > > > Sorry for the late reply, this fell through the cracks.
> > > > >
> > > > > Admittedly there's not much of a formal process here at all. Anyt=
hing
> > > > > I've received up to now seemed to be fairly straightforward suppo=
rt
> > > > > extensions like this where the ACPI tables basically provide the =
same
> > > > > information as the DT via standard resources like register ranges.
> > > > >
> > > > > I suppose for anything beyond this, we'll want better documentati=
on and
> > > > > broader review.
> > > > >
> > > > > Is there anything in particular that you're looking for? Should I=
 guide
> > > > > people internally to always Cc linux-acpi for anything that conce=
rns
> > > > > ACPI? =20
> > > >
> > > > I don't know, I'm also still learning about how this is done, I
> > > > was hoping that there was already an established way. =20
> > >
> > > Yeah, me too. Maybe Rafael and Len can provide some guidance here. =20
> >=20
> > I cannot speak for Len, and he has not been actively involved in the
> > maintenance of ACPI support in the kernel for several years.
> >=20
> > As far as I'm concerned, the code maintained by me is mostly located
> > in drivers/acpi/ (as per the relevant MAINTAINERS entries) and it is
> > mostly generic code related to ACPI support.  I generally don't
> > maintain device drivers using ACPI support except for the ones under
> > drivers/acpi/ which mostly bind to devices representing interfaces
> > defined in the ACPI specification (which is kind of a special case).
> >=20
> > But there is more.  There is ACPI support code in other places (like
> > for instance gpiolib-acpi maintained by Andy and Mika, or platform-x86
> > drivers maintained by Ilpo) and there are experienced kernel
> > developers in the ARM ecosystem with quite a bit of ACPI-related
> > knowledge (Hans, Jonathan, Sudeep, Lorenzo - all CCed) who can be
> > reached out to for guidance (and arguably they have more experience
> > with ARM platforms than I do).
> >  =20
> > > I don't know how ACPI on more traditional platforms works, but I imag=
ine
> > > that it's a lot of the same anyway, except perhaps that people have m=
ore
> > > experience with the spec and today might be doing a good job already.=
 =20
> >=20
> > If you have any specific questions, I think I should be able to answer
> > at least some of them, but I'm afraid I cannot give you general
> > guidance on how to do ACPI support in device drivers that would be
> > universally useful.  Different drivers have different needs.
> >=20
> > There are things in ACPI that are not present in DT and vice versa.
> > It also depends on what bus types we're talking about (platform vs PCI
> > vs USB etc). =20
>=20
> And don't forget the big player(s) such as Microsoft that from time to ti=
me
> creates an "extension" to the ACPI (in means of additional tables or how =
some
> of the existing data should be interpreted if it's not clear from the ACPI
> specification). For instance, above mentioned USB ACPI support for some c=
ases
> heavily relies on the MS "extensions". Or earlycon support for ACPI is ba=
sed
> on MS defined SPCR table. And so on...
>=20
> > > > Having a review done by the ACPI maintainers would definitely =20
> >=20
> > So as per the above, who exactly do you mean by "ACPI maintainers"?
> > If you mean "the people maintaining the code in drivers/acpi/", that's
> > just me and quite frankly, I'm not sure if my review, specifically,
> > would be super-useful for driver development (the fact that my review
> > bandwidth is almost completely saturated nowadays aside).
> >=20
> > My recommendation would be to ask other people within the ARM
> > ecosystem who have more experience with ACPI for help.
> >  =20
> > > > help from my point of view, but I'm not sure whether they are
> > > > set up for that, in case there are a lot of new drivers. =20
> >=20
> > I am not and had I been trying to do it, it wouldn't have scaled anyway.
> >  =20
> > > I think platform maintainers need to be a first line of defense here
> > > since they sit at the intersection of a lot of this. At least that's =
the
> > > case for me. Also, I'm eager to learn how to do this right, but I'm
> > > often at a loss of where to start. The spec is a bit daunting, and th=
en
> > > there's various extensions, too. Maybe the AI genies can help me ramp
> > > up. =20
> >=20
> > My advice would be to reach out to people within your ecosystem in the
> > first place.

It is a bit of a guessing game to figure out who are the right people today
when it comes to ACPI and both ARM and x86 platforms.=20

They fall into a few categories and it depends on what you are trying to
do.  Starting point is push back hard on your firmware folk wrt to shipping
something random without an upstream discussion first.  You wouldn't expect
that to work for dt, it shouldn't work for ACPI either. Features
will get rejected if people try to just do something that works for them
(same as a weird custom DT binding gets rejected).

1) Basic stand alone driver stuff.  Mostly that's all pretty standard
   and follow the specs where possible.  If there are gaps start asking
   questions. Linux definitely  doesn't support all the stuff that has been
   added to the spec in recent years.  So this covers things like register
   addresses, interrupts etc.  All fine, hopefully a subsystem maintainer
   can take a look and will have enough of any idea.  If not ping the folk
   on this thread for help.  Things are a bit flexible for consumer type
   devices where fixed and bodges are common, generally less so if it is
   server grade hardware.

2) Stuff that is an ACPI spec gap or place where we'd expect generalization.
   There are several examples of this on list this week and a few more in
   my inbox.  The particular series here might fall into this category.
   I've not figured out enough of the details yet to say definitively.

I'd also expect a driver using AML as the target interface to either
point at a published spec doc, or to include some snippets
of the AML - that can be a lot easier to read than the driver code
(imagine reading DT by only looking at how drivers parse it).

FWIW The driver feature in question looks like it is doing something a bit =
similar
to the PCI trace and tune driver Hisilicon has (though IIRC that has
a presence as a PCI driver) https://docs.kernel.org/trace/hisi-ptt.html
or if you squint at it differently resctrl / mpam fb.

Given that has new ABI etc, I'd expect that to have gotten broader review
as well.  Probably keeping it to linux-tegra and lkml alone wasn't
going to result in anyone noticing!

https://lore.kernel.org/all/?q=3D20260929095915.2215685-1-anrao@nvidia.com

Anyhow, feel free to reach out if you want some feedback on this or
similar. I can perhaps at least point you to someone who knows a
specific area better than me.

Jonathan
=20
> >  =20
> > > > I assume there is a knowledge gap in both subsystem maintainers
> > > > regarding ACPI (certainly this is the case for me for drivers/bus,
> > > > drivers/firmware, drivers/soc, etc) and ACPI maintainers regarding
> > > > many of the subsystems that we support with DT. =20
> > >
> > > Agreed. I've seen some patches where the ACPI support was as simple as
> > > just adding an ID table entry and the rest was all standard, but I th=
ink
> > > once we move beyond standard resources things might get a bit more
> > > complicated. I imagine that ACPI may not even have specs for certain
> > > aspects that we currently handle in DT... =20
> >=20
> > That certainly is true, but the ACPI specification is under active
> > development and pieces that are missing can be added to it.  There is
> > a process for that in place and ARM people take part in it. =20
>=20
>=20
> On top of the above in Linux we also developed some "extensions", for ins=
tance
> how I=C2=B2C muxes are described, or how some multi-functional devices ar=
e being
> enumerated. These specifics we usually document under
> Documentation/firmware-guide/acpi/ (see i2c-muxes.rst for the mentioned c=
ase).
>=20

