Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872533;
	b=35ruvHZUtu8EQU8ZK7begyK9oAKz0McvsMNFYwFem9/6byyi7HU7KjnKsUF5zEs6iNtZ
	 3fK33ms6xLtTAVa9xkbOAb8EsHiMPFId6pj4ldUYmARhuWzWQjloH9Y2BzZq3hk9P/yIV
	 dI+7P3cb0idsyA2uX2tsnhdbRQR7S/cEYWSB9q2iUEFCD2S0b12/ur0obJ0hZxaj0M+pQ
	 LCuqwyOEfvJ0/XK/u8T6YEvi1Q2GWE3GhnPIrC08St+iPzWAZ3/jAuL9jaEJvWFGGRuD6
	 J6iYcApbs7tAeTSl0G6sVc/UouIG2OLi56dFmEDDRy6/A3+4aWo3YcbX6Ru7IYWhmNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872533;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=yYe6CIEzHHIU5GeXhJHljatRQTHK1/buaPUEJDpwMkg=;
	b=HaUnJL7tQA0CIHm2gqRdnDcdUDm/McxYYplUTkQ6QeNtohzGoRF2eBHfnNUr7vZ5pho3
	 OiOFgRPrVN8HoksCERHaoJRE1hBPZJClC2PFBobm8pS7US/pFGSIhlYaniRqPHAiS/4qX
	 0yYXQTIa7OJYMpqfJvdG3xeL5UR4+UFQkdSfZj4oyGJwxFjyYw0TGqCWganWTnqFkZDjH
	 +6KK3FrBLUggzEoAwDaNXAg4bMVAiORt0CnrRVt6JFXjWEFU9DrOIQ8N+OTtOgNeYSvBR
	 B53Kq/uNK/kVbbcm96m+uB7lw8CRbA93cC/AmebF7Xz+vl3cXxd9CyKQk/8vSdhlfjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=KDs36gqI;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BwAB4lVo;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB94606D803
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB94606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=KDs36gqI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BwAB4lVo
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id D687D1D0019D
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 04:55:31 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 05 Nov 2026 04:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793872519;
	 x=1793958919; bh=yYe6CIEzHHIU5GeXhJHljatRQTHK1/buaPUEJDpwMkg=; b=
	KDs36gqI3uiWbSo5Nq9ioN7evjZ6TcDxqEJJ2uFOVOZFaEWZu2riXOj793mSnSXW
	xCXBwKkiE1r96MCzEPA1Eoyk7rSNPF2UqnxP43vbJxPc3UEo7xPrFaEEOvR6i9Ug
	pxqixVIo65QLZYGCT+JIs1CzBBlmuydRpFOSR2tdIRpgnCVKUlfctmuib90ERZkw
	Id9PxNAs55xhYT6fAWZlNezQFasWf0nxcVjEyiVN6R2M6eaqjQaWp7tj6cKTf1s/
	vcJH455QbYD7/+ML/3QjAwOvnhBkOlaNqDbY9biqzpM4rVfP9Nft0sF4tHsYWHAO
	ssrgnJ5CZ+pYHq6gKe8R5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793872519; x=
	1793958919; bh=yYe6CIEzHHIU5GeXhJHljatRQTHK1/buaPUEJDpwMkg=; b=B
	wAB4lVo2hy1QNhQ78Cm9AX0hg+SnCZ4foAEUota4c2DUNe7kFUMmJ3VR8DVrEHHQ
	4mvMquylkKwyVJFqAaYcOV01zgE+awwLSKHHHPA3yAeUSjW1jcY/cxp5bQb6EXhz
	K+RKOaAA0wl8eqmUp8l5Y+rUkwif9pEo2mw39Q01DT6mceUYasfS32p9xvTN1JY8
	IZ6GECymD1zc2ozfspJH1LQujNAwe8r0cRy6a9ZB+XPdu0EwW5QUQkFub4ZYsR16
	Fk5+i5r9OfsYqsv/c4ZobqpIIJuOhh78fJD2k7z4p7M5eReU243QEZU2cTz05aw4
	4vHue3vEba6VFXs4ZWkaA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793872519; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:nkY+Wq3rIbyzBvMOHx0Ukmz1jj/UCGwODGRRyQ8Cdfr51Q4
	xvqOOSUqg8OiMj4wVl9i/D7164cqGrJHSNElcYZ468pVFciWgOn/l+15wNENoLeq
	YHMZNvif3R9XnmS2JoRXdsWx14KTqaQ+lXU/C8ptYE119jqMp5B9rxNYU4PZZyAr
	KDiyCtyO02BWiNdlrXMTsnVRq/xhGChxed0CFw7qBmSkofv+AfK3QjEb2QqTa2GV
	6lv3tMefXgPD49EuFGK6PCqEBRJeSZ0K1etzR1ZVnbvOtfL8vWaD19LQH+kQDnLg
	Te62cEV9s3/mP8ug3xNbV/QnIMeVJZ43pVpLz7Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:P8Kh0SV27nFzy5+qlPgzS0dQZrOaPuYkmuY2IvHDwAQ=:uYdk09vuVwBFCmYlcqg2fixxKgonfy3RDZ+Q6EFVc9k=;
X-ME-Sender: <xms:gVLsaj0sbFfE7q-z85_VG37V1N-9GAI68Z5wFUuJMYYZTLKRCJPQvw>
    <xme:gVLsas53mPKtRA_S4BIa_NQfLvB1kxOBSjVhzJxh4g6z7ZQEXchKmKAhGLLiw-Cbb
    kTgjARPTyMi_ArTQMVe1bXjiTERHxBKS91Tj52UoJX0uxRCupwTg3I7>
