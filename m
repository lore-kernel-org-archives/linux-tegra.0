From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Date: Fri, 14 Jun 2019 21:36:15 -0700
Message-ID: <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614211129.GG17899@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/14/19 2:11 PM, Wolfram Sang wrote:
> On Thu, Jun 06, 2019 at 10:37:47PM -0700, Bitan Biswas wrote:
>> Post suspend I2C registers have power on reset values. Before any
>> transfer initialize I2C registers to prevent I2C transfer timeout
>> and implement suspend and resume callbacks needed. Fix below errors
>> post suspend:
>>
>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>
>> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @ 2939, parent: i2c-1
>> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
>> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
>> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0 returns -110
>> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110 after 127152 usecs
>> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>>
>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>
>> Remove i2c bus lock-unlock calls in resume callback as i2c_mark_adapter_*
>> (suspended-resumed) help ensure i2c core calls from client are not
>> executed before i2c-tegra resume.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> 
> Applied to for-next, thanks!
> 
> Without a maintainer ack, this is an exception this time. Should we add
> Dmitry as another maintainer or reviewer at least?
> 
I shall followup with Maintainer for ACK in future I2C tegra patches. 
Probably maintainers or reviewers should comment here.
