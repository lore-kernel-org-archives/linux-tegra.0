From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V1] i2c: tegra: Add Bus Clear Master Support
Date: Thu, 10 Jan 2019 22:59:44 +0000
Message-ID: <BN7PR12MB283699DEC4D5EF468B0404F4C2840@BN7PR12MB2836.namprd12.prod.outlook.com>
References: <1546561418-10230-1-git-send-email-skomatineni@nvidia.com>
 <20190110152148.GE25353@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110152148.GE25353@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org



>> @@ -636,6 +649,9 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>>  		goto err;
>>  	}
>> =20
>> +	if (i2c_dev->hw->has_bus_clr_support && (status & I2C_INT_BUS_CLR_DONE=
))
>> +		goto err;
>> +
>
>This looks odd. If we support bus clear and the BUS_CLR_DONE interrupt is =
set, shouldn't we still process all other potential interrupts? Or was this=
 meant to be inversed:
>
>	if (!i2c_dev->hw->supports_bus_clear && (status & I2C_INT_BUS_CLR_DONE)
>
>?
>
>
>Thierry

Bus clear mechanism is to recover master from I2C Bus hang when I2C master =
loses bus arbitration due to some slave devices pulling SDA LOW continuousl=
y for some unknown reason.
Master performs bus clear operation and once bus clear is done successfully=
, I2C_INT_BUS_CLR_DONE is set in interrupt status.=20
During this time, no other interrupts will be received as it is already in =
the process of recovering from bus hang thru this bus clear operation.=20
So transaction during the bus hang obviously is failure transaction. But ma=
ster tries to recover from bus hang so transaction can be re-tried and comm=
unication with other slaves on that bus and further happen.

Thanks
Sowjanya
