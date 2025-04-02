Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE11DFDAB;
	Wed,  2 Apr 2025 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622318; cv=none; b=QQk5yPCXz2j23vBSWa1UaKfP6S07hjFjtufg7uI5JCkQDvzuk57QCDOkYrsVvqPg9HVq38vUAKjKaEeryiZz1ZMw7aMLnHH3S2diYxX1Cj6nA6EEj0eJHso9JmPCKkn8UchlEAhKnAi9uuxoSFFnQeXfbZfVmxt2FaXA4Ut++No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622318; c=relaxed/simple;
	bh=nVbIoVqcHFrESYeRHzy5m1Eupw3F6hxYS6sjOV7sTck=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NqcvnUTMJt+/lnWbWeoz7RltdcqqKoHJoa0xMQsO1UfaNZvjwiQ8PS131dGd9gqU0V9vtrAdZA5FOC7cBXrEy/vJ/eYYBKA7SGgtNXY63czphLeW4qZlZ7KwRSeNo7D7DUXf0WUQjpwJ2f38Yba5H5PaEVGdIyxUHMVsum2qLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=guYyMPFt; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="guYyMPFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743622308; x=1744227108; i=markus.elfring@web.de;
	bh=UHOjYhdUZi8zf8al7+oTcOgs8V80BAdyjZoQxApePzk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=guYyMPFt5Qca3zcnYabEM4NfGJ2Zk0pz6oNJ+bIIBSKUFbjAnBR8WLmdif9Pp7XZ
	 +74LTS3CMqfgf20sxcdlQfz3yZ6+K6Cddxef6furLuFy28YCQYeFpAbVJG310aynt
	 sueL0oebNsb6kStinX/d8eX1keSWHMgDwOxfji4QLnEvKExhXpc+lOs9zHph9xDRQ
	 zRWUNe/zicInwNeJAm9abF5T3/AMGQGgY1GSc5qyscTXh6VorFXhjf57ktIKIVqU5
	 58wvhAnFsJosokHjXBh7ulhuhBuo+7AeIds4R/UpBzRrn3AGfXlB1Q9q6KnvQymsq
	 mbpK0jQMc8mFAZcDfw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsrdC-1t70Hs1dsW-00wUGq; Wed, 02
 Apr 2025 21:31:48 +0200
Message-ID: <e13c8dee-2631-4366-a51c-6a47dabf23d6@web.de>
Date: Wed, 2 Apr 2025 21:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-tegra@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20250402144115.45564-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] mailbox: tegra-hsp: Fix null-ptr-deref in
 tegra_hsp_doorbell_create()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250402144115.45564-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OLH2MdbhxSuSQeX5kUvZ62IrTw+XFu+k4gfXqGSUmSgM5hnk4R6
 tfAN00W+Ay/6fGZHX6YJg/InsEp2LJp2D3rdfRDpQ4Zy/YfXWQw7ML8accHQjEUwQ+uAfz5
 n9lkYCM7g3O668VtLNzIVUik3dOoFARmNq5udtrgUe79aPlYz2/66Iaey6Y4UlQHSZnBqQV
 qEmoIdeCUP3592zdmYUYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Hh9PD4nuHyM=;Imei8X/d2lSoseWwzSc94AwyDuY
 BPl28FZ7TTuRtaSnp6Jp56eygY9aMgOGEPsaqsVQo82qJPVFjXs1Hu1gc+ve9FxsSWNYgJuAs
 1PybVqpM4eQ45lGk/3EYiDKj5UMP4NvspiS6GmlWx3mHDSzhogn25E9pjMcGeAMwdvM5aCqB7
 aCg8hSkXa9/BL08c9uKiOODOzRsBjip1q4vIl7IUrNHHPDWzhgrCyb/HEN/+K1xEUSJ+bSqG+
 twLMJbU3Zyqw6LIxDTS9HZBfyaiQFihJvTuHzTy/CeKlcGLxK+Aisgzc4K6eaA6vWrUDhM3FE
 XUxX7ZXOANjABRSF4o5zJucph9tnV4jq7eVyiLPzP0yNMYWzlOuGKsAvT7lc3avD1COyB4vsE
 Rx2GN56pftbyI0kDWRYPIWm/9Ean4bdc3NjXsEOPWUi7lBHjNGU2S0cmPVaToIWieJPOjzsnA
 /WzpBbLUbcFHDS8AbQ2qwRLXZju+iwCI4FrZvhIE9Sr3WMLrK4zI/kIhorS5V05qYfxQJLDzR
 UY/EUL65Z02KUcA0Q8ubv8Ymr2+V3Wag0/P/fc1XeN66/SuNWFUWE16CKGhuAO651lm5e6tkb
 uF/pO4F1N86RyqocqTZPKlBs8a5zrLMX1vACcLUDDKB3LeSHZ66AW+R6GDQHR5kAK+Tkde43z
 p3l4eiAvuKsSFpHbwv66knBhetvYKEQJbUSx5eFNGEkvY/1tnKXu5SxdUJuuFKUR9nUabT9Fl
 aT6phZCOpHRlZAP+wAhtdozhB+npY0yf1HVjO3fpFDt5eOPfshWI9QWBmRl51PRSMu8lukIve
 AwIsH/BQkxta5V50NdU9ycxGC8KqLyur/G/ciiwG/8saNrUrsqiUMM3DX7E8HkMgFAiOQNbQR
 otIifX/wgQTJCIJf+LleNj/zcRFP3V+effthCjJDuuG11GE1nk4r7bvwRdL7aZAVI3ueEIPPk
 btsdCUbmGzWwwsj7RQd2uxXuMCx6ctOWwV6GXrt2DTs6G7S+8SbsoQZRUK1pPANaWKaqrwVIT
 IU6XI19iGDgQ4kCdSbllhSlLIZQR5edMWRAStGVyDM+K86ixbPVSZEz1TrOy5jgcYIBwzctXp
 pBQcjD1vgOfjEHZa3KIofZJjZitdqWQV8bVMIUVGMu+HP1It/895MJL1aWTQucSCkutIMqaOL
 Zphg3wDoJV3AOSYYqTalY1bOs75+TlpN+mY8LQzdUl7Foe3zm2ccc1oz9yj8mNpsB1OsCgpNR
 fsxXaajd0fBPDMmsthYD/VLu8iuRK+K5nSmdC46x6PZ0e73y768mZDD/EAn03w5qGsG491EEe
 Udr2mf+aEIuaJUmqkitFfwBtXHPFz8YlhZRGW6Pkkn/FSudsmcmVcxDO2f+P/lBISCDVqamMe
 UnLvFiVIeK86u2yZjcID9yY0aU20u/PwvMV6R6dQS6ZNwx64BRDn/a3vvGBDkIlun/CV5Jdwq
 pAaHYNBsJ5wqQO4e/cBgWZPXjFDky2c2mdSzhln/nglfna5+i4tQYXXHzDJZhbLrV69phIA==

> devm_kstrdup_const() returns NULL when memory allocation fails.
=E2=80=A6
                                                       failed?

Can a summary phrase like =E2=80=9CPrevent null pointer dereference
in tegra_hsp_doorbell_create()=E2=80=9D be a bit nicer?


=E2=80=A6
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -293,6 +293,8 @@ tegra_hsp_doorbell_create(struct tegra_hsp *hsp, con=
st char *name,
>  	db->channel.hsp =3D hsp;
>
>  	db->name =3D devm_kstrdup_const(hsp->dev, name, GFP_KERNEL);
> +	if (!db->name)
> +		return ERR_PTR(-ENOMEM);

Can a blank line be desirable after such a statement?

Regards,
Markus
