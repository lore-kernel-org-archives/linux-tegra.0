From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V3] i2c: tegra: Fix Maximum transfer size
Date: Thu, 3 Jan 2019 19:47:21 +0000
Message-ID: <BN7PR12MB28368BFA8C7DB877316960EFC28D0@BN7PR12MB2836.namprd12.prod.outlook.com>
References: <1546472423-31366-1-git-send-email-skomatineni@nvidia.com>
 <20190103190552.tspqarvalqxlz7yu@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190103190552.tspqarvalqxlz7yu@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


>> Tegra194 supports maximum 64K Bytes transfer per packet.
>> Tegra186 and prior supports maximum 4K Bytes transfer per packet.
>>=20
>> This patch fixes this payload difference between Tegra194 and prior=20
>> tegra chipsets using separate i2c_adapter_quirks.
>>=20
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>
>  CC      drivers/i2c/busses/i2c-tegra.o
>drivers/i2c/busses/i2c-tegra.c:171: warning: Function parameter or member =
'quirks' not described in >'tegra_i2c_hw_feature'
>
Somehow I don't see this warning. Do I need to document somewhere on quirks=
 member of tegra_i2c_hw_feature?
