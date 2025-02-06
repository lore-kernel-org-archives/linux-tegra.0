Received: from box.windestam.se (box.windestam.se [85.90.246.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187291FCFCB;
	Thu,  6 Feb 2025 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.90.246.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828058; cv=none; b=TAxUhua1r8JkcJXICX/U3uoYrSEhyueaVlEubyJJFKwprkCPWp/ztoUtZs3+lkmqXlAc7WJ9jtMR9T3YqEOsOZHiDhPhI2Mk6Ah9ezvEAl0ULxLa6sAIDBW6fJBu1OIB6nLbfW/tnhNaNz3vIxjThebiNtn3hEavOY+zYYE8VIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828058; c=relaxed/simple;
	bh=8d+2aMdp4wHrWfwojuD6UdqQVMO3zQEkJkTwtgBJEMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1VgTDgNpZDiDujXL1eJd77IUXZOJ+HJ/tOjKfX4usJLdoWL4RunqI983ABh6+obHwqQDksVglhjTL6LDV4SLeKh59I8SweLGQzpePAxJ+pt1cNXTZeLs9S3AocZDL97w34TOBU5Kbux/GCORf0s6F5hW9Tm6q8dhLS46DrubFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=windestam.se; spf=pass smtp.mailfrom=windestam.se; dkim=pass (2048-bit key) header.d=windestam.se header.i=@windestam.se header.b=0vfrmw7+; arc=none smtp.client-ip=85.90.246.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=windestam.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windestam.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windestam.se header.i=@windestam.se header.b="0vfrmw7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=windestam.se; s=mail;
	t=1738828051; bh=8d+2aMdp4wHrWfwojuD6UdqQVMO3zQEkJkTwtgBJEMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0vfrmw7+FWsTJt6cBXIGLZZ0wEIiIb7JesxCFm05z39TCTd9iniJkR7sWwQG83HdW
	 5FIQ6Qf3jYOcp3bY5OsuWRAfwPr4Wh6/87XEppbwfEdm86d9/0V1Y86LVb9lBaVy62
	 7TR/8EGLY+DtoQZC3C7eib+g0PLu1IOREnPTaPb1npHqkm1cqX5ben7WQTqtwpj/oC
	 A/WXurW9n5hrviV52RPzTLYfjyb3wlN31HK7yXPc0hfzc0hMgPwzw3jaV5eP9qBuQ6
	 RY/rCW4b04NuTPut+hLOoc7wAYxGyIx+SU1kFk/gzdwEyaxCuo3HGFZOeYSLsG/OwR
	 L3RBE5BBQ95lA==
Received: from authenticated-user (box.windestam.se [85.90.246.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.windestam.se (Postfix) with ESMTPSA id 112484118F;
	Thu,  6 Feb 2025 08:47:31 +0100 (CET)
Message-ID: <4735da72-63b7-4168-974c-ac4681d69a1e@windestam.se>
Date: Thu, 6 Feb 2025 08:47:30 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJp?=
 =?UTF-8?Q?al=3A_Disable_ep_before_setting_port_to_null_to_fix_the_crash_cau?=
 =?UTF-8?Q?sed_by_port_being_null?=
To: Prashanth K <prashanth.k@oss.qualcomm.com>, =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 Jon Hunter <jonathanh@nvidia.com>
Cc: "mwalle@kernel.org" <mwalle@kernel.org>,
 "quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
 David Brownell <dbrownell@users.sourceforge.net>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource.kernel" <opensource.kernel@vivo.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Brad Griffis <bgriffis@nvidia.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
 <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
 <TYUPR06MB621712E6A082791B397088BFD2F72@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
 <33a19657-a890-4d59-b7ea-5798cf8f7d9b@oss.qualcomm.com>
Content-Language: en-US
From: Pelle Windestam <pelle@windestam.se>
In-Reply-To: <33a19657-a890-4d59-b7ea-5798cf8f7d9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Are you also using tegra-xudc ? ep_disable routine may be called in an
> atomic (interrupt) context.

Nope, I have a board based on a NXP iMX7D CPU, I'm not 100% sure what 
the tegra-xudc equivalent would be for that.

//Pelle
