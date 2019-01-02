From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V2] i2c: tegra: Fix Maximum transfer size
Date: Wed, 2 Jan 2019 23:35:17 +0000
Message-ID: <BN7PR12MB283637DD2AA8882E46B76EDFC28C0@BN7PR12MB2836.namprd12.prod.outlook.com>
References: <1546468519-2128-1-git-send-email-skomatineni@nvidia.com>
 <20190102224512.GA2750@kunai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190102224512.GA2750@kunai>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Thanks Wolfram.=20

>> Tegra194 supports maximum 64K Bytes transfer per packet.
>
>Linux I2C doesn't support more than 64K of transfers as well...
>
>> +	.max_read_len =3D 65535,
>> +	.max_write_len =3D 65535,
>
>... so you can simply drop these lines.

Oh Yes right, msg len is u16. will fix it. Thanks.

Thanks
Sowjanya
