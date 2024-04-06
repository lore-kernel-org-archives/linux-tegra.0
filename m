Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45D1EB48;
	Sat,  6 Apr 2024 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406388; cv=none; b=FSUOfD8P6iFR7yxtUi6NFs+V2RHzYHdjN0ctQ18sVdT1cW1dUnHt5Sg6HeCnuF1AutiFEGXbQAUFf9oA1PtcJ4FgfiCx3E5PXChS6+a5HI/c1CAxNuonYSBPzQZXoiqKXCuwPgWeYOBd0v5ITioJ6YREho10R8632FzIopS2RBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406388; c=relaxed/simple;
	bh=UmmuvzlY1/7ExxRj0Vu+cLk5bNP2bQaLzO4W9Zyjrf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fwBc1e+OZNAHHK3Uh1EYF5Cj77PmjSNYQvbQ7jj8fpd65L0FHaKwWJ6iHDEwQz8Sr3Jb+xcLcl4DVo1/2WscvQCeF1f/Jq0beBkRTd3HrnKuh9Q9K9LsZ7GE7ZAJudhhH7VPtjpRVk/y1Emm2qWQuiS/NjW8xr5TmpVOX0MJqUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=G1Dd23lE; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="G1Dd23lE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712406382; x=1713011182; i=marvin24@gmx.de;
	bh=qJJJ7XZcAzYvRNvfKlTb0ONtJ/ycqEH3apwLhaKdujU=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:
	 References;
	b=G1Dd23lE4rvI5ri3AC5Nj9NnMbxpphkFOtfqNLQaHGif3hjZxnW+mlksimpGA6Gp
	 PttHBIVX9Ezc1N1/mQ/i7NSVUl5reHhfQmXi1YZ5dC/5HFwbg3PQN81iyobB2lQA/
	 427WBHxUGBDzBvbkEzu1HK2I/j7K+TSclTO+5aBzLlZ43UgWPXXu0Q8XRj0H5dI+q
	 knD5QzPs8wv7jNwuwNpu48Z2BD4z8iNK5ETQkOOD0ZEz4jj025+5H4dkndNuun/70
	 NKvbPVVxC3HI0lhxkC1jrOEff1uWmeHyWEGMKKuZaf9XuIP9NHi5I0PeEWiwS03nw
	 H2cBYaifHNearob+5w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIwz4-1sDUJw0xUQ-00KMiC; Sat, 06
 Apr 2024 14:26:22 +0200
Date: Sat, 6 Apr 2024 14:26:21 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev, 
    linux-tegra@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/4] staging: nvec: make keyboard init synchronous
In-Reply-To: <0e0ee669-7b67-40b2-b46b-fa804a914e75@moroto.mountain>
Message-ID: <e6c0587e-e608-2192-1d51-d0107db639bb@gmx.de>
References: <20240405140906.77831-1-marvin24@gmx.de> <20240405140906.77831-2-marvin24@gmx.de> <144d1723-12d5-405e-b37b-498e261dbd90@moroto.mountain> <0e0ee669-7b67-40b2-b46b-fa804a914e75@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:vUiANfDvkw9cjyXvrso7pe0hdB7Nd54kL6FPQ68UEOm1M0wlJ4q
 f79lDNSYYy9HbZ40pjESXgkJIaS8ypj+PRk2hQfKBnyEIDhucero02yuDpw+Aoo0TODtC74
 TYUUF7akcLrys5JtSR/ZC35pSIgZuFpHdtgQNgOUdFE7xf4zjpc1fy1t6LonMiK1YegLXZv
 ysWbAMDizO8X4p3HOwuWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6ibZVGV1iCo=;qTepHDtHgU2Gkv4qj5oRjMP4Tme
 IK1f9m8xhsskwCyem7VcAfRCehzhe4MJgvWNImM8Rv/4ew4HZkMZtpSv1a55LqNepWwRCrpW5
 Q9tPpU6YU+tLFX+KzZeeDXC8qc1+i3R7gflYztKci3qW51Akq+zmH0oNHW2wbaSJ6of/AHfVU
 61FV+DjeMLY9FNrO/RiLM+MKtLqpOqFJG5lTXYyu4y4I5ngkzPScemcB0b2lVOsvuLZo6iV0y
 td+zt9sOY1a4V+qEsLmado8XKrP9b3eGBFTmPGpLafSut9dPBn5qK0WZblvS3cnvv8v9XoDqJ
 vZ61QWZGrztT88ympwpV5hp0/61y4mPvg6VMiG1SovSCebI5qyM1WBP4ZlfAWaN3IaGb6fIx+
 /5EFeqlS3nPo65We1yzWd3hhXSmRtl6fXGIxXIBpG1Cq8zmw6cmHZMYFqW+M9CBl6+Vno7CqB
 /iX5LnTP8jsR/otm+F5ulRPT/1dpgWKqkK7lzW/6cOT2CDIAwaHWodzUXd3s5ZaMs3dERSWXf
 F/uH/6mGTtG7WYR5paNbeAg4pz9JyZCbvQBqXEgGyTu9PTYS/AMvffi5GoMnjRNn+i699NEKn
 xsZPT+syKcyclJGmt7iDxs0rz+q7n2FhogkLtNGY8VgjCF0NpxJ5SEeqiFkv9rJNIDQVjedfJ
 gVRjKRy5QWV4vGE/85TYL9z1ppxnnWFm+CUiLyERpmx7YBsifnGjy0dkORYuI37DAk2Ef0snx
 DSv/8UI6M6NYs4yxiPO0KwiR7Zx58d3a6UriXYZ3jEyPaL8FtnqY6FrLVfbLFEXThkPA79uKh
 43Z/c+sH7dehElmGf25mMTUDtEHqRPuLEY/F7nS+lOAUQ=
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Fri, 5 Apr 2024, Dan Carpenter wrote:

> On Fri, Apr 05, 2024 at 06:15:54PM +0300, Dan Carpenter wrote:
>> On Fri, Apr 05, 2024 at 04:09:03PM +0200, Marc Dietrich wrote:
>>> Improve initialization stability by waiting for command completion bef=
ore
>>> sending the next one.
>>>
>>
>> Presumably you experienced an issue with this in real life.  Can you
>> describe what that looked like in your commit message?  Should this
>> commit be sent to stable?
>
> Actually, some of this information is in the cover letter but the cover
> letter isn't preserved in the git log so it's better to put it in the
> commits themselves.

ok, I'm going to send a new version of the series which hopefully
addresses yous and Thierry's comments.

Best regards,

Marc
