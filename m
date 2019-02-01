From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 4/5] i2c: tegra: update transfer timeout
Date: Fri, 1 Feb 2019 22:41:59 +0300
Message-ID: <1f0a6315-8e38-236a-c16c-0b8699bba1b5@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-4-git-send-email-skomatineni@nvidia.com>
 <53b3f00f-b3a8-e1ef-b04b-1bdd5f5473ce@gmail.com>
 <BYAPR12MB3398D89D631E65C484DC8267C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398D89D631E65C484DC8267C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

01.02.2019 22:37, Sowjanya Komatineni пишет:
> 
>>> BYTES_PER_FIFO_WORD 4
>>>  
>>>  #define I2C_CNFG				0x000
>>> @@ -893,8 +892,9 @@ static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev *i2c_dev)
>>>  		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
>>>  		tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
>>>  
>>> -		time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
>>> -							TEGRA_I2C_TIMEOUT);
>>> +		time_left = wait_for_completion_timeout(
>>> +						&i2c_dev->msg_complete,
>>> +						msecs_to_jiffies(1000));
>>
>> So potentially tegra_i2c_xfer_msg() could take more than 1 second and then fail with -EAGAIN, correct? In that case we should set adapter.timeout in probe to a larger value:
>>
> Bus clear pulse threshold we are setting is 9 (default as per spec) so bus clear should happen after finishing sending of 9 pulses.
> So 1sec is very long time for bus to get released and in case of ARB LOST whole transfer to return EAGAIN will be much less then 1sec

Okay, thank you very much for the clarification. What about to set the timeout to a shorter value then? Maybe 10ms.
