Received: from sonic305-3.consmr.mail.bf2.yahoo.com (sonic305-3.consmr.mail.bf2.yahoo.com [74.6.133.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8324DD3B7
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 23:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.133.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934752; cv=none; b=uhMQJuO/jnp+shPnyWIA72Z5PCqx/jzFdg/slAV6jwfg152IBumTFbWeBGysCWGV7/2J5p4ESBXMimiKppZGe/IyjOvxc03gSomrSbQtY3Q/mv06SQKt4UxICaFR4q5RIGh/FFUs8U+R+uUGNaBIAczIjRuN0FRWYbdGkS/oKw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934752; c=relaxed/simple;
	bh=unrQ123xXTj9mg6azhbRZKBE0GJ2FJNrep2ZLraIK+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTPJ5FFo4fUtwOt0pDTC9Yv0iZvlyF1FHW3ktHtQh7g5Y5xW+iT3JkuLdMqJi3YMMT0SG6auxO9xFJ5f6M4C+/NtKDhmk8my5tuDw/KnaTJ2k8KXXkHLLHCkWvRaZCuzn2Hn69WyBGteMb8B8AhciaZDBC04LFdqj3R2cvStdOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=AyJtst+w; arc=none smtp.client-ip=74.6.133.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="AyJtst+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791934745; bh=ntTdf5da5riDGqp0/lnqznJtGtR2qq5uPORC63l8Kno=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=AyJtst+wHerHDGpyl0T7QkHzGda4jZuiTA2/e7+wapTvJ8BjiR4EMxNuNAq8xYaMJewoBsm5Wkl0w9sSkC+WWW9QypXV9bAQZRzH0bQpDI8huUU3QXCU2j5CD767KbGoKG8yqj6L4UwB7VXtN//EeQ2vKVceIDBVuhOGyAhbiZFSAk3NIpZbHyvg0O0WnGPB2E5HNKFCtTaGvc+LkJ//sMSK6Y8v1lESXLpuJGISCkEXNWvZZ+/ZGGhcdPbaDEYRMdsZD6jTWpjITmoEUefoxY4nQgmCKEHT/JJLdt+cMds/RBdlpE22JwjQgDVkvFWVccZWlN0tGMTgDadfakvZrQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791934745; bh=oKJg4jOA4ZrTF1arWxOlKFehAEDik4Js39f8DF5mo6g=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=j/ndZB1XY7GA4Uga8xvUwILcHro91TNbTFgx0ivBz/+BD1+vyAlWyro5apSs8WEyWnjiVq6yCJhchBSw5lrdeWJNOReWVheClzSdslDxVoKtywvCzH7FwSYjoiuncSNdwYTvMRxH24qND+cyX2FX4ELGafk2p3GQYuUdUNXv+wk3Ziq6ewpJ/Vwf7X6H03QyZSKP6kiHdn5wG9b7p8jDgQv4emqCOzY1RTRGYwnxEnbi40UK/Fu8r1iej1TC3BZwxqesTUCajRlJcEju8/fdOIfojXdKWzmvbvCES+pctoaFZ5FbW85KfRWIqVNJzE1Hjm3alwi4g5z53EkH5jmbjA==
X-YMail-OSG: BhmqEuwVM1l4k9JTFM9jnnIs.e97bloKx8dRyHq4ts9WH3_4DKCuvs17y0GgEQ4
 C1PRHf37Mxe_SLlgMzct9sEdYQ6M8oTTviavSgzhxjg3tfsyCxDwTbI7KcgbD4TGdmbmYkVJGzVA
 skikEhc4YiYiR26KOPlmaUnfJxiBYjkfnh_XJYoSFWdBw_ZojapNLjsG9awUB1gtBYfd3_bJIRpN
 Bqxd0UlSuB8I.OyZQ67gY.VXyVE9mrqs4fTl5VoXlD9TFd5NYy58SaIV53BmnzdKzCaEimqvVVV9
 pfyGqfgzMjhq_FK8rFGGPAYC2VeAmLElo5bnZg5dwJXZfV1znHIWI_onRfkTuofyeASUmJwMTMeL
 Metz7lKNs_oH1nJWJHTVPZ2RhQuy4rHckazxxxJoY.mWU1GUd6l1y3zYqQM8mO4hLjVvG4xpi1O1
 0QIGGHsmfYK46c2nsS22OYWXkprEuUwrmAqsJ1kRMocSSO9RziCo31eNKTtRADml2RP3wwISED.S
 nMSaXCHe14Rz2frtWc6CFC461G8jRC9NOwuF0qRvm3YbRqJMTeMpPvvvjvtDwrX.hOOuGMAv3Mnq
 pb4sKbJweD_bHNMbG0gRJ0YvUBM0mpl3i9q9gZde9HVadOCbiZir7J2H7I0_ngnkO1FGY_NS7sqH
 mkio1pG8PfDQdpWBCaJ3h3FH4b7OkV_4Z6AD2Neq259TI5mz2tzmFqgfXyd5IcWwBh_qorRNaW2A
 YlopBPPTqwI0Hlldbjizaaww_pwZmzhmliRYFXlJz3F5oeRLYETI0erxYdhFpdSZJBI9Q_tr7KXX
 mPbiHVekyB9vtlTdZTcqm78L8OABFwpOUgc8F3LRgXZZairXGMmcnimQ8aPYhR.n1XuRRhK8Zih6
 P83YRSdGXZpJ9i6IFmhRJzmX43XFWDGqPBiEmyOUMmowIFMXvTzNc_ZUjbrk2rYy_3bSOteYPk0W
 xNsQpruPPTRrq_mLmzASKyAtz8_7uyuvzM45pcl6iv61cAd.T8VKyjFgNzs.3ISvXexdNfeCbrOY
 5Ea7hzhlZqsm4esYCaplHlLb6GtM_PVYJzJBWVrVJ_gdNlhRYIFp_eZ1s4UmWl8BctW2QubDMavI
 9GH.ojk0Rj.byk243dddzl6haeA6iDn2t2w0QTVzrn_F2EuRjFe5NEHB311HI6dyXmBT5t1D61k.
 FW97GyGH4OHN3dcA5KVnQVB.FymbnhXAN9ExvRYzny2stzY43a_X5JbbnaB9umdjO7JdZ8XHuvzl
 TXji.Jm9qIsfWNhjj2GISu8Jh0C4YqJtv5dH.5fgsuOaXq0KVDgOT5NlYFfbzzdf1tVc3YcmwORN
 9bdYWs4Xc9.QPnanI1ClQb5cSiBFZuhU7uutTL40gwQ.JEyR_bCRYZDC8WUgmLqT9CL3XNNARJWD
 _QQLaKN2E3DmgcEEPr.hVfkZ4hHRSdMp7ytvwm_k_gNJ2wnYEH62IVo..IQjndysWt2izQdJzuUu
 VbFwLhb1IRquuJg6XT4G81h3F6JgITYb.CMnLDYTIh0GtkvK9sZosZHpfSG2vkqIZGCSWspTJCr0
 Z7QVcLgmy_lPct_i9B7F4NtAtuKJ5R.QQR015oSCHRLzr6mo67ixOh2fJX.p28j4Q3Oeuw95nqk8
 IfaKlbrpJ_YujhPArPVzUoir05yEZdl18YMcGp9Bo6bn2nmR6rpbnp5xvLBdXb3sFmIss7a2wSCX
 3cspLhXGSTQQ4JUBK3sN7kvuOmqVx72DFEaFWY3FtjfX_w2gY5wb9WVpISXB7jrrSY8fQngL2xc8
 qLJJ0NeIJfhgP8PvHW48FuVl8xn71ddD0rce24EsOzAWshBmW.Am59VMjvxt.dNW1.aDVwBQ7uH2
 DK6H5yY99CwiPqbBCN14za03JyT7xdI05__EikLh55K6NKZ73xYMsQnSABbjBznARH3rXKtvhD3X
 m8LTmp1ycTF8NKi02ruN1ZkrJG8pOrpYktPBKA267.I0cYBWI6M8p7HO.5a2VpALgFxTFlCdNbee
 8JbNuYz8YrGblUQmbfD1ksc06_OR.Ib_qtcIL7AiL8X.2azXSVl4U29f1MEV50Wr_Yt61dn7RtkG
 6C7mVn0YhYArPDntM_VXFFAc6vM2svSNxdExiG3Faicd7N5rNJYN6QFgZXfkYvXKBIXocVu8bhOG
 kWpI50OBdvCmCvA0dg_i4ZjrU07KA09CyLNz6ObjLpi6eFPFOrBVELiNW20lyhQ_l1onore0uBGS
 qLOrIg9mAnmn40RfCk4GNgTgSLDJLVsmV4Dn_9kvB1y7DymLhfMU-
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 580a666d-c35e-4236-bdc4-9891ef3e9414
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Tue, 13 Oct 2026 23:39:05 +0000
Received: by hermes--production-bf1-6d6877594b-r7rdv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c9026ab00b60b81d08c481f0c8e2d06a;
          Tue, 13 Oct 2026 23:18:23 +0000 (UTC)
Message-ID: <642cd62d-4e44-4e5e-be7c-1f2b0ce4a759@yahoo.com>
Date: Tue, 13 Oct 2026 17:18:17 -0600
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: nvec: use guard(mutex) in nvec_write_sync()
To: Temitope Obabi <obabitemitope765@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20261012171312.5998-1-deaner92.ref@yahoo.com>
 <20261012171312.5998-1-deaner92@yahoo.com>
 <b51c3755-a967-3de3-5f8c-3e4984d6e93c@inria.fr>
 <492e9a13-b50b-48cb-bd41-3114573c7950@yahoo.com> <as5WES_Ec2KGWQsm@orome>
 <CALUk5xZtpOH=23mdiT7MYs-gem2NL+EoV=priVxuSubbCocqFQ@mail.gmail.com>
Content-Language: en-US
From: Jeremy Clifton <deaner92@yahoo.com>
In-Reply-To: <CALUk5xZtpOH=23mdiT7MYs-gem2NL+EoV=priVxuSubbCocqFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.26740 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi T Obabi,

On 10/13/26 4:58 PM, Temitope Obabi wrote:
> Hi I have finally installed Ubuntu on my system, I hope am on the right 
> track
You need to send plain text.
Also, there is no need to reply to my v2 message here. Reply to the 
Welcome 2026 Applicants. If you don't have that email, send out to 
outreachy@lists.linux.dev with an intro.

Look into plain text. >
> On Tue, 13 Oct 2026, 7:57 pm Thierry Reding, <thierry.reding@kernel.org 
> <mailto:thierry.reding@kernel.org>> wrote:
> 
>     On Mon, Oct 12, 2026 at 03:41:48PM -0600, Jeremy Clifton wrote:
>      > Thank you so much for your guidance and feedback.
>      >
>      > It is the result that the patch will produce. All the unlock
>     calls will
>      > be deleted and the out of memory path will have no braces, as per
>      > the style guidelines.
>      >
>      > The motivation behind the patch is to defer usage of manual locks
>      > for new and improved guards, disallowing lock leaks.
>      >
>      > This way, there can be no error producing path by not calling unlock.
>      >
>      > Shall I send a v2 with motivation included?
> 
>     Not a big deal in this case, but you might want to read up on how to
>     properly reply to emails:
> 
>     https://subspace.kernel.org/etiquette.html#do-not-top-post-when-
>     replying <https://subspace.kernel.org/etiquette.html#do-not-top-
>     post-when-replying>
> 
>     Thierry
> 

