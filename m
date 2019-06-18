From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
Date: Tue, 18 Jun 2019 04:52:39 -0700
Message-ID: <2724f809-fe0b-810c-6236-d94a1efc2112@nvidia.com>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
 <e1bf5aac-5528-3e54-0f41-5a1bbabce419@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e1bf5aac-5528-3e54-0f41-5a1bbabce419@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/18/19 4:29 AM, Dmitry Osipenko wrote:
> 18.06.2019 14:09, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> The usage of BUG() macro is generally discouraged in kernel, unless
>> it's a problem that results in a physical damage or loss of data.
>> This patch removes unnecessary BUG() macros and replaces the rest
>> with warning.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 47 ++++++++++++++++++++++++++++++++++=
+-------
>>   1 file changed, 39 insertions(+), 8 deletions(-)
>=20
> Thank you very much! Please keep applying all the advises that were given=
 to you
> during the reviews in the future patches.
Thank you Dmitry for the review inputs and patience. I shall try to keep=20
the advices in mind for future reviews.


>=20
> I made a quick test and no problems spotted, all warning spots are silent=
.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>=20
Also, Thank you for help in testing the patch at your end.

-regards,
  Bitan
