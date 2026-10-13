Received: from sonic310-14.consmr.mail.bf2.yahoo.com (sonic310-14.consmr.mail.bf2.yahoo.com [74.6.135.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64D51AFD8
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.135.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904408; cv=none; b=J3Fq9pPrKqTNLMPJjgjHL7+XVuqFQHwGQy8ZUpjCrG2Q2tqBYqlIpYOklYJv8mCYkUKgZe56PpY+H9wuCDyJdxjoDIPBZTeU88+zzO75QZrJCSOBquKWoR3WsA2tnkt0gua1bDpejHRY2Z54+QYdJRVknHtLV2DmbHfoO9q7Jtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904408; c=relaxed/simple;
	bh=VWy8kOV5fpxV1rES9+rwWAo2HS95BTyvhW0F6FbOIyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiBE8HXdFJvI73DNLY+HMTTbtU7Hp6i4DLe9cgyu8nAYOd1eljFwkFzfk1+vxiKy/BB8Cd9Gs2ecHimcHWudb7c1v1eaoEdK2GJAe0KFQoLcwi90aRFVvJbikwx+wT+ujhuuCoKcqE5AtTCS3HrgV+xFTgrHlAD3QUh4ZnQFT48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=PtYbF22A; arc=none smtp.client-ip=74.6.135.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="PtYbF22A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791904405; bh=8CabwxGpw7QPwiwrmZsN8gni+LU43IXDehbaUPw+ozI=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=PtYbF22AjCydqZYKfK1+5YGHznj1DzR4VJvg6IFy8RhpQw7Q/K7PDYe0XhFMjNSLdQsb9Z3znJ+IN6pdvPR7RfyhFUNvUeh3bDYAOXVhzvTv4MEGLKEf+UOmvQRXepyJzyNy9YBTJR/qkpOJ2MBBxBbiQ8Hbo+iboP8eO9YMFzeyk247Uv+YCmTWaSlsnoMbhJxYXpoBowUjM26tN+TzAH2UHOtGuQ/VEBuvIFH+c2bV3r1h+WRyLsgTg6O0LC5bMJkn7LyRn1B5ycAKo8qvzRQfl6KYnGCHlf+L7hua0EJklvrAeVD67fv186RHwYhuPTVwXd/GCzD9gO76s4ZVKQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791904405; bh=Gfq3O0CiKPflBA23nNJaVaMPJskvZTeUcIbAnxCRspt=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=mKxgkDHcp1uvnfsI/qGVPQznvT7Gr74r+nvKy/+m7XHHAl/5HBxR9mIAkLSJCF/tLlSBMSCcpjU0wEIVy3UftLtrtw88Wje/HXPIqafLSakFE3KbeY0llI8Pu0jjr+lKJKfCkwk1G5Sd009g/+OahZSsU7nNVIc3D2WC1xHWXZhXqlBJPFxpXUGVgN4CQNjMib5nUTgzrdeD38nTl2iEEwJjTtIchV69YSGfrhYAE9P+uy1fEO8+nB1FaLvu6NLMOqX6ExJym27n0hdWsaF3REs2WjAR1fZqMVGNPb4cPCcvyTHLpMfAHzDWmVo1EMPbK3vA3ZrpuNAHDqskmuESBw==
X-YMail-OSG: gJgxy3IVM1mZ7XAYp4Rr2laLCAMsgib0PHD.dxk9mBSDPTN4r2G8BaR7FW.FRiQ
 MXvqVK1y7z5ENAq82IcHoyn3bf5Pi23yrt7gmGWnQGRJpkEUj3hts9oXP5kOwWsv0n7uEX25mwH0
 cTgWmNvXaLY2Y_G2YZhtUDWq1nN_cu3ctxy6VSzVduNpcvV0CZun5n.beGqRH4ocEV_8Sx3P7IuK
 kfQTN_1DZ1cixunwsE8wCGs8mSqVnJgVn4rOyFz7zyFju3DxqIel3_yFbQXvnN3ZaCQ4JCnPpA_p
 66eh1nPsbBXICwrG9sNRcX_.7d70ZvXFqLp4IDXW3_kJvPVCtMqToRxhskn0tlEpY0BFQDyEMCyU
 xvGiKzAQNUyt0rELZa2eLTKx_MU9a6jgthuAxu4ZZ6cB12B0BuD3MP9f.b1HmPAiCzRheKfQ9sQJ
 itfX.4CJgUPjnpSkzwbQz.CdGElKxzZaIz06iKCjUP3QOwKojsViBQ6k0MM2lmrAtg5Vc8cLebZk
 P4WdowcsPRb.MogqzE2uhDQOteNYuMSOm6jlzy8dMOTGDbkwLoAtPAtrOKk3jYFUk6WDa6JPJOhL
 g58TtQGpBF8hn6A1Qn6XUftfMPI52tfckIVx7UkMjTXXngeOKT9Rm3PGPS1mmlWImzMF3SKmA2OU
 9RVhT0XtaK9jlxs79RaIgBjfCxy7Rgt5e0gp5OYZyrwXN6bG7fO6vkF_spjy8VCOob7FBEeKxFjj
 jWUxIWVOniOMlzmkPwdOFSwdkEZQ5hgox4XKfVM1bqGsB4Rto3sitCvjpnuBdJOxraY_.M5.9lVP
 q904aQGKRpKNoBQVenfJmf1_CEBeLO..3sgs0Bp1jOa3OcY1p_jTWDWiY7Y4PgrQf5bx3bah2PiC
 GEmVORyY4Pu13vYG11LD2CQNIaT02l97WGRkHX9uLHpraWyPFlmHu3KPWzeC6AqVLFvLmKs21kAf
 45fptbhi8.9njzHcRbQ7EGxbkpycHjk0QXucVKDesq35JOePtA7wfZQVpHs4TdHfWT7RPrTR8Chy
 dzmYS9VOmoNub9WdBC4qKiFWrZNIHvmN0BoOwKl_hATOoP..Y8rzpgQyZJjEb56.7tq12jls20HM
 wlptF5WDKr1tWH5.T_G8kTYb_Fz0LG1yV7mFHnclOXs7okvqqvSGtR9h936Bg2WK4f4h3TT9iN.L
 ljTfH5V1uGmKzva0pJZczDMjFL4VO0838mjFpexj.zv1fi_xqhUVSyYzhqcitVbENWVdL7Yq9Nru
 h5vV3mX05V061R9fLBC6KkhINiPCRXxkSnczF2u7NiAJEvexTHL1cvp9O1dy13_38wnIySD.L7tx
 e8hVIrl_CW982im1QgKq7yYLclTKBLepOXYmQkWM1QzMZljYhv0addPEHGURn6N1rckL001fQSAA
 giT92u4WDr1VjnARblE35B.U8DaS8Ek8TllLD.dvWT9S6OQ0TVl3D2IUszoFM9E.yqOq1.qeAOIn
 3PYmDSND83zUH6XHIMyuT4beCJS8W9zKfHDeesXFi3V7GKMKSH93VREnTlQigva4rLbCYJs2csCO
 n2exc9wQ4qdYikhQdyK3XWUmcrvYYUxK3CKkWKlfiOfK5Ay2FyJvWzNLrmoOnma5NaDP_UxQhteW
 aPS3_Bl_g37G0zmoJ.mrCguEiYsuQ0vAD36.VvlvqFp3hbAxe6ps1czsBlk2.0U1zfLyVj467sDP
 MmRKek_JLuu8z4LxiZbHNtWi3_DDU1F.Aj6j9YXjSR5tkcuNuwFJc0oB3nRiNqbZTm4LnxDHtiN_
 I.Z1rQLI3WLhwziQk3yeGQ3JNsRPmi6kPikm3.Tgzg6RgwCbE2GlU8em3LO6_p5A8BnuVu_Q5Uhj
 prMWLSQJ5eUPA6AjjsNU0HVp1J78dtRkZ__q55yJtRNSn0vosotLUWUO4O.nfPv1XfKzX6SEPgwL
 TmjtDqpBCo5fP5OvkB.IXhisTgK2zSxjQjLmCk2LRkq0achM3wdR3Kp0J4BFuJgsLXLzuWNi6d_j
 iYW2KWg2l0XfG2gNb2gR6xswkbsRR.WHi6kQYurP7L_KeRGOqYQJG2UOSmkwFltzv76XDUXXUqZs
 Oajq1kDilYPCqRDLQdrkvZc9zlZMySattgsjVUwCXLv_qHCPUd7XMza08HvyRzUy14ESbIWQxhbL
 RkrwL015E8McAeUSrmLC1GxoV1SBPnaqP9hHRbBKugNXT7OszzTkQkpZZchMBMjSUL66hFbaSdex
 8fL3pYDPYjsw31tt1qBPBVv8UWc22fZ81W.9l5O5Ht5k-
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 5157e8c7-a71a-4ed1-b34a-cdaf6e57793e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Tue, 13 Oct 2026 15:13:25 +0000
Received: by hermes--production-bf1-6d6877594b-tqwxv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID efe0f48b2b69dba20bedb55f2cbb6290;
          Tue, 13 Oct 2026 15:13:22 +0000 (UTC)
Message-ID: <47090350-2dcd-4d7b-a73e-681f68ff3a1c@yahoo.com>
Date: Tue, 13 Oct 2026 09:13:17 -0600
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: nvec: use guard(mutex) in nvec_write_sync()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
 Julia Lawall <julia.lawall@inria.fr>
References: <20261012222926.7754-1-deaner92.ref@yahoo.com>
 <20261012222926.7754-1-deaner92@yahoo.com>
 <2026101335-expansive-veteran-c4d6@gregkh>
Content-Language: en-US
From: Jeremy Clifton <deaner92@yahoo.com>
In-Reply-To: <2026101335-expansive-veteran-c4d6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

OK, it's understood. I'll look for another candidate.

Thanks for your feedback.

Jeremy

On 10/13/26 12:15 AM, Greg Kroah-Hartman wrote:
> On Mon, Oct 12, 2026 at 10:29:26PM +0000, Jeremy Dean Clifton wrote:
>> The three return paths of nvec_write_sync() each release
>> sync_write_mutex with explicit unlock calls.
>>
>> Use guard(mutex) to unlock the lock automatically on any return
>> path.
>>
>> This removes the three mutex_unlock() calls.
>>
>> No functional change.
>>
>> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
>> ---
>> v2:
>>   - Reword the commit message to state the motivation and to make
>>     clear that removing the mutex_unlock() calls is the result of
>>     the change (Julia Lawall).
>> v1: https://lore.kernel.org/all/20261012171312.5998-1-deaner92@yahoo.com/
> 
> Please read the archives for why I will not take guard() rewrites of
> staging drivers (nor do I want to see you use a LLM in here either.)
> 
> sorry,
> 
> greg k-h

