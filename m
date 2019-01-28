From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 2/3] i2c: tegra: Update transfer timeout
Date: Tue, 29 Jan 2019 01:27:09 +0300
Message-ID: <2f3cab66-7424-1b33-976f-826877623726@gmail.com>
References: <1548475073-12408-1-git-send-email-skomatineni@nvidia.com>
 <1548475073-12408-2-git-send-email-skomatineni@nvidia.com>
 <0cf91475-f77d-7453-deb6-3dd91b63aeb6@gmail.com>
 <BYAPR12MB3398E9D32B57B0E2FC2A6466C2960@BYAPR12MB3398.namprd12.prod.outlook.com>
 <c0b36535-6767-7327-5dc5-612e6957a769@gmail.com>
 <BYAPR12MB339837E896774531B0D11A98C2960@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB339837E896774531B0D11A98C2960@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

29.01.2019 1:15, Sowjanya Komatineni пишет:
> 
> 
>>>>> Update I2C transfer timeout based on transfer bytes and I2C bus rate 
>>>>> to allow enough time during max transfer size based on the speed.
>>>>
>>>> Could it be that I2C device is busy and just slowly handling the transfer requests? Maybe better to leave the timeout as-is and assume the worst case scenario?
>>>>
>>> This change includes min transfer time out of 100ms in addition to computed timeout based on transfer bytes and speed which can account in cases of slave devices running at slower speed.
>>> Also Tegra I2C Master supports Clock stretching by the slave.
>>
>> Okay, I suppose in reality this shouldn't break anything.
>>
>> Please explain what benefits this change brings. Does it fix or improve anything? The commit message only describes changes done in the patch and has no word on justification of those changes. Transfer timeout is an extreme case that doesn't happen often and > > when it happens, usually only the fact of timeout matters. If there is no real value in shortening of the timeout, why bother then?
> 
> Original transfer timeout in existing driver is 1Sec and incases of transfer size more than 10Kbytes at STD bus rate, timeout is not sufficient.
> Also Tegra194 platform supports max of 64K bytes of transfer and to allow full transfer size at lowest bus rate it takes almost ~5.8 Sec.
> In cases if large transfer at low bus rates 1 Sec timeout is not enough and in those cases transfers will timeout before it waits for complete transfer to happen.
> 
> So this patch uses transfer time based on transfer bytes and bus rate.
> 

Please add that to the commit message.

And then seems you also need to set I2C adapter timeout to a some larger value. Currently Tegra's I2C doesn't explicitly specify the "adapter.timeout" and I2C core sets it to 1 second if it is 0.
