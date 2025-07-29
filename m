Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6327CCE7;
	Tue, 29 Jul 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780082; cv=none; b=aQtrV3XpkYNJge9pSijV2Ui4EnGHo+BbiFmrcvo/WEVu3h1j3A+ipxxcIG43fNFoqy5vOzpeFxdpx3XrOpjxnkfugHeSAw5H+jmNpJLgsB5v/ic+OYovkYmM1weDPViK1uE3D/Pb6YKNOvhswod/MeMly4dnFqFIQALAuRTzStM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780082; c=relaxed/simple;
	bh=qZvpEj9mSasixgT6/SZwxPkP76fTud+WJTEaupMLNso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYHshSCCGBDt1KBCuMzG5QL4M14qQheaFBPPv7FC8Azo7Ibmp8KAyvJFcx08U1+EETEnoKREy0ZLxcVoEXQKYxE8R40eeXeHpCK4b6Zv5trgjtV88RVU1/MAyzig75mQo5RzXVERj2kA/PfYk0zRAUHqnwprdwKH9wUTv8Z9I40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Dk0ulIqS; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Dk0ulIqS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6F3C43187;
	Tue, 29 Jul 2025 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753780072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k4a5SsI/nvjVItbd+WYqIPRNobzyb8741BFwCKTc04s=;
	b=Dk0ulIqSW+91Z5TdH6BU6Z06+8ne9mgoNOkyrk9tEjugwze0HitFHDlKWB1uuT9PAiwHOO
	9Iuezv3g2grTO5uXLNQ/pNQypAcEXjITE07oN5bGSp54EA5xcpULTd2SgWnWGIClYfOvLo
	YqmOK42eh+hI6Mv4YPNv/WAwsbeG5WbihsnTAgxbnc5bG/RGreOK5e5c5paJ+Et/4DdLiP
	BFuWJjHT6IwVE15A+oPxcGFZvsYMeYzBdf0SbyYCSbnRUUJZhDh2mPgn0cjXW4eml0np5M
	wb6dSWY1xwQ5EO+oa42aPIfqQ1m+ce0ePR3bRYTAW5VtUxauZlp9ptLG4WpVtg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject:
 Re: [PATCH v2] regulator: core: repeat voltage setting request for stepped
 regulators
Date: Tue, 29 Jul 2025 11:07:46 +0200
Message-ID: <3560762.QJadu78ljV@fw-rgant>
In-Reply-To: <e9100dbf-524e-4edd-aba3-71e28fbc07d0@nvidia.com>
References:
 <20250718-regulator-stepping-v2-1-e28c9ac5d54a@bootlin.com>
 <e9100dbf-524e-4edd-aba3-71e28fbc07d0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1932750.CQOukoFCf9";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtt
 hhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg

--nextPart1932750.CQOukoFCf9
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 29 Jul 2025 11:07:46 +0200
Message-ID: <3560762.QJadu78ljV@fw-rgant>
In-Reply-To: <e9100dbf-524e-4edd-aba3-71e28fbc07d0@nvidia.com>
MIME-Version: 1.0

Hi Jon,

On Tuesday, 29 July 2025 10:28:17 CEST Jon Hunter wrote:
> Hi Romain,
> 
...
> Looking at better closer at the issue, I noticed that it is the
> 'tps62361-vout' regulator that change is causing problem for. On boot
> I see regulator_set_voltage_unlocked() called for this regulator and
> min/max voltage requested is ...
> 
>   regulator regulator.5: min_uV 1000000 max_uV 1350000
> 
> The min delta is 300000, but in this case the delta never reaches 0
> and in fact never converges at all and so remains at 300000.
> 
> Looking at the above, if the delta never changes, then we get stuck
> in the above loop forever because 'new_delta - delta' is always 0
> and this is never greater than 'rdev->constraints->max_uV_step'.
> 
> There are two things that is not clear to me in the above change ...
> 
> 1. Why do we 'new_delta - delta' instead of 'delta - new_delta'?
>     Assuming that we should converge, then I would expect that
>     'new_delta' should be getting smaller as we converge.

Indeed it should. "new_delta - delta" is equal to the increase of voltage
"error". So if this value is positive, it's bad because it means we're
getting further away from the target voltage. Also, if it's negative but
too large, then it means that we're slowly crawling to the target voltage,
which is bad. Currently we do:

```
if (new_delta - delta > max_uV_step)
	give up and return -EWOULDBLOCK
```

but we should be doing:

```
if (new_delta - delta > -max_uV_step)
	give up and return -EWOULDBLOCK
```

which is equivalent to:

```
if (delta - new_delta < max_uV_step)
	give up and return -EWOULDBLOCK
```

> 2. If difference in the delta is greater than then 'max_uV_step'
>     doesn't this imply that we are converging quickly?
> 

Yes, the current logic is indeed flawed.

> I am wondering if we need something like ...
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 8ed9b96518cf..554d83c4af0c 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -3884,7 +3884,7 @@ static int regulator_set_voltage_unlocked(struct
> regulator *regulator, new_delta = ret;
> 
>                          /* check that voltage is converging quickly enough */
>  -                       if (new_delta - delta > rdev->constraints->max_uV_step) {
> +                       if (delta - new_delta < rdev->constraints->max_uV_step) {

Yes, that would be correct. Do you want to send the fix yourself, or should I
do it and include your "Suggested-by"?

Thanks for reporting the issue and sorry for the trouble.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart1932750.CQOukoFCf9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmiIj2IACgkQKCYAIARz
eA6Taw//flYEbe3Y5ymsW6mxAcxLwb8/mzucOzf5mVCazki5ZFkEc2lPzAjXZvxL
QSmYX/syvJOr4S7irwlUUFyna2+/yWSlfxso9JnuKYiboCVETmnJvghd4WrnMOGw
D0roJ8S+b0b0zkEG2qFYjXN/xeGtYwTY94ns8RSW3fpEWV3ZtoGxpS4GmculwiWc
UHmScwdTNeFMBxi7mgJZK2VrWKIVuTIGcN/zQHNNupH6jGB5gnV3kxpDTN8ntHQb
vGCbNqVYXv4WRTyfNhP3+yFvBEseC6uSqYjue98RVUq64kBpeYJAWUb7xXQ9q1PA
zWJl9+7j7Q0zSHpQvUvLtUEIVJFv/920KMLhFsM4FJeBDU5qw003MVLgX3x6pET0
UA0kEe4PKF0ffx9ZRcwBz1wEUHqeFaIOpxQ6vfz4XWTFAwc2uvn8N19bLH8avXUD
I/WMPSFVTdEGu22p6hTBDB3npN3EehlcgtmctCCLZm8nxx7oSOXO2DO47oMH9xRA
kwcJfKqXG3FMec38e5A3OIx4Bon2qRw5B69TFlPWD4qyhXVci60pdpOAY5LkZ4GZ
AFycRCxv9BnT2qou6NTjem4GpPWueE47LqwgiQkeE4PuShzV9DsJcb4h/7YHRZCd
qO0M/7bWBBJXrrQqNCX6hHvZmS4Rsnf7Mp5mf+U1gloCBPRoOTM=
=lsGa
-----END PGP SIGNATURE-----

--nextPart1932750.CQOukoFCf9--



