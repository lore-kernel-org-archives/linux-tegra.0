From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V2] drivers: i2c: tegra: fix checkpatch defects
Date: Fri, 31 May 2019 02:04:17 -0700
Message-ID: <b86b9104-1754-531f-70b9-3c1a5d347b9b@nvidia.com>
References: <1559196850-7007-1-git-send-email-bbiswas@nvidia.com>
 <e9e3d8b0-a76a-81a9-1110-2d07ba1c787f@gmail.com>
 <911e52ed-8f3c-583a-7610-e38723219eca@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <911e52ed-8f3c-583a-7610-e38723219eca@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 5/30/19 4:43 AM, Dmitry Osipenko wrote:
> 30.05.2019 14:36, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 30.05.2019 9:14, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>> except for BUG/BUG_ON checks
>>
>> Please turn the BUG_ON's into WARN_ON's. The machine won't go on fire,
>> hence there is absolutely no good reason in making system unusable on a
>> software bug. BUG_ON may be more useful for development, but not for a
>> casual daily usage.
I shall update the patch to remove the BUG/BUG_ON calls.

>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>
>>> @@ -1034,7 +1038,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
>>>   	u32 *buffer =3D NULL;
>>>   	int err =3D 0;
>>>   	bool dma;
>>> -	u16 xfer_time =3D 100;
>>> +	u16 xfer_tm =3D 100;
>>
>> What's wrong with the "time"? I'm finding the "xfer_tm" as a very
>> unintuitive naming.
>>
>=20
> Also, please don't version patch as v2 if v1 was never sent out.
>=20
I marked the patch version as V2 incorrectly. Sorry. I shall be careful=20
about the patch version sequence from now on.

-regards,
  Bitan
