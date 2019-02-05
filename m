From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Tue, 5 Feb 2019 09:20:50 +0300
Message-ID: <1d7cdfc7-c625-940a-14d1-5981cf16cb56@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
 <467a3ac8-5667-66bf-50eb-7d21a103d901@gmail.com>
 <fa8a64fd-87e5-a70c-5ee7-c6c100b712c1@gmail.com>
 <DM6PR12MB34033CFF789C5115721B5BAEC26E0@DM6PR12MB3403.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DM6PR12MB34033CFF789C5115721B5BAEC26E0@DM6PR12MB3403.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

05.02.2019 4:37, Sowjanya Komatineni пишет:
>> I know that APB DMA driver enables flow control based on the channels spec, but still won't hurt to explicitly show that channels are flow-controlled. Ideally APB DMA driver should respect the device_fc field.
>>
>> 		dma_sconfig.device_fc = true;
> 
> 
> Dmitry,
> Thanks for all feedback. Sent updated patch V10 which has all below V9 feedback changes.
> 
> - Added explicit flow control settings to dma slave config and error check so need to move releasing of dma resources to separate function as I am using it multiple places (when dma slave config failed, on tegra drive remove, tegra_i2c_init_dma).
> As a part of this, moved error handling also inside init_dma as you suggested in earlier feedback.
> - Added apbdma hw support flag to now allow Tegra186 and later use APBDMA driver.
> - Updated to register tegra_i2c_driver from module level rather than subsys level.
> - Fixed timeout for bus clear to 50ms (10ms is enough but considering slaves responding slow). Also added adapter timeout to 6s considering worst case transfer rate.
> - other minor fixes.
> 
> Please review.
> - Sowjanya
> 

Thank you very much for keeping up with the new versions! The v10 is reviewed now. It is very close to final, but there is one new fatal bug there that leaves FIFO control register unconfigured in a case of error. I also pointed at some other minor cases that could be improved, please see my replies.
