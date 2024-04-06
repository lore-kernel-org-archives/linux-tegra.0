Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192651EB48;
	Sat,  6 Apr 2024 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406284; cv=none; b=Ye8xHcs3ucUzQkLmple3zgbGl3+fjETZ9pRDFCDTitjjR/srrvQBAUaAVzAouLMwePTI0p1Hlv949jPbDBstTQ8HA89r/+KE4wnaSIt38C6OHQAqoYQfWjbxovWZv9n0oDZQH636c1o1eZxqAmbCCag+IVl+dkNLKJX2AgRxMkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406284; c=relaxed/simple;
	bh=pkOs4L/x4lh8NcATG1NWQz3iOjxKSWMjcjHORdDqG+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=elf/R3FFN4zK2iATO/zjThTl5Aef0wHHn4OezzWXiU3JHd74JqNvOvWmf+lTMHUgWAa3V80elrwy9F9NcZUrXGOEAlsCfFBkErPbUIMw3np8srl86m5413x29b68uSK5GUquhtY79Hlc3zwbTvoLYUq69y8djF3HI+CxxxidZYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=UkDuCJ9Y; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="UkDuCJ9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712406278; x=1713011078; i=marvin24@gmx.de;
	bh=Kpn7Aw8iYmla6/WD3wCnzSFU0d0PnWN4scgVPeCgN5U=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:
	 References;
	b=UkDuCJ9YOYDFZFq34ykwkNHh1vZFeUBtuaVScTmZWeoqTjsZjzO06oZpZH+8qGhq
	 6N2uXfC5fzqe8eqx7qNGrDno/BvzpnZ7Iwi/Ce+SWUdSzydgpn20o3zHElvZ5vYag
	 oe710H8JhPqT99sZYff+xJA/iinsw0lTgnMm+3Cn7+TeGiitIYgE9TC+US16h+uS+
	 wRQU63Rpq8KPTfTP8FdSG0NG3c1CDCRdCYfHiYGTsUaAVNonMPMjP4w+Bu/sKwzXa
	 ZyZp/VqAVZgaym4koAYGPLs3vXWuwbyyx7Pii5y9NzKUK8wYU/Y0JqrbzfToLYNr0
	 MM9tPYQQ3BzrUvaMrg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVN6j-1sKsj32hFf-00SOl1; Sat, 06
 Apr 2024 14:24:38 +0200
Date: Sat, 6 Apr 2024 14:24:38 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: Thierry Reding <thierry.reding@gmail.com>
cc: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev, 
    linux-tegra@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 2/4] staging: nvec: make touchpad init synchronous
In-Reply-To: <D0C9MKZ155E9.GRG2F9N6JHBU@gmail.com>
Message-ID: <15303df3-2be6-283e-c5ae-9ba8c1c222f3@gmx.de>
References: <20240405140906.77831-1-marvin24@gmx.de> <20240405140906.77831-3-marvin24@gmx.de> <D0C9MKZ155E9.GRG2F9N6JHBU@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:h4ZTicB/16Wjp8Rk8T+Grm6pY/E5OtVbPXCEmHQlbiVnz760Ld+
 w9/j0bJw8n0wFu92niLxod+Ei0dUaUWtEAGeaPwxczqz+cQMjUPFxA62OyzyMguTgwOSNGS
 7pEwDVZQE2NQwDJBy+YxloIlumDPBWZ5VD/k4J8UycyKzvQHzO2l4w39MibFQ/VDBLnPlCY
 g5NH9A2fKK36CN5YmGaHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JrqMMaOs0j4=;gzR7kLO0rVZcg7QIaE5ySQG0TT9
 fxwXnJPeQ2WMbWlPF2m8mgrxjP9i5el1lt3sUuvrLDUQkQ26GZAaNHR79RB0uF47DDNZo1nAl
 2Ashp3pVenFKr7YXUQzju1J9pjX5GMCTtyXOgWfSJjfbknm1Z7rqbvnigj8pCD0W6+4q+D1tk
 bQRXMOyx4XgXrBI5wwnLEJeYZaI4CZ3HcWHgvdujE7oOOOxTyLwI0BBGW3o8TphKTTwKfx4tN
 zuV6fLVeGDrI1CrW6u7YnyNkeQNpY+SyrdSh9wnJtglH34bCD+t9KYVFcz6UInNYsToIaGtOs
 ZeHaXxZgfwnkcjxJUgFOgbJyILgg2MxIEQfp31Lw0OuLjnwZ6qo+BFSJBBTQi9MlFdik20Cfc
 FQUrfmdbAHw9TN7qKH0I325AaSFWFHJCWsh4hJ4nJp28LozyEJ3Bboqe3bYs3uN1j90BOQrSj
 6H06lyGAtuZCkErknongMSJJ94wMYUrrAviyJQP1h6uszW2rMr0fzswoW56gGP+yi60T6qfZF
 HjYJ/jQQLpJrRVePd7vE9vInXgl/7LdFUPzyV6R7HGNlgwDa2RETnh5kXImB+sM9w74KX+2xE
 oO8OPsLHib0SPehkJKMo2HvaXmp739JqFqX9liAKtGckGYXqFW0q/xA87B/wzpt9lAX2qoxA/
 BBAqtKqi6L/8oqHQ7CMn4O0V5h2jlciepwTMPwNwO8ms/UD9uVldG+ChxLl9kdo/rxFzL1eJS
 8VMdoZaq4LwlsVquJFY1c792/RaVSPKHS76JwrqH6PC3JsGLn+nn4Npmb9KISoW/6OoIfMope
 Q+8vRNCRr7250N+X1CeJoC4VBsuzNdL/ZQqKTPaodR800=
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Fri, 5 Apr 2024, Thierry Reding wrote:

