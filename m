Received: from sonic305-3.consmr.mail.bf2.yahoo.com (sonic305-3.consmr.mail.bf2.yahoo.com [74.6.133.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11003D75B5
	for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 22:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.133.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842561; cv=none; b=Q4tVd3uizxGKPJSIvVcQhKKc6aNvNLryLi2JVoTVWOG+qEd9REJ68ESlXT9MAGMoH4pwtDBVqBoi2GfkUw9JksdJxw77SLwArEJd4zgFAnt+iWJW4FZqruhd0I7v2dV0wRyArNRKibsMn8+/1tWmmM2jPaznu8i/sTJFCwi0fMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842561; c=relaxed/simple;
	bh=Bfln3E3WROihP7r58BRQzIRCXczrGTPeR1n8WumWjdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbC/FNX0ZWdQPjpGaX8uqRphb6sE+pLyIdW7VEaPSmXGujBFsY9HmWyKOKY69z6jx6ynVfkmHfELnr2NvXzQCnsvvi5dRp+FV1PdbqVLsAsgFrLjBQUpmz4dzJ3EYhk4guAX/RCj+KDRp1k2pBDSWJwe4Bv8+8v7rFoN9g4zaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=kw/7gyQb; arc=none smtp.client-ip=74.6.133.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="kw/7gyQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791842553; bh=Bfln3E3WROihP7r58BRQzIRCXczrGTPeR1n8WumWjdY=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=kw/7gyQbAWelJ44AHYccHRbpr0ot6RrYenhkEbQraTqWoExoKWfi67FouCQCWKv3gWbwRnQm5AQZe8U5ONPbLR3Pp37cHtqPrDpxHte0TYB9kK7GAeA+Hr6LaDjdd2nflHGCe4+Ha0JByC9VavUCVL7ONIlr2xWJgvWRAXggxk7t025S+uUFlBqyJsUcQgyW2KqovS0ALS6b7RRpF+4y1quY+2XD6HQV4jHeimpyvZU0390yDcB2uf3ITgUwYpxR3YDn8QHBaONaTHSemHYLHbEUC1UM5lS+2LWAP96ToTiQjN+nlwE3Q9OSyW6pE1+6a/EW7RgiYZwcz+3M8EVDAw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791842553; bh=b7SoQu1nul0Lafjas3paALb+FHJRqcSoq941q+L/uJR=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Qy6GuD1fxcuxmMbq3bParOhISO550dGH1EpW8UAz5N+FiYDHNSHGtdoP74SRGE/Vtf20IAjL7QjJnlI51Kfwqz3bjQEOikMmhytdCWNMkH8Uf2bdcST+ezyke+AeuAf+0OG5rnTqaWGi+iuVGZ4Rov8FI4egm/RwwgWVlLm0T2JYllO2fUJjFD9NguMaqlHZXAOSkIlYstGU4SOTWUSLHlRKEsrd72Eetj/9Oy28+Q+uK4uCzX8W77o64in0hDmKQfAyH18NOyQUkiZfzh87mL0FbjzTgl6PgjLC281LEs6j6PBZ2IUUs8HoF0uzPxHzmBLLnnlk5euhCutFf79Osg==
X-YMail-OSG: J_.CW5cVM1nZO9Ebp848tqdrDIukrK8HD0BPKXckYEnJXD4jRMevb3A2QR.Xt_6
 ncOXIUptIztSIr94MhDkZLexfAbsXYpGSzP1AcYAOdnz0ddJVxovqq_soC3nQ6_uRARdxDodTuLq
 GE.rbLxzQ0tr7kmqm8bM2UW81q17Qx88_Zx4p14i5tppgCR1zyaNXCNOnjulD_BajviSnr.C_Ulw
 trYd_x.zTfXbVn9VaP9oj4A2XJwwidDLoVAeCpfF4dVOrO8qSqN94rXZX9HinkBpM8maiDVGxZq2
 EQyEDttmqnZ8kwQmXZCRgwy5c4AlA35fvuIGG4WRn8cwgn1MqrKkumgpEK8GQamaFwlQqmhIjO50
 eIkK8ePty4vQiWYo4w7tNbxVb8dyzeKt9FTl_fsJC20tP3hYFVlWQtQO8t.GV5lVfcGjkFzXSe26
 KHNfOTqviYQTyKteDP_14g62aSEJUcRPOvEwgDR3h8EAfbEvT43sjLoUCYAsiKP6Qd1kdBfifprB
 kVxLyeDP3NRr6beX_B6IrqoqfKF1zvLduWh6K6lWsvqirU4gavMwSniFEoMFZm5GSZ7tuG3fdjHI
 DO8KygXWC_ESPqUdN_DlZhnwBAycotPsS9obi7GEvPofjom4cw7.rwHy6m2CaQIRaPD_6QuJSmsa
 OAjmFMxEG37r8URWg7Z2TUwIf8NBNjRdH_kA1DP9.Eac7lDIZT1eAOjBt3oou8sNfn7csTlXUpRe
 5lSB8kF65nACU8G7pSDM6zPbyIdz4qUcTTLYUrJlL8uxpE9uiGWgvFySpcKGHI49cox7BOA5aFzy
 s_ltEP9tacsCwQ_xFpLjWnFlqstESQsn.1ticxRS5pT2to8dgCJjPVU.09exN8ncIDN1WWhpBRGb
 qOv84lVjXNOsHSwNL.KIjR5izFMvATeAmVtTzPu2ummSNFuXjuMgRhBSiYrInChXV0JHAecUP9mt
 ue9Iv71sJBYHes_Lsy4otaDZunsJaBJU6awAwOVPy2C1LtY1i9DcCmtPl4a2XrZqElYB_ffTrko7
 NG61BLFkZBIKyH50Q9P9dO1V_RXuYSYsWLiaW9mUPz.fbQ9N1cH7QT3ZtyRCh5JSliY8Bzte5PwK
 1vPtBH4w3ihT8Bo6GHgJIiMAMFE2MYSgbs3HGae5r_hQehCl0cCpi9sAlrpsVv_WucBFRJTGPImd
 bMo8CTZ9UQjG5ljjlSoV0.BMAGxOkwfhyi4fjdwMp32M.HcMPwiPX8kHETeQrNndJJ63vLQgs6hT
 J5xHHNg.Xi6sH3N0KiRWGdscpaG0R4LpjRWFWvWLx8Yeu..XklSxY9Lni.1dybQFqZ.9aDMDGA_f
 L5csdZqPXaZ.BJrXByAB1ipaoaBL.r9MSp2NIsP84q.Fpxn7u6_v7.8XFV89JoVJZj_wKEflgzlX
 QqKzrAT4Jd6rQOqkfx9reLwgoBANCZTYx..Xf7_ck1ncgjs.I1tuA.N1ANYr740meAenijk86ybo
 tT6DipE2sVYnA8qvdDjTIC.t8F798QvoBcLteECMTaHTVKcr6PMr.IrrxEk1dUhtFv76E62qZ4YL
 VkjvBD4r9tN9IdtutU5muXfFKO.unCSf3OI62gOOs4fy1FgFVYf761F2De5WmQ819404Lkno1oMs
 lsqOrXrCq5wO4X_FSPmK67CM.qKOWX6pW10ybu2TBA9y9S2yRq4lYnVHf8M7Nu323Ecq2zL4NkwT
 9wdgQVJ2xSXc4GR3lPRdpmsXHChxTnjXt1GTjj5i5kgzOVCd2tUY58S7sxESqsUCorHnPanZ8.Ul
 84tAofgol1gYmBpXt8Xp3UqdVyCwQ4EOP9zAYqItz_61lqjNn5LKi72uUkZgt9iiDrbTV3r28s.J
 jHF_Eg1vKQOf9wr0TWDDqJqm5WTeo0uhLR8e64G3YEE0e579yvL4Y0I5aVMhxR2zQiQxYBnVHdp6
 YoUXrDdqmxHRP816YIiZ8OdDMn6eVDqv2oxmQxFsm7bXzZcSMrpdAWFPVz2haAY.FtbR_NIaI6qY
 MvDbpMXZfIrzXcTRspkjQcwBklI42S85M6XHtzGO8NuHHSnplmp40S.RYjp2Uc7R.cFbbt7KrIYn
 29zV5wUPhMgBAlGlq5IBRtNFAmzpFCQR83owiKhs3PItjeYA9W8uGpDBWP5KgzAUIcPIE.vpxM_P
 pRpI8zNyVrtIqPWW4BM5AIwaX_XbwvATdzqCgjp4cKn4QyV39VoHBR4MS84rR1YegCd__GxkBZVd
 BanA1SsBp4XMxyA912K4hI_Lag1DUGroJ2vIW5gI-
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: d9583b0c-73c4-40eb-ab77-ec90b061af37
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Mon, 12 Oct 2026 22:02:33 +0000
Received: by hermes--production-bf1-6d6877594b-gmmk7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID cf7b4a086180cb5d241fb3428fb36baf;
          Mon, 12 Oct 2026 21:41:53 +0000 (UTC)
Message-ID: <492e9a13-b50b-48cb-bd41-3114573c7950@yahoo.com>
Date: Mon, 12 Oct 2026 15:41:48 -0600
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: nvec: use guard(mutex) in nvec_write_sync()
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20261012171312.5998-1-deaner92.ref@yahoo.com>
 <20261012171312.5998-1-deaner92@yahoo.com>
 <b51c3755-a967-3de3-5f8c-3e4984d6e93c@inria.fr>
Content-Language: en-US
From: Jeremy Clifton <deaner92@yahoo.com>
In-Reply-To: <b51c3755-a967-3de3-5f8c-3e4984d6e93c@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Thank you so much for your guidance and feedback.

It is the result that the patch will produce. All the unlock calls will
be deleted and the out of memory path will have no braces, as per
the style guidelines.

The motivation behind the patch is to defer usage of manual locks
for new and improved guards, disallowing lock leaks.

This way, there can be no error producing path by not calling unlock.

Shall I send a v2 with motivation included?

On 10/12/26 2:45 PM, Julia Lawall wrote:
> Is this the motivation for
> doing the patch or the result of the patch.