X-ME-Proxy-Cause: dmFkZTGPZKrpK5u23rORwwLT4VcYjpOGZf3598mqc5qOQMCBzaafa8Wy9yw28dXD8b1Z5T
    BgrdmYNHuIX42ZpBNE+ClLn/OyWCusOaI+18SMDwzRoinwpq/yxS3TOrzxLu5FFRs/lz6p
    9DxH/iqqZ8vrPgnc0wkHjaW+VjgtHRLStx/jdwKMTtPgPdJ5JwwjQw63HXILQS84TNn/kb
    6l4x6O3QdVWX3fZtkZbX9w3Lf6RHr3xqZY+/QESgnfLLhr47EWqmjfdbDxM9E/QD3qKNoA
    tK5npRZx09cl7kB2b0YMP9gm8f5/PeyrmdlXxPTXNbH3SkME6rLQE+QHfp+a6MAERjnVt3
    qpDeivDWHrTolLr0rANMg8uEwtmRGE1Uux5+t2HMGMTYXcFHaJC01/9kXx7ltQ1ggnQHGf
    WsKMf/HRlPLUeEANPNHdHvBwqY62i9kxY7cUy599e5PW+YBm9k0wxzjjOCsGs1sKIiLRM0
    Mur46/M8P/uatm7Q9qGPYqVetGBXQyEhmUv3KITfgfxM2gm0gZtd/bt5/+r8XDIAxCMZTn
    ZopY865rZ7ieF7sc6TYmzyYO8GztgJHC23M6TOfeof+LzVc9M4N9AhfFDiPojnKO7HPXKb
    /ppbr3a+Tk8kZ5Ld0mQyOQgOkCeJbQwRGRFZJY8W2YUVpaSXZiM6+lPm5gmg
X-ME-Proxy: <xmx:hFLsaoMygJZEtNhr4I2XHpP_ye6aFV380_3Mte1cJTLnO4JVCVUihw>
    <xmx:hFLsavXnyTbzWl7xvLzoQg15tZKu1J8kDPiuVvPWZVPDmsiADGzD_A>
    <xmx:hFLsagbv84RL1yQWdoTVZQbHx9R4vrJtmuamqMSgtuhN2wRJ57XWJA>
    <xmx:hFLsasva9e8PnvS2O-DWbc7k-SeL-2JeR908j6V24eJtdnuBRbEDXQ>
    <xmx:h1LsajVXGhqXW5KkG2wi3Bh6LRcA_rB0wM-ZxI1qIqOMdnJwwMKsfP7d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 31C9232A0099; Thu,  5 Nov 2026 04:55:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Ar0hN4MWufik
Date: Thu, 05 Nov 2026 10:54:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Thierry Reding" <thierry.reding@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org, "Jon Hunter" <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Len Brown" <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Hans de Goede" <hansg@kernel.org>, "Jonathan Cameron" <jic23@kernel.org>,
 "Mika Westerberg" <westeri@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "James Morse" <james.morse@arm.com>, "Ben Horgan" <ben.horgan@arm.com>,
 "Sizhe Liu" <liusizhe5@huawei.com>
Message-Id: <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>
In-Reply-To: <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
 <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
 <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 5, 2026, at 10:30, Sudeep Holla wrote:
> On Wed, Nov 04, 2026 at 04:11:25PM -0800, Jonathan Cameron wrote:

>> 1) Basic stand alone driver stuff.  Mostly that's all pretty standard
>>    and follow the specs where possible.  If there are gaps start asking
>>    questions. Linux definitely  doesn't support all the stuff that has been
>>    added to the spec in recent years.  So this covers things like register
>>    addresses, interrupts etc.  All fine, hopefully a subsystem maintainer
>>    can take a look and will have enough of any idea.  If not ping the folk
>>    on this thread for help.  Things are a bit flexible for consumer type
>>    devices where fixed and bodges are common, generally less so if it is
>>    server grade hardware.
>> 
>> 2) Stuff that is an ACPI spec gap or place where we'd expect generalization.
>>    There are several examples of this on list this week and a few more in
>>    my inbox.  The particular series here might fall into this category.
>>    I've not figured out enough of the details yet to say definitively.
>> 
>
> Nicely summarised or categorised Jonathan. Nothing much to add.

+1

>> I'd also expect a driver using AML as the target interface to either
>> point at a published spec doc, or to include some snippets
>> of the AML - that can be a lot easier to read than the driver code
>> (imagine reading DT by only looking at how drivers parse it).
>> 
>
> Ideally, it should be just HID that any vendor needs to publish unless
> they make use of any custom methods or something device specific like
> DSD/DSM. I would expect most of the devices to use standard methods and
> properties that are already well defined in the ACPI spec.

>> Given that has new ABI etc, I'd expect that to have gotten broader review
>> as well.  Probably keeping it to linux-tegra and lkml alone wasn't
>> going to result in anyone noticing!
>> 
>> https://lore.kernel.org/all/?q=20260929095915.2215685-1-anrao@nvidia.com
>> 
>
> Agreed, it shouldn't hurt to cc linux-acpi for such driver ACPI enablement
> patches.

Is the "BMRQ" in
https://lore.kernel.org/all/20260929095915.2215685-3-anrao@nvidia.com/
a custom method then? 

How does this relate to the EC and PCC interfaces in ACPI systems?

In current mainline, I see that the bpmp driver is used on DT systems
by the tegra specific cpufreq, memory and pci drivers, but I would
expect that on ACPI those all use shared drivers. Are there any other
users that are not already covered on ACPI?

     Arnd