> On Fri Apr 5, 2024 at 4:09 PM CEST, Marc Dietrich wrote:
>> Improve initialization stability by waiting for command completion befo=
re
>> sending the next one.
>>
>> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
>> ---
>>  drivers/staging/nvec/nvec_ps2.c | 31 +++++++++++++++++++++----------
>>  1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nve=
c_ps2.c
>> index cb6d71b8dc83..f34016c4a26b 100644
>> --- a/drivers/staging/nvec/nvec_ps2.c
>> +++ b/drivers/staging/nvec/nvec_ps2.c
>> @@ -60,16 +60,6 @@ static void ps2_stopstreaming(struct serio *ser_dev)
>>  	nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
>>  }
>>
>> -static int ps2_sendcommand(struct serio *ser_dev, unsigned char cmd)
>> -{
>> -	unsigned char buf[] =3D { NVEC_PS2, SEND_COMMAND, ENABLE_MOUSE, 1 };
>> -
>> -	buf[2] =3D cmd & 0xff;
>> -
>> -	dev_dbg(&ser_dev->dev, "Sending ps2 cmd %02x\n", cmd);
>> -	return nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
>> -}
>> -
>>  static int nvec_ps2_notifier(struct notifier_block *nb,
>>  			     unsigned long event_type, void *data)
>>  {
>> @@ -98,6 +88,27 @@ static int nvec_ps2_notifier(struct notifier_block *=
nb,
>>  	return NOTIFY_DONE;
>>  }
>>
>> +static int ps2_sendcommand(struct serio *ser_dev, unsigned char cmd)
>> +{
>> +	unsigned char buf[] =3D { NVEC_PS2, SEND_COMMAND, ENABLE_MOUSE, 1 };
>> +	struct nvec_msg *msg;
>> +	int ret;
>> +
>> +	buf[2] =3D cmd & 0xff;
>> +
>> +	dev_dbg(&ser_dev->dev, "Sending ps2 cmd %02x\n", cmd);
>> +
>> +	ret =3D nvec_write_sync(ps2_dev.nvec, buf, sizeof(buf), &msg);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	nvec_ps2_notifier(NULL, NVEC_PS2, msg->data);
>> +
>> +	nvec_msg_free(ps2_dev.nvec, msg);
>> +
>> +	return 0;
>> +}
>> +
>
> Is there a particular reason why you've moved the function around? It'd
> probably make the patch a tiny bit smaller if you kept it in the right
> spot.

because I'm calling nvec_ps2_notifier, I either need to to move the
function down or add a forward declaration. I prefered moving down because
that keeps the code a bit cleaner (with the cost of a slighly bigger
patch).

Marc
