Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC074258EC2;
	Thu, 15 Jan 2026 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495334; cv=none; b=oDx0A2Viqp3ssHpRqO+4J2QLcuNMsVTFSV9Jw9ZjDGJwZ74fMZcX65VK06u0JOAx9f+d+buhqSlq4Z1s/I3DaM4UzfjULNNO9YOmqmo/zKjfHL/Soci2hyXVAYCqV1OqHVTRpmO67pJBtHk8OAxe00JhRfgoRN2ckXuNB/S9KWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495334; c=relaxed/simple;
	bh=XoZogkPOIfB1Gsm6ApG9Ui7pV6gmv97lnUS7SADFfyY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tyWcEoVLpZYPC8qvkkGIMOSdQeiv9dZVO+l9WIkqlLWqIpBQKvd+HSghk37KBzSTKdEMNOGBwESmfYEY1KQHM6DD70dTFvsspNlEny2ZelNUphIi0nneR85b2dxOwrKeyLRnZLCIPQg0NmKZZsVsp14LB2eH+TmlL/N2VmT8/qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=i78PXqZF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AG9RDkhh; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="i78PXqZF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AG9RDkhh"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C7F6F1D00077;
	Thu, 15 Jan 2026 11:42:11 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 15 Jan 2026 11:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1768495331;
	 x=1768581731; bh=vtoo9zCrEINleF+1LKaty9IqadvZTH6ofc8ImJa5hZA=; b=
	i78PXqZFN++A88VgebX16dgp1p2uKpY6Jg8kMHaTdTW5/2j/60o+RQ4teLYGvWPE
	INd53pQXpNYro2eexcV7CV9ebzv987Mk/cCgiCj2qryeXKD+x9TKG14/DCl3wrV8
	t9WBZobfIdKMs10Lf5ov3Zpn82SofIarjhNeb/X5+dzQbgiKGBgUAaypVu86SqCr
	/IYa7MgyVPLu1UIcmxKfl7iuThjPOfAm65mKkwYdKIDpELOOb0QSWGO6Ewzs+2z+
	PdLClDylpm7Vm0dKKtd/hk0ICPRXXP0UUXaKVgiLVeoh80r1XtemzkHQX9fY8R0v
	E1vxvn0M48c/S6wjPej69Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768495331; x=
	1768581731; bh=vtoo9zCrEINleF+1LKaty9IqadvZTH6ofc8ImJa5hZA=; b=A
	G9RDkhhu1gODRH2hgEtAYFeWaJ3bZDOsNGwMBMBdBr/9Y0SQvHd64Rx99NlmFkBK
	3FjlHqjS1X4wqr+RwdJU+T733GaRYR87KUks1shLXjPcvSB1P47MxBrcEJlGxUB8
	o+qbYLtM9K99FiPtMhZO1B2mzhQB/w9xk0tluvKyGyO4TY5idkCW/Zz0IQiNCmNJ
	JaeMLQWM08Aa3uQc924lTxzd/4Dow1sAOAlbBeMg1gE120oJq40OcuRQx/7pcgfn
	wJ4S5KzQOKT9Uw7qY1r0R8jJID1SA2/jZNNxITf4R6SJ4PCRpxj/p2XYiuFWz/Or
	JDdnQVJboYEWOr9BJ1igg==
X-ME-Sender: <xms:4xhpaQIdSYqC3y-2JE27KtLKkfDBPuoQjN0RyqPBmGcvhimmQ4wZUA>
    <xme:4xhpaa_5l-a-kSn5CVCjk0UGaJ46gpQvfpUH7qx6p3JZYp7jfvZkD3IIWFpuiVbK5
    zMv9oY0G7NVjS0KvnGXl5W6zfSxPndlw1gcI-eqZUWUUq6bQaWAZ8U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeiheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepieeigeevfeduheduheffhfeiueffveeugffhkeelheefgeevteeifeejledutedt
    necuffhomhgrihhnpehoiihlrggsshdrohhrghdpkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhn
    uggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdprhgtphhtthho
    peifvggsghgvvghkuddvfeegsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrmheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpth
    htohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4xhpaS1TLcDaHvxENQdAsts0p2wKRMJe4GQ2yZ4l5Gen1u5KPrMe_Q>
    <xmx:4xhpabFPhRigdVpOj_UgemFdEF1xwcZenF4dIoVYwwaLBmfzvrqAOA>
    <xmx:4xhpaVtdSL8MkjnguQvCLjDmMzrT9mjEhNBjC-B8PeGlOckqNoV5XQ>
    <xmx:4xhpaWqSBTIybq5fPwFN90q7W0veC_YSSuF0NU1hU1hW9xuvs4RdKA>
    <xmx:4xhpaZcpQrrdFhWSWFHmN2AcHJot6tBUVUaXacdERY-powDs4Ki1whRB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6CD5E700065; Thu, 15 Jan 2026 11:42:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASELbE4oFPCV
Date: Thu, 15 Jan 2026 17:41:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jon Hunter" <jonathanh@nvidia.com>,
 "Thierry Reding" <thierry.reding@gmail.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Aaron Kling" <webgeek1234@gmail.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Message-Id: <c41a9d20-2221-4429-91e6-74835f89c9aa@app.fastmail.com>
In-Reply-To: <fced85f4-07b0-453b-9969-19abbef3f840@nvidia.com>
References: <20251217104744.184153-1-jonathanh@nvidia.com>
 <aUPrVFWKfFYmuwhB@orome> <fced85f4-07b0-453b-9969-19abbef3f840@nvidia.com>
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for Tegra210"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 15, 2026, at 10:50, Jon Hunter wrote:
> Hi Arnd,
>
> On 18/12/2025 11:56, Thierry Reding wrote:
>> On Wed, Dec 17, 2025 at 10:47:44AM +0000, Jon Hunter wrote:
>>> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
>>> Tegra210") populated interconnect properties for Tegra210 and this is
>>> preventing the Tegra DRM driver from probing successfully. The following
>>> error is observed on boot ...
>>>
>>>   drm drm: failed to initialize 54240000.dc: -517
>>>
>>> For now revert this change, until a fix is available.
>>>
>>> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Tegra210")
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ------------------------
>>>   1 file changed, 24 deletions(-)
>> 
>> Hi Arnd,
>> 
>> this is the only patch that I think we need in v6.19 for now, so do you
>> want me to send a PR or would you rather pick this up directly?
>> 
>> Here's a link to the patchwork for this, for convenience:
>> 
>> 	https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217104744.184153-1-jonathanh@nvidia.com/
>> 
>> Acked-by: Thierry Reding <treding@nvidia.com>
>
>
> Please can you let us know if you can pick this up as a fix for v6.19? 
> This is still the only fix we have outstanding that needs to be merged.

Sorry I missed the earlier message. I've applied it now, but in
the future please forward patches to soc@lists.linux.dev if you
want make sure they don't get lost. A pull request or a separate
patch works just as well, but sending it to the list means it
shows up in patchwork[1].

     Arnd

[1] https://patchwork.kernel.org/project/linux-soc/list/
